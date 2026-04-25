package org.acme;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.Arrays;
import java.util.List;

import org.jboss.resteasy.reactive.server.ServerExceptionMapper;

//class Namespace {
//    String name;
//    String location;
//    ArrayList<Table> tableList;
//}
@Path("namespaces")
public class Namespaces {

    @Inject
    MetadataRequests metadataRequests;

    @Inject
    NamespaceEntityService namespaceEntityService;

    //    private Hashtable<String, Namespace> namespaces_list = new Hashtable();

    @ServerExceptionMapper
    public Response mapException(noSuchNamespaceException e) {
        return Response.status(e.code.getStatusCode())
            .type(MediaType.APPLICATION_JSON)
            .entity(
                new ErrorResponse(
                    "Namespace does not exist",
                    e.element +
                        ": " +
                        e.getMessage() +
                        "\n" +
                        Arrays.toString(e.getStackTrace())
                )
            )
            .build();
    }

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

    @ServerExceptionMapper
    public Response mapException(Exception e) {
        return Response.status(400)
            .type(MediaType.APPLICATION_JSON)
            .entity(
                new ErrorResponse(
                    e.getMessage(),
                    Arrays.stream(e.getStackTrace()).toList().toString()
                )
            )
            .build();
    }

    @GET
    public Response getNamespacesList() {
        return Response.ok().build();
    }

    @POST
    public Response createNewNamespace(CreateNamespaceRequest namespaceRequest) {
        NamespaceObject entity = new NamespaceObject();
        entity.setNamespace(namespaceRequest.getNamespace());
        entity.setProperties(namespaceRequest.getProperties());
        
        NamespaceObject saved = namespaceEntityService.createNamespace(entity);
        
        NamespaceResponse response = new NamespaceResponse(saved.getNamespace(), saved.getProperties());
        return Response.ok().entity(response).build();
    }

    @Path("/{ns_name}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getNamespaceDetails(
        @PathParam("ns_name") String namespace
    ) {
        List<String> namespaceList = List.of(namespace);
        NamespaceObject namespaceDetails = namespaceEntityService.findByNamespace(namespaceList);

        if (namespaceDetails != null) {
            NamespaceResponse response = new NamespaceResponse(
                namespaceDetails.getNamespace(),
                namespaceDetails.getProperties()
            );
            return Response.ok().entity(response).build();
        } else {
            throw new noSuchNamespaceException(namespace);
        }
    }

    @Path("/{ns_name}/tables")
    @GET
    public Response getTableList(@PathParam("ns_name") String namespace) {
        // TODO: Ideally call helper function from Tables class instead

        return Response.ok().build();
    }

    //    @Path("/{ns_name}/tables/{tb_name}")
    //    @GET
    //    @Produces(MediaType.APPLICATION_JSON)
    //    public Response getTableDetails(@PathParam("ns_name") String namespace, @PathParam("tb_name") String table){
    //        Namespace object = namespaces_list.get(namespace);
    //
    ////        if (object != null && object.tableList != null && object.tableList.contains(table)) {
    //        try {
    //            List<FileObject> metadata = metadataRequests.getMetadata(namespace, table);
    //            return Response.ok(metadata).build();
    //        } catch (Exception e){
    //            e.fillInStackTrace();
    ////            noSuchTableException e = new noSuchTableException(table, namespace);
    //            throw e;
    //        }
    //    }

    @Path("/mongodb/{ns_name}/{tb_name}")
    @GET
    public Response temp(
        @PathParam("ns_name") String namespace,
        @PathParam("tb_name") String table
    ) {
        return Response.ok().build();
    }
}

class noSuchTableException extends RuntimeException {

    public final Response.Status code;
    public final String element;

    public final String namespace;
    public final String type = "NoSuchTableException";

    public noSuchTableException(String element, String namespace) {
        this.element = element;
        this.namespace = namespace;
        this.code = Response.Status.NOT_FOUND;
    }
}

class noSuchNamespaceException extends RuntimeException {

    public final Response.Status code;
    public final String element;
    public final String type = "NoSuchNamespaceException";

    public noSuchNamespaceException(String element) {
        this.element = element;
        this.code = Response.Status.NOT_FOUND;
    }
}
