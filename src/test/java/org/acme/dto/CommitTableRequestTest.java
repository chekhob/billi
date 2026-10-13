package org.acme.dto;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertInstanceOf;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.annotation.JsonInclude;

import org.acme.dto.requirement.AssertRefSnapshotId;
import org.acme.dto.requirement.AssertTableUUID;
import org.acme.dto.requirement.TableRequirement;

import java.util.List;

class CommitTableRequestTest {

    private static ObjectMapper objectMapper;

    @BeforeAll
    static void setUp() {
        objectMapper = new ObjectMapper()
                .setPropertyNamingStrategy(PropertyNamingStrategies.KEBAB_CASE)
                .setSerializationInclusion(JsonInclude.Include.NON_NULL);
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
    }

    @Test
    void deserializeRequirementsIntoCorrectSubtypes() throws Exception {
        String json = """
                {
                  "requirements": [
                    { "type": "assert-table-uuid", "uuid": "22ab6f4e-5f16-4777-bedf-70d8a2845f15" },
                    { "type": "assert-ref-snapshot-id", "ref": "main", "snapshot-id": null }
                  ]
                }
                """;

        CommitTableRequest request = objectMapper.readValue(json, CommitTableRequest.class);

        List<TableRequirement> requirements = request.getRequirements();
        assertEquals(2, requirements.size());

        assertInstanceOf(AssertTableUUID.class, requirements.get(0));
        AssertTableUUID uuidReq = (AssertTableUUID) requirements.get(0);
        assertEquals("22ab6f4e-5f16-4777-bedf-70d8a2845f15", uuidReq.uuid());

        assertInstanceOf(AssertRefSnapshotId.class, requirements.get(1));
        AssertRefSnapshotId refReq = (AssertRefSnapshotId) requirements.get(1);
        assertEquals("main", refReq.ref());
        assertNull(refReq.snapshotId());
    }

    @Test
    void requirementAccessorReturnsRequestedSubtype() throws Exception {
        String json = """
                {
                  "requirements": [
                    { "type": "assert-table-uuid", "uuid": "22ab6f4e-5f16-4777-bedf-70d8a2845f15" },
                    { "type": "assert-ref-snapshot-id", "ref": "main", "snapshot-id": null }
                  ]
                }
                """;

        CommitTableRequest request = objectMapper.readValue(json, CommitTableRequest.class);

        AssertTableUUID uuidReq = request.requirement(AssertTableUUID.class);
        assertEquals("22ab6f4e-5f16-4777-bedf-70d8a2845f15", uuidReq.uuid());

        AssertRefSnapshotId refReq = request.requirement(AssertRefSnapshotId.class);
        assertEquals("main", refReq.ref());
        assertNull(refReq.snapshotId());
    }

    @Test
    void requirementAccessorReturnsNullWhenAbsent() throws Exception {
        CommitTableRequest request = objectMapper.readValue("{}", CommitTableRequest.class);

        assertNull(request.requirement(AssertTableUUID.class));
    }

    @Test
    void deserializeNonNullSnapshotId() throws Exception {
        String json = """
                {
                  "requirements": [
                    { "type": "assert-ref-snapshot-id", "ref": "main", "snapshot-id": 8912320219285957195 }
                  ]
                }
                """;

        CommitTableRequest request = objectMapper.readValue(json, CommitTableRequest.class);

        AssertRefSnapshotId refReq = (AssertRefSnapshotId) request.getRequirements().get(0);
        assertEquals(8912320219285957195L, refReq.snapshotId());
    }

    @Test
    void serializePreservesTypeDiscriminator() throws Exception {
        CommitTableRequest request = new CommitTableRequest(
                List.of(
                        new AssertTableUUID("22ab6f4e-5f16-4777-bedf-70d8a2845f15"),
                        new AssertRefSnapshotId("main", 8912320219285957195L)),
                null);

        String json = objectMapper.writeValueAsString(request);

        String expected = """
                {
                  "requirements" : [ {
                    "type" : "assert-table-uuid",
                    "uuid" : "22ab6f4e-5f16-4777-bedf-70d8a2845f15"
                  }, {
                    "type" : "assert-ref-snapshot-id",
                    "ref" : "main",
                    "snapshot-id" : 8912320219285957195
                  } ]
                }""";

        assertEquals(objectMapper.readTree(expected), objectMapper.readTree(json));
    }
}
