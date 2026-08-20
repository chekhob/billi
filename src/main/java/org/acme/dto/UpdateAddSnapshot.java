package org.acme.dto;

import java.util.Map;
import com.fasterxml.jackson.annotation.JsonTypeName;

@JsonTypeName("add-snapshot")
public record UpdateAddSnapshot(SnapshotCommit snapshot) implements TableUpdate {

  @Override
  public String action() {
    return "add-snapshot";
  }
}
