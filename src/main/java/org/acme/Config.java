package org.acme;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.HashMap;
import java.util.Map;

@Path("/config")
class Config {
    private HashMap<String, Object> config = new HashMap<>();

    public Config() {
        config.put("defaults",  Map.of());
        config.put("overrides",  Map.of());
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getConfig() throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        return Response.ok(this.config).build();
    }
}
