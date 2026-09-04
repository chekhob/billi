package org.acme.dto.requirement;

import org.acme.dto.IcebergMetadata;
import org.acme.exceptions.InvalidRequirementException;

import com.fasterxml.jackson.annotation.JsonTypeName;

import jakarta.ws.rs.core.Response;

@JsonTypeName("assert-ref-snapshot-id")
public record AssertRefSnapshotId(String ref, Long snapshotId) implements TableRequirement {

  @Override
  public void validate(IcebergMetadata current) {
    Long currentSnapshotId = current.getCurrentSnapshotId();
    if (snapshotId == null) {
      // asserting the ref does not exist
      if (currentSnapshotId != null && currentSnapshotId.longValue() != IcebergMetadata.DEFAULT_SNAPSHOT_ID) {
        throw new InvalidRequirementException(
            "Ref " + ref + " exists with snapshot-id " + currentSnapshotId
                + ", expected no ref",
            Response.Status.CONFLICT);
      }
    } else if (currentSnapshotId == null || currentSnapshotId.longValue() != snapshotId.longValue()) {
      throw new InvalidRequirementException(
          "Ref " + ref + " snapshot-id mismatch: expected " + snapshotId + " but was "
              + currentSnapshotId,
          Response.Status.CONFLICT);
    }
  }
}
