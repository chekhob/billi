package org.acme.services;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import org.acme.dto.IcebergMetadata;
import org.acme.entity.SnapshotEntity;
import org.acme.entity.repo.SnapshotRepository;

import java.util.UUID;

@RequestScoped
public class SnapshotEntityService {

    @Inject
    SnapshotRepository snapshotRepository;
    @Transactional
    public void createSnapshotEntry(IcebergMetadata metadata, String metadataLocation){
        SnapshotEntity snapshotEntity = new SnapshotEntity();
        snapshotEntity.setSnapshotId(metadata.getCurrentSnapshotId());
        snapshotEntity.setSequenceNumber(metadata.getLastSequenceNumber());
        snapshotEntity.setTableId(metadata.getTableUuid());
        snapshotEntity.setMetadataLocation(metadataLocation);

        snapshotRepository.persist(snapshotEntity);
    }

    public SnapshotEntity getSnapshotDetails(Long snapshotId, UUID tableId){
        return snapshotRepository.findInTable(snapshotId,tableId);
    }

}
