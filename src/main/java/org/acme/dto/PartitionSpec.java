package org.acme.dto;

public class PartitionSpec {

    private int specId;
    private WriteOrderFields[] fields;

    public PartitionSpec() {
        // no-args constructor for Jackson
    }

    public PartitionSpec(int specId, WriteOrderFields[] fields) {
        this.specId = specId;
        this.fields = fields;
    }

    public int getSpecId() {
        return specId;
    }

    public void setSpecId(int specId) {
        this.specId = specId;
    }

    public WriteOrderFields[] getFields() {
        return fields;
    }

    public void setFields(WriteOrderFields[] fields) {
        this.fields = fields;
    }
}
