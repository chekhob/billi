package org.acme.dto;

public class CreateTableRequest {

    private String name;
    private String location;
    private Schema schema;
    private PartitionSpec partitionSpec;
    private WriteOrder writeOrder;
    private TableProperties properties;
    private Boolean stageCreate;

    public CreateTableRequest() {
        // no-args constructor for Jackson
    }

    public CreateTableRequest(
        String name,
        String location,
        Schema schema,
        PartitionSpec partitionSpec,
        WriteOrder writeOrder,
        TableProperties properties,
        Boolean stageCreate
    ) {
        this.name = name;
        this.location = location;
        this.schema = schema;
        this.partitionSpec = partitionSpec;
        this.writeOrder = writeOrder;
        this.properties = properties;
        this.stageCreate = stageCreate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
}
