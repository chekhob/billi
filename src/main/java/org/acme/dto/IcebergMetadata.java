package org.acme.dto;

import java.util.UUID;

public class IcebergMetadata {

  // "table-uuid": "8cb26f5a-3b4a-4ade-aa30-9aaca6f931bb",
  // "last-sequence-number": 0,
  // "last-updated-ms": 1781701408273,
  // "last-column-id": 2,
  // "current-schema-id": 0,
  // "default-spec-id": 0,
  // "last-partition-id": 999,
  // "default-sort-order-id": 0,
  // "sort-orders": [
  // {
  // "order-id": 0,
  // "fields": []
  // }
  private Integer formatVersion;
  private UUID tableUuid;
  private Long lastSequenceNumber;
  private Long lastUpdatedMs;
  private Integer lastColumnId;
  private Integer currentSchemaId;
  private String location;
  private Schema schema;
  private PartitionSpec partitionSpec;
  private Integer lastPartitionId;
  private Integer defaultSpecId;
  private Integer defaultSortOrderId;
  private SortOrder[] sortOrders;
  private WriteOrder writeOrder;
  private TableProperties properties;
  private Boolean stageCreate;
  private Long currentSnapshotId = (long) -1;

  public IcebergMetadata() {
    // no-args constructor for Jackson
  }

  public IcebergMetadata(
      Integer formatVersion,
      UUID uuid,
      Long lastSequenceNumber,
      Long lastUpdatedMs,
      Integer currentSchemaId,
      Integer lastColumnId,
      String location,
      Schema schema,
      PartitionSpec partitionSpec,
      Integer lastPartitionId,
      Integer defaultSpecId,
      int defaultSortOrderId,
      SortOrder[] sortOrders,
      WriteOrder writeOrder,
      TableProperties properties,
      Boolean stageCreate,
      Long currentSnapshotId) {
    this.formatVersion = formatVersion;
    this.tableUuid = uuid;
    this.lastSequenceNumber = lastSequenceNumber;
    this.lastUpdatedMs = lastUpdatedMs;
    this.currentSchemaId = currentSchemaId;
    this.lastColumnId = lastColumnId;
    this.location = location;
    this.schema = schema;
    this.partitionSpec = partitionSpec;
    this.lastPartitionId = lastPartitionId;
    this.defaultSpecId = defaultSpecId;
    this.defaultSortOrderId = defaultSortOrderId;
    this.sortOrders = sortOrders;
    this.writeOrder = writeOrder;
    this.properties = properties;
    this.stageCreate = stageCreate;
    if (currentSnapshotId != null) {
      this.currentSnapshotId = currentSnapshotId;
    }
  }

  public Integer getFormatVersion() {
    return formatVersion;
  }

  public void setFormatVersion(Integer formatVersion) {
    this.formatVersion = formatVersion;
  }

  public UUID getTableUuid() {
    return tableUuid;
  }

  public void setTableUuid(UUID uuid) {
    this.tableUuid = uuid;
  }

  public Long getLastSequenceNumber() {
    return lastSequenceNumber;
  }

  public void setLastSequenceNumber(Long lastSequenceNumber) {
    this.lastSequenceNumber = lastSequenceNumber;
  }

  public long getLastUpdatedMs() {
    return lastUpdatedMs;
  }

  public void setLastUpdatedMs(long lastUpdatedMs) {
    this.lastUpdatedMs = lastUpdatedMs;
  }

  public Integer getCurrentSchemaId() {
    return currentSchemaId;
  }

  public void setCurrentSchemaId(Integer currentSchemaId) {
    this.currentSchemaId = currentSchemaId;
  }

  public Integer getLastColumnId() {
    return lastColumnId;
  }

  public void setLastColumnId(Integer lastColumnId) {
    this.lastColumnId = lastColumnId;
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public Schema getSchema() {
    return schema;
  }

  public void setSchema(Schema schema) {
    this.schema = schema;
  }

  public PartitionSpec getPartitionSpec() {
    return partitionSpec;
  }

  public void setPartitionSpec(PartitionSpec partitionSpec) {
    this.partitionSpec = partitionSpec;
  }

  public Integer getLastPartitionId() {
    return lastPartitionId;
  }

  public void setLastPartitionId(Integer lastPartitionId) {
    this.lastPartitionId = lastPartitionId;
  }

  public Integer getDefaultSpecId() {
    return defaultSpecId;
  }

  public void setDefaultSpecId(Integer defaultSpecId) {
    this.defaultSpecId = defaultSpecId;
  }

  public Integer getDefaultSortOrderId() {
    return defaultSortOrderId;
  }

  public void setDefaultSortOrderId(Integer defaultSortOrderId) {
    this.defaultSortOrderId = defaultSortOrderId;
  }

  public SortOrder[] getSortOrders() {
    return sortOrders;
  }

  public void setSortOrders(SortOrder[] sortOrders) {
    this.sortOrders = sortOrders;
  }

  public WriteOrder getWriteOrder() {
    return writeOrder;
  }

  public void setWriteOrder(WriteOrder writeOrder) {
    this.writeOrder = writeOrder;
  }

  public TableProperties getProperties() {
    return properties;
  }

  public void setProperties(TableProperties properties) {
    this.properties = properties;
  }

  public Boolean getStageCreate() {
    return stageCreate;
  }

  public void setStageCreate(Boolean stageCreate) {
    this.stageCreate = stageCreate;
  }

  public Long getCurrentSnapshotId() {
    return currentSnapshotId;
  }

  public void setCurrentSnapshotId(Long currentSnapshotId) {
    this.currentSnapshotId = currentSnapshotId;
  }
}

// TableMetadata:
// type: object
// required:
// - format-version
// - table-uuid
// properties:
// format-version:
// type: Integereger
// minimum: 1
// maximum: 3
// table-uuid:
// type: string
// location:
// type: string
// last-updated-ms:
// type: Integereger
// format: Integer64
// next-row-id:
// type: Integereger
// format: Integer64
// description: A long higher than all assigned row IDs; the next snapshot's
// first-row-id.
// properties:
// type: object
// additionalProperties:
// type: string
// # schema tracking
// schemas:
// type: array
// items:
// $ref: '#/components/schemas/Schema'
// current-schema-id:
// type: Integereger
// last-column-id:
// type: Integereger
// # partition spec tracking
// partition-specs:
// type: array
// items:
// $ref: '#/components/schemas/PartitionSpec'
// default-spec-id:
// type: Integereger
// last-partition-id:
// type: Integereger
// # sort order tracking
// sort-orders:
// type: array
// items:
// $ref: '#/components/schemas/SortOrder'
// default-sort-order-id:
// type: Integereger
// # encryption
// encryption-keys:
// type: array
// items:
// $ref: '#/components/schemas/EncryptedKey'
// # snapshot tracking
// snapshots:
// type: array
// items:
// $ref: '#/components/schemas/Snapshot'
// refs:
// $ref: '#/components/schemas/SnapshotReferences'
// current-snapshot-id:
// type: Integereger
// format: Integer64
// last-sequence-number:
// type: Integereger
// format: Integer64
// # logs
// snapshot-log:
// $ref: '#/components/schemas/SnapshotLog'
// metadata-log:
// $ref: '#/components/schemas/MetadataLog'
// # statistics
// statistics:
// type: array
// items:
// $ref: '#/components/schemas/StatisticsFile'
// partition-statistics:
// type: array
// items:
// $ref: '#/components/schemas/PartitionStatisticsFile'
