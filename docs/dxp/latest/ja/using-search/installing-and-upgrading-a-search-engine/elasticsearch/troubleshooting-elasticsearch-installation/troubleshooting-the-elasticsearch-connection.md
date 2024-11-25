# Elasticsearch接続のトラブルシューティング

LiferayとElasticsearchの接続を設定する際に遭遇する可能性のある接続上の問題と、それらの問題に対する最も一般的な解決策を以下に列挙します。 その他の可能性については、[Elasticsearchのトラブルシューティング：よくある問題](./troubleshooting-elasticsearch-common-issues.md)を参照してください。

## LiferayとElasticsearchのホスト設定の不一致

Liferay 7.3 と 7.4 (RESTクライアント接続を使用) では、このログメッセージが表示されます。

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

Liferay 7.0-7.2 (Java Transport client を使用) では、このログメッセージが表示されます。

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

LiferayのElasticsearchコネクターはElasticsearchホスト`es-node1-prod`に接続しようとしていますが、利用可能なノードが見つかりません。 Elasticsearchのログで、以下のような行を探します。

```
[2021-06-04T17:31:22,472][INFO ][o.e.t.TransportService   ] [es-node1] publish_address {es-node1/192.168.0.17:9300}, bound_addresses {192.168.0.17:9300}
(...)
[2021-06-04T17:31:23,080][INFO ][o.e.h.AbstractHttpServerTransport] [es-node1] publish_address {es-node1/192.168.0.17:9200}, bound_addresses {192.168.0.17:9200}
```

指定されたノードの実際のアドレスが出力されます。 この例では、トランスポートアドレスは`es-node1/192.168.0.17:9300` 、HTTPアドレスは `es-node1/192.168.0.17:9200`です。

Liferay 7.3と7.4での正しいコネクター構成は次のとおりです。

```properties
networkHostAddresses=["http:es-node1:9200"]
# The value ["es-node1:9200"] also works
```

Liferay 7.0-7.2での正しいコネクター構成は以下の通りです。

```properties
transportAddresses=["es-node1:9300"]
```

## TLS/SSLは有効だが、Liferayは暗号化されていないチャンネルで通信しようとしている。

Liferay 7.3と7.4では、このログメッセージが表示されます。

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

Liferay 7.0-7.2では、このエラーはより一般的な `org.elasticsearch.client.transport.NoNodeAvailableException`として表示されます。

Elasticsearchのログには、関連するエラーが表示されます。

Liferay 7.3 と 7.4 では、 [Elasticsearch](https://help.liferay.com/hc/ja/articles/360016511651#Liferay-DXP-7.4) のログに次のように表示されます。

```
[2021-06-04T18:09:11,925][WARN ][o.e.x.s.t.n.SecurityNetty4HttpServerTransport] [es-node1] received plaintext http traffic on an https channel, closing connection Netty4HttpChannel{localAddress=0.0.0.0/0.0.0.0:9200, remoteAddress=/192.168.0.17:41104}
```

Liferay 7.0-7.2では、 [Elasticsearch 6/7](https://help.liferay.com/hc/ja/articles/360016511651#Liferay-DXP-7.2-Elasticsearch) のログが以下を出力します。

```
[2021-06-04T18:11:13,045][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] received plaintext traffic on an encrypted channel, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:34346}
```

Elasticsearchの警告は、暗号化されたチャンネルでサーバーが平文のトラフィックを受信したことを示しています。

`elasticsearch.yml`ファイルに`xpack.security.*`プロパティがトランスポート層および/またはhttp層に設定されている場合（ `xpack.security.enabled: true`も参照）、ElasticsearchはX-Pack Securityを有効にしています。 したがって、Liferayのコネクターもそれに応じて設定する必要があります。

正しいコネクターの構成については、 [Elasticsearchの保護](../securing-elasticsearch.md)を参照してください。

## Elasticsearchのホスト名と証明書のDNS名の不一致

Liferay 7.3と7.4では、このログメッセージが表示されます。

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

Liferay 7.0-7.2では、このエラーは`org.elasticsearch.client.transport.NoNodeAvailableException: NoNodeAvailableException`と`java.security.cert.CertificateException: No subject alternative DNS name matching found`として表示されます。

```
[2021-06-08T17:09:24,557][WARN ][o.e.c.s.DiagnosticTrustManager] [
ode_name]failed to establish trust with server at [es-node1]; the server provided a certificate with subject name [CN=elastic-nodes] and fingerprint [065071bd5b26e83b2903b09179acf4a48851d775]; the certificate has subject alternative names [DNS:localhost,DNS:dxp.example.com,DNS:es-node-1,IP:127.0.0.1,DNS:es-node2,DNS:es-node3,DNS:kibana.example.com]; the certificate is issued by [CN=elastic-ca]; the certificate is signed by (subject [CN=elastic-ca] fingerprint [39b9312498b37827bdf8f64faef397449c0c0686] {trusted issuer}) which is self-issued; the [CN=elastic-ca] certificate is trusted in this ssl context ([xpack.security.transport.ssl])
java.security.cert.CertificateException: No subject alternative DNS name matching es-node1 found.
```

```{note}
Liferay 7.0-7.2では、`XPackSecurityConfiguration.config`ファイルで `transportSSLVerificationMode="full"` が設定されているときのみ、この現象が発生します。 クライアント（つまりLiferayのコネクター）は、Elasticsearchノードの証明書が信頼できるCAによって署名されていることを確認するだけでなく、ホスト名/IPアドレスの検証も行っています。
```

Liferay 7.0-7.2で表示される関連したElasticsearch 6/7のエラーがあります。

```
[2021-06-08T17:06:03,540][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:40486}
```

これらのエラーは、Elasticsearchノードのホストが、SSLハンドシェイク中にクライアント（つまりLiferayのコネクター）に提示する証明書に見つからないことを知らせるものです。 ホスト名は証明書にサブジェクト代替名として表示されなければなりません。この場合、宣言されたホスト名 `es-node1` は証明書の名前と一致しません（おそらく証明書では `es-node-1`である可能性があります）。

サーバーの証明書を開きます。 `Subject Alternative Names`カテゴリのDNS名/IPアドレスにサーバーホスト名がない場合、証明書を更新してください。

## X-Packのセキュリティ認証情報が正しくないことによる認証の失敗

Liferay 7.3と7.4で、コネクターの構成で設定されたパスワードがElasticsearchのパスワードと一致しない場合、例外がログに表示されます。

```
Caused by: java.lang.RuntimeException: org.elasticsearch.ElasticsearchStatusException: ElasticsearchStatusException[method [HEAD], host [https://es-node-1:9200], URI [/liferay-20102-workflow-metrics-processes?ignore_throttled=false&include_type_name=true&ignore_unavailable=false&expand_wildcards=open&allow_no_indices=true], status line [HTTP/1.1 401 Unauthorized]]; nested: ResponseException[method [HEAD], host [https://es-node-1:9200], URI [/liferay-20102-workflow-metrics-processes?ignore_throttled=false&include_type_name=true&ignore_unavailable=false&expand_wildcards=open&allow_no_indices=true], status line [HTTP/1.1 401 Unauthorized]];
    at org.elasticsearch.client.RestHighLevelClient.parseResponseException(RestHighLevelClient.java:1866) ~[?:?]
    at org.elasticsearch.client.RestHighLevelClient.internalPerformRequest(RestHighLevelClient.java:1626) ~[?:?]
    at org.elasticsearch.client.RestHighLevelClient.performRequest(RestHighLevelClient.java:1583) ~[?:?]
```

ユーザー名が正しくない場合、別のエラーが表示されることがあります。

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

Liferay 7.0-7.2では、エラーは`org.elasticsearch.client.transport.NoNodeAvailableException`として表示されます。

Elasticsearchに表示される対応するエラーがあります。

```
[2021-06-04T18:30:29,114][INFO ][o.e.x.s.a.AuthenticationService] [es-node1] Authentication of [elastic] was terminated by realm [reserved] - failed to authenticate user [elastic]
```

Liferayでコネクターの構成を開き、ユーザ名とパスワードがElasticsearchのX-Packユーザーの認証情報と一致することを確認します。

## Liferayでセキュリティが有効になっているが、Elasticsearchで無効になっている

Liferay 7.3と7.4では、以下のログメッセージが表示されることがあります。

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

Liferay 7.0-7.2では、エラーは`org.elasticsearch.client.transport.NoNodeAvailableException`と表示されます。

対応するElasticsearchのエラーがあります。

```
[2021-06-07T17:48:31,554][WARN ][o.e.t.TcpTransport       ] [es-node1] SSL/TLS request received but SSL/TLS is not enabled on this node, got (16,3,3,1), [Netty4TcpChannel{localAddress=/192.168.0.17:9300, remoteAddress=/192.168.0.17:40646}], closing connection
```

`elasticsearch.yml`を開き、`xpack.security.enabled`が`false`に設定されていないことを確認します。 [「Elasticsearchの保護」](../securing-elasticsearch.md)の記事に従って、HTTP層とトランスポート層が暗号化通信を使用するように設定されていることを確認してください。

## LiferayとElasticsearchが異なる認証局で署名された証明書を使用している

`*.ssl.verification_mode`の設定が`certificate`もしくは`elasticsearch.yml`で`full`の場合、Liferay 7.3と7.4で以下のエラーが表示されることがあります。

```
Caused by: javax.net.ssl.SSLHandshakeException: PKIX path validation failed: java.security.cert.CertPathValidatorException: Path does not chain with any of the trust anchors
    at sun.security.ssl.Alert.createSSLException(Alert.java:131) ~[?:?]
```

Liferay 7.0-7.2では、`transportSSLVerificationMode="certificate"`が`XPackSecurityConfiguration.config`ファイルで設定されている場合、次のエラーが表示されることがあります。

```
[2021-06-07T18:18:44,579][WARN ][o.e.c.s.DiagnosticTrustManager] [
ode_name]failed to establish trust with server at [<unknown host>]; the server provided a certificate with subject name [CN=elastic-nodes] and fingerprint [065071bd5b26e83b2903b09179acf4a48851d775]; the certificate has subject alternative names [DNS:localhost,DNS:dxp.example.com,DNS:es-node-1,IP:127.0.0.1,DNS:es-node2,DNS:es-node3,DNS:kibana.example.com]; the certificate is issued by [CN=elastic-ca]; the certificate is signed by (subject [CN=elastic-ca] fingerprint [39b9312498b37827bdf8f64faef397449c0c0686]) which is self-issued; the [CN=elastic-ca] certificate is not trusted in this ssl context ([xpack.security.transport.ssl]); this ssl context does trust a certificate with subject [CN=elastic-ca] but the trusted certificate has fingerprint [9d82c3b32af8607add6682b5b7f20f4357735bce]
sun.security.validator.ValidatorException: PKIX path validation failed: java.security.cert.CertPathValidatorException: Path does not chain with any of the trust anchors
```

Liferay 7.0-7.2でTCP経由でサーバーに接続すると、対応するElasticsearchのエラーが表示されます。

```
[2021-06-07T18:19:49,623][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/192.168.0.17:41820}
```

スタック内のすべてのノード（Liferay、Elasticsearch、Kibanaなど）が同じ認証局（CA）で署名された証明書を使用しており、そのCAの証明書（公開鍵）がクライアントの環境に存在することを確認してください。 例えば、 `sslTruststorePath`や`sslCertificateAuthoritiesPath`の設定が [「Elasticsearchの保護」の記事](../securing-elasticsearch.md#configure-a-secure-connection-to-elasticsearch-in-liferay-7.2) に従って設定されていることを確認してください。

```{tip}
証明書ファイルを開き、「Issuer Name」または「Issued by」エントリーを見つけます。 これらのエントリーには、発行者 CA に関する情報が保持されます。
```

## Elasticsearch MonitoringおよびX-Pack Monitoringウィジェットが一時的に使用できない

[Monitoring Elasticsearch](../../../liferay-enterprise-search.md#monitoring-elasticsearch) は、KibanaがHTTPSを使用するように設定する方法を示しています。 セットアップ時の証明書の問題により、Liferay 7.3および7.4でこれらのログメッセージが表示されることがあります。

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

Liferay 7.0-7.2 では、異なるメッセージが表示されることがあります。

```
2021-06-08 13:24:57.104 ERROR [http-nio-7211-exec-8][XPackMonitoringProxyServlet:106] javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
    at java.base/sun.security.ssl.Alert.createSSLException(Alert.java:131)
```

対応するKibanaのエラーが表示されることがあります。

```
 error  [13:24:57.089] [error][client][connection] Error: 139942872246080:error:14094416:SSL routines:ssl3_read_bytes:sslv3 alert certificate unknown:../deps/openssl/openssl/ssl/record/rec_layer_s3.c:1544:SSL alert number 46
```

これらのエラーは、Kibanaサーバーが自己署名証明書を持ち、クライアントのトラストストアファイルにCAが存在しないことを示しています（Liferay DXP は、LESモニタリングアプリを介したクライアントです）。 JDKの`cacerts`ファイルは、デフォルトのトラストストアです。

LiferayのモニタリングポートレットをKibanaのUIのプロキシとして使用していて、自己署名証明書を使用しているため、Kibanaの証明書を信頼するようにアプリケーションサーバーの起動JVMパラメーターを構成する必要があります。 2つのアプローチがあり、ここではTomcatで実証しています。

1. Elasticsearchコネクターのセキュリティ設定に使用したのと同じファイルを使用して、トラストストアのパス、パスワード、タイプをアプリケーションサーバのスタートアップJVMパラメーターに追加します。 `setenv.sh/bat`ファイルを通して、Tomcat サーバーの`CATALINA_OPTS`にトラストストアとパスのパラメーターを追加します。

   ```
   CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=/path/to/elastic-nodes.p12 -Djavax.net.ssl.trustStorePassword=liferay -Djavax.net.ssl.trustStoreType=pkcs12"
   ```

1. より良い方法は、デフォルトの `cacerts` ファイルのコピーを作成し、秘密鍵なしで証明書をインポートし、カスタムのトラストストアファイルを使用するようにアプリケーションサーバーを構成することです。

   * Liferay JVMからデフォルトの`cacerts`ファイル（JDK 8では`JAVA_HOME/jre/lib/security` に、JDK 11では `JAVA_HOME/lib/security` にある）をコピーして、 `cacerts-custom.jks`に名前を変更します。
   * `openssl`を使って秘密鍵なしでCAの証明書を抽出します（`elastic-stack-ca.p12`のような単一の`.p12`ファイルしかない場合 ）。
   * Javaの `keytool`を使って、証明書をカスタムJKSファイルにインポートします。
   * カスタムのトラストストアを使用するようにTomcatを設定します。

      ```
      CATALINA_OPTS="${CATALINA_OPTS} -Djavax.net.ssl.trustStore=/PATH/TO/cacerts-custom.jks -Djavax.net.ssl.trustStorePassword=changeit"
      ```

## JDK 11とElasticsearch 7.11+使用時のSSL例外

Liferay DXPがJDK バージョン11を使用し、Kibanaバージョン 7.11+ と通信するように設定されている場合、Liferay のログに以下のエラーが表示されることがあります。

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

[Elasticsearchのモニタリング](../../../liferay-enterprise-search/monitoring-elasticsearch.md#troubleshooting-the-monitoring-setup) を参照してください。

## IOExceptionデータがオブジェクトIDでない

`.p12`ファイルが、Liferay JDKよりも高いメジャーバージョンのJDKで生成された場合 ( `keytool`を使用)、Liferayのログに次のエラーが表示されることがあります。

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

例えば、JDK11を使用して証明書を生成し、JDK8でLiferayを実行すると、この例外が発生することがあります。

続行するには、次のいずれかを行ってください。

1. 一致するJDKのバージョンを使用して証明書を再作成します。

1. キーストアに`PKCS12`の代わりに`JKS`の形式を使用します。

1. `keytool`で`-Dkeystore.pkcs12.legacy`オプションを使用して、 `keystore.pkcs12.legacy`システムプロパティを設定し、OpenJDK 11/16のkeytoolに古いアルゴリズムを使用させます。

## ノード証明書の署名に使用されたCA証明書は信頼されていない

Elasticsearchノード間、またはLiferayとElasticsearch間のSSLハンドシェイクでは、ノード証明書に署名するために使用されるCA証明書が信頼されている必要があります。 すべてのノードの`truststore`または `keystore`に証明書が存在することを確認します。 これは、通常、自己署名証明書を使用する場合に問題となります。

複数ノードのElasticsearchクラスタにおいて、クライアントのElasticsearchノードからリクエストを受けたElasticsearchサーバノードが、以下のような警告メッセージを投げることがあります。

```
[2022-07-15T11:49:39,361][WARN ][o.e.x.c.s.t.n.SecurityNetty4Transport] [es-node1] client did not trust this server's certificate, closing connection Netty4TcpChannel{localAddress=0.0.0.0/0.0.0.0:9300, remoteAddress=/127.0.0.1:44198, profile=default}
```

クライアントのElasticsearchノードでは、エラーが`SunCertPathBuilderException`で表示されます。

```
[2022-07-15T11:49:39,354][WARN ][o.e.t.OutboundHandler    ] [es-node2] send message failed [channel: Netty4TcpChannel{localAddress=/127.0.0.1:44198, remoteAddress=es-node1/127.0.0.1:9300, profile=default}]
javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
    at sun.security.ssl.Alert.createSSLException(Alert.java:131) ~[?:?]
    at sun.security.ssl.TransportContext.fatal(TransportContext.java:368) ~[?:?]
```

さらに詳しい検査で、根本的な原因を確認することができます。 各ノードの`elasticsearch.yml`で`xpack.security.transport.ssl.verification_mode: none`を一時的に設定します。 エラーが解消され、接続に成功した場合は、クライアントノードのキーストアまたはトラストストアに証明書は存在しません。

```{warning}
本番環境では、SSL検証モードを「none」に設定したままにしないでください。

SSL検証モードの設定については、 [Elasticsearchドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/security-settings.html#transport-tls-ssl-settings) をお読みください。
```

LiferayとElasticsearchのノード間でも同様の問題が発生することがあります。 Liferayは、Elasticsearchノードの証明書が信頼できないCAによって署名されている場合（例えば、自己署名証明書を使用している場合）、このようなエラーを投げます。

```
2022-07-15 10:15:54.287 ERROR [main][ElasticsearchSearchEngine:47] bundle com.liferay.portal.search.elasticsearch7.impl:6.0.48 (335)[com.liferay.portal.search.elasticsearch7.internal.ElasticsearchSearchEngine(925)] : The activate method has thrown an exception
java.lang.RuntimeException: org.elasticsearch.ElasticsearchException: ElasticsearchException[java.util.concurrent.ExecutionException: javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target];
```

Elasticsearchのノード証明書に署名したCAの証明書が、Liferayに設定されたトラストストアに存在し、信頼されていることを確認します。

* [セキュリティ設定](../securing-elasticsearch.md) が Elasticsearch コネクタの設定 (`com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config`) にある場合は、 `truststorePath` プロパティを使用して Elasticsearch 接続のトラストストアを設定します。
* セキュリティ設定がLES Securityアプリの設定（`com.liferay.portal.search.elasticsearch7.configuration.XPackSecurityConfiguration.config`）にある場合、 `sslTruststorePath`プロパティを使用してトラストストアを設定します。

また、ノード証明書にCA証明書（公開鍵）が存在しない場合にも、これらのエラーが表示されることがあります。 この場合、CA証明書とノード証明書の形式（PKCS#12またはPEM）に応じて、Javaの `keytool` または `openssl`などのツールを使用して追加します。

例えば、CAの証明書（公開鍵）と秘密鍵が `ca.p12` で、ノードの証明書が `elastic-nodes.p12`の場合、以下の手順に従います。

1. CAの公開鍵を秘密鍵なしでエクスポートします。

    `openssl pkcs12 -in ca.p12 -out ca.crt -nokeys`

1. プロンプトが表示されたら、 `ca.p12` のパスワードを入力します。 これにより、 `ca.crt`というファイルが生成されます。

1. CA証明書を`elastic-nodes.p12`にインポートします。

    `keytool -importcert -keystore elastic-nodes.p12 -trustcacerts -storepass liferay -file ca.crt`


## 新しいJDKで作成されたPKCS12 KeystoreをJDK 8で開くことができない。

Elasticsearch 8 はバンドルされている OpenJDK 19 を使用して、 [`elasticsearch-certutil`](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/certutil.html) コマンドで証明書と秘密鍵を生成します。 Liferay が JDK 8 で動作している場合、JDK 16 以上で生成された証明書を認識できません。

このようなエラーが起こる可能性がある：

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

この問題を解決するには、JDK 11でLiferayを実行します。 詳細は [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829) を参照。

## 関連トピック

* [Elasticsearchへの接続](../connecting-to-elasticsearch.md)
* [Elasticsearchインストールのトラブルシューティング](../troubleshooting-elasticsearch-installation.md)
* [Elasticsearchのトラブルシューティング：よくある問題](./troubleshooting-elasticsearch-common-issues.md)
