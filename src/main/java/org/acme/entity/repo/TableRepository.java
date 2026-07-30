package org.acme.entity.repo;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import java.util.List;
import java.util.UUID;
import org.acme.entity.TableObject;

@ApplicationScoped
public class TableRepository implements PanacheRepository<TableObject> {

    @Inject
    EntityManager entityManager;

    public TableObject findById(UUID tableId) {
        return find("id =?1", tableId).firstResult();
    }

    public TableObject findByTable(List<String> table) {
        return find("table = ?1", table).firstResult();
    }

    @SuppressWarnings("unchecked")
    public TableObject findByName(String name) {
        List<TableObject> results = entityManager
            .createNativeQuery(
                "SELECT * FROM data_tables WHERE table->(jsonb_array_length(table) - 1) = ?1",
                TableObject.class
            )
            .setParameter(1, name)
            .getResultList();
        return results.isEmpty() ? null : (TableObject) results.get(0);
    }

    public void deleteTable(TableObject table) {
        delete(table);
    }
}
