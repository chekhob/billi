package org.acme.dto;

public class SortOrderField {

    private int sourceId;
    private String transform;
    private String direction;
    private String nullOrder;

    public SortOrderField() {}

    public SortOrderField(
        int sourceId,
        String transform,
        String direction,
        String nullOrder
    ) {
        this.sourceId = sourceId;
        this.transform = transform;
        this.direction = direction;
        this.nullOrder = nullOrder;
    }

    public int getSourceId() {
        return sourceId;
    }

    public void setSourceId(int sourceId) {
        this.sourceId = sourceId;
    }

    public String getTransform() {
        return transform;
    }

    public void setTransform(String transform) {
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

// Transform:
//   type: string
//   example:
//     - "identity"
//     - "year"
//     - "month"
//     - "day"
//     - "hour"
//     - "bucket[256]"
//     - "truncate[16]"

// SortDirection:
//   type: string
//   enum: ["asc", "desc"]

// NullOrder:
//   type: string
//   enum: ["nulls-first", "nulls-last"]
