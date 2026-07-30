package org.acme.dto;

public class Schema {

  private String type;
  private int id;
  private Boolean required;
  private SchemaField[] fields;

  public Schema() {
    // no-args constructor for Jackson
  }

  public Schema(String type, int id, SchemaField[] fields) {
    this.type = type;
    this.id = id;
    this.fields = fields;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public SchemaField[] getFields() {
    return fields;
  }

  public void setFields(SchemaField[] fields) {
    this.fields = fields;
  }

  public Boolean getRequired() {
    return required;
  }

  public void setRequired(Boolean required) {
    this.required = required;
  }
}
