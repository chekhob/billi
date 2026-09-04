package org.acme.dto.update;

import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("remove-snapshot-ref")
public record UpdateRemoveSnapshotRef(String refName) implements TableUpdate {

  @Override
  public String action() {
    return "remove-snapshot-ref";
  }
}
