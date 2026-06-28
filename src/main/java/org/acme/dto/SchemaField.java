package org.acme.dto;

public class SchemaField {

    private int id;
    private String name;
    private boolean required;
    private String type;

    public SchemaField() {
        // no-args constructor for Jackson
    }

    public SchemaField(int id, String name, boolean required, String type) {
        this.id = id;
        this.name = name;
        this.required = required;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isRequired() {
        return required;
    }

    public void setRequired(boolean required) {
        this.required = required;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
