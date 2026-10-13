package org.acme.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@IdClass(SnapshotId.class)
@Table(name = "snapshot")
public class SnapshotEntity {
    @Id
    private Long snapshotId;
    @Id
    private UUID tableId;

    private Long sequenceNumber;
    private LocalDateTime timestampMs;
    private Long parentSnapshotId;

    private String metadataLocation;

    public SnapshotEntity() {
    }

    public SnapshotEntity(Long sequenceNumber, LocalDateTime timestampMs, UUID tableId, Long snapshotId, String metadataLocation) {
        this.sequenceNumber = sequenceNumber;
        this.timestampMs = timestampMs;
        this.tableId = tableId;
        this.snapshotId = snapshotId;
        this.metadataLocation=metadataLocation;
    }

    public SnapshotEntity(Long sequenceNumber, LocalDateTime timestampMs, UUID tableId, Long snapshotId, String metadataLocation, Long parentSnapshotId) {
        this.sequenceNumber = sequenceNumber;
        this.timestampMs = timestampMs;
        this.tableId = tableId;
        this.snapshotId = snapshotId;
        this.metadataLocation=metadataLocation;
        this.parentSnapshotId = parentSnapshotId;
    }

    public Long getSequenceNumber() {
        return sequenceNumber;
    }

    public void setSequenceNumber(Long sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }

    public LocalDateTime getTimestampMs() {
        return timestampMs;
    }

    public void setTimestampMs(LocalDateTime timestampMs) {
        this.timestampMs = timestampMs;
    }

    public UUID getTableId() {
        return tableId;
    }

    public void setTableId(UUID tableId) {
        this.tableId = tableId;
    }

    public Long getSnapshotId() {
        return snapshotId;
    }

    public void setSnapshotId(Long snapshotId) {
        this.snapshotId = snapshotId;
    }

    public Long getParentSnapshotId() {
        return parentSnapshotId;
    }

    public void setParentSnapshotId(Long parentSnapshotId) {
        this.parentSnapshotId = parentSnapshotId;
    }

    public String getMetadataLocation() {
        return metadataLocation;
    }

    public void setMetadataLocation(String metadataLocation) {
        this.metadataLocation = metadataLocation;
    }
}
