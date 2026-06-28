package org.acme.dto;

public class SortOrder {

    private Integer orderId;
    private SortOrderField[] fields;

    public SortOrder() {
        // no-args constructor for Jackson
    }

    public SortOrder(int id, SortOrderField[] fields) {
        this.orderId = id;
        this.fields = fields;
    }

    public int getOrderId() {
        return this.orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public SortOrderField[] getFields() {
        return this.fields;
    }

    public void setFields(SortOrderField[] fields) {
        this.fields = fields;
    }
}

// SortOrder:
//   type: object
//   required:
//     - order-id
//     - fields
//   properties:
//     order-id:
//       type: integer
//       readOnly: true
//     fields:
//       type: array
//       items:
//         $ref: '#/components/schemas/SortField'
