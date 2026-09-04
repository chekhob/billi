package org.acme.dto.update;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("remove-snapshots")
public record UpdateRemoveSnapshots(List<Long> snapshotIds) implements TableUpdate {

  @Override
  public String action() {
    return "remove-snapshots";
  }
}
