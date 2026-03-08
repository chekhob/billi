package org.acme;

public class TableMetadata {
    int format_version;
    String table_uuid;
    String location;
    long last_sequence_number;
    long last_updated_ms;
    int last_column_id;
    int current_schema_id;
    Schema[] schemas;
    int default_spec_id;
    int last_partition_id;
    int default_sort_order_id;
}
