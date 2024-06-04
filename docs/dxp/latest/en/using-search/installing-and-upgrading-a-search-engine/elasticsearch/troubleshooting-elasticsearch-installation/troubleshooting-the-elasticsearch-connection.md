---
taxonomy-category-names:
- Search
- Search Engine Installation and Maintenance
- Liferay Self-Hosted
uuid: 1101ada3-351d-45c1-b3cc-96e8cebb208e
---
# Troubleshooting the Elasticsearch Connection

Listed here are some connection issues you can encounter when configuring the Liferay-Elasticsearch connection, along with the most common solutions to those issues. See [Troubleshooting Elasticsearch: Common Issues](./troubleshooting-elasticsearch-common-issues.md) for additional possibilities.

## Mismatch between Liferay and Elasticsearch's Host Configurations

On Liferay 7.3 and 7.4 (using the REST client connection) you can see this log message:

```
Caused by: java.net.ConnectException: Timeout connecting to
	at org.elasticsearch.client.RestClient.extractAndWrapCause(RestClient.java:849) ~[?:?]
	at org.elasticsearch.client.RestClient.performRequest(RestClient.java:259) ~[?:?]
	at org.elasticsearch.client.RestClient.performRequest(RestClient.java:246) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.internalPerformRequest(RestHighLevelClient.java:1613) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.performRequest(RestHighLevelClient.java:1583) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.performRequestAndParseEntity(RestHighLevelClient.java:1553) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.bulk(RestHighLevelClient.java:533) ~[?:?]
	at com.liferay.portal.search.elasticsearch7.internal.search.engine.adapter.document.BulkDocumentRequestExecutorImpl.getBulkResponse(BulkDocumentRequestExecutorImpl.java:158) ~[?:?]
	... 55 more
```

On Liferay 7.0-7.2 (using the Java Transport client), you can see this log message:

```
2021-06-04 17:53:06.654 ERROR [main][ElasticsearchEngineConfigurator:93] bundle com.liferay.portal.search.elasticsearch7.impl:4.0.9 (83)[com.liferay.portal.search.elasticsearch7.internal.ElasticsearchEngineConfigurator(16)] : The activate method has thrown an exception 
java.lang.RuntimeException: org.elasticsearch.client.transport.NoNodeAvailableException: NoNodeAvailableException[None of the configured nodes are available: [{#transport#-1}{xDAEykAeQ-SgT_hYW2a2uw}{es-node1-prod}{192.168.23.95:9300}]]
	at org.elasticsearch.client.transport.TransportClientNodesService.ensureNodesAreAvailable(TransportClientNodesService.java:352)
	at org.elasticsearch.client.transport.TransportClientNodesService.execute(TransportClientNodesService.java:248)
	at org.elasticsearch.client.transport.TransportProxyClient.execute(TransportProxyClient.java:57)
	at org.elasticsearch.client.transport.TransportClient.doExecute(TransportClient.java:395)
	at org.elasticsearch.client.support.AbstractClient.execute(AbstractClient.java:409)
	at org.elasticsearch.client.support.AbstractClient.execute(AbstractClient.java:398)
	at org.elasticsearch.action.ActionRequestBuilder.execute(ActionRequestBuilder.java:45)
	at org.elasticsearch.action.ActionRequestBuilder.get(ActionRequestBuilder.java:52)
	at com.liferay.portal.search.elasticsearch7.internal.search.engine.adapter.cluster.HealthClusterRequestExecutorImpl.execute(HealthClusterRequestExecutorImpl.java:46)
```

The Elasticsearch connector in Liferay is attempting to connect to the Elasticsearch host `es-node1-prod` but can't find any available nodes. In the Elasticsearch logs look for lines like these:

```
[2021-06-04T17:31:22,472][INFO ][o.e.t.TransportService   ] [es-node1] publish_address {es-node1/192.168.0.17:9300}, bound_addresses {192.168.0.17:9300}
(...)
[2021-06-04T17:31:23,080][INFO ][o.e.h.AbstractHttpServerTransport] [es-node1] publish_address {es-node1/192.168.0.17:9200}, bound_addresses {192.168.0.17:9200}
```

The actual address of the given node is printed. In this example it is `es-node1/192.168.0.17:9300` for the Transport address and `es-node1/192.168.0.17:9200` for the HTTP address.

The correct connector configuration in Liferay 7.3 and 7.4 is

```properties
networkHostAddresses=["http:es-node1:9200"]
# The value ["es-node1:9200"] also works
```

The correct connector configuration in Liferay 7.0-7.2 is

```properties
transportAddresses=["es-node1:9300"]
```

## TLS/SSL is Enabled, but Liferay is Attempting to Communicate Over an Unencrypted Channel

On Liferay 7.3 and 7.4 you can see this log message:

```
Caused by: org.apache.http.ConnectionClosedException: Connection is closed
	at org.elasticsearch.client.RestClient.extractAndWrapCause(RestClient.java:839) ~[?:?]
	at org.elasticsearch.client.RestClient.performRequest(RestClient.java:259) ~[?:?]
	at org.elasticsearch.client.RestClient.performRequest(RestClient.java:246) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.internalPerformRequest(RestHighLevelClient.java:1613) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.performRequest(RestHighLevelClient.java:1583) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.performRequestAndParseEntity(RestHighLevelClient.java:1553) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.bulk(RestHighLevelClient.java:533) ~[?:?]
	at com.liferay.portal.search.elasticsearch7.internal.search.engine.adapter.document.BulkDocumentRequestExecutorImpl.getBulkResponse(BulkDocumentRequestExecutorImpl.java:158) ~[?:?]
	... 44 more
Caused by: org.apache.http.ConnectionClosedException: Connection is closed
	at org.apache.http.nio.protocol.HttpAsyncRequestExecutor.endOfInput(HttpAsyncRequestExecutor.java:356) ~[?:?]
	at org.apache.http.impl.nio.DefaultNHttpClientConnection.consumeInput(DefaultNHttpClientConnection.java:261) ~[?:?]
	at org.apache.http.impl.nio.client.InternalIODispatch.onInputReady(InternalIODispatch.java:81) ~[?:?]
	at org.apache.http.impl.nio.client.InternalIODispatch.onInputReady(InternalIODispatch.java:39) ~[?:?]
	at org.apache.http.impl.nio.reactor.AbstractIODispatch.inputReady(AbstractIODispatch.java:114) ~[?:?]
	at org.apache.http.impl.nio.reactor.BaseIOReactor.readable(BaseIOReactor.java:162) ~[?:?]
	at org.apache.http.impl.nio.reactor.AbstractIOReactor.processEvent(AbstractIOReactor.java:337) ~[?:?]
	at org.apache.http.impl.nio.reactor.AbstractIOReactor.processEvents(AbstractIOReactor.java:315) ~[?:?]
	at org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:276) ~[?:?]
	at org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104) ~[?:?]
	at org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591) ~[?:?]
	... 1 more
```

On Liferay 7.0-7.2 the error manifests as a more general `org.elasticsearch.client.transport.NoNodeAvailableException`.

The Elasticsearch log shows related errors.

On Liferay 7.3 and 7.4, the [Elasticsearch](https://help.liferay.com/hc/en-us/articles/360016511651#Liferay-DXP-7.4) log prints

```
[2021-06-04T18:09:11,925][WARN ][o.e.x.s.t.n.SecurityNetty4HttpServerTransport] [es-node1] received plaintext http traffic on an https channel, closing connection Netty4HttpChannel{localAddress=0.0.0.0/0.0.0.0:9200, remoteAddress=/192.168.0.17:41104}
```

On Liferay 7.0-7.2, the [Elasticsearch 6/7](https://help.liferay.com/hc/en-us/articles/360016511651#Liferay-DXP-7.2-Elasticsearch) log prints

```
[2021-06-04T18:11:13,045][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] received plaintext traffic on an encrypted channel, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:34346}
```

The Elasticsearch warnings indicate that the server received plain text traffic on an encrypted channel.

If the `elasticsearch.yml` file has `xpack.security.*` properties set for the transport and/or http layers (you may also see `xpack.security.enabled: true`), Elasticsearch has X-Pack Security enabled. Thus the connector in Liferay must be configured accordingly.

See [Securing Elasticsearch](../securing-elasticsearch.md) for the correct connector configurations.

## The Elasticsearch Host Name Does Not Match the DNS Names in the Certificate

On Liferay 7.3 and 7.4 you can see this log message:

```
Caused by: javax.net.ssl.SSLPeerUnverifiedException: Host name 'es-node1' does not match the certificate subject provided by the peer (CN=elastic-nodes)
	at org.apache.http.nio.conn.ssl.SSLIOSessionStrategy.verifySession(SSLIOSessionStrategy.java:209) ~[?:?]
	at org.apache.http.nio.conn.ssl.SSLIOSessionStrategy$1.verify(SSLIOSessionStrategy.java:188) ~[?:?]
	at org.apache.http.nio.reactor.ssl.SSLIOSession.doHandshake(SSLIOSession.java:360) ~[?:?]
	at org.apache.http.nio.reactor.ssl.SSLIOSession.isAppInputReady(SSLIOSession.java:523) ~[?:?]
	at org.apache.http.impl.nio.reactor.AbstractIODispatch.inputReady(AbstractIODispatch.java:120) ~[?:?]
	at org.apache.http.impl.nio.reactor.BaseIOReactor.readable(BaseIOReactor.java:162) ~[?:?]
	at org.apache.http.impl.nio.reactor.AbstractIOReactor.processEvent(AbstractIOReactor.java:337) ~[?:?]
	at org.apache.http.impl.nio.reactor.AbstractIOReactor.processEvents(AbstractIOReactor.java:315) ~[?:?]
	at org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:276) ~[?:?]
	at org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104) ~[?:?]
	at org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591) ~[?:?]
	... 1 more
```

On Liferay 7.0-7.2 the error manifests as `org.elasticsearch.client.transport.NoNodeAvailableException: NoNodeAvailableException` and `java.security.cert.CertificateException: No subject alternative DNS name matching found`.

```
[2021-06-08T17:09:24,557][WARN ][o.e.c.s.DiagnosticTrustManager] [
ode_name]failed to establish trust with server at [es-node1]; the server provided a certificate with subject name [CN=elastic-nodes] and fingerprint [065071bd5b26e83b2903b09179acf4a48851d775]; the certificate has subject alternative names [DNS:localhost,DNS:dxp.example.com,DNS:es-node-1,IP:127.0.0.1,DNS:es-node2,DNS:es-node3,DNS:kibana.example.com]; the certificate is issued by [CN=elastic-ca]; the certificate is signed by (subject [CN=elastic-ca] fingerprint [39b9312498b37827bdf8f64faef397449c0c0686] {trusted issuer}) which is self-issued; the [CN=elastic-ca] certificate is trusted in this ssl context ([xpack.security.transport.ssl])
java.security.cert.CertificateException: No subject alternative DNS name matching es-node1 found.
```

```{note}
On Liferay 7.0-7.2 this happens only when `transportSSLVerificationMode="full"` is set in the `XPackSecurityConfiguration.config` file. The client (i.e., the connector in Liferay) is not only verifying that the Elasticsearch node's certificate is signed by a trusted CA, but it's also performing host name/IP address verification.
```

There's a related Elasticsearch 6/7 error that appears on Liferay 7.0-7.2:

```
[2021-06-08T17:06:03,540][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:40486}
```

These errors signal that the Elasticsearch node's host is not found in the certificate it is presenting to the client (i.e., the connector in Liferay) during the SSL handshake. The host name must appear in the certificate as a Subject Alternative Name: in this case, the declared host name `es-node1` doesn't match the name in the certificate (perhaps it's `es-node-1` in the certificate).

Open the server's certificate. If the server host name isn't in the DNS names/IP addresses under the `Subject Alternative Names` category, update the certificate.

## Authentication Fails Due to Incorrect X-Pack Security Credentials

On Liferay 7.3 and 7.4 when the password set in the connector configuration doesn't match the password in Elasticsearch, exceptions appear in the log:

```
Caused by: java.lang.RuntimeException: org.elasticsearch.ElasticsearchStatusException: ElasticsearchStatusException[method [HEAD], host [https://es-node-1:9200], URI [/liferay-20102-workflow-metrics-processes?ignore_throttled=false&include_type_name=true&ignore_unavailable=false&expand_wildcards=open&allow_no_indices=true], status line [HTTP/1.1 401 Unauthorized]]; nested: ResponseException[method [HEAD], host [https://es-node-1:9200], URI [/liferay-20102-workflow-metrics-processes?ignore_throttled=false&include_type_name=true&ignore_unavailable=false&expand_wildcards=open&allow_no_indices=true], status line [HTTP/1.1 401 Unauthorized]];
	at org.elasticsearch.client.RestHighLevelClient.parseResponseException(RestHighLevelClient.java:1866) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.internalPerformRequest(RestHighLevelClient.java:1626) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.performRequest(RestHighLevelClient.java:1583) ~[?:?]
```

If the user name is incorrect, a different error can appear:

```
2021-06-04 18:34:49.059 ERROR [com.liferay.data.engine.internal.petra.executor.DataEngineNativeObjectPortalExecutor-2][DataEngineNativeObjectPortalExecutor:163] java.lang.RuntimeException: org.elasticsearch.ElasticsearchStatusException: ElasticsearchStatusException[Elasticsearch exception [type=security_exception, reason=unable to authenticate user [elasticc] for REST request [/_bulk?refresh=true&timeout=1m]]]
java.lang.RuntimeException: org.elasticsearch.ElasticsearchStatusException: ElasticsearchStatusException[Elasticsearch exception [type=security_exception, reason=unable to authenticate user [elasticc] for REST request [/_bulk?refresh=true&timeout=1m]]]
	at org.elasticsearch.rest.BytesRestResponse.errorFromXContent(BytesRestResponse.java:187) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.parseEntity(RestHighLevelClient.java:1892) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.parseResponseException(RestHighLevelClient.java:1869) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.internalPerformRequest(RestHighLevelClient.java:1626) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.performRequest(RestHighLevelClient.java:1583) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.performRequestAndParseEntity(RestHighLevelClient.java:1553) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.bulk(RestHighLevelClient.java:533) ~[?:?]
```

On Liferay 7.0-7.2 the error manifests as `org.elasticsearch.client.transport.NoNodeAvailableException`.

There's a corresponding error that appears in Elasticsearch:

```
[2021-06-04T18:30:29,114][INFO ][o.e.x.s.a.AuthenticationService] [es-node1] Authentication of [elastic] was terminated by realm [reserved] - failed to authenticate user [elastic]
```

Open the connector configuration in Liferay and make sure that the user name and password match the credentials of the X-Pack user in Elasticsearch.

## Security is Enabled in Liferay but Disabled in Elasticsearch

On Liferay 7.3 and 7.4 the following log messages can appear:

```
Caused by: javax.net.ssl.SSLException: Unrecognized SSL message, plaintext connection?
	at sun.security.ssl.SSLEngineInputRecord.bytesInCompletePacket(SSLEngineInputRecord.java:146) ~[?:?]
	at sun.security.ssl.SSLEngineInputRecord.bytesInCompletePacket(SSLEngineInputRecord.java:64) ~[?:?]
	at sun.security.ssl.SSLEngineImpl.readRecord(SSLEngineImpl.java:557) ~[?:?]
	at sun.security.ssl.SSLEngineImpl.unwrap(SSLEngineImpl.java:454) ~[?:?]
	at sun.security.ssl.SSLEngineImpl.unwrap(SSLEngineImpl.java:433) ~[?:?]
	at javax.net.ssl.SSLEngine.unwrap(SSLEngine.java:637) ~[?:?]
	at org.apache.http.nio.reactor.ssl.SSLIOSession.doUnwrap(SSLIOSession.java:275) ~[httpcore-nio-4.4.12.jar:4.4.12]
	at org.apache.http.nio.reactor.ssl.SSLIOSession.doHandshake(SSLIOSession.java:321) ~[httpcore-nio-4.4.12.jar:4.4.12]
	at org.apache.http.nio.reactor.ssl.SSLIOSession.isAppInputReady(SSLIOSession.java:523) ~[httpcore-nio-4.4.12.jar:4.4.12]
	at org.apache.http.impl.nio.reactor.AbstractIODispatch.inputReady(AbstractIODispatch.java:120) ~[httpcore-nio-4.4.12.jar:4.4.12]
	at org.apache.http.impl.nio.reactor.BaseIOReactor.readable(BaseIOReactor.java:162) ~[httpcore-nio-4.4.12.jar:4.4.12]
	at org.apache.http.impl.nio.reactor.AbstractIOReactor.processEvent(AbstractIOReactor.java:337) ~[httpcore-nio-4.4.12.jar:4.4.12]
	at org.apache.http.impl.nio.reactor.AbstractIOReactor.processEvents(AbstractIOReactor.java:315) ~[httpcore-nio-4.4.12.jar:4.4.12]
	at org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:276) ~[httpcore-nio-4.4.12.jar:4.4.12]
	at org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104) ~[httpcore-nio-4.4.12.jar:4.4.12]
	at org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591) ~[httpcore-nio-4.4.12.jar:4.4.12]
```

On Liferay 7.0-7.2 the error manifests with `org.elasticsearch.client.transport.NoNodeAvailableException`.

There's a corresponding Elasticsearch error:

```
[2021-06-07T17:48:31,554][WARN ][o.e.t.TcpTransport       ] [es-node1] SSL/TLS request received but SSL/TLS is not enabled on this node, got (16,3,3,1), [Netty4TcpChannel{localAddress=/192.168.0.17:9300, remoteAddress=/192.168.0.17:40646}], closing connection
```

Open `elasticsearch.yml` and make sure `xpack.security.enabled` is not set to `false`. Ensure that the HTTP and Transport layers are configured to use encrypted communication according to the [Securing Elasticsearch](../securing-elasticsearch.md) article.

## Liferay and Elasticsearch are Using Certificates Signed by a Different Certificate Authority

When `*.ssl.verification_mode` settings are `certificate` or `full` in `elasticsearch.yml`, the following error can appear in Liferay 7.3 and 7.4:

```
Caused by: javax.net.ssl.SSLHandshakeException: PKIX path validation failed: java.security.cert.CertPathValidatorException: Path does not chain with any of the trust anchors
	at sun.security.ssl.Alert.createSSLException(Alert.java:131) ~[?:?]
```

On Liferay 7.0-7.2, if `transportSSLVerificationMode="certificate"` is set in the `XPackSecurityConfiguration.config` file, this error can appear:
,

```
[2021-06-07T18:18:44,579][WARN ][o.e.c.s.DiagnosticTrustManager] [
ode_name]failed to establish trust with server at [<unknown host>]; the server provided a certificate with subject name [CN=elastic-nodes] and fingerprint [065071bd5b26e83b2903b09179acf4a48851d775]; the certificate has subject alternative names [DNS:localhost,DNS:dxp.example.com,DNS:es-node-1,IP:127.0.0.1,DNS:es-node2,DNS:es-node3,DNS:kibana.example.com]; the certificate is issued by [CN=elastic-ca]; the certificate is signed by (subject [CN=elastic-ca] fingerprint [39b9312498b37827bdf8f64faef397449c0c0686]) which is self-issued; the [CN=elastic-ca] certificate is not trusted in this ssl context ([xpack.security.transport.ssl]); this ssl context does trust a certificate with subject [CN=elastic-ca] but the trusted certificate has fingerprint [9d82c3b32af8607add6682b5b7f20f4357735bce]
sun.security.validator.ValidatorException: PKIX path validation failed: java.security.cert.CertPathValidatorException: Path does not chain with any of the trust anchors
```

A corresponding Elasticsearch error appears with Liferay 7.0-7.2 when connecting to the server over TCP:

```
[2021-06-07T18:19:49,623][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:41820}
```

Make sure all nodes in your stack (e.g., Liferay, Elasticsearch, and Kibana) use certificates signed by the same Certificate Authority (CA) and the certificate (public key) of the CA is present in the client's environment. For example, make sure the `sslTruststorePath` or `sslCertificateAuthoritiesPath` settings are configured according the [Securing Elasticsearch documentation](../securing-elasticsearch.md#configure-a-secure-connection-to-elasticsearch-in-liferay-7.2).

```{tip}
Open the certificate files and find the "Issuer Name" or "Issued by" entry. These entries hold information about the issuer CA.
```

## Elasticsearch Monitoring and/or the X-Pack Monitoring Widget is Temporarily Unavailable

[Monitoring Elasticsearch](../../../liferay-enterprise-search.md#monitoring-elasticsearch) demonstrates configuring Kibana to use HTTPS. Certificate issues with the setup can cause these log messages to appear on Liferay 7.3 and 7.4:

```
2021-06-08 13:54:53.084 ERROR [http-nio-8080-exec-8][MonitoringProxyServlet:107] java.net.ConnectException: Connection refused (Connection refused)
java.net.ConnectException: Connection refused (Connection refused)
	at java.net.PlainSocketImpl.socketConnect(Native Method) ~[?:?]
	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:399) ~[?:?]
	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:242) ~[?:?]
	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:224) ~[?:?]
	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:403) ~[?:?]
	at java.net.Socket.connect(Socket.java:608) ~[?:?]
	at sun.security.ssl.SSLSocketImpl.connect(SSLSocketImpl.java:287) ~[?:?]
	at org.apache.http.conn.ssl.SSLSocketFactory.connectSocket(SSLSocketFactory.java:532) ~[httpclient-4.5.jar:?]
	at org.apache.http.conn.ssl.SSLSocketFactory.connectSocket(SSLSocketFactory.java:409) ~[httpclient-4.5.jar:?]
	at org.apache.http.impl.conn.DefaultClientConnectionOperator.openConnection(DefaultClientConnectionOperator.java:177) ~[httpclient-4.5.jar:?]
	at org.apache.http.impl.conn.ManagedClientConnectionImpl.open(ManagedClientConnectionImpl.java:304) ~[httpclient-4.5.jar:?]
	at org.apache.http.impl.client.DefaultRequestDirector.tryConnect(DefaultRequestDirector.java:611) ~[httpclient-4.5.jar:?]
	at org.apache.http.impl.client.DefaultRequestDirector.execute(DefaultRequestDirector.java:446) ~[httpclient-4.5.jar:?]
	at org.apache.http.impl.client.AbstractHttpClient.doExecute(AbstractHttpClient.java:882) ~[httpclient-4.5.jar:?]
	at org.apache.http.impl.client.CloseableHttpClient.execute(CloseableHttpClient.java:117) ~[httpclient-4.5.jar:?]
	at org.apache.http.impl.client.CloseableHttpClient.execute(CloseableHttpClient.java:55) ~[httpclient-4.5.jar:?]
	at org.mitre.dsmiley.httpproxy.ProxyServlet.service(ProxyServlet.java:267) ~[smiley-http-proxy-servlet-1.7.jar:?]
	at com.liferay.portal.search.elasticsearch.monitoring.web.internal.servlet.MonitoringProxyServlet.service(MonitoringProxyServlet.java:224) [bundleFile:?]
```

On Liferay 7.0-7.2, different messages can appear:

```
2021-06-08 13:24:57.104 ERROR [http-nio-7211-exec-8][XPackMonitoringProxyServlet:106] javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
	at java.base/sun.security.ssl.Alert.createSSLException(Alert.java:131)
```

A corresponding Kibana error can appear:

```
 error  [13:24:57.089] [error][client][connection] Error: 139942872246080:error:14094416:SSL routines:ssl3_read_bytes:sslv3 alert certificate unknown:../deps/openssl/openssl/ssl/record/rec_layer_s3.c:1544:SSL alert number 46
```

These errors indicate that the Kibana server has a self-signed certificate and the CA is not present in the client's truststore file (Liferay DXP is the client, through the LES Monitoring app). The JDK's `cacerts` file is the default truststore.

Because you're using the Monitoring portlet in Liferay as a proxy to Kibana's UI and using a self-signed certificate, you must configure the application server's startup JVM parameters to trust Kibana's certificate. There are two approaches, demonstrated with Tomcat here:

1. Add the truststore path, password, and type to your application server's startup JVM parameters using the same files you also used to configure security in the Elasticsearch connector. Append truststore and path parameters to a Tomcat server's `CATALINA_OPTS` through the `setenv.sh/bat` file:

   ```
   CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=/path/to/elastic-nodes.p12 -Djavax.net.ssl.trustStorePassword=liferay -Djavax.net.ssl.trustStoreType=pkcs12"
   ```

1. A better way is to make a copy of the default `cacerts` file, import the certificate without private key, then configure the application server to use the custom truststore file:

   * Copy the default `cacerts` file from the Liferay JVM (located in `JAVA_HOME/jre/lib/security` in JDK 8 or in `JAVA_HOME/lib/security` in JDK 11) and rename it `cacerts-custom.jks`.
   * Extract the certificate of the CA without the private key using `openssl` (if you only have a single `.p12` file like `elastic-stack-ca.p12`)
   * Import the certificate into your custom JKS file using Java's `keytool`
   * Configure Tomcat to use the custom truststore:

      ```
      CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=/PATH/TO/cacerts-custom.jks -Djavax.net.ssl.trustStorePassword=changeit"
      ```

## SSL Exception when Using JDK 11 and Elasticsearch 7.11+

When Liferay DXP is configured to use JDK version 11 and communicate with Kibana version 7.11+, the following error can appear in Liferay's log:

```
12:24:42,480 ERROR [http-nio-8080-exec-10][XPackMonitoringProxyServlet:108] javax.net.ssl.SSLPeerUnverifiedException: peer not authenticated
javax.net.ssl.SSLPeerUnverifiedException: peer not authenticated
	at java.base/sun.security.ssl.SSLSessionImpl.getPeerCertificates(SSLSessionImpl.java:526)
	at org.apache.http.conn.ssl.AbstractVerifier.verify(AbstractVerifier.java:112)
	<truncated for clarity>
        at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1601)
	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
	at java.base/java.lang.Thread.run(Thread.java:834)
12:24:42,483 ERROR [http-nio-8080-exec-4][XPackMonitoringProxyServlet:108] javax.net.ssl.SSLException: No PSK available. Unable to resume.
javax.net.ssl.SSLException: No PSK available. Unable to resume.
```

See [Monitoring Elasticsearch](../../../liferay-enterprise-search/monitoring-elasticsearch.md#troubleshooting-the-monitoring-setup).

## IOException: Data Isn't an Object ID

When the `.p12` file was generated (using `keytool`) by a JDK from a higher major version than the Liferay JDK, this error can appear in Liferay's log: 

```
09:30:55,298 ERROR [ServerService Thread Pool -- 106][ElasticsearchConnectionManager:93] bundle com.liferay.portal.search.elasticsearch7.impl:5.0.17 (670)[com.liferay.portal.search.elasticsearch7.internal.connection.ElasticsearchConnectionManager(1656)] : The activate method has thrown an exception
java.lang.RuntimeException: java.io.IOException: parseAlgParameters failed: ObjectIdentifier() -- data isn't an object ID (tag = 48)
        at com.liferay.portal.search.elasticsearch7.internal.connection.RestHighLevelClientFactory.createSSLContext(RestHighLevelClientFactory.java:172)
        at com.liferay.portal.search.elasticsearch7.internal.connection.RestHighLevelClientFactory.customizeHttpClient(RestHighLevelClientFactory.java:185)
        at org.elasticsearch.client.RestClientBuilder.createHttpClient(RestClientBuilder.java:215)
        at java.security.AccessController.doPrivileged(Native Method)
        at org.elasticsearch.client.RestClientBuilder.build(RestClientBuilder.java:191)
        at org.elasticsearch.client.RestHighLevelClient.<init>(RestHighLevelClient.java:287)
        at org.elasticsearch.client.RestHighLevelClient.<init>(RestHighLevelClient.java:279)
        at com.liferay.portal.search.elasticsearch7.internal.connection.RestHighLevelClientFactory.lambda$newRestHighLevelClient$0(RestHighLevelClientFactory.java:64)
        at com.liferay.portal.search.elasticsearch7.internal.util.ClassLoaderUtil.getWithContextClassLoader(ClassLoaderUtil.java:34)
        at com.liferay.portal.search.elasticsearch7.internal.connection.RestHighLevelClientFactory.newRestHighLevelClient(RestHighLevelClientFactory.java:63)
        at com.liferay.portal.search.elasticsearch7.internal.connection.ElasticsearchConnection.createRestHighLevelClient(ElasticsearchConnection.java:164)
        at com.liferay.portal.search.elasticsearch7.internal.connection.ElasticsearchConnection.connect(ElasticsearchConnection.java:64)
```

For example, generating the certs using JDK11 but running Liferay with JDK8 can produce this exception.

To proceed, follow one of these options:

1. Re-generate the certificate(s) using a matching JDK version.

1. Use the `JKS` format instead of `PKCS12` for the keystore.

1. Use the `-Dkeystore.pkcs12.legacy` option with `keytool` to set the `keystore.pkcs12.legacy` system property and force OpenJDK 11/16's keytool to use the older algorithms.

## The CA Certificate Used to Sign the Node Certificate is Not Trusted

During the SSL handshake between Elasticsearch nodes or between Liferay and Elasticsearch, the CA certificate used to sign the node certificates must be trusted. Make sure the certificate is present in the `truststore` or `keystore` of all nodes. This is usually a problem when using self-signed certificates.

In a multi-node Elasticsearch cluster, the Elasticsearch server node receiving the request from a client Elasticsearch node can throw the following warning message:

```
[2022-07-15T11:49:39,361][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/127.0.0.1:44198, profile=default}
```

On the client Elasticsearch node the error manifests in a `SunCertPathBuilderException`:

```
[2022-07-15T11:49:39,354][WARN ][o.e.t.OutboundHandler    ] [es-node2] send message failed [channel: Netty4TcpChannel{localAddress=/127.0.0.1:44198, remoteAddress=es-node1/127.0.0.1:9300, profile=default}]
javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
	at sun.security.ssl.Alert.createSSLException(Alert.java:131) ~[?:?]
	at sun.security.ssl.TransportContext.fatal(TransportContext.java:368) ~[?:?]
```

Some further testing can confirm the root cause. Temporarily set `xpack.security.transport.ssl.verification_mode: none` in the `elasticsearch.yml` of each node. If the errors clear up and the connection is successful, the certificate isn't present in the keystore or truststore of the client node.

```{warning}
Never leave the SSL verification mode set to `none` in production environments.

Read the [Elasticsearch documentation](https://www.elastic.co/guide/en/elasticsearch/reference/8.12/security-settings.html#transport-tls-ssl-settings) to learn more about the SSL verification mode setting.
```

A similar problem can occur between Liferay and the Elasticsearch nodes. Liferay throws an error like this if the Elasticsearch node certificates were signed by a non-trusted CA (e.g., when using self-signed certificates):

```
2022-07-15 10:15:54.287 ERROR [main][ElasticsearchSearchEngine:47] bundle com.liferay.portal.search.elasticsearch7.impl:6.0.48 (335)[com.liferay.portal.search.elasticsearch7.internal.ElasticsearchSearchEngine(925)] : The activate method has thrown an exception
java.lang.RuntimeException: org.elasticsearch.ElasticsearchException: ElasticsearchException[java.util.concurrent.ExecutionException: javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target];
```

Make sure that the CA's certificate that signed the Elasticsearch node certificates is present and trusted in the truststore configured in Liferay.

* If your [security settings](../securing-elasticsearch.md) are in the Elasticsearch connector's configuration (`com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config`), set the truststore for the Elasticsearch connections using the `truststorePath` property.
* If your security settings are in the LES Security app configuration (`com.liferay.portal.search.elasticsearch7.configuration.XPackSecurityConfiguration.config`, set the truststore using the `sslTruststorePath` property. 

You can also see these errors if the CA certificate (public key) is not present in the node certificate. In this case add it using Java's `keytool` or other tools like `openssl`, depending on the format of the CA certificate and node certificates (PKCS#12 or PEM).

For example, if you have your CA's certificate (public key) and private key in `ca.p12` and your node certificate is `elastic-nodes.p12`, follow these steps:

1. Export the public key of the CA without the private key:

	`openssl pkcs12 -in ca.p12 -out ca.crt -nokeys`

1. Provide the password of `ca.p12` when prompted. This produces a file called `ca.crt`.

1. Import the CA certificate into `elastic-nodes.p12`:

	`keytool -importcert -keystore elastic-nodes.p12 -trustcacerts -storepass liferay -file ca.crt`


## PKCS12 Keystore created with newer JDK cannot be opened by JDK 8

Elasticsearch 8 uses the bundled OpenJDK 19 to generate certificates and private keys with the [`elasticsearch-certutil`](https://www.elastic.co/guide/en/elasticsearch/reference/8.12/certutil.html) command. When Liferay runs on JDK 8, it cannot recognize certificates generated with JDK 16 or higher.

Errors like this can result:

```log
2023-05-18 21:37:54.085 ERROR [Start Level: Equinox Container: 3f8ebcb7-02d0-40a7-a084-7a89762b9642][ElasticsearchConnectionConfigurationActivationHandler:56] bundle com.liferay.portal.search.elasticsearch7.impl:6.0.84 (270)[com.liferay.portal.search.elasticsearch7.internal.connection.ElasticsearchConnectionConfigurationActivationHandler(666)] : The activate method has thrown an exception
java.lang.IllegalStateException: could not create the default ssl context
	at org.elasticsearch.client.RestClientBuilder.createHttpClient(RestClientBuilder.java:328) ~[?:?]
	at java.security.AccessController.doPrivileged(Native Method) ~[?:1.8.0_292]
	at org.elasticsearch.client.RestClientBuilder.build(RestClientBuilder.java:278) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.<init>(RestHighLevelClient.java:312) ~[?:?]
   ...
Caused by: java.security.NoSuchAlgorithmException: Error constructing implementation (algorithm: Default, provider: SunJSSE, class: sun.security.ssl.SSLContextImpl$DefaultSSLContext)
	at java.security.Provider$Service.newInstance(Provider.java:1617) ~[?:1.8.0_292]
	at sun.security.jca.GetInstance.getInstance(GetInstance.java:236) ~[?:1.8.0_292]
	at sun.security.jca.GetInstance.getInstance(GetInstance.java:164) ~[?:1.8.0_292]
	at javax.net.ssl.SSLContext.getInstance(SSLContext.java:156) ~[?:1.8.0_292]
   ...
Caused by: java.security.KeyStoreException: problem accessing trust store
	at sun.security.ssl.TrustManagerFactoryImpl.engineInit(TrustManagerFactoryImpl.java:73) ~[?:1.8.0_292]
	at javax.net.ssl.TrustManagerFactory.init(TrustManagerFactory.java:250) ~[?:1.8.0_292]
	at sun.security.ssl.SSLContextImpl$DefaultManagersHolder.getTrustManagers(SSLContextImpl.java:1041) ~[?:1.8.0_292]
	at sun.security.ssl.SSLContextImpl$DefaultManagersHolder.<clinit>(SSLContextImpl.java:1011) ~[?:1.8.0_292]
   ...
Caused by: java.io.IOException: Keystore was tampered with, or password was incorrect
	at sun.security.provider.JavaKeyStore.engineLoad(JavaKeyStore.java:792) ~[?:1.8.0_292]
	at sun.security.provider.JavaKeyStore$JKS.engineLoad(JavaKeyStore.java:57) ~[?:1.8.0_292]
	at sun.security.provider.KeyStoreDelegator.engineLoad(KeyStoreDelegator.java:224) ~[?:1.8.0_292]
	at sun.security.provider.JavaKeyStore$DualFormatJKS.engineLoad(JavaKeyStore.java:71) ~[?:1.8.0_292]
   ...
Caused by: java.security.UnrecoverableKeyException: Password verification failed
	at sun.security.provider.JavaKeyStore.engineLoad(JavaKeyStore.java:790) ~[?:1.8.0_292]
	at sun.security.provider.JavaKeyStore$JKS.engineLoad(JavaKeyStore.java:57) ~[?:1.8.0_292]
	at sun.security.provider.KeyStoreDelegator.engineLoad(KeyStoreDelegator.java:224) ~[?:1.8.0_292]
	at sun.security.provider.JavaKeyStore$DualFormatJKS.engineLoad(JavaKeyStore.java:71) ~[?:1.8.0_292]
   ...
```

To solve this issue, you can run Liferay on JDK 11. See the [compatibility matrix](https://help.liferay.com/hc/en-us/articles/4411310034829) for details.

## Related Topics

* [Connecting to Elasticsearch](../connecting-to-elasticsearch.md)
* [Troubleshooting Elasticsearch Installation](../troubleshooting-elasticsearch-installation.md)
* [Troubleshooting Elasticsearch: Common Issues](./troubleshooting-elasticsearch-common-issues.md)
