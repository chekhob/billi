package org.acme.repo;

import io.quarkus.hibernate.orm.panache.PanacheRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import java.util.List;
import java.util.UUID;
import org.acme.entity.NamespaceObject;

@ApplicationScoped
public class NamespaceRepository implements PanacheRepository<NamespaceObject> {

    @Inject
    EntityManager entityManager;

    public NamespaceObject findById(UUID namespaceId) {
        return find("id =?1", namespaceId).firstResult();
    }

    public NamespaceObject findByNamespace(List<String> namespace) {
        return find("namespace = ?1", namespace).firstResult();
    }

    @SuppressWarnings("unchecked")
    public NamespaceObject findByName(String name) {
        List<NamespaceObject> results = entityManager
            .createNativeQuery(
                "SELECT * FROM namespaces WHERE namespace->(jsonb_array_length(namespace) - 1) = ?1",
                NamespaceObject.class
            )
            .setParameter(1, name)
            .getResultList();
        return results.isEmpty() ? null : (NamespaceObject) results.get(0);
    }

    public void deleteNamespace(NamespaceObject namespace) {
        delete(namespace);
    }
}
