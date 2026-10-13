package org.acme.services;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.UUID;
import org.acme.entity.TableObject;
import org.acme.entity.repo.TableRepository;

@RequestScoped
public class TableEntityService {

    @Inject
    TableRepository tableRepository;

    @Transactional
    public TableObject findById(UUID tableId) {
        return tableRepository.findById(tableId);
    }

//    @Transactional
//    public TableObject findByTable(List<String> table) {
//        return tableRepository.findByTable(table);
//    }

    @Transactional
    public TableObject findByName(String name, List<String> namespace) {
        return tableRepository.findByName(name, namespace);
    }

    @Transactional
    public void createTable(TableObject tableObject) {
        tableRepository.persist(tableObject);
    }

    @Transactional
    public void updateSnapshotRef(Long updatedSnapshotId, UUID tableUUID){
        TableObject tableObject = findById(tableUUID);
        tableObject.setCurrentSnapshotId(updatedSnapshotId);
        tableRepository.persist(tableObject);
    }

    @Transactional
    public void deleteById(UUID tableId) {
        TableObject tableObject = findById(tableId);
        tableRepository.deleteTable(tableObject);
    }
}
