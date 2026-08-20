package org.acme.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.ws.rs.core.Response;

import org.acme.dto.IcebergMetadata;
import org.acme.dto.SnapshotCommit;
import org.acme.dto.TableUpdate;
import org.acme.dto.UpdateAddSnapshot;
import org.acme.dto.UpdateSetSnapshotRef;
import org.acme.exceptions.InvalidUpdateException;

import org.acme.enums.ActionType;

@ApplicationScoped
public class SnapshotApplier implements TableUpdateApplier {

  @Override
  public Set<String> actions() {
    // return Set.of("add-snapshot", "set-snapshot-ref");
    return Arrays.stream(ActionType.values()).map(ActionType::getAction).collect(Collectors.toSet());
  }

  @Override
  public void apply(IcebergMetadata metadata, TableUpdate update) {
    switch (update) {
      case UpdateAddSnapshot(SnapshotCommit snapshot) -> {
        List<SnapshotCommit> existing = metadata.getSnapshots();
        if (existing == null) {
          List<SnapshotCommit> snapshots = new ArrayList<>();
          snapshots.add(snapshot);
          metadata.setSnapshots(snapshots);
        }
      }
      case UpdateSetSnapshotRef(String refName, Long snapshotId, String type) -> {
        metadata.setCurrentSnapshotId(snapshotId);
      }
      default -> throw new InvalidUpdateException(
          "Unsupported snapshot update: " + update.action(),
          Response.Status.BAD_REQUEST);
    }
  }
}
