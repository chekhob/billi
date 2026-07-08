package org.acme.services;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.acme.entity.NamespaceObject;
import org.acme.repo.NamespaceRepository;
import org.eclipse.microprofile.config.inject.ConfigProperty;

@RequestScoped
public class NamespaceEntityService {

    @Inject
    MetadataRequests metadataRequests;

    @Inject
    NamespaceRepository namespaceRepository;

    @ConfigProperty(name = "bucket.name")
    String bucket;

    @Transactional
    public NamespaceObject getNamespaceEntityDetails(UUID namespaceId) {
        return namespaceRepository.findById(namespaceId);
    }

    @Transactional
    public NamespaceObject findByNamespace(List<String> namespace) {
        return namespaceRepository.findByNamespace(namespace);
    }

    @Transactional
    public NamespaceObject findByName(String name) {
        return namespaceRepository.findByName(name);
    }

    @Transactional
    public NamespaceObject createNamespace(NamespaceObject ns_object) {
        Map<String, String> properties = ns_object.getProperties();
        if (properties == null) {
            properties = new java.util.HashMap<>();
            ns_object.setProperties(properties);
        }
        if (!properties.containsKey("location")) {
            String namespacePath = String.join("/", ns_object.getNamespace());
            properties.put("location", "s3://" + bucket + "/" + namespacePath);
        }
        namespaceRepository.persist(ns_object);
        return ns_object;
    }

    @Transactional
    public void deleteById(UUID uuid) {
        NamespaceObject ns_object = getNamespaceEntityDetails(uuid);
        namespaceRepository.deleteNamespace(ns_object);
    }
}
