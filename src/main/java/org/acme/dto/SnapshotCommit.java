package org.acme.dto;

import jakarta.enterprise.context.RequestScoped;

import java.util.Map;

@RequestScoped
public class SnapshotCommit {
  private Integer sequenceNumber;
  private Long snapshotId;
  private Long timestampMs;
  private Map<String, String> summary;
  private String manifestList;
  private Integer schemaId;

  public SnapshotCommit() {
    // no-args constructor for Jackson
  }

  public SnapshotCommit(
      Integer sequenceNumber,
      Long snapshotId,
      Long timestampMs,
      Map<String, String> summary,
      String manifestList,
      Integer schemaId) {
    this.sequenceNumber = sequenceNumber;
    this.snapshotId = snapshotId;
    this.timestampMs = timestampMs;
    this.summary = summary;
    this.manifestList = manifestList;
    this.schemaId = schemaId;
  }

  public Integer getSequenceNumber() {
    return sequenceNumber;
  }

  public void setSequenceNumber(Integer sequenceNumber) {
    this.sequenceNumber = sequenceNumber;
  }

  public Long getSnapshotId() {
    return snapshotId;
  }

  public void setSnapshotId(Long snapshotId) {
    this.snapshotId = snapshotId;
  }

  public Long getTimestampMs() {
    return timestampMs;
  }

  public void setTimestampMs(Long timestampMs) {
    this.timestampMs = timestampMs;
  }

  public Map<String, String> getSummary() {
    return summary;
  }

  public void setSummary(Map<String, String> summary) {
    this.summary = summary;
  }

  public String getManifestList() {
    return manifestList;
  }

  public void setManifestList(String manifestList) {
    this.manifestList = manifestList;
  }

  public Integer getSchemaId() {
    return schemaId;
  }

  public void setSchemaId(Integer schemaId) {
    this.schemaId = schemaId;
  }
}
