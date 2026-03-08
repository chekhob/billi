Capturing on 'eth0'
=== Frame 6 ===

← INCOMING to REST Catalog
GET /v1/config

=== Frame 8 ===

← RESPONSE to REST Catalog
/v1/config
Status: 200
{
"defaults": {},
"overrides": {}
}

=== Frame 18 ===

← INCOMING to REST Catalog
GET /v1/namespaces/prod

=== Frame 20 ===

← RESPONSE to REST Catalog
/v1/namespaces/prod
Status: 200
{
"namespace": [
  "prod"
],
"properties": {
  "owner": "root",
  "location": "s3://warehouse/prod"
}
}

=== Frame 25 ===

← INCOMING to REST Catalog
GET /v1/namespaces/prod

=== Frame 27 ===

← RESPONSE to REST Catalog
/v1/namespaces/prod
Status: 200
{
"namespace": [
  "prod"
],
"properties": {
  "owner": "root",
  "location": "s3://warehouse/prod"
}
}

=== Frame 35 ===

← INCOMING to REST Catalog
GET /v1/namespaces/prod/tables/gamma?snapshots=all

=== Frame 37 ===

← RESPONSE to REST Catalog
/v1/namespaces/prod/tables/gamma?snapshots=all
Status: 404
{
"error": {
  "message": "Table does not exist: prod.gamma",
  "type": "NoSuchTableException",
  "code": 404,
  "stack": [
    "org.apache.iceberg.exceptions.NoSuchTableException: Table does not exist: prod.gamma",
    "\tat org.apache.iceberg.BaseMetastoreCatalog.loadTable(BaseMetastoreCatalog.java:55)",
    "\tat org.apache.iceberg.rest.CatalogHandlers.loadTable(CatalogHandlers.java:312)",
    "\tat org.apache.iceberg.rest.RESTCatalogAdapter.handleRequest(RESTCatalogAdapter.java:388)",
    "\tat org.apache.iceberg.rest.RESTServerCatalogAdapter.handleRequest(RESTServerCatalogAdapter.java:42)",
    "\tat org.apache.iceberg.rest.RESTCatalogAdapter.execute(RESTCatalogAdapter.java:552)",
    "\tat org.apache.iceberg.rest.RESTCatalogServlet.execute(RESTCatalogServlet.java:100)",
    "\tat org.apache.iceberg.rest.RESTCatalogServlet.doGet(RESTCatalogServlet.java:66)",
    "\tat javax.servlet.http.HttpServlet.service(HttpServlet.java:687)",
    "\tat javax.servlet.http.HttpServlet.service(HttpServlet.java:790)",
    "\tat org.eclipse.jetty.servlet.ServletHolder.handle(ServletHolder.java:799)",
    "\tat org.eclipse.jetty.servlet.ServletHandler.doHandle(ServletHandler.java:554)",
    "\tat org.eclipse.jetty.server.handler.ScopedHandler.handle(ScopedHandler.java:143)",
    "\tat org.eclipse.jetty.server.handler.gzip.GzipHandler.handle(GzipHandler.java:772)",
    "\tat org.eclipse.jetty.server.handler.HandlerWrapper.handle(HandlerWrapper.java:127)",
    "\tat org.eclipse.jetty.server.handler.ScopedHandler.nextHandle(ScopedHandler.java:235)",
    "\tat org.eclipse.jetty.server.handler.ContextHandler.doHandle(ContextHandler.java:1440)",
    "\tat org.eclipse.jetty.server.handler.ScopedHandler.nextScope(ScopedHandler.java:188)",
    "\tat org.eclipse.jetty.servlet.ServletHandler.doScope(ServletHandler.java:505)",
    "\tat org.eclipse.jetty.server.handler.ScopedHandler.nextScope(ScopedHandler.java:186)",
    "\tat org.eclipse.jetty.server.handler.ContextHandler.doScope(ContextHandler.java:1355)",
    "\tat org.eclipse.jetty.server.handler.ScopedHandler.handle(ScopedHandler.java:141)",
    "\tat org.eclipse.jetty.server.handler.HandlerWrapper.handle(HandlerWrapper.java:127)",
    "\tat org.eclipse.jetty.server.Server.handle(Server.java:516)",
    "\tat org.eclipse.jetty.server.HttpChannel.lambda$handle$1(HttpChannel.java:487)",
    "\tat org.eclipse.jetty.server.HttpChannel.dispatch(HttpChannel.java:732)",
    "\tat org.eclipse.jetty.server.HttpChannel.handle(HttpChannel.java:479)",
    "\tat org.eclipse.jetty.server.HttpConnection.onFillable(HttpConnection.java:277)",
    "\tat org.eclipse.jetty.io.AbstractConnection$ReadCallback.succeeded(AbstractConnection.java:311)",
    "\tat org.eclipse.jetty.io.FillInterest.fillable(FillInterest.java:105)",
    "\tat org.eclipse.jetty.io.ChannelEndPoint$1.run(ChannelEndPoint.java:104)",
    "\tat org.eclipse.jetty.util.thread.QueuedThreadPool.runJob(QueuedThreadPool.java:883)",
    "\tat org.eclipse.jetty.util.thread.QueuedThreadPool$Runner.run(QueuedThreadPool.java:1034)",
    "\tat java.base/java.lang.Thread.run(Thread.java:840)"
  ]
}
}

=== Frame 39 ===

← INCOMING to REST Catalog
POST /v1/namespaces/prod/tables
{
"name": "gamma",
"location": null,
"schema": {
  "type": "struct",
  "schema-id": 0,
  "fields": [
    {
      "id": 0,
      "name": "id",
      "required": true,
      "type": "long"
    },
    {
      "id": 1,
      "name": "text",
      "required": false,
      "type": "string"
    }
  ]
},
"partition-spec": {
  "spec-id": 0,
  "fields": []
},
"write-order": null,
"properties": {
  "owner": "root"
},
"stage-create": false
}

=== Frame 48 ===

→ RESPONSE from REST Catalog

Status: 100

=== Frame 50 ===

→ OUTGOING from REST Catalog
PUT /prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json (to warehouse.minio:9000)

=== Frame 51 ===

→ RESPONSE from REST Catalog
/prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json
Status: 200

=== Frame 53 ===

→ OUTGOING from REST Catalog
GET /prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json (to warehouse.minio:9000)

=== Frame 54 ===

→ RESPONSE from REST Catalog

Status: 206
{
"format-version": 2,
"table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
"location": "s3://warehouse/prod/gamma",
"last-sequence-number": 0,
"last-updated-ms": 1771771373606,
"last-column-id": 2,
"current-schema-id": 0,
"schemas": [
  {
    "type": "struct",
    "schema-id": 0,
    "fields": [
      {
        "id": 1,
        "name": "id",
        "required": true,
        "type": "long"
      },
      {
        "id": 2,
        "name": "text",
        "required": false,
        "type": "string"
      }
    ]
  }
],
"default-spec-id": 0,
"partition-specs": [
  {
    "spec-id": 0,
    "fields": []
  }
],
"last-partition-id": 999,
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

=== Frame 56 ===

← RESPONSE to REST Catalog
/v1/namespaces/prod/tables
Status: 200
{
"metadata-location": "s3://warehouse/prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json",
"metadata": {
  "format-version": 2,
  "table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
  "location": "s3://warehouse/prod/gamma",
  "last-sequence-number": 0,
  "last-updated-ms": 1771771373606,
  "last-column-id": 2,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "id",
          "required": true,
          "type": "long"
        },
        {
          "id": 2,
          "name": "text",
          "required": false,
          "type": "string"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": []
    }
  ],
  "last-partition-id": 999,
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

=== Frame 72 ===

← INCOMING to REST Catalog
GET /v1/namespaces/prod/tables/gamma?snapshots=all

=== Frame 79 ===

→ OUTGOING from REST Catalog
GET /prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json (to warehouse.minio:9000)

=== Frame 81 ===

→ RESPONSE from REST Catalog

Status: 206
{
"format-version": 2,
"table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
"location": "s3://warehouse/prod/gamma",
"last-sequence-number": 0,
"last-updated-ms": 1771771373606,
"last-column-id": 2,
"current-schema-id": 0,
"schemas": [
  {
    "type": "struct",
    "schema-id": 0,
    "fields": [
      {
        "id": 1,
        "name": "id",
        "required": true,
        "type": "long"
      },
      {
        "id": 2,
        "name": "text",
        "required": false,
        "type": "string"
      }
    ]
  }
],
"default-spec-id": 0,
"partition-specs": [
  {
    "spec-id": 0,
    "fields": []
  }
],
"last-partition-id": 999,
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

=== Frame 83 ===

← RESPONSE to REST Catalog
/v1/namespaces/prod/tables/gamma?snapshots=all
Status: 200
{
"metadata-location": "s3://warehouse/prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json",
"metadata": {
  "format-version": 2,
  "table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
  "location": "s3://warehouse/prod/gamma",
  "last-sequence-number": 0,
  "last-updated-ms": 1771771373606,
  "last-column-id": 2,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "id",
          "required": true,
          "type": "long"
        },
        {
          "id": 2,
          "name": "text",
          "required": false,
          "type": "string"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": []
    }
  ],
  "last-partition-id": 999,
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

=== Frame 86 ===

← INCOMING to REST Catalog
GET /v1/namespaces/prod/tables/gamma

=== Frame 87 ===

→ OUTGOING from REST Catalog
GET /prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json (to warehouse.minio:9000)

=== Frame 88 ===

→ RESPONSE from REST Catalog

Status: 206
{
"format-version": 2,
"table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
"location": "s3://warehouse/prod/gamma",
"last-sequence-number": 0,
"last-updated-ms": 1771771373606,
"last-column-id": 2,
"current-schema-id": 0,
"schemas": [
  {
    "type": "struct",
    "schema-id": 0,
    "fields": [
      {
        "id": 1,
        "name": "id",
        "required": true,
        "type": "long"
      },
      {
        "id": 2,
        "name": "text",
        "required": false,
        "type": "string"
      }
    ]
  }
],
"default-spec-id": 0,
"partition-specs": [
  {
    "spec-id": 0,
    "fields": []
  }
],
"last-partition-id": 999,
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

=== Frame 90 ===

← RESPONSE to REST Catalog
/v1/namespaces/prod/tables/gamma
Status: 200
{
"metadata-location": "s3://warehouse/prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json",
"metadata": {
  "format-version": 2,
  "table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
  "location": "s3://warehouse/prod/gamma",
  "last-sequence-number": 0,
  "last-updated-ms": 1771771373606,
  "last-column-id": 2,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "id",
          "required": true,
          "type": "long"
        },
        {
          "id": 2,
          "name": "text",
          "required": false,
          "type": "string"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": []
    }
  ],
  "last-partition-id": 999,
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
POST /v1/namespaces/prod/tables/gamma
{
"requirements": [
  {
    "type": "assert-table-uuid",
    "uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2"
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
      "snapshot-id": 1802330819907052105,
      "timestamp-ms": 1771771415279,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1771771249250",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "707",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "707",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1771771249250",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/prod/gamma/metadata/snap-1802330819907052105-1-a9d5d67e-1c22-4264-8cb5-fd33cbb2de85.avro",
      "schema-id": 0
    }
  },
  {
    "action": "set-snapshot-ref",
    "ref-name": "main",
    "snapshot-id": 1802330819907052105,
    "type": "branch"
  }
]
}

=== Frame 93 ===

→ OUTGOING from REST Catalog
GET /prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json (to warehouse.minio:9000)

=== Frame 94 ===

→ RESPONSE from REST Catalog

Status: 206
{
"format-version": 2,
"table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
"location": "s3://warehouse/prod/gamma",
"last-sequence-number": 0,
"last-updated-ms": 1771771373606,
"last-column-id": 2,
"current-schema-id": 0,
"schemas": [
  {
    "type": "struct",
    "schema-id": 0,
    "fields": [
      {
        "id": 1,
        "name": "id",
        "required": true,
        "type": "long"
      },
      {
        "id": 2,
        "name": "text",
        "required": false,
        "type": "string"
      }
    ]
  }
],
"default-spec-id": 0,
"partition-specs": [
  {
    "spec-id": 0,
    "fields": []
  }
],
"last-partition-id": 999,
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

=== Frame 97 ===

→ RESPONSE from REST Catalog

Status: 100

=== Frame 98 ===

→ OUTGOING from REST Catalog
PUT /prod/gamma/metadata/00001-d5e8df5c-c1dd-470f-984e-8e6837a58fbc.metadata.json (to warehouse.minio:9000)

=== Frame 100 ===

→ RESPONSE from REST Catalog
/prod/gamma/metadata/00001-d5e8df5c-c1dd-470f-984e-8e6837a58fbc.metadata.json
Status: 200

=== Frame 102 ===

→ OUTGOING from REST Catalog
GET /prod/gamma/metadata/00001-d5e8df5c-c1dd-470f-984e-8e6837a58fbc.metadata.json (to warehouse.minio:9000)

=== Frame 103 ===

→ RESPONSE from REST Catalog

Status: 206
{
"format-version": 2,
"table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
"location": "s3://warehouse/prod/gamma",
"last-sequence-number": 1,
"last-updated-ms": 1771771415279,
"last-column-id": 2,
"current-schema-id": 0,
"schemas": [
  {
    "type": "struct",
    "schema-id": 0,
    "fields": [
      {
        "id": 1,
        "name": "id",
        "required": true,
        "type": "long"
      },
      {
        "id": 2,
        "name": "text",
        "required": false,
        "type": "string"
      }
    ]
  }
],
"default-spec-id": 0,
"partition-specs": [
  {
    "spec-id": 0,
    "fields": []
  }
],
"last-partition-id": 999,
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
"current-snapshot-id": 1802330819907052105,
"refs": {
  "main": {
    "snapshot-id": 1802330819907052105,
    "type": "branch"
  }
},
"snapshots": [
  {
    "sequence-number": 1,
    "snapshot-id": 1802330819907052105,
    "timestamp-ms": 1771771415279,
    "summary": {
      "operation": "append",
      "spark.app.id": "local-1771771249250",
      "added-data-files": "1",
      "added-records": "1",
      "added-files-size": "707",
      "changed-partition-count": "1",
      "total-records": "1",
      "total-files-size": "707",
      "total-data-files": "1",
      "total-delete-files": "0",
      "total-position-deletes": "0",
      "total-equality-deletes": "0",
      "engine-version": "3.5.5",
      "app-id": "local-1771771249250",
      "engine-name": "spark",
      "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
    },
    "manifest-list": "s3://warehouse/prod/gamma/metadata/snap-1802330819907052105-1-a9d5d67e-1c22-4264-8cb5-fd33cbb2de85.avro",
    "schema-id": 0
  }
],
"statistics": [],
"partition-statistics": [],
"snapshot-log": [
  {
    "timestamp-ms": 1771771415279,
    "snapshot-id": 1802330819907052105
  }
],
"metadata-log": [
  {
    "timestamp-ms": 1771771373606,
    "metadata-file": "s3://warehouse/prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json"
  }
]
}

=== Frame 105 ===

← RESPONSE to REST Catalog
/v1/namespaces/prod/tables/gamma
Status: 200
{
"metadata-location": "s3://warehouse/prod/gamma/metadata/00001-d5e8df5c-c1dd-470f-984e-8e6837a58fbc.metadata.json",
"metadata": {
  "format-version": 2,
  "table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
  "location": "s3://warehouse/prod/gamma",
  "last-sequence-number": 1,
  "last-updated-ms": 1771771415279,
  "last-column-id": 2,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "id",
          "required": true,
          "type": "long"
        },
        {
          "id": 2,
          "name": "text",
          "required": false,
          "type": "string"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": []
    }
  ],
  "last-partition-id": 999,
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
  "current-snapshot-id": 1802330819907052105,
  "refs": {
    "main": {
      "snapshot-id": 1802330819907052105,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 1802330819907052105,
      "timestamp-ms": 1771771415279,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1771771249250",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "707",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "707",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1771771249250",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/prod/gamma/metadata/snap-1802330819907052105-1-a9d5d67e-1c22-4264-8cb5-fd33cbb2de85.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1771771415279,
      "snapshot-id": 1802330819907052105
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1771771373606,
      "metadata-file": "s3://warehouse/prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json"
    }
  ]
},
"config": {}
}

=== Frame 107 ===

← INCOMING to REST Catalog
GET /v1/namespaces/prod/tables/gamma

=== Frame 109 ===

→ OUTGOING from REST Catalog
GET /prod/gamma/metadata/00001-d5e8df5c-c1dd-470f-984e-8e6837a58fbc.metadata.json (to warehouse.minio:9000)

=== Frame 110 ===

→ RESPONSE from REST Catalog

Status: 206
{
"format-version": 2,
"table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
"location": "s3://warehouse/prod/gamma",
"last-sequence-number": 1,
"last-updated-ms": 1771771415279,
"last-column-id": 2,
"current-schema-id": 0,
"schemas": [
  {
    "type": "struct",
    "schema-id": 0,
    "fields": [
      {
        "id": 1,
        "name": "id",
        "required": true,
        "type": "long"
      },
      {
        "id": 2,
        "name": "text",
        "required": false,
        "type": "string"
      }
    ]
  }
],
"default-spec-id": 0,
"partition-specs": [
  {
    "spec-id": 0,
    "fields": []
  }
],
"last-partition-id": 999,
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
"current-snapshot-id": 1802330819907052105,
"refs": {
  "main": {
    "snapshot-id": 1802330819907052105,
    "type": "branch"
  }
},
"snapshots": [
  {
    "sequence-number": 1,
    "snapshot-id": 1802330819907052105,
    "timestamp-ms": 1771771415279,
    "summary": {
      "operation": "append",
      "spark.app.id": "local-1771771249250",
      "added-data-files": "1",
      "added-records": "1",
      "added-files-size": "707",
      "changed-partition-count": "1",
      "total-records": "1",
      "total-files-size": "707",
      "total-data-files": "1",
      "total-delete-files": "0",
      "total-position-deletes": "0",
      "total-equality-deletes": "0",
      "engine-version": "3.5.5",
      "app-id": "local-1771771249250",
      "engine-name": "spark",
      "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
    },
    "manifest-list": "s3://warehouse/prod/gamma/metadata/snap-1802330819907052105-1-a9d5d67e-1c22-4264-8cb5-fd33cbb2de85.avro",
    "schema-id": 0
  }
],
"statistics": [],
"partition-statistics": [],
"snapshot-log": [
  {
    "timestamp-ms": 1771771415279,
    "snapshot-id": 1802330819907052105
  }
],
"metadata-log": [
  {
    "timestamp-ms": 1771771373606,
    "metadata-file": "s3://warehouse/prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json"
  }
]
}

=== Frame 112 ===

← RESPONSE to REST Catalog
/v1/namespaces/prod/tables/gamma
Status: 200
{
"metadata-location": "s3://warehouse/prod/gamma/metadata/00001-d5e8df5c-c1dd-470f-984e-8e6837a58fbc.metadata.json",
"metadata": {
  "format-version": 2,
  "table-uuid": "771c04f3-2c08-468b-a8fe-f11967b0bbd2",
  "location": "s3://warehouse/prod/gamma",
  "last-sequence-number": 1,
  "last-updated-ms": 1771771415279,
  "last-column-id": 2,
  "current-schema-id": 0,
  "schemas": [
    {
      "type": "struct",
      "schema-id": 0,
      "fields": [
        {
          "id": 1,
          "name": "id",
          "required": true,
          "type": "long"
        },
        {
          "id": 2,
          "name": "text",
          "required": false,
          "type": "string"
        }
      ]
    }
  ],
  "default-spec-id": 0,
  "partition-specs": [
    {
      "spec-id": 0,
      "fields": []
    }
  ],
  "last-partition-id": 999,
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
  "current-snapshot-id": 1802330819907052105,
  "refs": {
    "main": {
      "snapshot-id": 1802330819907052105,
      "type": "branch"
    }
  },
  "snapshots": [
    {
      "sequence-number": 1,
      "snapshot-id": 1802330819907052105,
      "timestamp-ms": 1771771415279,
      "summary": {
        "operation": "append",
        "spark.app.id": "local-1771771249250",
        "added-data-files": "1",
        "added-records": "1",
        "added-files-size": "707",
        "changed-partition-count": "1",
        "total-records": "1",
        "total-files-size": "707",
        "total-data-files": "1",
        "total-delete-files": "0",
        "total-position-deletes": "0",
        "total-equality-deletes": "0",
        "engine-version": "3.5.5",
        "app-id": "local-1771771249250",
        "engine-name": "spark",
        "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
      },
      "manifest-list": "s3://warehouse/prod/gamma/metadata/snap-1802330819907052105-1-a9d5d67e-1c22-4264-8cb5-fd33cbb2de85.avro",
      "schema-id": 0
    }
  ],
  "statistics": [],
  "partition-statistics": [],
  "snapshot-log": [
    {
      "timestamp-ms": 1771771415279,
      "snapshot-id": 1802330819907052105
    }
  ],
  "metadata-log": [
    {
      "timestamp-ms": 1771771373606,
      "metadata-file": "s3://warehouse/prod/gamma/metadata/00000-c4f870ee-38ac-444f-8ca2-34570d2a5502.metadata.json"
    }
  ]
},
"config": {}
}

=== Frame 114 ===

← INCOMING to REST Catalog
POST /v1/namespaces/prod/tables/gamma/metrics
{
"report-type": "commit-report",
"table-name": "local.prod.gamma",
"snapshot-id": 1802330819907052105,
"sequence-number": 1,
"operation": "append",
"metrics": {
  "total-duration": {
    "count": 1,
    "time-unit": "nanoseconds",
    "total-duration": 332273806
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
    "value": 707
  },
  "total-files-size-bytes": {
    "unit": "bytes",
    "value": 707
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
  "app-id": "local-1771771249250",
  "engine-name": "spark",
  "iceberg-version": "Apache Iceberg 1.8.1 (commit 9ce0fcf0af7becf25ad9fc996c3bad2afdcfd33d)"
}
}

=== Frame 115 ===

← RESPONSE to REST Catalog
/v1/namespaces/prod/tables/gamma/metrics
Status: 200
