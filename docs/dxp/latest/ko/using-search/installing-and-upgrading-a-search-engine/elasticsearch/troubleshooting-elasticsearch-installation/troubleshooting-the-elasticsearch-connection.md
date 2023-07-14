# Elasticsearch 연결 문제 해결

다음은 Liferay-Elasticsearch 연결을 구성할 때 발생할 수 있는 몇 가지 연결 문제와 이러한 문제에 대한 가장 일반적인 솔루션입니다. 추가 가능성은 [Elasticsearch 문제 해결: 일반적인 문제](./troubleshooting-elasticsearch-common-issues.md) 참조하십시오.

## Liferay와 Elasticsearch의 호스트 구성 간의 불일치

Liferay 7.3 및 7.4(REST 클라이언트 연결 사용)에서 다음 로그 메시지를 볼 수 있습니다.

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

Liferay 7.0-7.2(Java Transport 클라이언트 사용)에서 다음 로그 메시지를 볼 수 있습니다.

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

Liferay의 Elasticsearch 커넥터가 Elasticsearch 호스트 `es-node1-prod` 에 연결을 시도하지만 사용 가능한 노드를 찾을 수 없습니다. Elasticsearch 로그에서 다음과 같은 줄을 찾습니다.

```
[2021-06-04T17:31:22,472][INFO ][o.e.t.TransportService   ] [es-node1] publish_address {es-node1/192.168.0.17:9300}, bound_addresses {192.168.0.17:9300}
(...)
[2021-06-04T17:31:23,080][INFO ][o.e.h.AbstractHttpServerTransport] [es-node1] publish_address {es-node1/192.168.0.17:9200}, bound_addresses {192.168.0.17:9200}
```

주어진 노드의 실제 주소가 인쇄됩니다. 이 예에서 전송 주소는 `es-node1/192.168.0.17:9300` 이고 HTTP 주소는 `es-node1/192.168.0.17:9200` 입니다.

Liferay 7.3 및 7.4의 올바른 커넥터 구성은 다음과 같습니다.

```properties
networkHostAddresses=["http:es-node1:9200"]
# The value ["es-node1:9200"] also works
```

Liferay 7.0-7.2의 올바른 커넥터 구성은 다음과 같습니다.

```properties
transportAddresses=["es-node1:9300"]
```

## TLS/SSL이 활성화되었지만 Liferay가 암호화되지 않은 채널을 통해 통신을 시도함

Liferay 7.3 및 7.4에서 다음 로그 메시지를 볼 수 있습니다.

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

Liferay 7.0-7.2에서 오류는 보다 일반적인 `org.elasticsearch.client.transport.NoNodeAvailableException`로 나타납니다.

Elasticsearch 로그에 관련 오류가 표시됩니다.

Liferay 7.3 및 7.4에서 [Elasticsearch](https://help.liferay.com/hc/ko/articles/360016511651#Liferay-DXP-7.4) 로그가 인쇄됩니다.

```
[2021-06-04T18:09:11,925][WARN ][o.e.x.s.t.n.SecurityNetty4HttpServerTransport] [es-node1] received plaintext http traffic on an https channel, closing connection Netty4HttpChannel{localAddress=0.0.0.0/0.0.0.0:9200, remoteAddress=/192.168.0.17:41104}
```

Liferay 7.0-7.2에서 [Elasticsearch 6/7](https://help.liferay.com/hc/ko/articles/360016511651#Liferay-DXP-7.2-Elasticsearch) 로그가 인쇄됩니다.

```
[2021-06-04T18:11:13,045][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] received plaintext traffic on an encrypted channel, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:34346}
```

Elasticsearch 경고는 서버가 암호화된 채널에서 일반 텍스트 트래픽을 수신했음을 나타냅니다.

`elasticsearch.yml` 파일에 전송 및/또는 http 레이어에 대해 설정된 `xpack.security.*` 속성이 있는 경우( `xpack.security.enabled: true`가 표시될 수도 있음) Elasticsearch는 X-Pack Security를 활성화한 것입니다. 따라서 Liferay의 커넥터를 적절하게 구성해야 합니다.

올바른 커넥터 구성은 [Elasticsearch](../securing-elasticsearch.md) 보안을 참조하십시오.

## Elasticsearch 호스트 이름이 인증서의 DNS 이름과 일치하지 않음

Liferay 7.3 및 7.4에서 다음 로그 메시지를 볼 수 있습니다.

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

Liferay 7.0-7.2에서 오류는 `org.elasticsearch.client.transport.NoNodeAvailableException: NoNodeAvailableException` 및 `java.security.cert.CertificateException: No subject alternative DNS name matching found`으로 나타납니다.

```
[2021-06-08T17:09:24,557][WARN ][o.e.c.s.DiagnosticTrustManager] [
ode_name]failed to establish trust with server at [es-node1]; the server provided a certificate with subject name [CN=elastic-nodes] and fingerprint [065071bd5b26e83b2903b09179acf4a48851d775]; the certificate has subject alternative names [DNS:localhost,DNS:dxp.example.com,DNS:es-node-1,IP:127.0.0.1,DNS:es-node2,DNS:es-node3,DNS:kibana.example.com]; the certificate is issued by [CN=elastic-ca]; the certificate is signed by (subject [CN=elastic-ca] fingerprint [39b9312498b37827bdf8f64faef397449c0c0686] {trusted issuer}) which is self-issued; the [CN=elastic-ca] certificate is trusted in this ssl context ([xpack.security.transport.ssl])
java.security.cert.CertificateException: No subject alternative DNS name matching es-node1 found.
```

```{note}
Liferay 7.0-7.2에서 이는 `XPackSecurityConfiguration.config` 파일에 `transportSSLVerificationMode="full"`이 설정된 경우에만 발생합니다. 클라이언트(즉, Liferay의 커넥터)는 Elasticsearch 노드의 인증서가 신뢰할 수 있는 CA에 의해 서명되었는지 확인할 뿐만 아니라 호스트 이름/IP 주소 확인도 수행합니다.
```

Liferay 7.0-7.2에 나타나는 관련 Elasticsearch 6/7 오류가 있습니다.

```
[2021-06-08T17:06:03,540][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:40486}
```

이러한 오류는 SSL 핸드셰이크 중에 클라이언트(즉, Liferay의 커넥터)에 제공하는 인증서에서 Elasticsearch 노드의 호스트를 찾을 수 없음을 나타냅니다. 호스트 이름은 주체 대체 이름으로 인증서에 나타나야 합니다. 이 경우 선언된 호스트 이름 `es-node1` 은 인증서의 이름과 일치하지 않습니다(인증서의 `es-node-1` 일 수 있음).

서버의 인증서를 엽니다. 서버 호스트 이름이 `Subject Alternative Names` 범주 아래의 DNS 이름/IP 주소에 없으면 인증서를 업데이트합니다.

## 잘못된 X-Pack 보안 자격 증명으로 인한 인증 실패

Liferay 7.3 및 7.4에서 커넥터 구성에 설정된 암호가 Elasticsearch의 암호와 일치하지 않으면 로그에 예외가 나타납니다.

```
Caused by: java.lang.RuntimeException: org.elasticsearch.ElasticsearchStatusException: ElasticsearchStatusException[method [HEAD], host [https://es-node-1:9200], URI [/liferay-20102-workflow-metrics-processes?ignore_throttled=false&include_type_name=true&ignore_unavailable=false&expand_wildcards=open&allow_no_indices=true], status line [HTTP/1.1 401 Unauthorized]]; nested: ResponseException[method [HEAD], host [https://es-node-1:9200], URI [/liferay-20102-workflow-metrics-processes?ignore_throttled=false&include_type_name=true&ignore_unavailable=false&expand_wildcards=open&allow_no_indices=true], status line [HTTP/1.1 401 Unauthorized]];
    at org.elasticsearch.client.RestHighLevelClient.parseResponseException(RestHighLevelClient.java:1866) ~[?:?]
    at org.elasticsearch.client.RestHighLevelClient.internalPerformRequest(RestHighLevelClient.java:1626) ~[?:?]
    at org.elasticsearch.client.RestHighLevelClient.performRequest(RestHighLevelClient.java:1583) ~[?:?]
```

사용자 이름이 올바르지 않으면 다른 오류가 나타날 수 있습니다.

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

Liferay 7.0-7.2에서 오류는 `org.elasticsearch.client.transport.NoNodeAvailableException`로 나타납니다.

Elasticsearch에 표시되는 해당 오류가 있습니다.

```
[2021-06-04T18:30:29,114][INFO ][o.e.x.s.a.AuthenticationService] [es-node1] Authentication of [elastic] was terminated by realm [reserved] - failed to authenticate user [elastic]
```

Liferay에서 커넥터 구성을 열고 사용자 이름과 암호가 Elasticsearch의 X-Pack 사용자 자격 증명과 일치하는지 확인합니다.

## Liferay에서는 보안이 활성화되지만 Elasticsearch에서는 비활성화됩니다.

Liferay 7.3 및 7.4에서 다음 로그 메시지가 나타날 수 있습니다.

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

Liferay 7.0-7.2에서 오류는 `org.elasticsearch.client.transport.NoNodeAvailableException`로 나타납니다.

해당하는 Elasticsearch 오류가 있습니다.

```
[2021-06-07T17:48:31,554][WARN ][o.e.t.TcpTransport       ] [es-node1] SSL/TLS request received but SSL/TLS is not enabled on this node, got (16,3,3,1), [Netty4TcpChannel{localAddress=/192.168.0.17:9300, remoteAddress=/192.168.0.17:40646}], closing connection
```

`elasticsearch.yml` 열고 `xpack.security.enabled` `false`로 설정되지 않았는지 확인합니다. [Elasticsearch 보안](../securing-elasticsearch.md) 기사에 따라 암호화된 통신을 사용하도록 HTTP 및 전송 계층이 구성되었는지 확인하십시오.

## Liferay 및 Elasticsearch는 다른 인증 기관에서 서명한 인증서를 사용하고 있습니다.

`*.ssl.verification_mode` 설정이 `인증서` 또는 `전체` in `elasticsearch.yml`인 경우 Liferay 7.3 및 7.4에 다음 오류가 나타날 수 있습니다.

```
Caused by: javax.net.ssl.SSLHandshakeException: PKIX path validation failed: java.security.cert.CertPathValidatorException: Path does not chain with any of the trust anchors
    at sun.security.ssl.Alert.createSSLException(Alert.java:131) ~[?:?]
```

Liferay 7.0-7.2에서 `transportSSLVerificationMode="certificate"` `XPackSecurityConfiguration.config` 파일에 설정되어 있으면 다음 오류가 나타날 수 있습니다. ,

```
[2021-06-07T18:18:44,579][WARN ][o.e.c.s.DiagnosticTrustManager] [
ode_name]failed to establish trust with server at [<unknown host>]; the server provided a certificate with subject name [CN=elastic-nodes] and fingerprint [065071bd5b26e83b2903b09179acf4a48851d775]; the certificate has subject alternative names [DNS:localhost,DNS:dxp.example.com,DNS:es-node-1,IP:127.0.0.1,DNS:es-node2,DNS:es-node3,DNS:kibana.example.com]; the certificate is issued by [CN=elastic-ca]; the certificate is signed by (subject [CN=elastic-ca] fingerprint [39b9312498b37827bdf8f64faef397449c0c0686]) which is self-issued; the [CN=elastic-ca] certificate is not trusted in this ssl context ([xpack.security.transport.ssl]); this ssl context does trust a certificate with subject [CN=elastic-ca] but the trusted certificate has fingerprint [9d82c3b32af8607add6682b5b7f20f4357735bce]
sun.security.validator.ValidatorException: PKIX path validation failed: java.security.cert.CertPathValidatorException: Path does not chain with any of the trust anchors
```

TCP를 통해 서버에 연결할 때 Liferay 7.0-7.2에서 해당 Elasticsearch 오류가 나타납니다.

```
[2021-06-07T18:19:49,623][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:41820}
```

스택의 모든 노드(예: Liferay, Elasticsearch 및 Kibana)가 동일한 인증 기관(CA)에서 서명한 인증서를 사용하고 CA의 인증서(공개 키)가 클라이언트 환경에 있는지 확인하십시오. 예를 들어 `sslTruststorePath` 또는 `sslCertificateAuthoritiesPath` 설정이 [Securing Elasticsearch 설명서](../securing-elasticsearch.md#configure-a-secure-connection-to-elasticsearch-in-liferay-7.2) 에 따라 구성되었는지 확인하십시오.

```{tip}
인증서 파일을 열고 "Issuer Name" 또는 "Issued by" 항목을 찾습니다. 이러한 항목은 발급자 CA에 대한 정보를 보유합니다.
```

## Elasticsearch 모니터링 및/또는 X-Pack 모니터링 위젯을 일시적으로 사용할 수 없음

[Elasticsearch 모니터링](../../../liferay-enterprise-search.md#monitoring-elasticsearch) HTTPS를 사용하도록 Kibana를 구성하는 방법을 보여줍니다. 설정과 관련된 인증서 문제로 인해 Liferay 7.3 및 7.4에 다음 로그 메시지가 나타날 수 있습니다.

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

Liferay 7.0-7.2에서는 다음과 같은 다른 메시지가 나타날 수 있습니다.

```
2021-06-08 13:24:57.104 ERROR [http-nio-7211-exec-8][XPackMonitoringProxyServlet:106] javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
    at java.base/sun.security.ssl.Alert.createSSLException(Alert.java:131)
```

해당 Kibana 오류가 나타날 수 있습니다.

```
 error  [13:24:57.089] [error][client][connection] Error: 139942872246080:error:14094416:SSL routines:ssl3_read_bytes:sslv3 alert certificate unknown:../deps/openssl/openssl/ssl/record/rec_layer_s3.c:1544:SSL alert number 46
```

이러한 오류는 Kibana 서버에 자체 서명된 인증서가 있고 클라이언트의 truststore 파일에 CA가 없음을 나타냅니다(Liferay DXP는 LES 모니터링 앱을 통한 클라이언트임). JDK의 `cacerts` 파일은 기본 신뢰 저장소입니다.

Kibana의 UI에 대한 프록시로 Liferay의 모니터링 포틀릿을 사용하고 자체 서명된 인증서를 사용하고 있으므로 Kibana의 인증서를 신뢰하도록 애플리케이션 서버의 시작 JVM 매개변수를 구성해야 합니다. 여기에 Tomcat으로 시연된 두 가지 접근 방식이 있습니다.

1. Elasticsearch 커넥터에서 보안을 구성하는 데 사용한 것과 동일한 파일을 사용하여 신뢰 저장소 경로, 비밀번호 및 유형을 애플리케이션 서버의 시작 JVM 매개변수에 추가하십시오. `setenv.sh/bat` 파일을 통해 Tomcat 서버의 `CATALINA_OPTS` 에 신뢰 저장소 및 경로 매개변수를 추가합니다.

   ```
   CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=/path/to/elastic-nodes.p12 -Djavax.net.ssl.trustStorePassword=liferay -Djavax.net.ssl.trustStoreType=pkcs12"
   ```

1. 더 좋은 방법은 기본 `cacerts` 파일의 복사본을 만들고 개인 키 없이 인증서를 가져온 다음 사용자 지정 truststore 파일을 사용하도록 응용 프로그램 서버를 구성하는 것입니다.

   * Liferay JVM(JDK 8의 `JAVA_HOME/jre/lib/security` 또는 JDK 11의 `JAVA_HOME/lib/security` 에 있음)에서 기본 `cacerts` 파일을 복사하고 이름을 `cacerts-custom.jks`로 바꿉니다.
   * `openssl` 사용하여 개인 키 없이 CA의 인증서를 추출합니다( `elastic-stack-ca.p12`와 같은 단일 `.p12` 파일만 있는 경우).
   * Java의 `keytool`을 사용하여 인증서를 사용자 지정 JKS 파일로 가져옵니다.
   * 사용자 지정 신뢰 저장소를 사용하도록 Tomcat을 구성합니다.

      ```
      CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=/PATH/TO/cacerts-custom.jks -Djavax.net.ssl.trustStorePassword=changeit"
      ```

## JDK 11 및 Elasticsearch 7.11 이상 사용 시 SSL 예외

Liferay DXP가 JDK 버전 11을 사용하고 Kibana 버전 7.11+와 통신하도록 구성된 경우 Liferay의 로그에 다음 오류가 나타날 수 있습니다.

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

[Elasticsearch 모니터링](../../../liferay-enterprise-search/monitoring-elasticsearch.md#troubleshooting-the-monitoring-setup) 참조하십시오.

## IOException: 데이터가 개체 ID가 아닙니다.

Liferay JDK보다 높은 주 버전의 JDK에서 `.p12` 파일이 생성된 경우( `keytool`사용) Liferay의 로그에 이 오류가 나타날 수 있습니다.

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

예를 들어 JDK11을 사용하여 인증서를 생성하지만 JDK8로 Liferay를 실행하면 이 예외가 발생할 수 있습니다.

계속하려면 다음 옵션 중 하나를 따르십시오.

1. 일치하는 JDK 버전을 사용하여 인증서를 다시 생성하십시오.

1. 키 저장소에 대해 `PKCS12` 대신 `JKS` 형식을 사용하십시오.

1. `-Dkeystore.pkcs12.legacy` 옵션을 `keytool` 과 함께 사용하여 `keystore.pkcs12.legacy` 시스템 속성을 설정하고 OpenJDK 11/16의 keytool이 이전 알고리즘을 사용하도록 합니다.

## 노드 인증서 서명에 사용된 CA 인증서를 신뢰할 수 없음

Elasticsearch 노드 간 또는 Liferay와 Elasticsearch 간 SSL 핸드셰이크 중에 노드 인증서 서명에 사용되는 CA 인증서를 신뢰할 수 있어야 합니다. 인증서가 모든 노드의 `신뢰 저장소` 또는 `키 저장소` 에 있는지 확인하십시오. 이는 일반적으로 자체 서명된 인증서를 사용할 때 문제가 됩니다.

다중 노드 Elasticsearch 클러스터에서 클라이언트 Elasticsearch 노드로부터 요청을 수신하는 Elasticsearch 서버 노드는 다음과 같은 경고 메시지를 표시할 수 있습니다.

```
[2022-07-15T11:49:39,361][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/127.0.0.1:44198, profile=default}
```

클라이언트 Elasticsearch 노드에서 오류는 `SunCertPathBuilderException`에 나타납니다.

```
[2022-07-15T11:49:39,354][WARN ][o.e.t.OutboundHandler    ] [es-node2] send message failed [channel: Netty4TcpChannel{localAddress=/127.0.0.1:44198, remoteAddress=es-node1/127.0.0.1:9300, profile=default}]
javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
    at sun.security.ssl.Alert.createSSLException(Alert.java:131) ~[?:?]
    at sun.security.ssl.TransportContext.fatal(TransportContext.java:368) ~[?:?]
```

몇 가지 추가 테스트를 통해 근본 원인을 확인할 수 있습니다. 임시로 각 노드의 `개의 elasticsearch.yml` 개에 `xpack.security.transport.ssl.verification_mode: none` 설정합니다. 오류가 해결되고 연결에 성공하면 클라이언트 노드의 키 저장소 또는 신뢰 저장소에 인증서가 없는 것입니다.

```{warning}
프로덕션 환경에서 SSL 확인 모드를 'none'으로 설정하지 마십시오.

SSL 확인 모드 설정에 대한 자세한 내용은 [Elasticsearch 설명서](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/security-settings.html#transport-tls-ssl-settings) 를 참조하세요.
```

Liferay와 Elasticsearch 노드 간에 유사한 문제가 발생할 수 있습니다. Liferay는 Elasticsearch 노드 인증서가 신뢰할 수 없는 CA에서 서명된 경우(예: 자체 서명된 인증서를 사용하는 경우) 다음과 같은 오류를 발생시킵니다.

```
2022-07-15 10:15:54.287 ERROR [main][ElasticsearchSearchEngine:47] bundle com.liferay.portal.search.elasticsearch7.impl:6.0.48 (335)[com.liferay.portal.search.elasticsearch7.internal.ElasticsearchSearchEngine(925)] : The activate method has thrown an exception
java.lang.RuntimeException: org.elasticsearch.ElasticsearchException: ElasticsearchException[java.util.concurrent.ExecutionException: javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target];
```

Elasticsearch 노드 인증서에 서명한 CA의 인증서가 존재하고 Liferay에 구성된 신뢰 저장소에 신뢰할 수 있는지 확인하십시오.

* [보안 설정](../securing-elasticsearch.md) Elasticsearch 커넥터 구성(`com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config`)에 있는 경우 `truststorePath` 속성을 사용하여 Elasticsearch 연결에 대한 신뢰 저장소를 설정합니다.
* 보안 설정이 LES Security 앱 구성(`com.liferay.portal.search.elasticsearch7.configuration.XPackSecurityConfiguration.config`에 있는 경우 `sslTruststorePath` 속성을 사용하여 신뢰 저장소를 설정합니다.

CA 인증서(공용 키)가 노드 인증서에 없는 경우에도 이러한 오류를 볼 수 있습니다. 이 경우 CA 인증서 및 노드 인증서(PKCS#12 또는 PEM)의 형식에 따라 Java의 `keytool` 또는 `openssl`같은 다른 도구를 사용하여 추가합니다.

예를 들어 `ca.p12` 에 CA의 인증서(공개 키)와 개인 키가 있고 노드 인증서가 `elastic-nodes.p12`인 경우 다음 단계를 따르십시오.

1. 개인 키 없이 CA의 공개 키를 내보냅니다.

    `openssl pkcs12 -in ca.p12 -out ca.crt -nokeys`

1. 프롬프트가 표시되면 비밀번호 `ca.p12` 을 입력하십시오. 이것은 `ca.crt`이라는 파일을 생성합니다.

1. CA 인증서를 `elastic-nodes.p12`로 가져옵니다.

    `keytool -importcert -keystore elastic-nodes.p12 -trustcacerts -storepass liferay -file ca.crt`


## 최신 JDK로 만든 PKCS12 키 저장소를 JDK 8에서 열 수 없음

Elasticsearch 8은 번들로 제공되는 OpenJDK 19를 사용하여 [`elasticsearch-certutil`](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/certutil.html) 명령으로 인증서와 개인 키를 생성합니다. Liferay가 JDK 8에서 실행되는 경우 JDK 16 이상에서 생성된 인증서를 인식할 수 없습니다.

다음과 같은 오류가 발생할 수 있습니다.

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

이 문제를 해결하려면 JDK 11에서 Liferay를 실행할 수 있습니다. 자세한 내용은 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/4411310034829) 참조하십시오.

## 관련 항목

* [Elasticsearch에 연결](../connecting-to-elasticsearch.md)
* [Elasticsearch 설치 문제 해결](../troubleshooting-elasticsearch-installation.md)
* [Elasticsearch 문제 해결: 일반적인 문제](./troubleshooting-elasticsearch-common-issues.md)
