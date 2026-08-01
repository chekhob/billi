package org.acme.services;

import java.io.IOException;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.acme.dto.CreateTableRequest;
import org.acme.dto.IcebergMetadata;
import org.acme.dto.SchemaField;
import org.acme.dto.SortOrder;
import org.acme.dto.SortOrderField;
import org.acme.dto.TableMetadataResponse;
import org.acme.entity.NamespaceObject;
import org.acme.entity.TableObject;
import org.eclipse.microprofile.config.inject.ConfigProperty;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.core.Response;

import software.amazon.awssdk.core.ResponseBytes;
import software.amazon.awssdk.services.s3.model.PutObjectResponse;
import software.amazon.awssdk.services.s3.model.GetObjectResponse;

import org.jboss.logging.Logger;

@ApplicationScoped
public class TablesServices {

  @Inject
  MetadataRequests metadataRequests;

  @Inject
  ObjectMapper objectMapper;

  @Inject
  TableEntityService tableEntityService;

  @ConfigProperty(name = "iceberg.format.version")
  Integer FORMAT_VERSION_ICEBERG;

  @ConfigProperty(name = "iceberg.initial.spec-id")
  Integer INITIAL_SPEC_ID;

  private static Long DEFAULT_SNAPSHOT_ID = (long) -1;

  private static Long newTableSequenceNumber = 0L;
  private static Integer LAST_PARITION_ID = 1000;
  private static String METADATA_FILE_SUFFIX = ".metadata.json";

  private static final Logger LOG = Logger.getLogger(TablesServices.class);

  public TableObject createTableObject(NamespaceObject ns_object, IcebergMetadata metadata) {
    TableObject tableObject = new TableObject();
    tableObject.setNamespaceId(ns_object.getUuid());
    tableObject.setLocation(metadata.getLocation());
    tableObject.setLastColumnId(metadata.getLastColumnId());
    tableObject.setCurrentSchemaId(metadata.getCurrentSchemaId());
    tableObject.setCurrentSnapshotId(metadata.getCurrentSnapshotId());
    return tableEntityService.createTable(tableObject);
  }

  public IcebergMetadata createMetadataJSON(
      String namespace,
      CreateTableRequest createTableRequest) {
    // TODO: check the location of the namespace from DB and verify

    String namespaceLocation = "s3://warehouse/" + namespace + '/' + createTableRequest.getName();
    Integer lastColumnId = createTableRequest.getSchema() != null
        ? createTableRequest.getSchema().getFields().length - 1
        : null;

    SortOrderField[] sortOrderFields = { new SortOrderField() };
    SortOrder sortOrder = new SortOrder(0, sortOrderFields);
    SortOrder[] sortOrderList = { sortOrder };
    // Why are we doing this, just a counting quirk?
    SchemaField[] fields = createTableRequest.getSchema() != null
        ? createTableRequest.getSchema().getFields()
        : null;
    if (fields != null) {
      for (SchemaField temp : fields) {
        temp.setId(temp.getId() + 1);
      }
    }
    Integer currentSchemaId = createTableRequest.getSchema() != null ? createTableRequest.getSchema().getId() : 0;

    LOG.info("Current Schema ID: " + currentSchemaId);

    IcebergMetadata metadata = new IcebergMetadata(
        FORMAT_VERSION_ICEBERG,
        java.util.UUID.randomUUID(),
        newTableSequenceNumber,
        System.currentTimeMillis(),
        currentSchemaId,
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
        createTableRequest.getStageCreate(),
        DEFAULT_SNAPSHOT_ID);

    return metadata;
  }

  public String generateMetaFileName(int version) {

    String uuidString = java.util.UUID.randomUUID().toString();
    if (version == 0) {
      String prefix = "00000";
      uuidString = prefix + '-' + uuidString + METADATA_FILE_SUFFIX;
    }

    return uuidString;
  }

  public PutObjectResponse putMetadataFile(String fileName,
      String folderName,
      IcebergMetadata icebergMetadata) {
    return metadataRequests.uploadMetadataFile(
        fileName,
        folderName,
        icebergMetadata);

  }

  public Response createMetadataFile(NamespaceObject ns_object, CreateTableRequest createTableRequest)
      throws JsonProcessingException {
    try {
      LOG.info("@POST Create Table Request:");
      LOG.info(objectMapper.writeValueAsString(createTableRequest));
    } catch (JsonProcessingException e) {
      if (e.getClass() == JsonProcessingException.class) {
        LOG.error("TRUE \n\n\n TRUE");
      }
      LOG.error(e);
    }
    String namespace = ns_object.getName();

    IcebergMetadata metadata = createMetadataJSON(
        namespace,
        createTableRequest);
    // TODO: this is related to the objectKey thing, like I have to edit this later
    // since it is handled differently in createMetadataJSON
    namespace = namespace + '/' + createTableRequest.getName();

    String fileName = generateMetaFileName(0);
    // TODO: create the objectKey and pass it up everywhere to avoid confusion
    PutObjectResponse putObjectResponse = putMetadataFile(
        fileName,
        namespace,
        metadata);

    if (putObjectResponse != null) {
      // the object eky is just the file name?;
      String objectKey = namespace + '/' + fileName;
      ResponseBytes<GetObjectResponse> objectBytes = metadataRequests.downloadFile(objectKey);

      Map<String, Object> tableMetadata;

      try {
        // Table Metadata tableMetadata =
        // objectMapper.readValue(objectBytes.asByteArray(), TableMetadata.class);
        tableMetadata = objectMapper.readValue(objectBytes.asUtf8String(), new TypeReference<Map<String, Object>>() {
        });
        createTableObject(ns_object, metadata);
        // TODO: Add create snapshot here
      } catch (JsonProcessingException e) {
        LOG.error("Failed to parse metadata from S3 object: " + objectKey, e);
        throw e;
      } catch (IOException e) {
        LOG.error("I/O error reading metadata bytes for: " + objectKey, e);
        throw new RuntimeException("Failed to read metadata: " + objectKey, e);
      }

      // TableMetadataResponse metadataResponse = new
      // TableMetadataResponse(tableMetadata.getLocation() + "/" + fileName,
      // tableMetadata);
      TableMetadataResponse metadataResponse = new TableMetadataResponse(
          (String) tableMetadata.get("location") + "/" + fileName, tableMetadata);

      // TableMetadataResponse metadataResponse =
      // tablesServices.createMetadataFile(namespace, createTableRequest);
      Response.ResponseBuilder response = Response.ok(
          metadataResponse);
      response.header(
          "Content-Disposition",
          "attachment;filename=" + fileName);
      response.header("Content-Type", objectBytes.response().contentType());

      try {
        // Object data = fileData.toString();
        LOG.info(objectMapper.writeValueAsString(response));
        LOG.info(objectBytes.asUtf8String());
      } catch (Exception e) {
        LOG.error(e.getMessage());
        if (e.getClass() == JsonProcessingException.class) {
          LOG.error("TRUE \n\n\n TRUE");
        }
      }
      return response.build();
    }
    return Response.serverError().build();
  }

  // we will still create the file, I think so just need to extend the above
  // method
  // But we need to interpret this new object also so maybe like updateTable? and
  // call create metadata from there?
  // TODO: Add updateTable method for the path given below

}

// POST /v1/namespaces/iceberg_catalog_test_f8b262d6/tables/test_dml
// {
// "requirements": [
// {
// "type": "assert-table-uuid",
// "uuid": "22ab6f4e-5f16-4777-bedf-70d8a2845f15"
// },
// {
// "type": "assert-ref-snapshot-id",
// "ref": "main",
// "snapshot-id": null
// }
// ],
// "updates": [
// {
// "action": "add-snapshot",
// "snapshot": {
// "sequence-number": 1,
// "snapshot-id": 8912320219285957195,
// "timestamp-ms": 1784058701092,
// "summary": {
// "operation": "append",
// "spark.app.id": "local-1784058691816",
// "added-data-files": "3",
// "added-records": "3",
// "added-files-size": "2868",
// "changed-partition-count": "1",
// "total-records": "3",
// "total-files-size": "2868",
// "total-data-files": "3",
// "total-delete-files": "0",
// "total-position-deletes": "0",
// "total-equality-deletes": "0",
// "engine-version": "3.5.5",
// "app-id": "local-1784058691816",
// "engine-name": "spark",
// "iceberg-version": "Apache Iceberg 1.8.1 (commit
// 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
// },
// "manifest-list":
// "s3://warehouse/iceberg_catalog_test_f8b262d6/test_dml/metadata/snap-8912320219285957195-1-36ab8409-162f-402f-8f08-bc0c28223a04.avro",
// "schema-id": 0
// }
// },
// {
// "action": "set-snapshot-ref",
// "ref-name": "main",
// "snapshot-id": 8912320219285957195,
// "type": "branch"
// }
// ]
// }
