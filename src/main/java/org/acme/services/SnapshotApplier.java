package org.acme.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.ws.rs.core.Response;

import org.acme.dto.IcebergMetadata;
import org.acme.dto.SnapshotCommit;
import org.acme.dto.update.TableUpdate;
import org.acme.dto.update.UpdateAddSnapshot;
import org.acme.dto.update.UpdateRemoveSnapshotRef;
import org.acme.dto.update.UpdateRemoveSnapshots;
import org.acme.dto.update.UpdateSetSnapshotRef;
import org.acme.exceptions.InvalidUpdateException;

import org.acme.enums.ActionType;

@ApplicationScoped
public class SnapshotApplier implements TableUpdateApplier {

  @Override
  public Set<String> actions() {
    return Set.of(
        ActionType.ADD_SNAPSHOT.getAction(),
        ActionType.SET_SNAPSHOT_REF.getAction(),
        ActionType.REMOVE_SNAPSHOT_REF.getAction(),
        ActionType.REMOVE_SNAPSHOTS.getAction());
  }

  @Override
  public void apply(IcebergMetadata metadata, TableUpdate update) {
    switch (update) {
      case UpdateAddSnapshot(SnapshotCommit snapshot) -> {
        List<SnapshotCommit> existingSnapshotCommits = metadata.getSnapshots();
        if (existingSnapshotCommits == null) {
          List<SnapshotCommit> snapshots = new ArrayList<>();
          snapshots.add(snapshot);
          metadata.setSnapshots(snapshots);
        }
        else{
            existingSnapshotCommits.add(snapshot);
        }
      }
      case UpdateSetSnapshotRef(String refName, Long snapshotId, String type) -> {
        metadata.setCurrentSnapshotId(snapshotId);
      }
      case UpdateRemoveSnapshotRef(String refName) -> {
        // TODO: refs model not yet implemented; ref removal transformation deferred
      }
      case UpdateRemoveSnapshots(List<Long> snapshotIds) -> {
        // TODO: snapshots removal transformation deferred
      }
      default -> throw new InvalidUpdateException(
          "Unsupported snapshot update: " + update.action(),
          Response.Status.BAD_REQUEST);
    }
  }
}
