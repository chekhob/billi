package org.acme.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.UuidGenerator;
import org.hibernate.annotations.UuidGenerator.Style;
import org.hibernate.type.SqlTypes;

@Entity
@Table(name = "namespace")
public class NamespaceObject {

  @Id
  @UuidGenerator(style = Style.TIME)
  private UUID uuid;

  @JdbcTypeCode(SqlTypes.JSON)
  private List<String> namespace;

  private UUID idempotentKey;

  @JdbcTypeCode(SqlTypes.JSON)
  private Map<String, String> properties;

  public NamespaceObject() {
  }

  public UUID getUuid() {
    return uuid;
  }

  public void setUuid(UUID id) {
    this.uuid = id;
  }

  public List<String> getNamespace() {
    return namespace;
  }

  public void setNamespace(List<String> namespace) {
    this.namespace = namespace;
  }

  public UUID getIdempotentKey() {
    return idempotentKey;
  }

  public void setIdempotentKey(UUID idempotentKey) {
    this.idempotentKey = idempotentKey;
  }

  public Map<String, String> getProperties() {
    return properties;
  }

  public void setProperties(Map<String, String> properties) {
    this.properties = properties;
  }
}
