# Troubleshooting Elasticsearch Liferay Connection

## Network Host Addresses / Transport Addresses Configuration and Elasticsearch Nodes' Hosts Mismatch

Possible errors (in Liferay's server log):

On Liferay 7.3 and 7.4,

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

On Liferay 7.0-7.2,

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

The above errors indicate that Elasticsearch connector in Liferay is attempting to connect to Elasticsearch using host `es-node1-prod` and it can't find any available nodes. Obtain the Elasticsearch node(s) logs and look for lines like 

```
[2021-06-04T17:31:22,472][INFO ][o.e.t.TransportService   ] [es-node1] publish_address {es-node1/192.168.0.17:9300}, bound_addresses {192.168.0.17:9300}
(...)
[2021-06-04T17:31:23,080][INFO ][o.e.h.AbstractHttpServerTransport] [es-node1] publish_address {es-node1/192.168.0.17:9200}, bound_addresses {192.168.0.17:9200}
```

These are indicating the actual address of the given node. In this example, it is `es-node1/192.168.0.17:9300` for the Transport address and `es-node1/192.168.0.17:9200` for the HTTP address.

Therefore, the connector config in Liferay should use
* `networkHostAddresses=["http:es-node1:9200"]` on Liferay 7.3 and 7.4 (`["es-node1:9200"]` also works)
* `transportAddresses=["es-node1:9300"]` on Liferay 7.0-7.2.

## TLS/SSL is Enabled, but Liferay is Attempting to Communicate Over an Unencrypted Channel

Possible errors (in Liferay's server log):

On Liferay 7.3 and 7.4,

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

On Liferay 7.0-7.2, it manifests in the general `org.elasticsearch.client.transport.NoNodeAvailableException` error.

Related errors in Elasticsearc's log:

On Liferay 7.3 and 7.4,

```
[2021-06-04T18:09:11,925][WARN ][o.e.x.s.t.n.SecurityNetty4HttpServerTransport] [es-node1] received plaintext http traffic on an https channel, closing connection Netty4HttpChannel{localAddress=0.0.0.0/0.0.0.0:9200, remoteAddress=/192.168.0.17:41104}
```

On a Liferay 7.0-7.2,

```
[2021-06-04T18:11:13,045][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] received plaintext traffic on an encrypted channel, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:34346}
```

The Elasticsearch WARNs are indicating that the server received plaintext traffic on an encrypted channel.

Open the `elasticsearch.yml` and if it has `xpack.security.*` properties set for the transport and/or http layers (and optionally you also see `xpack.security.enabled: true`) it means Elasticsearch has X-Pack Security enabled so the connector in Liferay must also be configured accordingly.

Consult with the [Securing Elasticsearch](../securing-elasticsearch.html) article and adjust your settings, if needed.

## Elasticsearch Node Host Does Not Match the DNS Names in the Certificate

Possible errors:

On Liferay 7.3 and 7.4,

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

On Liferay 7-0-7.2, it manifests in `org.elasticsearch.client.transport.NoNodeAvailableException: NoNodeAvailableException` and `java.security.cert.CertificateException: No subject alternative DNS name matching found` errors.

```
[2021-06-08T17:09:24,557][WARN ][o.e.c.s.DiagnosticTrustManager] [
ode_name]failed to establish trust with server at [es-node1]; the server provided a certificate with subject name [CN=elastic-nodes] and fingerprint [065071bd5b26e83b2903b09179acf4a48851d775]; the certificate has subject alternative names [DNS:localhost,DNS:dxp.example.com,DNS:es-node-1,IP:127.0.0.1,DNS:es-node2,DNS:es-node3,DNS:kibana.example.com]; the certificate is issued by [CN=elastic-ca]; the certificate is signed by (subject [CN=elastic-ca] fingerprint [39b9312498b37827bdf8f64faef397449c0c0686] {trusted issuer}) which is self-issued; the [CN=elastic-ca] certificate is trusted in this ssl context ([xpack.security.transport.ssl])
java.security.cert.CertificateException: No subject alternative DNS name matching es-node1 found.
```

Note: on Liferay 7.0-7.2, this happens only when `transportSSLVerificationMode="full"` is set in `*.XPackSecurityConfiguration.config` in Liferay, so the client (connector in Liferay) is not only verifying that the Elasticsearch server node's certficate is signed by a trusted CA, but it's also performing host name/IP address verification.


Related Elasticsearch error (on Liferay 7.0-7.2),

```
[2021-06-08T17:06:03,540][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:40486}
```

This error indicates that the Elasticsearch server node's host is not found in the certificate it is presenting to the client (Liferay) during the SSL handshake as a _Subject Alternative Name_: server's host: `es-node1` in this example, while the certificate is containing `es-node-1`.

Open the server's certificate and DNS names/IP addresses under the `Subject Alternative Names` category and check if the server's host is there. If it is not, the cert should be updated.

## Authentication Fails Due to Incorrect X-Pack Security User Credentials (username or password)

On Liferay 7.3 and 7.4 when the `password` set in the connector configuration is incorrect,

```
Caused by: java.lang.RuntimeException: org.elasticsearch.ElasticsearchStatusException: ElasticsearchStatusException[method [HEAD], host [https://es-node-1:9200], URI [/liferay-20102-workflow-metrics-processes?ignore_throttled=false&include_type_name=true&ignore_unavailable=false&expand_wildcards=open&allow_no_indices=true], status line [HTTP/1.1 401 Unauthorized]]; nested: ResponseException[method [HEAD], host [https://es-node-1:9200], URI [/liferay-20102-workflow-metrics-processes?ignore_throttled=false&include_type_name=true&ignore_unavailable=false&expand_wildcards=open&allow_no_indices=true], status line [HTTP/1.1 401 Unauthorized]];
	at org.elasticsearch.client.RestHighLevelClient.parseResponseException(RestHighLevelClient.java:1866) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.internalPerformRequest(RestHighLevelClient.java:1626) ~[?:?]
	at org.elasticsearch.client.RestHighLevelClient.performRequest(RestHighLevelClient.java:1583) ~[?:?]
```

If the `username` is incorrect,

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

On Liferay 7.0-7.2, it manifests in the `org.elasticsearch.client.transport.NoNodeAvailableException` error.

Corresponding Elasticsearch error,

```
[2021-06-04T18:30:29,114][INFO ][o.e.x.s.a.AuthenticationService] [es-node1] Authentication of [elastic] was terminated by realm [reserved] - failed to authenticate user [elastic]
```

Open the connector configuration and make sure that the username/password configured match with the credentials of the X-Pack user set up in Elasticsearch.

## Security is Enabled in Liferay, but X-Pack Security is Disabled in Elasticsearch

On Liferay 7.3 and 7.4,

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

On Liferay 7.0-7.2, it usually manifests in the `org.elasticsearch.client.transport.NoNodeAvailableException` error.

Corresponding Elasticsearch error,

```
[2021-06-07T17:48:31,554][WARN ][o.e.t.TcpTransport       ] [es-node1] SSL/TLS request received but SSL/TLS is not enabled on this node, got (16,3,3,1), [Netty4TcpChannel{localAddress=/192.168.0.17:9300, remoteAddress=/192.168.0.17:40646}], closing connection
```

Open `elasticsearch.yml` and make sure `xpack.security.enabled` is not set to `false` and the HTTP and Transport layers are also configured properly to use encrypted communication according to the [Securing Elasticsearch](../securing-elasticsearch.html) article.

## Liferay and the Elasticsearch Nodes are Using Certificates Signed by a Different CA

This happens when when `*.ssl.verification_mode` is configured as `certificate` or `full` in `elasticsearch.yml` for the HTTP and/or Transport layer.

On Liferay 7.3 and 7.4,

```
Caused by: javax.net.ssl.SSLHandshakeException: PKIX path validation failed: java.security.cert.CertPathValidatorException: Path does not chain with any of the trust anchors
	at sun.security.ssl.Alert.createSSLException(Alert.java:131) ~[?:?]
```

On Liferay 7.0-7.2 when `transportSSLVerificationMode="certificate"` is set in the `*.XPackSecurityConfiguration.config` file,
,

```
[2021-06-07T18:18:44,579][WARN ][o.e.c.s.DiagnosticTrustManager] [
ode_name]failed to establish trust with server at [<unknown host>]; the server provided a certificate with subject name [CN=elastic-nodes] and fingerprint [065071bd5b26e83b2903b09179acf4a48851d775]; the certificate has subject alternative names [DNS:localhost,DNS:dxp.example.com,DNS:es-node-1,IP:127.0.0.1,DNS:es-node2,DNS:es-node3,DNS:kibana.example.com]; the certificate is issued by [CN=elastic-ca]; the certificate is signed by (subject [CN=elastic-ca] fingerprint [39b9312498b37827bdf8f64faef397449c0c0686]) which is self-issued; the [CN=elastic-ca] certificate is not trusted in this ssl context ([xpack.security.transport.ssl]); this ssl context does trust a certificate with subject [CN=elastic-ca] but the trusted certificate has fingerprint [9d82c3b32af8607add6682b5b7f20f4357735bce]
sun.security.validator.ValidatorException: PKIX path validation failed: java.security.cert.CertPathValidatorException: Path does not chain with any of the trust anchors
```

Corresponding Elasticsearch error in case of Liferay 7.0-7.2 when connecting to the server over TCP:

```
[2021-06-07T18:19:49,623][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:41820}
```

Make sure all nodes in your stack (Liferay, Elasticsearch, Kibana) are using certificates signed by the same Certificate Authority (CA) and the certificate (public key) of the CA is present in the client's (DXP, Kibana) truststore/sslCertificateAuthoritiesPaths files. If you open your cert files, the "Issuer Name" or "Issued by" entry holds information about the issuer CA.

## Elasticsearch Monitoring/X-Pack Monitoring Widget is Temporarily Unavailable

This can happen due to Certificate Issues when Kibana is using HTTPS.

On Liferay 7.3 and 7.4,

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

On Liferay 7.0-7.2,

```
2021-06-08 13:24:57.104 ERROR [http-nio-7211-exec-8][XPackMonitoringProxyServlet:106] javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
	at java.base/sun.security.ssl.Alert.createSSLException(Alert.java:131)
```

Corresponding Kibana error,

```
 error  [13:24:57.089] [error][client][connection] Error: 139942872246080:error:14094416:SSL routines:ssl3_read_bytes:sslv3 alert certificate unknown:../deps/openssl/openssl/ssl/record/rec_layer_s3.c:1544:SSL alert number 46
```

The above errors indicate that the server (Kibana) the client (Liferay DXP through the LES Monitoring app) is probably using a self-signed certificate and the CA is not present in the client's trustStore file, which is the JDK's `cacerts` file by default.

Because you’re using the Monitoring portlet in Liferay as a proxy to Kibana’s UI and you are using a self-signed certificate, you must configure the application server’s startup JVM parameters to trust Kibana’s certificate.

One approach is to add the truststore path, password and type to your application server’s startup JVM parameters using the same files you also used to configure the Elasticsearch connector to use security. Here are example truststore and path parameters for appending to a Tomcat server’s `CATALINA_OPTS` through the `setenv.sh/bat` file:

```
CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=/path/to/elastic-nodes.p12 -Djavax.net.ssl.trustStorePassword=liferay -Djavax.net.ssl.trustStoreType=pkcs12"
```

Another approach (recommended) is to make a copy of the default `cacerts` file (located in `JAVA_HOME/jre/lib/security` in JDK 8 or in `JAVA_HOME/lib/security` in JDK 11) , name it `cacerts-custom.jks`, extract/obtain the certificate of the CA without the private key using `openssl` (if you only have a single .p12 file like `elastic-stack-ca.p12`) and import it into your custom JKS file using Java's `keytool` and then configure Tomcat to use that trustStore:

```
CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=/PATH/TO/cacerts-custom.jks -Djavax.net.ssl.trustStorePassword=changeit"
```

## SSLException: No PSK available. Unable to resume Error and Elasticsearch Monitoring/X-Pack Monitoring widget is Broken with Kibana 7.11+

Related error in Liferay,

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

See the [Monitoring Elasticsearch](../liferay-enterprise-search/monitoring-elasticsearch.md#troubleshooting-the-monitoring-setup) article.

## java.io.IOException: parseAlgParameters failed: ObjectIdentifier() -- data isn't an object ID (tag = 48)

This can happen when the the `.p12` files was generated using `keytool` by a JDK from a higher major version than what DXP is running on. (For example, generating the certs using JDK11, but than running the portal with JDK8.

Related error from Liferay 7.3 and 7.4,

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

You have the following options,
A.) Re-generate the certificate(s) using the same version of JDK that is used by DXP.  
B.) Use `JKS` format instead of `PKCS12` for the keystore  
C.) Use the `-Dkeystore.pkcs12.legacy` option with keytool to set the `keystore.pkcs12.legacy` system property and force OpenJDK 11/16's keytool to use the older algorithms (which are supported by Java 8 and 11)  

Related resources,
* https://stackoverflow.com/questions/67766268/ioexception-in-java-8-when-reading-pkcs12-keystore-created-with-keytool-from-ope
* https://bugs.java.com/bugdatabase/view_bug.do?bug_id=8202837
* https://bugs.java.com/bugdatabase/view_bug.do?bug_id=8267837
* https://liferay.slack.com/archives/CKY6GP7BL/p1634911737006400
