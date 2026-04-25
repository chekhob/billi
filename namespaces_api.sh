=== Frame 72 ===

← INCOMING to REST Catalog
GET /v1/namespaces/cat

=== Frame 74 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/cat
Status: 404
{
  "error": {
    "message": "Namespace does not exist: cat",
    "type": "NoSuchNamespaceException",
    "code": 404,
    "stack": [
      "org.apache.iceberg.exceptions.NoSuchNamespaceException: Namespace does not exist: cat",
      "\tat org.apache.iceberg.jdbc.JdbcCatalog.loadNamespaceMetadata(JdbcCatalog.java:490)",
      "\tat org.apache.iceberg.rest.CatalogHandlers.loadNamespace(CatalogHandlers.java:158)",
      "\tat org.apache.iceberg.rest.RESTCatalogAdapter.handleRequest(RESTCatalogAdapter.java:326)",
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

=== Frame 76 ===

← INCOMING to REST Catalog
POST /v1/namespaces
{
  "namespace": [
    "cat"
  ],
  "properties": {
    "owner": "root"
  }
}

=== Frame 77 ===

→ RESPONSE from REST Catalog
 /v1/namespaces
Status: 200
{
  "namespace": [
    "cat"
  ],
  "properties": {
    "owner": "root",
    "location": "s3://warehouse/cat"
  }
}

=== Frame 83 ===

← INCOMING to REST Catalog
GET /v1/namespaces?pageToken=

=== Frame 84 ===

→ RESPONSE from REST Catalog
 /v1/namespaces?pageToken=
Status: 200
{
  "namespaces": [
    [
      "cat"
    ],
    [
      "cats"
    ]
  ],
  "next-page-token": null
}

## Restarted server
=== Frame 6 ===
← INCOMING to REST Catalog
POST /v1/namespaces/cats/properties
{
  "removals": [],
  "updates": {
    "Edit-date": "01/01/2001",
    "Edited-by": "John"
  }
}

=== Frame 8 ===
→ RESPONSE from REST Catalog
 /v1/namespaces/cats/properties
Status: 200
{
  "removed": [],
  "updated": [
    "Edit-date",
    "Edited-by"
  ],
  "missing": []
}

=== Frame 127 ===
← INCOMING to REST Catalog
GET /v1/namespaces/cats

=== Frame 129 ===
→ RESPONSE from REST Catalog
 /v1/namespaces/cats
Status: 200
{
  "namespace": [
    "cats"
  ],
  "properties": {
    "owner": "root",
    "Edit-date": "01/01/2001",
    "location": "s3://warehouse/cats",
    "Edited-by": "John"
  }
}

=== Frame 159 ===
← INCOMING to REST Catalog
POST /v1/namespaces/cats/properties
{
  "removals": [],
  "updates": {
    "location": "s3://warehouse/cat"
  }
}

=== Frame 160 ===
→ RESPONSE from REST Catalog
 /v1/namespaces/cats/properties
Status: 200
{
  "removed": [],
  "updated": [
    "location"
  ],
  "missing": []
}

=== Frame 232 ===
← INCOMING to REST Catalog
GET /v1/namespaces/cats

=== Frame 234 ===
→ RESPONSE from REST Catalog
 /v1/namespaces/cats
Status: 200
{
  "namespace": [
    "cats"
  ],
  "properties": {
    "owner": "root",
    "Edit-date": "01/01/2001",
    "location": "s3://warehouse/cat",
    "Edited-by": "John"
  }
}

=== Frame 479 ===

← INCOMING to REST Catalog
GET /v1/namespaces/cats

=== Frame 481 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/cats
Status: 200
{
  "namespace": [
    "cats"
  ],
  "properties": {
    "owner": "root",
    "Edit-date": "01/01/2001",
    "location": "s3://warehouse/cat",
    "Edited-by": ""
  }
}

=== Frame 483 ===

← INCOMING to REST Catalog
DELETE /v1/namespaces/cats

=== Frame 484 ===

→ RESPONSE from REST Catalog
 /v1/namespaces/cats
Status: 200

