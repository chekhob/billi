package org.acme.entity.repo;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;
import org.acme.entity.SnapshotEntity;

import java.util.UUID;

@ApplicationScoped
public class SnapshotRepository implements PanacheRepository<SnapshotEntity> {

    public SnapshotEntity findInTable(Long snapshotId, UUID tableId) {
        if(snapshotId == null){
            snapshotId = (long) -1;
        }
        return find("snapshotId = ?1 and tableId = ?2", snapshotId, tableId).firstResult();
    }

}
