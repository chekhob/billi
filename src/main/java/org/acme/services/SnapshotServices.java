package org.acme.services;

import jakarta.inject.Inject;
import org.acme.dto.IcebergMetadata;

public class SnapshotServices {
    @Inject
    SnapshotEntityService snapshotEntityService;

    public void createNewSnapshot(IcebergMetadata metadata, String metadataLocation) {
        snapshotEntityService.createSnapshotEntry(metadata, metadataLocation);
    }

}
