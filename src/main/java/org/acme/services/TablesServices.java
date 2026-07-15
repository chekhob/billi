package org.acme.services;

import java.util.UUID;

import org.acme.dto.CreateTableRequest;
import org.acme.dto.IcebergMetadata;
import org.acme.dto.SchemaField;
import org.acme.dto.SortOrder;
import org.acme.dto.SortOrderField;
import org.eclipse.microprofile.config.inject.ConfigProperty;

import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class TablesServices {

  @ConfigProperty(name = "iceberg.format.version")
  Integer FORMAT_VERSION_ICEBERG;

  @ConfigProperty(name = "iceberg.initial.spec-id")
  Integer INITIAL_SPEC_ID;

  private static Integer newTableSequenceNumber = 0;
  private static Integer LAST_PARITION_ID = 1000;

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
        createTableRequest.getStageCreate());

    return metadata;
  }

  public String generateMetaFileName(int version) {

    String uuidString = java.util.UUID.randomUUID().toString();
    if (version == 0) {
      String suffix = "00000";
      uuidString = suffix + '-' + uuidString;
    }

    return uuidString;
  }
}
