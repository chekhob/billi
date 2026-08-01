package org.acme.apidef;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.Arrays;
import java.util.List;

import org.acme.context.RequestContext;
import org.acme.dto.CommitTableRequest;
import org.acme.dto.CreateTableRequest;
import org.acme.dto.ErrorResponse;
import org.acme.dto.FileObject;
import org.acme.entity.NamespaceObject;
import org.acme.services.MetadataRequests;
import org.acme.services.TablesServices;
import org.acme.services.NamespaceEntityService;

import org.jboss.logging.Logger;
import org.jboss.resteasy.reactive.server.ServerExceptionMapper;

@RequestScoped
@Path("/tables")
public class TablesResource {

  @Inject
  ObjectMapper objectMapper;

  @Inject
  TablesServices tablesServices;

  @Inject
  NamespaceEntityService namespaceService;

  @Inject
  MetadataRequests metadataRequests;

  @Inject
  RequestContext requestContext;

  private static final Logger LOG = Logger.getLogger(TablesResource.class);

  // TODO: dont really understand what this means have to understand more of the
  // spec or flow to get this

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
                    Arrays.toString(e.getStackTrace())))
        .build();
  }

  @ServerExceptionMapper
  public Response mapException(JsonProcessingException e) {
    String message = e.getOriginalMessage() != null ? e.getOriginalMessage() : e.getMessage();
    return Response.status(400)
        .type(MediaType.APPLICATION_JSON)
        .entity(
            new ErrorResponse(
                "Invalid JSON",
                message + "\n" + Arrays.toString(e.getStackTrace())))
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
      CreateTableRequest createTableRequest) throws JsonProcessingException {
    NamespaceObject ns_object = requestContext.getNamespace();
    // if (ns_object == null) {
    // throw noSuchNamespaceException(namespace);
    // }
    return tablesServices.createMetadataFile(ns_object, createTableRequest);
  }

  @Path("{tb_name}")
  @GET
  @Produces(MediaType.APPLICATION_JSON)
  public Response getTableDetails(
      @PathParam("tb_name") String table) {
    NamespaceObject object = requestContext.getNamespace();
    try {
      List<FileObject> metadata = metadataRequests.getMetadata(
          object.getName(),
          table);

      return Response.ok(metadata).build();
    } catch (Exception e) {
      e.fillInStackTrace();
      noSuchTableException table_exception = new noSuchTableException(table, object.getName());
      throw table_exception;
    }
  }

  @Path("{tb_name}")
  @POST
  @Produces(MediaType.APPLICATION_JSON)
  public Response updateTable(@PathParam("tb_name") String table, CommitTableRequest commitTableRequest) {
    NamespaceObject ns_object = requestContext.getNamespace();
    // tablesServices.updateMetadata
    return Response.ok().build();

  }
}
