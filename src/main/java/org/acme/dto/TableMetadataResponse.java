package org.acme.dto;

import java.util.Map;

public class TableMetadataResponse {
  private String metadataLocation;
  // private TableMetadata metadata;
  private Map<String, Object> metadata;

  public TableMetadataResponse() {
  }

  // public TableMetadataResponse(String metadataLocation, TableMetadata
  // metadata){
  // this.metadataLocation = metadataLocation;
  // this.metadata = metadata;
  // }
  public TableMetadataResponse(String metadataLocation, Map<String, Object> metadata) {
    this.metadataLocation = metadataLocation;
    this.metadata = metadata;
  }

  public String getMetadataLocation() {
    return metadataLocation;
  }

  public void setMetadataLocation(String metadataLocation) {
    this.metadataLocation = metadataLocation;
  }

  public Map<String, Object> getMetadata() {
    return metadata;
  }

  public void setMetadata(Map<String, Object> metadata) {
    this.metadata = metadata;
  }

  // public TableMetadata getMetadata() {
  // return metadata;
  // }

  // public void setMetadata(TableMetadata metadata) {
  // this.metadata = metadata;
  // }

}
