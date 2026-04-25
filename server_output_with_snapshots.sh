=== Frame 76 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 0,
    "last-updated-ms": 1772478933987,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      # shellcheck disable=SC1073
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": -1,
    "refs": {},
    "snapshots": [],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [],
    "metadata-log": []
  },
  "config": {}
}

=== Frame 92 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales?snapshots=all

=== Frame 99 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json (to warehouse.minio:9000)

=== Frame 101 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 0,
  "last-updated-ms": 1772478933987,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": -1,
  "refs": {},
  "snapshots": [],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [],
  "metadata-log": []
}

=== Frame 103 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales?snapshots=all
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 0,
    "last-updated-ms": 1772478933987,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": -1,
    "refs": {},
    "snapshots": [],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [],
    "metadata-log": []
  },
  "config": {}
}

=== Frame 106 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales

=== Frame 107 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json (to warehouse.minio:9000)

=== Frame 108 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 0,
  "last-updated-ms": 1772478933987,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": -1,
  "refs": {},
  "snapshots": [],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [],
  "metadata-log": []
}

=== Frame 110 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 0,
    "last-updated-ms": 1772478933987,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": -1,
    "refs": {},
    "snapshots": [],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [],
    "metadata-log": []
  },
  "config": {}
}

=== Frame 112 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales
{
  "requirements": [
    {
      "type": "assert-table-uuid",
      "uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90"
    },
    {
      "type": "assert-ref-snapshot-id",
      "ref": "main",
      "snapshot-id": null
    }
  ],
  "updates": [
    {
      "action": "add-snapshot",
      "snapshot": {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      }
    },
    {
      "action": "set-snapshot-ref",
      "ref-name": "main",
      "snapshot-id": 6656377125404557408,
      "type": "branch"
    }
  ]
}

=== Frame 113 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json (to warehouse.minio:9000)

=== Frame 114 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 0,
  "last-updated-ms": 1772478933987,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": -1,
  "refs": {},
  "snapshots": [],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [],
  "metadata-log": []
}

=== Frame 117 ===

← RESPONSE to REST Catalog

Status: 100

=== Frame 118 ===

→ OUTGOING from REST Catalog
PUT /mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json (to warehouse.minio:9000)

=== Frame 120 ===

← RESPONSE to REST Catalog
 /mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json
Status: 200

=== Frame 121 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json (to warehouse.minio:9000)

=== Frame 123 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 1,
  "last-updated-ms": 1772479008877,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 6656377125404557408,
  "refs": {
    "main": {
      "snapshot-id": 6656377125404557408,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    }
  ]
}

=== Frame 125 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 1,
    "last-updated-ms": 1772479008877,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 6656377125404557408,
    "refs": {
      "main": {
        "snapshot-id": 6656377125404557408,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 127 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales

=== Frame 129 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json (to warehouse.minio:9000)

=== Frame 130 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 1,
  "last-updated-ms": 1772479008877,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 6656377125404557408,
  "refs": {
    "main": {
      "snapshot-id": 6656377125404557408,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    }
  ]
}

=== Frame 132 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 1,
    "last-updated-ms": 1772479008877,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 6656377125404557408,
    "refs": {
      "main": {
        "snapshot-id": 6656377125404557408,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 134 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales/metrics
{
  "report-type": "commit-report",
  "table-name": "local.mycat.sales",
  "snapshot-id": 6656377125404557408,
  "sequence-number": 1,
  "operation": "append",
  "metrics": {
    "total-duration": {
      "count": 1,
      "time-unit": "nanoseconds",
      "total-duration": 370474587
    },
    "attempts": {
      "unit": "count",
      "value": 1
    },
    "added-data-files": {
      "unit": "count",
      "value": 1
    },
    "total-data-files": {
      "unit": "count",
      "value": 1
    },
    "total-delete-files": {
      "unit": "count",
      "value": 0
    },
    "added-records": {
      "unit": "count",
      "value": 1
    },
    "total-records": {
      "unit": "count",
      "value": 1
    },
    "added-files-size-bytes": {
      "unit": "bytes",
      "value": 1279
    },
    "total-files-size-bytes": {
      "unit": "bytes",
      "value": 1279
    },
    "total-positional-deletes": {
      "unit": "count",
      "value": 0
    },
    "total-equality-deletes": {
      "unit": "count",
      "value": 0
    }
  },
  "metadata": {
    "engine-version": "3.5.5",
    "app-id": "local-1772478008209",
    "engine-name": "spark",
    "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
  }
}

=== Frame 135 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales/metrics
Status: 200

=== Frame 137 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales/metrics
{
  "report-type": "scan-report",
  "table-name": "local.mycat.sales",
  "snapshot-id": 6656377125404557408,
  "filter": true,
  "schema-id": 0,
  "projected-field-ids": [
    2,
    3
  ],
  "projected-field-names": [
    "customer",
    "amount"
  ],
  "metrics": {
    "total-planning-duration": {
      "count": 1,
      "time-unit": "nanoseconds",
      "total-duration": 66618942
    },
    "result-data-files": {
      "unit": "count",
      "value": 1
    },
    "result-delete-files": {
      "unit": "count",
      "value": 0
    },
    "total-data-manifests": {
      "unit": "count",
      "value": 1
    },
    "total-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "scanned-data-manifests": {
      "unit": "count",
      "value": 1
    },
    "skipped-data-manifests": {
      "unit": "count",
      "value": 0
    },
    "total-file-size-in-bytes": {
      "unit": "bytes",
      "value": 1279
    },
    "total-delete-file-size-in-bytes": {
      "unit": "bytes",
      "value": 0
    },
    "skipped-data-files": {
      "unit": "count",
      "value": 0
    },
    "skipped-delete-files": {
      "unit": "count",
      "value": 0
    },
    "scanned-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "skipped-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "indexed-delete-files": {
      "unit": "count",
      "value": 0
    },
    "equality-delete-files": {
      "unit": "count",
      "value": 0
    },
    "positional-delete-files": {
      "unit": "count",
      "value": 0
    },
    "dvs": {
      "unit": "count",
      "value": 0
    }
  },
  "metadata": {
    "engine-version": "3.5.5",
    "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)",
    "app-id": "local-1772478008209",
    "engine-name": "spark"
  }
}

=== Frame 139 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales/metrics
Status: 200

=== Frame 153 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales?snapshots=all

=== Frame 160 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json (to warehouse.minio:9000)

=== Frame 162 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 1,
  "last-updated-ms": 1772479008877,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 6656377125404557408,
  "refs": {
    "main": {
      "snapshot-id": 6656377125404557408,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    }
  ]
}

=== Frame 164 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales?snapshots=all
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 1,
    "last-updated-ms": 1772479008877,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 6656377125404557408,
    "refs": {
      "main": {
        "snapshot-id": 6656377125404557408,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 166 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales/metrics
{
  "report-type": "scan-report",
  "table-name": "local.mycat.sales",
  "snapshot-id": 6656377125404557408,
  "filter": {
    "type": "eq",
    "term": "customer",
    "value": "(hash-37cef14e)"
  },
  "schema-id": 0,
  "projected-field-ids": [
    1,
    2147483646,
    2,
    2147483645,
    3,
    4
  ],
  "projected-field-names": [
    "order_id",
    "_file",
    "customer",
    "_pos",
    "amount",
    "ts"
  ],
  "metrics": {
    "total-planning-duration": {
      "count": 1,
      "time-unit": "nanoseconds",
      "total-duration": 33157757
    },
    "result-data-files": {
      "unit": "count",
      "value": 1
    },
    "result-delete-files": {
      "unit": "count",
      "value": 0
    },
    "total-data-manifests": {
      "unit": "count",
      "value": 1
    },
    "total-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "scanned-data-manifests": {
      "unit": "count",
      "value": 1
    },
    "skipped-data-manifests": {
      "unit": "count",
      "value": 0
    },
    "total-file-size-in-bytes": {
      "unit": "bytes",
      "value": 1279
    },
    "total-delete-file-size-in-bytes": {
      "unit": "bytes",
      "value": 0
    },
    "skipped-data-files": {
      "unit": "count",
      "value": 0
    },
    "skipped-delete-files": {
      "unit": "count",
      "value": 0
    },
    "scanned-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "skipped-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "indexed-delete-files": {
      "unit": "count",
      "value": 0
    },
    "equality-delete-files": {
      "unit": "count",
      "value": 0
    },
    "positional-delete-files": {
      "unit": "count",
      "value": 0
    },
    "dvs": {
      "unit": "count",
      "value": 0
    }
  },
  "metadata": {
    "engine-version": "3.5.5",
    "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)",
    "app-id": "local-1772478008209",
    "engine-name": "spark"
  }
}

=== Frame 168 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales/metrics
Status: 200

=== Frame 170 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales/metrics
{
  "report-type": "scan-report",
  "table-name": "local.mycat.sales",
  "snapshot-id": 6656377125404557408,
  "filter": {
    "type": "and",
    "left": {
      "type": "not-null",
      "term": "customer"
    },
    "right": {
      "type": "eq",
      "term": "customer",
      "value": "(hash-37cef14e)"
    }
  },
  "schema-id": 0,
  "projected-field-ids": [
    2147483646,
    2
  ],
  "projected-field-names": [
    "_file",
    "customer"
  ],
  "metrics": {
    "total-planning-duration": {
      "count": 1,
      "time-unit": "nanoseconds",
      "total-duration": 15782933
    },
    "result-data-files": {
      "unit": "count",
      "value": 1
    },
    "result-delete-files": {
      "unit": "count",
      "value": 0
    },
    "total-data-manifests": {
      "unit": "count",
      "value": 1
    },
    "total-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "scanned-data-manifests": {
      "unit": "count",
      "value": 1
    },
    "skipped-data-manifests": {
      "unit": "count",
      "value": 0
    },
    "total-file-size-in-bytes": {
      "unit": "bytes",
      "value": 1279
    },
    "total-delete-file-size-in-bytes": {
      "unit": "bytes",
      "value": 0
    },
    "skipped-data-files": {
      "unit": "count",
      "value": 0
    },
    "skipped-delete-files": {
      "unit": "count",
      "value": 0
    },
    "scanned-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "skipped-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "indexed-delete-files": {
      "unit": "count",
      "value": 0
    },
    "equality-delete-files": {
      "unit": "count",
      "value": 0
    },
    "positional-delete-files": {
      "unit": "count",
      "value": 0
    },
    "dvs": {
      "unit": "count",
      "value": 0
    }
  },
  "metadata": {
    "engine-version": "3.5.5",
    "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)",
    "app-id": "local-1772478008209",
    "engine-name": "spark"
  }
}

=== Frame 172 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales/metrics
Status: 200

=== Frame 174 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales

=== Frame 175 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json (to warehouse.minio:9000)

=== Frame 176 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 1,
  "last-updated-ms": 1772479008877,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 6656377125404557408,
  "refs": {
    "main": {
      "snapshot-id": 6656377125404557408,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    }
  ]
}

=== Frame 178 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 1,
    "last-updated-ms": 1772479008877,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 6656377125404557408,
    "refs": {
      "main": {
        "snapshot-id": 6656377125404557408,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 180 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales
{
  "requirements": [
    {
      "type": "assert-table-uuid",
      "uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90"
    },
    {
      "type": "assert-ref-snapshot-id",
      "ref": "main",
      "snapshot-id": 6656377125404557408
    }
  ],
  "updates": [
    {
      "action": "add-snapshot",
      "snapshot": {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      }
    },
    {
      "action": "set-snapshot-ref",
      "ref-name": "main",
      "snapshot-id": 7025296218094013915,
      "type": "branch"
    }
  ]
}

=== Frame 182 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json (to warehouse.minio:9000)

=== Frame 183 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 1,
  "last-updated-ms": 1772479008877,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 6656377125404557408,
  "refs": {
    "main": {
      "snapshot-id": 6656377125404557408,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    }
  ]
}

=== Frame 186 ===

← RESPONSE to REST Catalog

Status: 100

=== Frame 187 ===

→ OUTGOING from REST Catalog
PUT /mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json (to warehouse.minio:9000)

=== Frame 189 ===

← RESPONSE to REST Catalog
 /mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json
Status: 200

=== Frame 190 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json (to warehouse.minio:9000)

=== Frame 193 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 2,
  "last-updated-ms": 1772479104679,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 7025296218094013915,
  "refs": {
    "main": {
      "snapshot-id": 7025296218094013915,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    }
  ]
}

=== Frame 194 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 2,
    "last-updated-ms": 1772479104679,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 7025296218094013915,
    "refs": {
      "main": {
        "snapshot-id": 7025296218094013915,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      },
      {
        "timestamp-ms": 1772479104679,
        "snapshot-id": 7025296218094013915
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      },
      {
        "timestamp-ms": 1772479008877,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 196 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales

=== Frame 197 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json (to warehouse.minio:9000)

=== Frame 200 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 2,
  "last-updated-ms": 1772479104679,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 7025296218094013915,
  "refs": {
    "main": {
      "snapshot-id": 7025296218094013915,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    }
  ]
}

=== Frame 201 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 2,
    "last-updated-ms": 1772479104679,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 7025296218094013915,
    "refs": {
      "main": {
        "snapshot-id": 7025296218094013915,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      },
      {
        "timestamp-ms": 1772479104679,
        "snapshot-id": 7025296218094013915
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      },
      {
        "timestamp-ms": 1772479008877,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 202 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales/metrics
{
  "report-type": "commit-report",
  "table-name": "local.mycat.sales",
  "snapshot-id": 7025296218094013915,
  "sequence-number": 2,
  "operation": "overwrite",
  "metrics": {
    "total-duration": {
      "count": 1,
      "time-unit": "nanoseconds",
      "total-duration": 159829676
    },
    "attempts": {
      "unit": "count",
      "value": 1
    },
    "added-data-files": {
      "unit": "count",
      "value": 1
    },
    "removed-data-files": {
      "unit": "count",
      "value": 1
    },
    "total-data-files": {
      "unit": "count",
      "value": 1
    },
    "total-delete-files": {
      "unit": "count",
      "value": 0
    },
    "added-records": {
      "unit": "count",
      "value": 1
    },
    "removed-records": {
      "unit": "count",
      "value": 1
    },
    "total-records": {
      "unit": "count",
      "value": 1
    },
    "added-files-size-bytes": {
      "unit": "bytes",
      "value": 1319
    },
    "removed-files-size-bytes": {
      "unit": "bytes",
      "value": 1279
    },
    "total-files-size-bytes": {
      "unit": "bytes",
      "value": 1319
    },
    "total-positional-deletes": {
      "unit": "count",
      "value": 0
    },
    "total-equality-deletes": {
      "unit": "count",
      "value": 0
    }
  },
  "metadata": {
    "engine-version": "3.5.5",
    "app-id": "local-1772478008209",
    "engine-name": "spark",
    "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
  }
}

=== Frame 204 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales/metrics
Status: 200

=== Frame 207 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales/metrics
{
  "report-type": "scan-report",
  "table-name": "local.mycat.sales",
  "snapshot-id": 7025296218094013915,
  "filter": {
    "type": "eq",
    "term": "order_id",
    "value": "(4-digit-int)"
  },
  "schema-id": 0,
  "projected-field-ids": [
    1,
    2,
    3,
    4
  ],
  "projected-field-names": [
    "order_id",
    "customer",
    "amount",
    "ts"
  ],
  "metrics": {
    "total-planning-duration": {
      "count": 1,
      "time-unit": "nanoseconds",
      "total-duration": 30965944
    },
    "result-data-files": {
      "unit": "count",
      "value": 1
    },
    "result-delete-files": {
      "unit": "count",
      "value": 0
    },
    "total-data-manifests": {
      "unit": "count",
      "value": 2
    },
    "total-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "scanned-data-manifests": {
      "unit": "count",
      "value": 1
    },
    "skipped-data-manifests": {
      "unit": "count",
      "value": 1
    },
    "total-file-size-in-bytes": {
      "unit": "bytes",
      "value": 1319
    },
    "total-delete-file-size-in-bytes": {
      "unit": "bytes",
      "value": 0
    },
    "skipped-data-files": {
      "unit": "count",
      "value": 0
    },
    "skipped-delete-files": {
      "unit": "count",
      "value": 0
    },
    "scanned-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "skipped-delete-manifests": {
      "unit": "count",
      "value": 0
    },
    "indexed-delete-files": {
      "unit": "count",
      "value": 0
    },
    "equality-delete-files": {
      "unit": "count",
      "value": 0
    },
    "positional-delete-files": {
      "unit": "count",
      "value": 0
    },
    "dvs": {
      "unit": "count",
      "value": 0
    }
  },
  "metadata": {
    "engine-version": "3.5.5",
    "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)",
    "app-id": "local-1772478008209",
    "engine-name": "spark"
  }
}

=== Frame 209 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales/metrics
Status: 200

=== Frame 211 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales

=== Frame 212 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json (to warehouse.minio:9000)

=== Frame 215 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 2,
  "last-updated-ms": 1772479104679,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 7025296218094013915,
  "refs": {
    "main": {
      "snapshot-id": 7025296218094013915,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    }
  ]
}

=== Frame 217 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 2,
    "last-updated-ms": 1772479104679,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 7025296218094013915,
    "refs": {
      "main": {
        "snapshot-id": 7025296218094013915,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      },
      {
        "timestamp-ms": 1772479104679,
        "snapshot-id": 7025296218094013915
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      },
      {
        "timestamp-ms": 1772479008877,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 219 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales
{
  "requirements": [
    {
      "type": "assert-table-uuid",
      "uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90"
    },
    {
      "type": "assert-ref-snapshot-id",
      "ref": "main",
      "snapshot-id": 7025296218094013915
    }
  ],
  "updates": [
    {
      "action": "add-snapshot",
      "snapshot": {
        "sequence-number": 3,
        "snapshot-id": 273821540950717088,
        "parent-snapshot-id": 7025296218094013915,
        "timestamp-ms": 1772479119262,
        "summary": {
          "operation": "delete",
          "spark.app.id": "local-1772478008209",
          "deleted-data-files": "1",
          "deleted-records": "1",
          "removed-files-size": "1319",
          "changed-partition-count": "1",
          "total-records": "0",
          "total-files-size": "0",
          "total-data-files": "0",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
        "schema-id": 0
      }
    },
    {
      "action": "set-snapshot-ref",
      "ref-name": "main",
      "snapshot-id": 273821540950717088,
      "type": "branch"
    }
  ]
}

=== Frame 221 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json (to warehouse.minio:9000)

=== Frame 224 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 2,
  "last-updated-ms": 1772479104679,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 7025296218094013915,
  "refs": {
    "main": {
      "snapshot-id": 7025296218094013915,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    }
  ]
}

=== Frame 227 ===

← RESPONSE to REST Catalog

Status: 100

=== Frame 228 ===

→ OUTGOING from REST Catalog
PUT /mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json (to warehouse.minio:9000)

=== Frame 230 ===

← RESPONSE to REST Catalog
 /mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json
Status: 200

=== Frame 231 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json (to warehouse.minio:9000)

=== Frame 234 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 3,
  "last-updated-ms": 1772479119262,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 273821540950717088,
  "refs": {
    "main": {
      "snapshot-id": 273821540950717088,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 3,
      "snapshot-id": 273821540950717088,
      "parent-snapshot-id": 7025296218094013915,
      "timestamp-ms": 1772479119262,
      "summary": {
        "operation": "delete",
        "spark.app.id": "local-1772478008209",
        "deleted-data-files": "1",
        "deleted-records": "1",
        "removed-files-size": "1319",
        "changed-partition-count": "1",
        "total-records": "0",
        "total-files-size": "0",
        "total-data-files": "0",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    },
    {
      "timestamp-ms": 1772479119262,
      "snapshot-id": 273821540950717088
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    },
    {
      "timestamp-ms": 1772479104679,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
    }
  ]
}

=== Frame 236 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 3,
    "last-updated-ms": 1772479119262,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 273821540950717088,
    "refs": {
      "main": {
        "snapshot-id": 273821540950717088,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 3,
        "snapshot-id": 273821540950717088,
        "parent-snapshot-id": 7025296218094013915,
        "timestamp-ms": 1772479119262,
        "summary": {
          "operation": "delete",
          "spark.app.id": "local-1772478008209",
          "deleted-data-files": "1",
          "deleted-records": "1",
          "removed-files-size": "1319",
          "changed-partition-count": "1",
          "total-records": "0",
          "total-files-size": "0",
          "total-data-files": "0",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      },
      {
        "timestamp-ms": 1772479104679,
        "snapshot-id": 7025296218094013915
      },
      {
        "timestamp-ms": 1772479119262,
        "snapshot-id": 273821540950717088
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      },
      {
        "timestamp-ms": 1772479008877,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
      },
      {
        "timestamp-ms": 1772479104679,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 238 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales

=== Frame 239 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json (to warehouse.minio:9000)

=== Frame 242 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 3,
  "last-updated-ms": 1772479119262,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 273821540950717088,
  "refs": {
    "main": {
      "snapshot-id": 273821540950717088,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 3,
      "snapshot-id": 273821540950717088,
      "parent-snapshot-id": 7025296218094013915,
      "timestamp-ms": 1772479119262,
      "summary": {
        "operation": "delete",
        "spark.app.id": "local-1772478008209",
        "deleted-data-files": "1",
        "deleted-records": "1",
        "removed-files-size": "1319",
        "changed-partition-count": "1",
        "total-records": "0",
        "total-files-size": "0",
        "total-data-files": "0",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    },
    {
      "timestamp-ms": 1772479119262,
      "snapshot-id": 273821540950717088
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    },
    {
      "timestamp-ms": 1772479104679,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
    }
  ]
}

=== Frame 244 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 3,
    "last-updated-ms": 1772479119262,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 273821540950717088,
    "refs": {
      "main": {
        "snapshot-id": 273821540950717088,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 3,
        "snapshot-id": 273821540950717088,
        "parent-snapshot-id": 7025296218094013915,
        "timestamp-ms": 1772479119262,
        "summary": {
          "operation": "delete",
          "spark.app.id": "local-1772478008209",
          "deleted-data-files": "1",
          "deleted-records": "1",
          "removed-files-size": "1319",
          "changed-partition-count": "1",
          "total-records": "0",
          "total-files-size": "0",
          "total-data-files": "0",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      },
      {
        "timestamp-ms": 1772479104679,
        "snapshot-id": 7025296218094013915
      },
      {
        "timestamp-ms": 1772479119262,
        "snapshot-id": 273821540950717088
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      },
      {
        "timestamp-ms": 1772479008877,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
      },
      {
        "timestamp-ms": 1772479104679,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 245 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales/metrics
{
  "report-type": "commit-report",
  "table-name": "local.mycat.sales",
  "snapshot-id": 273821540950717088,
  "sequence-number": 3,
  "operation": "delete",
  "metrics": {
    "total-duration": {
      "count": 1,
      "time-unit": "nanoseconds",
      "total-duration": 117803940
    },
    "attempts": {
      "unit": "count",
      "value": 1
    },
    "removed-data-files": {
      "unit": "count",
      "value": 1
    },
    "total-data-files": {
      "unit": "count",
      "value": 0
    },
    "total-delete-files": {
      "unit": "count",
      "value": 0
    },
    "removed-records": {
      "unit": "count",
      "value": 1
    },
    "total-records": {
      "unit": "count",
      "value": 0
    },
    "removed-files-size-bytes": {
      "unit": "bytes",
      "value": 1319
    },
    "total-files-size-bytes": {
      "unit": "bytes",
      "value": 0
    },
    "total-positional-deletes": {
      "unit": "count",
      "value": 0
    },
    "total-equality-deletes": {
      "unit": "count",
      "value": 0
    }
  },
  "metadata": {
    "engine-version": "3.5.5",
    "app-id": "local-1772478008209",
    "engine-name": "spark",
    "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
  }
}

=== Frame 246 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales/metrics
Status: 200

=== Frame 260 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales?snapshots=all

=== Frame 267 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json (to warehouse.minio:9000)

=== Frame 271 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 3,
  "last-updated-ms": 1772479119262,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 273821540950717088,
  "refs": {
    "main": {
      "snapshot-id": 273821540950717088,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 3,
      "snapshot-id": 273821540950717088,
      "parent-snapshot-id": 7025296218094013915,
      "timestamp-ms": 1772479119262,
      "summary": {
        "operation": "delete",
        "spark.app.id": "local-1772478008209",
        "deleted-data-files": "1",
        "deleted-records": "1",
        "removed-files-size": "1319",
        "changed-partition-count": "1",
        "total-records": "0",
        "total-files-size": "0",
        "total-data-files": "0",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    },
    {
      "timestamp-ms": 1772479119262,
      "snapshot-id": 273821540950717088
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    },
    {
      "timestamp-ms": 1772479104679,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
    }
  ]
}

=== Frame 273 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales?snapshots=all
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 3,
    "last-updated-ms": 1772479119262,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 273821540950717088,
    "refs": {
      "main": {
        "snapshot-id": 273821540950717088,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 3,
        "snapshot-id": 273821540950717088,
        "parent-snapshot-id": 7025296218094013915,
        "timestamp-ms": 1772479119262,
        "summary": {
          "operation": "delete",
          "spark.app.id": "local-1772478008209",
          "deleted-data-files": "1",
          "deleted-records": "1",
          "removed-files-size": "1319",
          "changed-partition-count": "1",
          "total-records": "0",
          "total-files-size": "0",
          "total-data-files": "0",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      },
      {
        "timestamp-ms": 1772479104679,
        "snapshot-id": 7025296218094013915
      },
      {
        "timestamp-ms": 1772479119262,
        "snapshot-id": 273821540950717088
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      },
      {
        "timestamp-ms": 1772479008877,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
      },
      {
        "timestamp-ms": 1772479104679,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 306 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales?snapshots=all

=== Frame 311 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json (to warehouse.minio:9000)

=== Frame 315 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 3,
  "last-updated-ms": 1772479119262,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 273821540950717088,
  "refs": {
    "main": {
      "snapshot-id": 273821540950717088,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 3,
      "snapshot-id": 273821540950717088,
      "parent-snapshot-id": 7025296218094013915,
      "timestamp-ms": 1772479119262,
      "summary": {
        "operation": "delete",
        "spark.app.id": "local-1772478008209",
        "deleted-data-files": "1",
        "deleted-records": "1",
        "removed-files-size": "1319",
        "changed-partition-count": "1",
        "total-records": "0",
        "total-files-size": "0",
        "total-data-files": "0",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    },
    {
      "timestamp-ms": 1772479119262,
      "snapshot-id": 273821540950717088
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    },
    {
      "timestamp-ms": 1772479104679,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
    }
  ]
}

=== Frame 317 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales?snapshots=all
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 3,
    "last-updated-ms": 1772479119262,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 273821540950717088,
    "refs": {
      "main": {
        "snapshot-id": 273821540950717088,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 3,
        "snapshot-id": 273821540950717088,
        "parent-snapshot-id": 7025296218094013915,
        "timestamp-ms": 1772479119262,
        "summary": {
          "operation": "delete",
          "spark.app.id": "local-1772478008209",
          "deleted-data-files": "1",
          "deleted-records": "1",
          "removed-files-size": "1319",
          "changed-partition-count": "1",
          "total-records": "0",
          "total-files-size": "0",
          "total-data-files": "0",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      },
      {
        "timestamp-ms": 1772479104679,
        "snapshot-id": 7025296218094013915
      },
      {
        "timestamp-ms": 1772479119262,
        "snapshot-id": 273821540950717088
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      },
      {
        "timestamp-ms": 1772479008877,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
      },
      {
        "timestamp-ms": 1772479104679,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 337 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales

=== Frame 344 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json (to warehouse.minio:9000)

=== Frame 348 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 3,
  "last-updated-ms": 1772479119262,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 273821540950717088,
  "refs": {
    "main": {
      "snapshot-id": 273821540950717088,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 3,
      "snapshot-id": 273821540950717088,
      "parent-snapshot-id": 7025296218094013915,
      "timestamp-ms": 1772479119262,
      "summary": {
        "operation": "delete",
        "spark.app.id": "local-1772478008209",
        "deleted-data-files": "1",
        "deleted-records": "1",
        "removed-files-size": "1319",
        "changed-partition-count": "1",
        "total-records": "0",
        "total-files-size": "0",
        "total-data-files": "0",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    },
    {
      "timestamp-ms": 1772479119262,
      "snapshot-id": 273821540950717088
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    },
    {
      "timestamp-ms": 1772479104679,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
    }
  ]
}

=== Frame 350 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 3,
    "last-updated-ms": 1772479119262,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 273821540950717088,
    "refs": {
      "main": {
        "snapshot-id": 273821540950717088,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 3,
        "snapshot-id": 273821540950717088,
        "parent-snapshot-id": 7025296218094013915,
        "timestamp-ms": 1772479119262,
        "summary": {
          "operation": "delete",
          "spark.app.id": "local-1772478008209",
          "deleted-data-files": "1",
          "deleted-records": "1",
          "removed-files-size": "1319",
          "changed-partition-count": "1",
          "total-records": "0",
          "total-files-size": "0",
          "total-data-files": "0",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      },
      {
        "timestamp-ms": 1772479104679,
        "snapshot-id": 7025296218094013915
      },
      {
        "timestamp-ms": 1772479119262,
        "snapshot-id": 273821540950717088
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      },
      {
        "timestamp-ms": 1772479008877,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
      },
      {
        "timestamp-ms": 1772479104679,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 352 ===

← INCOMING to REST Catalog
GET /v1/namespaces/mycat/tables/sales

=== Frame 353 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json (to warehouse.minio:9000)

=== Frame 356 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 3,
  "last-updated-ms": 1772479119262,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 273821540950717088,
  "refs": {
    "main": {
      "snapshot-id": 273821540950717088,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 3,
      "snapshot-id": 273821540950717088,
      "parent-snapshot-id": 7025296218094013915,
      "timestamp-ms": 1772479119262,
      "summary": {
        "operation": "delete",
        "spark.app.id": "local-1772478008209",
        "deleted-data-files": "1",
        "deleted-records": "1",
        "removed-files-size": "1319",
        "changed-partition-count": "1",
        "total-records": "0",
        "total-files-size": "0",
        "total-data-files": "0",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    },
    {
      "timestamp-ms": 1772479119262,
      "snapshot-id": 273821540950717088
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    },
    {
      "timestamp-ms": 1772479104679,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
    }
  ]
}

=== Frame 358 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 3,
    "last-updated-ms": 1772479119262,
    "last-column-id": 4,
    "current-schema-id": 0,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 273821540950717088,
    "refs": {
      "main": {
        "snapshot-id": 273821540950717088,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 3,
        "snapshot-id": 273821540950717088,
        "parent-snapshot-id": 7025296218094013915,
        "timestamp-ms": 1772479119262,
        "summary": {
          "operation": "delete",
          "spark.app.id": "local-1772478008209",
          "deleted-data-files": "1",
          "deleted-records": "1",
          "removed-files-size": "1319",
          "changed-partition-count": "1",
          "total-records": "0",
          "total-files-size": "0",
          "total-data-files": "0",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      },
      {
        "timestamp-ms": 1772479104679,
        "snapshot-id": 7025296218094013915
      },
      {
        "timestamp-ms": 1772479119262,
        "snapshot-id": 273821540950717088
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      },
      {
        "timestamp-ms": 1772479008877,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
      },
      {
        "timestamp-ms": 1772479104679,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
      }
    ]
  },
  "config": {}
}

=== Frame 359 ===

← INCOMING to REST Catalog
POST /v1/namespaces/mycat/tables/sales
{
  "requirements": [
    {
      "type": "assert-table-uuid",
      "uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90"
    },
    {
      "type": "assert-last-assigned-field-id",
      "last-assigned-field-id": 4
    },
    {
      "type": "assert-current-schema-id",
      "current-schema-id": 0
    }
  ],
  "updates": [
    {
      "action": "add-schema",
      "schema": {
        "type": "struct",
        "schema-id": 1,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "client_name",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      },
      "last-column-id": 4
    },
    {
      "action": "set-current-schema",
      "schema-id": -1
    }
  ]
}

=== Frame 360 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json (to warehouse.minio:9000)

=== Frame 363 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 3,
  "last-updated-ms": 1772479119262,
  "last-column-id": 4,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 273821540950717088,
  "refs": {
    "main": {
      "snapshot-id": 273821540950717088,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 3,
      "snapshot-id": 273821540950717088,
      "parent-snapshot-id": 7025296218094013915,
      "timestamp-ms": 1772479119262,
      "summary": {
        "operation": "delete",
        "spark.app.id": "local-1772478008209",
        "deleted-data-files": "1",
        "deleted-records": "1",
        "removed-files-size": "1319",
        "changed-partition-count": "1",
        "total-records": "0",
        "total-files-size": "0",
        "total-data-files": "0",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    },
    {
      "timestamp-ms": 1772479119262,
      "snapshot-id": 273821540950717088
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    },
    {
      "timestamp-ms": 1772479104679,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
    }
  ]
}

=== Frame 366 ===

← RESPONSE to REST Catalog

Status: 100

=== Frame 367 ===

→ OUTGOING from REST Catalog
PUT /mycat/sales/metadata/00004-dfbc9c34-aceb-4acb-970e-2153265a903c.metadata.json (to warehouse.minio:9000)

=== Frame 369 ===

← RESPONSE to REST Catalog
 /mycat/sales/metadata/00004-dfbc9c34-aceb-4acb-970e-2153265a903c.metadata.json
Status: 200

=== Frame 370 ===

→ OUTGOING from REST Catalog
GET /mycat/sales/metadata/00004-dfbc9c34-aceb-4acb-970e-2153265a903c.metadata.json (to warehouse.minio:9000)

=== Frame 373 ===

← RESPONSE to REST Catalog

Status: 206
{
  "format-version": 2,
  "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
  "location": "s3://warehouse/mycat/sales",
  "last-sequence-number": 3,
  "last-updated-ms": 1772479813519,
  "last-column-id": 4,
  "current-schema-id": 1,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "customer",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    },
    {
      "type": "struct",
      "schema-id": 1,
      "fields": [
        {
          "id": 1,
          "name": "order_id",
          "required": false,
          "type": "long"
        },
        {
          "id": 2,
          "name": "client_name",
          "required": false,
          "type": "string"
        },
        {
          "id": 3,
          "name": "amount",
          "required": false,
          "type": "decimal(10, 2)"
        },
        {
          "id": 4,
          "name": "ts",
          "required": false,
          "type": "timestamptz"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": [
        {
          "name": "customer_bucket",
          "transform": "bucket[16]",
          "source-id": 2,
          "field-id": 1000
        }
      ]
    }
  ],
  "last-partition-id": 1000,
  "default-sort-order-id": 0,
  "sort-orders": [
    {
      "order-id": 0,
      "fields": []
    }
  ],
  "properties": {
    "owner": "root",
    "write.parquet.compression-codec": "zstd"
  },
  "current-snapshot-id": 273821540950717088,
  "refs": {
    "main": {
      "snapshot-id": 273821540950717088,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479008877,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1279",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 2,
      "snapshot-id": 7025296218094013915,
      "parent-snapshot-id": 6656377125404557408,
      "timestamp-ms": 1772479104679,
      "summary": {
        "operation": "overwrite",
        "spark.app.id": "local-1772478008209",
        "added-data-files": "1",
        "deleted-data-files": "1",
        "added-records": "1",
        "deleted-records": "1",
        "added-files-size": "1319",
        "removed-files-size": "1279",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "1319",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
      "schema-id": 0
    },
    {
      "sequence-number": 3,
      "snapshot-id": 273821540950717088,
      "parent-snapshot-id": 7025296218094013915,
      "timestamp-ms": 1772479119262,
      "summary": {
        "operation": "delete",
        "spark.app.id": "local-1772478008209",
        "deleted-data-files": "1",
        "deleted-records": "1",
        "removed-files-size": "1319",
        "changed-partition-count": "1",
        "total-records": "0",
        "total-files-size": "0",
        "total-data-files": "0",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1772478008209",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1772479008877,
      "snapshot-id": 6656377125404557408
    },
    {
      "timestamp-ms": 1772479104679,
      "snapshot-id": 7025296218094013915
    },
    {
      "timestamp-ms": 1772479119262,
      "snapshot-id": 273821540950717088
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1772478933987,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
    },
    {
      "timestamp-ms": 1772479008877,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
    },
    {
      "timestamp-ms": 1772479104679,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
    },
    {
      "timestamp-ms": 1772479119262,
      "metadata-file": "s3://warehouse/mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json"
    }
  ]
}

=== Frame 375 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/mycat/tables/sales
Status: 200
{
  "metadata-location": "s3://warehouse/mycat/sales/metadata/00004-dfbc9c34-aceb-4acb-970e-2153265a903c.metadata.json",
  "metadata": {
    "format-version": 2,
    "table-uuid": "d815b205-e1c9-4e2e-80b2-e92a0c799a90",
    "location": "s3://warehouse/mycat/sales",
    "last-sequence-number": 3,
    "last-updated-ms": 1772479813519,
    "last-column-id": 4,
    "current-schema-id": 1,
    "schemas": [
      {
        "type": "struct",
        "schema-id": 0,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "customer",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      },
      {
        "type": "struct",
        "schema-id": 1,
        "fields": [
          {
            "id": 1,
            "name": "order_id",
            "required": false,
            "type": "long"
          },
          {
            "id": 2,
            "name": "client_name",
            "required": false,
            "type": "string"
          },
          {
            "id": 3,
            "name": "amount",
            "required": false,
            "type": "decimal(10, 2)"
          },
          {
            "id": 4,
            "name": "ts",
            "required": false,
            "type": "timestamptz"
          }
        ]
      }
    ],
    "default-spec-id": 0,
    "partition-specs": [
      {
        "spec-id": 0,
        "fields": [
          {
            "name": "customer_bucket",
            "transform": "bucket[16]",
            "source-id": 2,
            "field-id": 1000
          }
        ]
      }
    ],
    "last-partition-id": 1000,
    "default-sort-order-id": 0,
    "sort-orders": [
      {
        "order-id": 0,
        "fields": []
      }
    ],
    "properties": {
      "owner": "root",
      "write.parquet.compression-codec": "zstd"
    },
    "current-snapshot-id": 273821540950717088,
    "refs": {
      "main": {
        "snapshot-id": 273821540950717088,
        "type": "branch"
      }
    },
    "snapshots": [
      {
        "sequence-number": 1,
        "snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479008877,
        "summary": {
          "operation": "append",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "added-records": "1",
          "added-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1279",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-6656377125404557408-1-9b600eea-4a51-45a5-bb6d-7b577636a3a5.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 2,
        "snapshot-id": 7025296218094013915,
        "parent-snapshot-id": 6656377125404557408,
        "timestamp-ms": 1772479104679,
        "summary": {
          "operation": "overwrite",
          "spark.app.id": "local-1772478008209",
          "added-data-files": "1",
          "deleted-data-files": "1",
          "added-records": "1",
          "deleted-records": "1",
          "added-files-size": "1319",
          "removed-files-size": "1279",
          "changed-partition-count": "1",
          "total-records": "1",
          "total-files-size": "1319",
          "total-data-files": "1",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-7025296218094013915-1-156dd7d2-5148-4032-95d9-365f5d0010b0.avro",
        "schema-id": 0
      },
      {
        "sequence-number": 3,
        "snapshot-id": 273821540950717088,
        "parent-snapshot-id": 7025296218094013915,
        "timestamp-ms": 1772479119262,
        "summary": {
          "operation": "delete",
          "spark.app.id": "local-1772478008209",
          "deleted-data-files": "1",
          "deleted-records": "1",
          "removed-files-size": "1319",
          "changed-partition-count": "1",
          "total-records": "0",
          "total-files-size": "0",
          "total-data-files": "0",
          "total-delete-files": "0",
          "total-position-deletes": "0",
          "total-equality-deletes": "0",
          "engine-version": "3.5.5",
          "app-id": "local-1772478008209",
          "engine-name": "spark",
          "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
        },
        "manifest-list": "s3://warehouse/mycat/sales/metadata/snap-273821540950717088-1-bc7359c7-74a5-4ef9-a644-019a0e7857f3.avro",
        "schema-id": 0
      }
    ],
    "statistics": [],
    "partition-statistics": [],
    "snapshot-log": [
      {
        "timestamp-ms": 1772479008877,
        "snapshot-id": 6656377125404557408
      },
      {
        "timestamp-ms": 1772479104679,
        "snapshot-id": 7025296218094013915
      },
      {
        "timestamp-ms": 1772479119262,
        "snapshot-id": 273821540950717088
      }
    ],
    "metadata-log": [
      {
        "timestamp-ms": 1772478933987,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00000-47a3ea29-48e4-4097-9476-0cfeeac570e3.metadata.json"
      },
      {
        "timestamp-ms": 1772479008877,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00001-8e13246a-1c33-4734-8c48-824995f3bd0f.metadata.json"
      },
      {
        "timestamp-ms": 1772479104679,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00002-8211e8a2-b174-4ad8-96e2-0ac7ae028e4d.metadata.json"
      },
      {
        "timestamp-ms": 1772479119262,
        "metadata-file": "s3://warehouse/mycat/sales/metadata/00003-ae7717d6-96b5-4b52-8c39-943e9768fb05.metadata.json"
      }
    ]
  },
  "config": {}
}
