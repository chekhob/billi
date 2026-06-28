package org.acme.dto;

public class WriteOrder {

    private Integer orderId;
    private WriteOrderFields[] fields;
    private Boolean stageCreate;
    private NamespaceProperties properties;

    public WriteOrder() {
        // no-args constructor for Jackson
    }

    public WriteOrder(
        Integer orderId,
        WriteOrderFields[] fields,
        Boolean stageCreate,
        NamespaceProperties properties
    ) {
        this.orderId = orderId;
        this.fields = fields;
        this.stageCreate = stageCreate;
        this.properties = properties;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public WriteOrderFields[] getFields() {
        return fields;
    }

    public void setFields(WriteOrderFields[] fields) {
        this.fields = fields;
    }

    public Boolean getStageCreate() {
        return stageCreate;
    }

    public void setStageCreate(Boolean stageCreate) {
        this.stageCreate = stageCreate;
    }

    public NamespaceProperties getProperties() {
        return properties;
    }

    public void setProperties(NamespaceProperties properties) {
        this.properties = properties;
    }
}
