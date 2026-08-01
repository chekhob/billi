package org.acme.services;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.activation.MimeType;
import jakarta.activation.MimeTypeParseException;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.core.Response;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import org.acme.dto.FileObject;
import org.acme.dto.IcebergMetadata;
import org.acme.dto.S3FormData;
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

  public PutObjectResponse uploadMetadataFile(
      String fileName,
      String folderName,
      IcebergMetadata icebergMetadata) {
    S3FormData formData = new S3FormData();
    formData.filename = folderName + '/' + fileName;
    try {
      formData.mimetype = new MimeType("application/json");
    } catch (MimeTypeParseException e) {
      System.err.println(e.fillInStackTrace());
    }

    try {
      ObjectMapper mapper = new ObjectMapper();
      formData.json = mapper.writeValueAsString(icebergMetadata);
    } catch (JsonProcessingException e) {
      System.err.println(e.fillInStackTrace());
    }
    PutObjectResponse putObjectResponse = s3.putObject(
        buildPutRequest(formData),
        RequestBody.fromString(formData.json));
    return putObjectResponse;
  }

  public ResponseBytes<GetObjectResponse> downloadFile(String objectKey) {
    // ResponseInputStream objectS3 = s3.getObject(
    // buildGetRequest(objectKey));
    // return objectS3.response().toString;

    ResponseBytes<GetObjectResponse> objectBytes = s3.getObjectAsBytes(
        buildGetRequest(objectKey));
    return objectBytes;
  }

  public List<FileObject> listFiles() {
    ListObjectsRequest listRequest = ListObjectsRequest.builder()
        .bucket(bucketName)
        .build();

    // HEAD S3 objects to get metadata
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
        prefix);

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
