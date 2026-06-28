package org.acme.dto;

public class WriteOrderFields {

    private Integer sourceId;
    private String name;
    private String[] transform;
    private String direction;
    private String nullOrder;

    public WriteOrderFields() {
        // no-args constructor for Jackson
    }

    public WriteOrderFields(
        Integer sourceId,
        String name,
        String[] transform,
        String direction,
        String nullOrder
    ) {
        this.sourceId = sourceId;
        this.name = name;
        this.transform = transform;
        this.direction = direction;
        this.nullOrder = nullOrder;
    }

    public Integer getSourceId() {
        return sourceId;
    }

    public void setSourceId(Integer sourceId) {
        this.sourceId = sourceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String[] getTransform() {
        return transform;
    }

    public void setTransform(String[] transform) {
        this.transform = transform;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getNullOrder() {
        return nullOrder;
    }

    public void setNullOrder(String nullOrder) {
        this.nullOrder = nullOrder;
    }
}
