package org.acme.apidef;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.quarkus.logging.Log;
import jakarta.activation.MimeType;
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
import jakarta.ws.rs.core.Response.Status;
import java.time.Instant;
import java.util.Arrays;
import java.util.HashMap;
import org.acme.dto.CreateTableRequest;
import org.acme.dto.ErrorResponse;
import org.acme.dto.IcebergMetadata;
import org.acme.dto.S3FormData;
import org.acme.services.MetadataRequests;
import org.acme.services.TablesServices;

import software.amazon.awssdk.services.s3.model.PutObjectResponse;

import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.jboss.logging.Logger;
import org.jboss.resteasy.reactive.server.ServerExceptionMapper;

@Path("/tables")
public class TablesResource {

    @Inject
    ObjectMapper objectMapper;

    @Inject
    TablesServices tablesServices;

    @Inject
    MetadataRequests metadataRequests;

    private static final Logger LOG = Logger.getLogger(TablesResource.class);
    private static Integer newTableSequenceNumber = 0;
    private static Integer LAST_PARITION_ID = 1000;

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
        try {
            LOG.info("@POST Create Table Request:");
            LOG.info(objectMapper.writeValueAsString(createTableRequest));
        } catch (JsonProcessingException e) {
            if (e.getClass() == JsonProcessingException.class) {
                LOG.error("TRUE \n\n\n TRUE");
            }
            LOG.error(e);
        }

        IcebergMetadata metadata = tablesServices.createMetadataJSON(
            namespace,
            createTableRequest
        );

        PutObjectResponse putObjectResponse = metadataRequests.uploadMetadataFile("folder", metadata);


        if (putObjectResponse != null) {
            return Response.ok().status(Status.CREATED).build();
        }

        return Response.serverError().build();
        // 6. Make a GET to same URL and return the Table MetaData
        // return Response.ok().build();
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
