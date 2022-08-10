# Elasticsearchの保護

Elasticsearchを保護するために最初に行う必要があるのは、[X-Pack Securityを有効にする](#enable-x-pack-security)ことです。 その後、認証と暗号化通信の設定を開始できます。

```{note}
**Elasticsearch 6.x:** Elasticsearch 6を使用している場合、ElasticのX-Pack Securityを使用するにはLiferay Enterprise Search (LES)サブスクリプションとLiferay Enterprise Search セキュリティアプリケーションが必要です。 Liferay Connector to Elasticsearch 7（[Customer Downloads Portal](https://customer.liferay.com/downloads)で入手可能で、Liferay 7.3以降にバンドルされている）から、ElasticのX-Packセキュリティのサポートがデフォルトで含まれています。 Elastic社のX-Packモニタリングと連携するには、LESが必要です。
```

## X-Pack Securityの有効化

セキュリティを有効にするには、各Elasticsearchノードの`［Elasticsearch Home］/config/elasticsearch.yml`ファイルに次の設定を追加します。

```yaml
xpack.security.enabled: true
```

これで、X-Packユーザーを設定できます。

## X-Packユーザーの設定

X-Packを使用するシステムでは、次の[組み込みX-Packユーザー](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/built-in-users.html)が重要です。

* `kibana_system`
* `elastic`

Elasticsearchサーバーで、[`setup-passwords`コマンド](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/setup-passwords.html)を使用してパスワードを設定します。

```bash
./bin/elasticsearch-setup-passwords interactive
```

```{note}
以下の設定では、すべてのパスワードが「*liferay*」に設定されているものとします。 インストールの際には、独自のパスワードを使用してください。
```

```{note}
内蔵ユーザーのパスワードを更新するには、KibanaのUIまたは[Change Password API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/security-api-change-password.html)を使用します。
```

## Elasticsearch通信の暗号化

トランスポート層セキュリティ（TLS）を有効にするには、ノード証明書と鍵を生成し、ElasticsearchサーバーとLiferayサーバーに適用する必要があります。

### ノード証明書の生成

ノードごとに[証明書を生成する](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/configuring-tls.html#node-certificates)か、Liferayなどのすべてのノードとクライアントで使用する証明書を生成します。 または、認証局を使用してノード証明書を取得します。

1. X-Packの[`certutil`](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/certutil.html)コマンドを使用してX-Pack認証局を生成します。

    ```bash
    ./bin/elasticsearch-certutil ca --ca-dn CN=elastic-ca
    ```

   `elastic-stack-ca.p12`というファイルが生成されます。

   認証局の証明書と秘密鍵をPEM形式で生成するには、

   ```bash
   ./bin/elasticsearch-certutil ca --pem --ca-dn CN=elastic-ca
   ```

1. 認証局ファイルを`［Elasticsearch Home］/config/certs`フォルダに移動します。

1. 作成したCAを使用して、X.509証明書と秘密鍵を生成します。

   `PKCS#12`形式で証明書と鍵を生成するには、次のコマンドを実行します。

   ```bash
   ./bin/elasticsearch-certutil cert --ca config/certs/elastic-stack-ca.p12 --ca-pass liferay --dns localhost --ip 127.0.0.1 --name elastic-nodes
   ```

   `PEM`形式で証明書と鍵を生成するには、次のコマンドを実行します。

   ```bash
   ./bin/elasticsearch-certutil cert --pem --ca-cert config/certs/ca.crt --ca-key config/certs/ca.key --dns localhost --ip 127.0.0.1 --name elastic-nodes
   ```

   `PKSC#12`認証局から`PEM`形式のノード証明書と鍵を生成するには、次のコマンドを実行します。

   ```bash
   ./bin/elasticsearch-certutil cert --pem --ca config/certs/elastic-stack-ca.p12 --ca-pass liferay --dns localhost --ip 127.0.0.1 --name elastic-nodes
   ```

   ```{note}
   Liferay 7.3+では、[Elasticsearch 7コネクター設定](https://docs.oracle.com/en/java/javase/11/docs/specs/security/standard-names.html#keystore-types)で使用できるキーストアタイプは以下のもののみです。
   ```

   複数のホストで動作する証明書を生成するには（たとえば、すべてのElasticsearchおよびLiferayサーバーで同じ証明書を使用するには）、DNS名とIPアドレスを列挙する際にカンマ区切りのリストを使用します。

   ```bash
   ./bin/elasticsearch-certutil cert --ca config/certs/elastic-stack-ca.p12 --ca-pass liferay --dns localhost,example.com,es-node1,es-node2,es-node3 --ip 127.0.0.1,<IPv4-address-2>,<IPv4-address-3>,<IPv4-address-4>
   ```

   `elasticsearch-certutil cert` コマンドは、 `elastic-nodes.p12` という別のファイルを生成します（他の名前でかまいません）。

   ```{note}
   certutil`コマンドのデフォルトでは、証明書の生成に*PKCS#12*形式を使用しており、これはElastic Stack 7.xで動作します。 Kibana 6.xはPKCS#12証明書では動作しないため、Liferay 7.2とKibana 6.xを*Liferay Enterprise Search Monitoring*で使用している場合は、`--pem`オプション（証明書を*PEM*形式で生成）が重要になります。 それぞれのケースのPEMコマンドは2つのZIPファイルを生成します。ca.crt`と`ca.key`、`elastic-nodes.crt`と`elastic-nodes.key`の2つのZIPファイルが生成されます。 アーカイブの内容を解凍して、*[Elasticsearch Home]/config/certs*フォルダに入れてください。
   ```

1. `elastic-nodes.p12`を`［Elasticsearch Home］/config/certs`フォルダに移動します。

    **チェックポイント：**`［Elasticsearch Home］/config/certs`フォルダに次のファイルができました。

    ```bash
    elastic-nodes.p12
    elastic-stack-ca.p12
    ```

    または

    ```bash
    ca.crt
    ca.key
    elastic-nodes.crt
    elastic-nodes.key
    ```

1. ファイルを各Elasticsearchノードの同じフォルダと各Liferayサーバーノードの適切な場所にコピーします。

証明書と鍵が、Elasticsearch設定で使用できるようになりました。

### Elasticsearch用のTLSを設定する

`［Elasticsearch Home］/config/elasticsearch.yml`ファイルを介して各ノードで[TLSを有効](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/configuring-tls.html)にします。

1. ノード間通信のために`elasticsearch.yml`で次の設定を使用してトランスポート層TLSを有効にします。

    ```yaml
    xpack.security.transport.ssl.enabled: true
    ```

1. トランスポートレイヤーTLSの設定 証明書、鍵、認証局のパスを各ノードの`elasticsearch.yml`に追加します。

    ```yaml
    # PKCS#12
    xpack.security.transport.ssl.keystore.path: certs/elastic-nodes.p12
    xpack.security.transport.ssl.keystore.password: liferay
    xpack.security.transport.ssl.truststore.path: certs/elastic-nodes.p12
    xpack.security.transport.ssl.truststore.password: liferay
    # PEM
    #xpack.security.transport.ssl.certificate_authorities: [ "certs/ca.crt" ]
    #xpack.security.transport.ssl.certificate: certs/elastic-nodes.crt
    #xpack.security.transport.ssl.key: certs/elastic-nodes.key

    xpack.security.transport.ssl.verification_mode: certificate
    ```

    上記のパスの例は、`［Elasticsearch Home］/config/certs`に証明書を追加したことを前提としています。

1. HTTPレイヤーでTLSを有効にして、クライアント通信を暗号化します。

    ```yaml
    xpack.security.http.ssl.enabled: true
    ```

1. HTTPレイヤーのTLSを設定します。 各ノードの `elasticsearch.yml`に、証明書、鍵、認証局のパスを追加します。

    ```yaml
    # PKCS#12
    xpack.security.http.ssl.keystore.path: certs/elastic-nodes.p12
    xpack.security.http.ssl.keystore.password: liferay
    xpack.security.http.ssl.truststore.path: certs/elastic-nodes.p12
    xpack.security.http.ssl.truststore.password: liferay
    # PEM
    #xpack.security.http.ssl.certificate_authorities: [ "certs/ca.crt" ]
    #xpack.security.http.ssl.certificate: certs/elastic-nodes.crt
    #xpack.security.http.ssl.key: certs/elastic-nodes.key
    ```

### Elasticsearchのセキュリティ設定の例

Elasticsearch 7の完全な設定は次のとおりです（`elasticsearch.yml`。Elasticsearch 6.5.x以降にも同様に適用されます）。

```yaml
cluster.name: LiferayElasticsearchCluster

# X-Pack Security
xpack.security.enabled: true

## TLS/SSL settings for Transport layer (PKCS#12)
xpack.security.transport.ssl.enabled: true
xpack.security.transport.ssl.keystore.path: certs/elastic-nodes.p12
xpack.security.transport.ssl.keystore.password: liferay
xpack.security.transport.ssl.truststore.path: certs/elastic-nodes.p12
xpack.security.transport.ssl.truststore.password: liferay
xpack.security.transport.ssl.verification_mode: certificate

# TLS/SSL settings for HTTP layer (PKCS#12)
xpack.security.http.ssl.enabled: true
xpack.security.http.ssl.keystore.path: certs/elastic-nodes.p12
xpack.security.http.ssl.keystore.password: liferay
xpack.security.http.ssl.truststore.path: certs/elastic-nodes.p12
xpack.security.http.ssl.truststore.password: liferay

# Comment out when Kibana and Liferay's X-Pack Monitoring are also configured
#xpack.monitoring.collection.enabled: true
```

## LiferayでElasticsearchへの安全な接続を設定する

Liferayでは、セキュリティはコントロールパネルまたは設定ファイルを使用して構成できます。 *［コントロールパネル］* &rarr; *［設定］* &rarr; *［システム設定］*に移動します。 *［検索機能］*カテゴリを見つけて、Liferay 7.3+の*［Elasticsearch 7］*エントリまたはLiferay 7.2の*［X-Pack Security］*エントリをクリックします。 ここにプロパティ値を入力することもできますが、`［Liferay Home］/osgi/configs`にデプロイされている設定ファイルを使用するのが一般的です。

ファイルの正確なコンテンツは、X-Packの設定によって異なります。 `password`は、上記のX-Packユーザーパスワードのセットアップ中に設定したものと一致する必要があります。

ここで参照されている証明書と鍵のファイルは、Elasticsearchサーバーノードで使用されているものと同じです。 それらをLiferayサーバーにコピーし、それに応じて設定内のパスを更新します。

TLSの設定に加えて、`authenticationEnabled`/`requiresAuthentication`を`true`に設定し、LiferayがElasticsearchへの認証に使用するElasticsearchユーザーの認証情報を提供することにより、以下の設定で認証を有効にします。

セキュリティの設定が完了したら、Elasticsearchを再起動します。 これらの手順では、Elasticsearchクラスターを完全に再起動する必要があります。

### Liferay 7.3および7.4でElasticsearchへの安全な接続を設定する

```{tip}
[Elasticsearchのインストール](./installing-elasticsearch.md) と [Elasticsearchへの接続](./connecting-to-elasticsearch.md) では、セキュリティを有効にし設定する方法を紹介していますので、 7.3 適用対象のセキュリティ設定についてはそちらを参照してください。
```

Liferay 7.3+にバンドルされているLiferay Connector to Elasticsearch 7には、X-Pack Securityのサポートが含まれています。 Elasticsearch 7コネクタの設定で使用できるサポートされているキーストアタイプの一覧については、[Java 11セキュリティのドキュメンテーション](https://docs.oracle.com/en/java/javase/11/docs/specs/security/standard-names.html#keystore-types)を参照してください。

以下のようなファイルを作成します。

```bash
com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config
```

次のようにファイルにデータを入力します。

```properties
operationMode="REMOTE"
productionModeEnabled=B"true"
username="elastic"
password="liferay"
authenticationEnabled=B"true"
httpSSLEnabled=B"true"
networkHostAddresses=["https://localhost:9200"]
truststorePassword="liferay"
truststorePath="/PATH/TO/elastic-nodes.p12"
truststoreType="pkcs12"
```

### Liferay 7.2でElasticsearchへの安全な接続を設定する

Elasticsearch 7へのすべてのLiferayコネクタには、X-Pack Securityのサポートが含まれています。

```{note}
Liferay 7.2とElasticsearch 6.xを使用していて、Liferay Enterprise Searchのサブスクリプションを持っている場合、 [download](https://customer.liferay.com/downloads/-/download/liferay-enterprise-search-for-liferay-dxp-7-2) 「Liferay Enterprise Search Security」アプリケーションを使用します。 LPKGファイルを`[Liferay Home]/deploy`フォルダにコピーしてインストールします。
```

以下のようなファイルを作成します。

```bash
com.liferay.portal.search.elasticsearch7.configuration.XPackSecurityConfiguration.config
```

（またはElastic Stack 6.xと`Liferay Enterprise Search Security`アプリケーションを使用している場合は`com.liferay.portal.search.elasticsearch6.configuration.XPackSecurityConfiguration.config`）

次のようにファイルにデータを入力します（`PKCS#12`）：

```properties
certificateFormat="PKCS#12"
sslKeystorePath="/PATH/TO/elastic-nodes.p12"
sslKeystorePassword="liferay"
sslTruststorePath="/PATH/TO/elastic-nodes.p12"
sslTruststorePassword="liferay"
requiresAuthentication=B"true"
username="elastic"
password="liferay"
transportSSLVerificationMode="certificate"
transportSSLEnabled=B"true"
```

`PEM`形式の証明書を使用している場合は、次のような設定を使用します。

```properties
certificateFormat="PEM"
sslKeyPath="/PATH/TO/elastic-nodes.key"
sslCertificatePath="/PATH/TO/elastic-nodes.crt"
requiresAuthentication=B"true"
username="elastic"
password="liferay"
sslCertificateAuthoritiesPaths="/PATH/TO/ca.crt"
transportSSLVerificationMode="certificate"
transportSSLEnabled="true"
```

### Liferay 7.3および7.4でのElasticsearch 7コネクタセキュリティの設定

7.3+におけるElasticsearch 7コネクタのセキュリティ設定の完全な一覧は次のとおりです（括弧内はデフォルト値）。

`authenticationEnabled`（_true_）：ユーザー名とパスワードを使用したElasticsearchへの認証を有効または無効にします。

`username`（_elastic_）：［認証が有効］がオンになっている場合、認証用のユーザー名をElasticsearchに設定します。

`password`：［認証が有効］がオンになっている場合、認証用のパスワードをElasticsearchに設定します。

`httpSSLEnabled`（_false_）：TLS/SSLを有効または無効にします。

`truststoreType`（_pkcs12_）：［HTTP SSLが有効］がオンになっている場合、トラストストアの種類を設定します。

`truststorePath`（_/path/ro/localhost.p12_）：［HTTP SSLが有効］がオンになっている場合、トラストストアファイルへのパスを設定します。

`truststorePassword`：［HTTP SSLが有効］がオンになっている場合、パスワードをトラストストアに設定します。

### Liferay 7.2のエンタープライズ・サーチセキュリティ/X-Pack Securityの設定

Liferay 7.2のX-Pack Security構成の設定の完全な一覧は次のとおりです。

`sslKeyPath`（_/path/to/instance.key_）：秘密鍵を含むPEMエンコードファイルへのパスを設定します。

`sslCertificatePath`（_/path/to/instance.crt_）：クライアントが接続するときにクライアントに提示される証明書（または証明書チェーン）を含むPEMエンコードファイルへのパスを設定します。 デフォルトは`/path/to/instance.crt`です。

`sslcertificateAuthoritiesPaths` (_["/path/to/ca.crt"]_) です。信頼できるPEMエンコードされた証明書ファイルのパスのリストを提供します。

`certificateFormat` (_PKCS#12_) を指定します。証明書のフォーマットを指定します (`PEM` または `PKCS#12`)。

`requireAuthentication`（_false_）：有効にすると、Elasticsearch/X-Packとの接続は設定されたユーザー名とパスワードで認証されます。

`username`（_elastic_）：［認証を要求］が有効になっている場合は、認証用のユーザー名をElasticsearchに設定する必要があります。

`password`：［認証を要求］が有効になっている場合、パスワードが必要です。

`transportSSLVerificationMode`（_certificate_）：LDAPを使用して中間者攻撃や証明書の偽造から保護する場合は、検証タイプ（`none`、`certificate`、または `full`）を指定します。

`transportSSLEnabled`（_false_）：TLS/SSLを設定または無効にします。

`sslKeystorePath`（_/path/to/elastic-certificates.p12_）：秘密鍵と証明書を保持しているキーストアへのパスを設定します。

`sslKeystorePassword`: PKCS#12ファイルのパスワードを設定します。

`sslTruststorePath`（_/path/to/elastic-certificates.p12_）：トラストストアファイルへのパスを設定します。

`sslTruststorePassword`：パスワードをトラストストアに設定します。

## TLS プロトコルと暗号スイートの設定

LiferayのJVMにTLSプロパティを設定し、ElasticsearchとLiferayの接続を暗号化する際に使用するTLSプロトコルバージョンと暗号スイートに対して制御をかけることができます。 これらのプロパティは、Tomcatサーバーの `setenv.sh`で設定することができます。

```properties
CATALINA_OPTS="$CATALINA_OPTS -Djdk.tls.client.protocols=TLSv1.2
CATALINA_OPTS="$CATALINA_OPTS -Djdk.tls.client.cipherSuites=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256"
```

なお、これらの値は一例である。

これらの設定は、対応するXPackの設定と連動して動作します。

Liferay 7.3 または 7.4 で REST Client 接続を設定している場合、 [HTTP レイヤー設定](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/security-settings.html#http-tls-ssl-settings) のように `elasticsearch.yml`を使用します。

```yaml
xpack.security.http.ssl.supported_protocols: [ "TLSv1.2" ]
xpack.security.http.ssl.cipher_suites : TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256
```

Liferay 7.1 と 7.2 でトランスポートクライアントを設定している場合、 [トランスポート設定](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/security-settings.html#transport-tls-ssl-settings) のように `elaticsearch.yml`を使用します。

```yaml
xpack.security.transport.ssl.supported_protocols: [ "TLSv1.2" ]
xpack.security.transport.ssl.cipher_suites : TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256
```

## 関連トピック

* [Elasticsearchのモニタリング](../../liferay-enterprise-search/monitoring-elasticsearch.md)
* [クラスター横断レプリケーション](./../../liferay-enterprise-search/cross-cluster-replication.md)
* [検索の調整](../../search-administration-and-tuning.md)
* [Liferayのインストールとアップグレード](../../installing-and-upgrading-a-search-engine.md)
