package org.acme.entity;

import java.io.Serializable;
import java.util.Objects;
import java.util.UUID;

public class SnapshotId implements Serializable {

    private Long snapshotId;
    private UUID tableId;

    public SnapshotId() {
    }

    public SnapshotId(Long snapshotId, UUID tableId) {
        this.snapshotId = snapshotId;
        this.tableId = tableId;
    }

    public Long getSnapshotId() {
        return snapshotId;
    }

    public void setSnapshotId(Long snapshotId) {
        this.snapshotId = snapshotId;
    }

    public UUID getTableId() {
        return tableId;
    }

    public void setTableId(UUID tableId) {
        this.tableId = tableId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SnapshotId that = (SnapshotId) o;
        return Objects.equals(snapshotId, that.snapshotId)
            && Objects.equals(tableId, that.tableId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(snapshotId, tableId);
    }
}
