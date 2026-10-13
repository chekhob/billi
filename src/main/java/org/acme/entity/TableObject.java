package org.acme.entity;

import jakarta.persistence.*;

import java.util.UUID;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;

@Entity
@Table(name = "data_table")
public class TableObject {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private int id;

  private UUID uuid;

  private String name;

  private String location;

  private int lastColumnId;

  private long lastSequenceNumber;

  private int currentSchemaId;

  private long currentSnapshotId;

  @ManyToOne
  @JoinColumn(name = "namespace_id", referencedColumnName = "uuid")
  private NamespaceObject namespace;


  // @JdbcTypeCode(SqlTypes.JSON)
  // private Map<String, String> properties;

  public TableObject() {
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public UUID getUuid() {
    return uuid;
  }

  public void setUUID(UUID uuid) {
    this.uuid = uuid;
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public int getLastColumnId() {
    return lastColumnId;
  }

  public void setLastColumnId(int lastColumnId) {
    this.lastColumnId = lastColumnId;
  }

  public long getLastSequenceNumber() {
    return lastSequenceNumber;
  }

  public void setLastSequenceNumber(long lastSequenceNumber) {
    this.lastSequenceNumber = lastSequenceNumber;
  }

  public int getCurrentSchemaId() {
    return currentSchemaId;
  }

  public void setCurrentSchemaId(int currentSchemaId) {
    this.currentSchemaId = currentSchemaId;
  }

  public long getCurrentSnapshotId() {
    return currentSnapshotId;
  }

  public void setCurrentSnapshotId(long currentSnapshotId) {
    this.currentSnapshotId = currentSnapshotId;
  }

  public NamespaceObject getNamespace() {
    return namespace;
  }

  public void setNamespace(NamespaceObject namespace) {
    this.namespace = namespace;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  // public Map<String, String> getProperties() {
  // return properties;
  // }

  // public void setProperties(Map<String, String> properties) {
  // this.properties = properties;
  // }
}
