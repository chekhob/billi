package org.acme.dto.update;

import org.acme.dto.SnapshotCommit;

import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("add-snapshot")
public record UpdateAddSnapshot(SnapshotCommit snapshot) implements TableUpdate {

  @Override
  public String action() {
    return "add-snapshot";
  }
}
