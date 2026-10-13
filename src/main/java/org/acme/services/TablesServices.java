package org.acme.services;

import java.io.IOException;
import java.util.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.acme.dto.*;
import org.acme.dto.requirement.AssertRefSnapshotId;
import org.acme.dto.requirement.AssertTableUUID;
import org.acme.dto.requirement.TableRequirement;
import org.acme.dto.update.TableUpdate;
import org.acme.dto.update.UpdateAddSnapshot;
import org.acme.dto.update.UpdateSetSnapshotRef;
import org.acme.entity.NamespaceObject;
import org.acme.entity.SnapshotEntity;
import org.acme.entity.TableObject;
import org.acme.util.S3Utils;
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
  S3Utils s3Utils;

  @Inject
  ObjectMapper objectMapper;

  @Inject
  TableEntityService tableEntityService;

  @Inject
  TableUpdateDispatcher updateDispatcher;

  @Inject
  SnapshotEntityService snapshotEntityService;

  //Snapshot
  @Inject
  SnapshotCommit snapshotCommit;

  @ConfigProperty(name = "iceberg.format.version")
  Integer FORMAT_VERSION_ICEBERG;

  @ConfigProperty(name = "iceberg.initial.spec-id")
  Integer INITIAL_SPEC_ID;

    private static final Logger LOG = Logger.getLogger(TablesServices.class);

  public void createTableObject(NamespaceObject ns_object, IcebergMetadata metadata, String tableName) {
    TableObject tableObject = new TableObject();
    tableObject.setUUID(metadata.getTableUuid());
    tableObject.setName(tableName);
    tableObject.setNamespace(ns_object);
    tableObject.setLocation(metadata.getLocation());
    tableObject.setLastColumnId(metadata.getLastColumnId());
    tableObject.setCurrentSchemaId(metadata.getCurrentSchemaId());
    tableObject.setCurrentSnapshotId(metadata.getCurrentSnapshotId());
    tableEntityService.createTable(tableObject);
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

      Integer LAST_PARITION_ID = 1000;
      Long DEFAULT_SNAPSHOT_ID = (long) -1;
      Long newTableSequenceNumber = 0L;
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
              DEFAULT_SNAPSHOT_ID,
        new ArrayList<>());

    return metadata;
  }

  public String generateMetaFileName(int version) {

    String uuidString = java.util.UUID.randomUUID().toString();
      String prefix = String.format("%05d", version);
      String METADATA_FILE_SUFFIX = ".metadata.json";
      uuidString = prefix + '-' + uuidString + METADATA_FILE_SUFFIX;

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
    String filePath = namespace + '/' + createTableRequest.getName();

    String fileName = generateMetaFileName(0);
    // TODO: create the objectKey and pass it up everywhere to avoid confusion
    PutObjectResponse putObjectResponse = putMetadataFile(
        fileName,
        filePath,
        metadata);
    if (putObjectResponse != null) {
      String objectKey = namespace + "/metadata/" + fileName;

      ResponseBytes<GetObjectResponse> objectBytes = metadataRequests.downloadFile(objectKey);
      String metadataLocation = "s3://" + "warehouse/"+ objectKey;

      Map<String, Object> tableMetadata;


      try {
        // Table Metadata tableMetadata =
        // objectMapper.readValue(objectBytes.asByteArray(), TableMetadata.class);
        // TODO: make the typecasting to iceberg-metadata into an explicit step
        tableMetadata = objectMapper.readValue(objectBytes.asUtf8String(), new TypeReference<Map<String, Object>>() {
        });
        createTableObject(ns_object, metadata, createTableRequest.getName());

        snapshotEntityService.createSnapshotEntry(metadata, metadataLocation);

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
      // TODO: replace warehouse with the name for application properties
      TableMetadataResponse metadataResponse = new TableMetadataResponse(
          metadataLocation, tableMetadata);

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

  public Response processCommit(
      NamespaceObject ns_object,
      String tableName,
      CommitTableRequest commitTableRequest) throws IOException {
    List<TableRequirement> requirements = commitTableRequest.getRequirements();
    List<TableUpdate>  updates = commitTableRequest.getUpdates();
    if (requirements == null || requirements.isEmpty()) {
      // TODO: process updates
      // why do I have this here? Is this a leetcode question?
      return Response.ok().build();
    }
//    DONE: Replace the below with a call to snapshot Table in DB
    UUID tableUuid = UUID.fromString(commitTableRequest.requirement(AssertTableUUID.class).uuid());
    Long snapshotId = commitTableRequest.requirement(AssertRefSnapshotId.class).snapshotId();

    IcebergMetadata currentMetadata = loadMetadataFile(snapshotId, tableUuid);

    if (currentMetadata == null) {
      return Response.status(Response.Status.NOT_FOUND)
          .entity(Map.of("error", "Table does not exist", "table", tableName))
          .build();
    }
    validateRequirements(currentMetadata, requirements);
    updateDispatcher.applyAll(currentMetadata, updates);

    // TRAIL: The file is getting saved to the wrong directory ns/metadata - should be - ns/table/metadata
    // TODO: Check if all the correct attributes are there in the newer version
    String previousFileName = getMetadataFileName(snapshotId, tableUuid);
     String fileName = generateMetaFileName( Integer.parseInt(previousFileName.split("-")[0]) + 1);
     // TODO: Refactor this into much cleaner code
    PutObjectResponse putObjectResponse = putMetadataFile(
            fileName,
            ns_object.getName() + "/" + tableName ,
            currentMetadata);
    if (putObjectResponse != null) {
      String objectKey = ns_object.getName() + "/" + tableName + "/metadata/" + fileName;

      LOG.info("ObjectKey:" + objectKey);
      ResponseBytes<GetObjectResponse> objectBytes = metadataRequests.downloadFile(objectKey);
      String metadataLocation = "s3://" + "warehouse/"+ objectKey;

      Map<String, Object> tableMetadata;
      try {
//         TableMetadata tableMetadata =
//         objectMapper.readValue(objectBytes.asByteArray(), TableMetadata.class);
        // TODO: make the typecasting to iceberg-metadata into an explicit step
        tableMetadata = objectMapper.readValue(objectBytes.asUtf8String(), new TypeReference<Map<String, Object>>() {
        });


        Optional<TableUpdate> setSnapshotRef = updates.stream().filter(e -> e.action() == "set-snapshot-ref").findAny();

        if(setSnapshotRef.isPresent()) {
          tableEntityService.updateSnapshotRef(currentMetadata.getCurrentSnapshotId(), tableUuid);
        }

        snapshotEntityService.createSnapshotEntry(currentMetadata, metadataLocation);

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
      // TODO: replace warehouse with the name for application properties
      TableMetadataResponse metadataResponse = new TableMetadataResponse(
              metadataLocation, tableMetadata);

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

//     snapshotEntityService.createSnapshotEntry(currentMetadata);


//    return Response.ok().entity(currentMetadata).build();
  }

  private IcebergMetadata loadLatestMetadata(String namespace, String table) throws IOException {
      // TODO: replace the params with List<String> namespace above when we start supporting that
    List<String> namespaceName = new ArrayList<>();
    namespaceName.add(namespace);
    TableObject tableObject = tableEntityService.findByName(table, namespaceName);

    SnapshotEntity snapshot = snapshotEntityService.getSnapshotDetails(tableObject.getCurrentSnapshotId(),tableObject.getUuid());

    ResponseBytes<GetObjectResponse> objectBytes;
    if(snapshot.getMetadataLocation() != null){
      String objectKey = s3Utils.toObjectKey(snapshot.getMetadataLocation());
      LOG.info("Object Key : "+ objectKey);
      objectBytes = metadataRequests.downloadFile(objectKey);
    }
    else {
      List<FileObject> files = metadataRequests.getMetadataList(namespace, table);
      if (files == null || files.isEmpty()) {
        return null;
      }
      FileObject latest = files.getLast();
      LOG.info("Object Key : "+ latest.getObjectKey());
      objectBytes = metadataRequests.downloadFile(latest.getObjectKey());
    }
    return objectMapper.readValue(objectBytes.asByteArray(), IcebergMetadata.class);
  }

  private IcebergMetadata loadMetadataFile(Long snapshotId, UUID tableUUID) throws IOException{
    SnapshotEntity snapshotEntity = snapshotEntityService.getSnapshotDetails(snapshotId, tableUUID);
    ResponseBytes<GetObjectResponse> objectBytes;

    if(snapshotEntity.getMetadataLocation() != null){
      String objectKey = s3Utils.toObjectKey(snapshotEntity.getMetadataLocation());
      LOG.info("Object Key : "+ objectKey);
      objectBytes = metadataRequests.downloadFile(objectKey);

    return objectMapper.readValue(objectBytes.asByteArray(), IcebergMetadata.class);
    }
    return null;
  }

  private String getMetadataFileName(Long snapshotId, UUID tableUUID){
    SnapshotEntity snapshotEntity = snapshotEntityService.getSnapshotDetails(snapshotId, tableUUID);

    String[] dir = snapshotEntity.getMetadataLocation().split("/");
    return dir[dir.length-1];
  }

  private void validateRequirements(
      IcebergMetadata currentMetadata,
      List<TableRequirement> requirements) {
    for (TableRequirement requirement : requirements) {
      requirement.validate(currentMetadata);
    }
  }
}
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
