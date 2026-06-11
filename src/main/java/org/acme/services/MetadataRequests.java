package org.acme.services;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.inject.Scope;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import org.acme.dto.FileObject;
import org.jboss.logging.Logger;
import software.amazon.awssdk.core.ResponseBytes;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.*;

@ApplicationScoped
public class MetadataRequests extends S3Connector {

    private static final Logger LOG = Logger.getLogger(MetadataRequests.class);

    @Inject
    S3Client s3;

    public Response createNewNamespaceFolder(String folderName) {
        Response.ResponseBuilder response = Response.ok();

        return response.build();
    }

    //    @GET
    //    @Path("download/{objectKey}")
    //    @Produces(MediaType.APPLICATION_OCTET_STREAM)
    public Response downloadFile(String objectKey) {
        ResponseBytes<GetObjectResponse> objectBytes = s3.getObjectAsBytes(
            buildGetRequest(objectKey)
        );
        Response.ResponseBuilder response = Response.ok(
            objectBytes.asByteArray()
        );
        response.header(
            "Content-Disposition",
            "attachment;filename=" + objectKey
        );
        response.header("Content-Type", objectBytes.response().contentType());
        return response.build();
    }

    //    @GET
    //    @Produces(MediaType.APPLICATION_JSON)
    public List<FileObject> listFiles() {
        ListObjectsRequest listRequest = ListObjectsRequest.builder()
            .bucket(bucketName)
            .build();

        //HEAD S3 objects to get metadata
        return s3
            .listObjects(listRequest)
            .contents()
            .stream()
            .map(FileObject::from)
            .sorted(Comparator.comparing(FileObject::getObjectKey))
            .collect(Collectors.toList());
    }

    public List<FileObject> getMetadata(String namespace, String table) {
        String prefix = namespace.concat('/' + table + "/metadata");
        ListObjectsRequest listRequest = ListObjectsRequest.builder()
            .bucket(bucketName)
            .prefix(prefix)
            .build();

        LOG.infof(
            "S3 ListObjects request: bucket=%s, prefix=%s",
            bucketName,
            prefix
        );

        try {
            ListObjectsResponse lor = s3.listObjects(listRequest);
            LOG.info(lor.contents());

            return lor
                .contents()
                .stream()
                .map(FileObject::from)
                .sorted(Comparator.comparing(FileObject::getObjectKey))
                .collect(Collectors.toList());
        } catch (Exception e) {
            LOG.error("Type of exception " + e.getClass());
            LOG.error("Message: " + e.getMessage());
            LOG.error(e);

            throw e;
        }
    }
}
