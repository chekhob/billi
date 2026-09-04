package org.acme.dto.update;

import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("set-snapshot-ref")
public record UpdateSetSnapshotRef(String refName, Long snapshotId, String type) implements TableUpdate {

  @Override
  public String action() {
    return "set-snapshot-ref";
  }
}
// TODO?: Maybe type can be added to an enum?
