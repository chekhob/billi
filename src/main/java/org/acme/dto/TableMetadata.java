package org.acme.dto;

public class TableMetadata {

    int formatVersion;
    String tableUuid;
    String location;
    Long lastSequenceNumber;
    Long lastUpdatedMs;
    int lastColumnId;
    int currentSchemaId;
    Schema[] schemas;
    int defaultSpecId;
    int lastPartitionId;
    int defaultSortOrderId;

    public TableMetadata() {
    }

    public TableMetadata(int formatVersion, String tableUuid, String location, long lastSequenceNumber,
                         long lastUpdatedMs, int lastColumnId, int currentSchemaId, Schema[] schemas,
                         int defaultSpecId, int lastPartitionId, int defaultSortOrderId) {
        this.formatVersion = formatVersion;
        this.tableUuid = tableUuid;
        this.location = location;
        this.lastSequenceNumber = lastSequenceNumber;
        this.lastUpdatedMs = lastUpdatedMs;
        this.lastColumnId = lastColumnId;
        this.currentSchemaId = currentSchemaId;
        this.schemas = schemas;
        this.defaultSpecId = defaultSpecId;
        this.lastPartitionId = lastPartitionId;
        this.defaultSortOrderId = defaultSortOrderId;
    }

    public int getFormatVersion() {
        return formatVersion;
    }

    public void setFormatVersion(int formatVersion) {
        this.formatVersion = formatVersion;
    }

    public String getTableUuid() {
        return tableUuid;
    }

    public void setTableUuid(String tableUuid) {
        this.tableUuid = tableUuid;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public long getLastSequenceNumber() {
        return lastSequenceNumber;
    }

    public void setLastSequenceNumber(long lastSequenceNumber) {
        this.lastSequenceNumber = lastSequenceNumber;
    }

    public long getLastUpdatedMs() {
        return lastUpdatedMs;
    }

    public void setLastUpdatedMs(long lastUpdatedMs) {
        this.lastUpdatedMs = lastUpdatedMs;
    }

    public int getLastColumnId() {
        return lastColumnId;
    }

    public void setLastColumnId(int lastColumnId) {
        this.lastColumnId = lastColumnId;
    }

    public int getCurrentSchemaId() {
        return currentSchemaId;
    }

    public void setCurrentSchemaId(int currentSchemaId) {
        this.currentSchemaId = currentSchemaId;
    }

    public Schema[] getSchemas() {
        return schemas;
    }

    public void setSchemas(Schema[] schemas) {
        this.schemas = schemas;
    }

    public int getDefaultSpecId() {
        return defaultSpecId;
    }

    public void setDefaultSpecId(int defaultSpecId) {
        this.defaultSpecId = defaultSpecId;
    }

    public int getLastPartitionId() {
        return lastPartitionId;
    }

    public void setLastPartitionId(int lastPartitionId) {
        this.lastPartitionId = lastPartitionId;
    }

    public int getDefaultSortOrderId() {
        return defaultSortOrderId;
    }

    public void setDefaultSortOrderId(int defaultSortOrderId) {
        this.defaultSortOrderId = defaultSortOrderId;
    }
}
