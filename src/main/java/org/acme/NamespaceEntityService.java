package org.acme;

import jakarta.enterprise.context.RequestScoped;
import jakarta.transaction.Transactional;
import org.bson.types.ObjectId;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import java.util.List;
import java.util.Map;

@RequestScoped
public class NamespaceEntityService {

    @ConfigProperty(name = "bucket.name")
    String bucket;
    @Transactional
    public NamespaceObject getNamespaceEntityDetails(String namespaceId) {
        ObjectId ns_id = new ObjectId(namespaceId);
        NamespaceObject namespaceDetails = NamespaceObject.findById(ns_id);
        return namespaceDetails;
    }

    @Transactional
    public NamespaceObject findByNamespace(List<String> namespace) {
        return NamespaceObject.find("namespace", namespace).firstResult();
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
        ns_object.persist();
        return ns_object;
    }
}
