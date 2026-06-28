package org.acme.apidef;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.quarkus.logging.Log;
import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Request;
import jakarta.ws.rs.core.Response;

import java.time.Instant;
import java.util.Arrays;
import java.util.HashMap;
import org.acme.dto.CreateTableRequest;
import org.acme.dto.ErrorResponse;
import org.acme.dto.IcebergMetadata;
import org.acme.dto.SchemaField;
import org.acme.dto.SortOrder;
import org.acme.dto.SortOrderField;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.jboss.logging.Logger;
import org.jboss.resteasy.reactive.server.ServerExceptionMapper;

@Path("/tables")
public class TablesResource

    @Inject
    ObjectMapper objectMapper;

    @ConfigProperty(name = "iceberg.format.version")
    Integer FORMAT_VERSION_ICEBERG;
    @ConfigProperty(name="iceberg.initial.spec-id")
    Integer INITIAL_SPEC_ID;


    private static final Logger LOG = Logger.getLogger(TablesResource.class);
    private static Integer newTableSequenceNumber = 0;
    private static Integer LAST_PARITION_ID=1000;
    // TODO: dont really understand what this means have to understand more of the spec or flow to get this

    @ServerExceptionMapper
    public Response mapException(noSuchTableException e) {
        return Response.status(e.code.getStatusCode())
            .type(MediaType.APPLICATION_JSON)
            .entity(
                new ErrorResponse(
                    "Table does not exist",
                    e.namespace +
                        "." +
                        e.element +
                        ": " +
                        e.getMessage() +
                        "\n" +
                        Arrays.toString(e.getStackTrace())
                )
            )
            .build();
    }

    @GET
    public Response getTableList(@PathParam("ns_name") String namespace) {
        // TODO: Ideally call helper function from Tables class instead

        return Response.ok().build();
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createTable(
        @PathParam("ns_name") String namespace,
        CreateTableRequest createTableRequest
    ) {
        // 1. First see if the intercepted request is coming properly
        try {
            LOG.info("@POST Create Table Request:");
            LOG.info(objectMapper.writeValueAsString(createTableRequest));
        } catch (JsonProcessingException e) {
            LOG.error(e);
        }

        // 2. Compare which fields are to be added
        //
        // TODO: check the location of the namespace from DB.
        // getNamespace(namespace);


        String namespaceLocation =
            "s3://warehouse/" + namespace + '/' + createTableRequest.getName();
        Integer lastColumnId = createTableRequest.getSchema().getFields().length - 1;

        SortOrderField[] sortOrderFields;
        SortOrder sortOrder = new SortOrder(0, sortOrderFields);
        SortOrder[] sortOrderList = {sortOrder};
        // Why are we doing this, just a counting quirk?
        SchemaField [] fields = createTableRequest.getSchema().getFields();
        for(SchemaField temp: fields){
            temp.setId(temp.getId()+1);
        }

        IcebergMetadata metadata = new IcebergMetadata(
            FORMAT_VERSION_ICEBERG,
            java.util.UUID.randomUUID(),
            newTableSequenceNumber,
            System.currentTimeMillis(),
            lastColumnId,
            namespaceLocation,
            createTableRequest.getSchema(),
            createTableRequest.getPartitionSpec(),
            LAST_PARITION_ID,
            INITIAL_SPEC_ID,
            sortOrder.getOrderId(),
            sortOrderList,
            createTableRequest.getWriteOrder(),
            createTableRequest.getProperties(),
            createTableRequest.getStageCreate()
        );


        // 3. Move the logic to a service file



        // 4. Transform or cast to Table MetaData -- done -- log objects are still pending

        // 5. PUT into S3


        // 6. Make a GET to same URL and return the Table MetaData
        return Response.ok().build();
    }

    // @Path("{tb_name}")
    // @GET
    // @Produces(MediaType.APPLICATION_JSON)
    // public Response getTableDetails(
    //     @PathParam("ns_name") String namespace,
    //     @PathParam("tb_name") String table
    // ) {
    //     // Namespace object = namespaces_list.get(namespace);

    //     //1. Check if namespace exists else return 404
    //     //2. Check if table already exists???????
    //     //3.
    //     if (
    //         object != null &&
    //         object.tableList != null &&
    //         object.tableList.contains(table)
    //     ) {
    //         try {
    //             List<FileObject> metadata = metadataRequets.getMetadata(
    //                 namespace,
    //                 table
    //             );

    //             return Response.ok(metadata).build();
    //         } catch (Exception e) {
    //             e.fillInStackTrace();
    //             //            noSuchTableException e = new noSuchTableException(table, namespace);
    //             throw e;
    //         }
    //     }
    // }
}
