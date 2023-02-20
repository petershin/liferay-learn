# Solrのインストール

{bdg-secondary}`7.2-7.3 (CE、DXP); 7.4 DXP U60+`

Solrは、Apache Luceneをベースに開発されたエンタープライズサーチプラットフォームとして人気があります。 信頼性、スケーラビリティ、フォールトトレラントに優れています。 詳しくは [こちら](http://lucene.apache.org/solr/)です。

この手順では、 [互換性のある Liferay バージョン用の Solr 8 のインストールについて説明します](https://help.liferay.com/hc/en-us/articles/360016511651-Search-Engine-Compatibility-Matrix). Solr 7をインストールする場合は、必要に応じてバージョン名を調整してください。

```{important}
Solrを使用する場合、重要な制限があります。 インストールする前に、[Solr Limitations](./solr-limitations.md)をお読みください。
```

## 互換性

パッチレベルごとの互換性のあるSolrとLiferayのバージョンに関する詳細な情報については、 [検索エンジン互換性マトリクス](https://help.liferay.com/hc/en-us/articles/360016511651) を参照してください。

## Elasticsearchのみの機能を無効にする

Liferay Connector to Solrをインストールする前に、ブラックリストまたはその他の方法で

- DXPの機能のうち、Elasticsearchでのみ動作するモジュール
- Liferay Connector to Elasticsearchモジュールの組み合わせ

### Elasticsearchのみの機能のブラックリスト化

Elasticsearchのみの機能をブラックリスト化する場合。

1. Liferay DXP 7.4 では、ポータルのプロパティまたは Docker 環境変数を使用して、いくつかの Elasticsearch 依存モジュールを無効にします。

   このプロパティを `portal-ext.properties に追加する`:

   ```properties
   enterprise.product.enterprise.search.enabled=false
   ```

   このDocker環境変数を設定します。

   ```properties
   LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_ENTEPRISE_PERIOD_SEARCH_PERIOD_ENABLED=false
   ```

   これにより、Liferay Enterprise Searchの機能はすべて無効になります。 詳しくは、 [Liferay Enterprise Searchの有効化](../../liferay-enterprise-search/activating-liferay-enterprise-search.md) をご覧ください。

1. ブラックリストの作成 [設定ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md). 名前はLiferayのバージョンに依存します。

   Liferay 7.4 の場合、以下を作成します。

   ```bash
   com.liferay.portal.bundle.blacklist.internal.configuration.BundleBlacklistConfiguration.config
   ```

   Liferay 7.2 と 7.3 の場合、以下を作成します。

   ```bash
   com.liferay.portal.bundle.blacklist.internal.BundleBlacklistConfiguration.config
   ```

1. Liferayのバージョンに応じた設定を入力します。

   **Liferay DXP 7.4:**

   ```properties
   blacklistBundleSymbolicNames=[\
      "com.liferay.portal.search.elasticsearch7.api",\
      "com.liferay.portal.search.elasticsearch7.impl",\
      "com.liferay.portal.search.elasticsearch7.spi",\
   ]
   ```

   この設定は、 [Elasticsearch 7 search engine connector の](../elasticsearch/installing-elasticsearch.md) モジュールを無効化します。 `enterprise.product.enterprise.search.enabled=false` プロパティは、 [Liferay Enterprise Search](../../liferay-enterprise-search.md) モジュールを無効にします。 Solrをインストールすると、自動的に他の [非互換の機能が無効になります](./solr-limitations.md).

   **Liferay 7.2および7.3。**

   ```properties
   blacklistBundleSymbolicNames=[\
      "com.liferay.portal.search.elasticsearch7.api",\
      "com.liferay.portal.search.elasticsearch7.impl",\
      "com.liferay.portal.search.elasticsearch7.spi",\
      "com.liferay.portal.search.tuning.rankings.web",\
      "com.liferay.portal.search.tuning.synonyms.web",\
      "com.liferay.portal.search.tuning.web",\
      "com.liferay.portal.search.tuning.web.api"\
   ]
   ```

1. Liferay の `osgi/configs` フォルダにファイルを配置します。

### Elasticsearchのみの機能を持つモジュールの停止

App Manager と Gogo シェルは、バンドルの状態を記憶するために `osgi/state` フォルダに依存しています。 このフォルダを削除すると（ [Liferay DXPのパッチ適用](../../../installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.md)時に推奨）、Elasticsearchコネクターが再インストールされ、自動的に起動されます。 そのため、 [ブラックリストアプローチ](#blacklisting-elasticsearch-only-features) の方が信頼性が高い。

App Managerでモジュールを無効化する場合。

1. コントロールパネル &rarr; App Manager を開きます。

1. 上記のブラックリストの設定に記載されているモジュールを検索します。 モジュールを見つけて、そのアクション (![Actions](../../../images/icon-actions.png)) メニューを開きます。 *無効にする*を選択します。  これにより、バンドルはインストールされたままになりますが、OSGiランタイムでは停止されます。

[Felix Gogo shell](../../../liferay-internals/fundamentals/using-the-gogo-shell.md) で Elasticsearch 依存モジュールを停止するには、まず無効化するモジュールのリストをコンパイルします。各モジュールのバンドルシンボル名については、上記の[ブラックリストの説明](#blacklisting-elasticsearch-only-features)を参照してください。Gogo シェルに移動したら

1. `lb -s [bundle.symbolic.name]`と入力してください。

1. `stop [bundle ID] を入力`.

1. 各モジュールで繰り返します。



## Solrコネクタのダウンロード

Solrへのコネクタをまだ取得していない場合。

1. Liferayが起動している状態で、コントロールパネル &rarr; Marketplace &rarr; Storeにアクセスします。 サインインしてください。

1. アプリへのアクセス権を付与する。

1. Solr 8を検索し、Liferayのインストールに対応するアプリを選択します。


   | Liferayフレーバー        | Solrコネクタ名                      |
   |:------------------- |:------------------------------ |
   | Liferayポータル/コミュニティ版 | Liferay CE Connector to Solr 8 |
   | Liferay DXP         | Liferay Connector to Solr 8    |

   
   1. アプリのランディングページにある「 *Free* 」ボタンをクリックします。

1. プロジェクトが存在する場合はそれを選択し、存在しない場合は追加します。

1. 条件に同意して、 *購入*をクリックします。

購入後、「過去のバージョン」のページからLPKGファイルをダウンロードしてください。

1. 以下のURLの <https://liferay.com> `user.name` を代入してください。
   
   CE: <https://web.liferay.com/web/[user.name]/apps/-/marketplace_apps/225525277/versions> DXP: <https://web.liferay.com/web/[user.name]/apps/-/marketplace_apps/182518167/versions>

1. *App* をクリックし、アプリの LPKG ファイルをダウンロードします。

お使いのLiferayのバージョンとパッチレベルで互換性のあるアプリケーションのバージョンについては、 [検索エンジン互換性マトリクス](https://help.liferay.com/hc/en-us/articles/360016511651) を参照してください。



```{warning}
構成が整う](#installing and-configuring-the-solr-connector) と [Solr が動作する](#installing and-configuring-solr) まで、Liferay に Solr コネクタをインストールしないでください。
```




## Solrのインストールと設定



```{important}
作業を進める前に、Liferay を停止してください。
```


Solr for Liferayをインストールし、設定する。

1. [互換性のある](https://help.liferay.com/hc/en-us/articles/360016511651) Solrサーバーをダウンロードし、解凍します。

1. `solr-[version]/server/solr`に移動します。

1. `liferay` という新しいフォルダと、 `liferay/conf` と `liferay/data`という2つのサブフォルダを作成します。

1. `configsets/_default/conf` の内容を `liferay/conf` フォルダにコピーします。

1. Liferay Connector to Solr 8のLPKGファイルをアーカイブマネージャーで開きます。

1. `Liferay Connector to Solr 8 - Impl.lpkg`を開いてください。

1. `com.liferay.portal.search.solr8.impl.jar` ファイルを開き、解凍します。 
   
   

   ```
   META-INF/resources/solrconfig.xml
   ```


および 



   ```
   META-INF/resources/schema.xml
   ```


宛先 



   ```
   liferay/conf
   ```


これは、現在の `solrconfig.xml` と `schema.xml` ファイルを、Liferayから来るデータをどのようにインデックスするかをSolrに伝えるもので置き換えます。

1. `liferay` フォルダに `core.properties` ファイルを作成し、この設定を追加します。 
   
   

   ```properties
   config=solrconfig.xml
   dataDir=data
   name=liferay
   schema=schema.xml
   ```


1. チェックポイント： `liferay` フォルダがこのような構造になっていることを確認します。 
   
   

   ```bash
   liferay
   ├── conf
   │   ├── lang
   │   │   ├── contractions_ca.txt
   │   │   ├── ....txt
   │   ├── managed-schema
   │   ├── protwords.txt
   │   ├── schema.xml
   │   ├── solrconfig.xml
   │   ├── stopwords.txt
   │   └── synonyms.txt
   ├── core.properties
   └── data
   ```


1. Solrをインストールしたトップレベルのフォルダー（`solr-[version]`）から次のように入力して、Solrサーバーを起動します。 
   
   

   ```bash
   ./bin/solr start -f
   ```


1. Solrサーバーは、デフォルトではポート `8983` で待機します。 <http://localhost:8983/solr/#/~cores> へ行きます。(ローカルでテストしていると仮定して`localhost` をホストとします） `liferay` コアが利用可能なことを確認します。

これでSolrがインストールされ、起動しました。 次に、Liferay用のSolrコネクタを構成し、インストールします。



## Solrコネクタのインストールと設定

コネクタをインストールすると、Liferay Connector to Solr のデフォルト値が Solr 自身のデフォルト値と一致するため、テストインストールではデフォルトの構成が機能します。 利用可能な設定の完全なリストは、 [設定のリファレンス](#solr-connector-configuration-reference) を参照してください。 本番環境では、最低限、コネクタの読み取り用URLと書き込み用URLを設定する必要があります。

Liferay の `osgi/configs` フォルダに配置された設定ファイルを使用して、Solr コネクタのデフォルト設定を編集するのが最も一般的な方法です。

1. ファイルに名前を付けます。 
   
   

   ```
   com.liferay.portal.search.solr8.configuration.SolrConfiguration.config
   ```


初期設定ファイルがデプロイされ、LiferayのSolrへの接続が有効になった後、コントロールパネル &rarr; Configuration &rarr; System SettingsにあるSolr 8 System Settingsエントリから設定を更新することができます。

![LiferayのSystem SettingsアプリケーションからSolrを設定することは、開発やテスト時に最も有用です。](./installing-solr/images/02.png)

1. アプリの LPKG のダウンロードが完了したら、それを Liferay の `osgi/marketplace` フォルダにコピーし、その設定ファイルを `osgi/configs`に配置します。

1. Liferayを起動します。

1. LiferayでSolrの接続を確認する。 グローバルメニューを開き、 *コントロールパネル* &rarr; *設定* &rarr; *検索* に移動し、接続が有効であることを確認します。
   
   ![検索管理コンソールでSolrの接続を確認する。](./installing-solr/images/01.png)

1. LiferayのデータをSolrに再インデックスします。 グローバルメニューを開き、 *［コントロールパネル］* &rarr; *［設定］* &rarr; *［検索］*へ行きます。 Index Actions] ペインで、[Re-index Search Indexes] オプションの横の *Execute* をクリックします。
   
   スペルチェック用のインデックスも再作成してください。



## SolrCloudによる高可用性

Solrサーバーのクラスターが必要な場合は、SolrCloudを使用します。 なお、SolrCloudを実運用で使用するには、 [外部のZooKeeperアンサンブル](https://cwiki.apache.org/confluence/display/solr/Setting+Up+an+External+ZooKeeper+Ensemble)を設定する必要があります。 [ZooKeeper](http://zookeeper.apache.org/) は、SolrCloudクラスターのような分散システムを管理するための、集中型のコーディネーションサービスです。

ここで紹介する手順は、SolrCloudをLiferayで設定するために必要な最低限のものです。 例えば、この手順では、1台のマシンでSolrCloudを構成することを説明します。 本番環境は、複数の物理マシンまたは仮想マシンを備えている必要があります。 また、この手順は、上記の *Installing and Configuring Solr* に従っていることを前提としています。 詳しくは [SolrCloudガイドをご参照ください](https://cwiki.apache.org/confluence/display/solr/SolrCloud).

1. Solrサーバーが稼働している場合は停止します。

1. Solrインストール内の `configsets` フォルダに移動します (`solr-[version]/server/solr/configsets`)。

1. `liferay_configs`というフォルダを作成します。

1. `conf` フォルダを `solr-[version]/server/solr/liferay` から先ほど作成した `liferay_configs` フォルダにコピーしてください。
   
   `configset/liferay_configs` フォルダには、SolrCloudのLiferayコレクションの設定が含まれており、ZooKeeperにアップロードされます。 先に設定した `conf` フォルダを、 `liferay` サーバーからコピーする際には、Liferay Solr Adapterに付属する `schema.xml` と `solrconfig.xml` ファイルを使用します。

1. インタラクティブなSolrCloudセッションを起動し、SolrCloudクラスターを設定します。 Solrのインストール・ルートから、以下を実行します。 
   
   

   ```bash
   ./bin/solr -e cloud
   ```


1. セットアップ・ウィザードを完了する。 ここでは、2ノードのクラスターを作成する手順を説明します。

    - ノード数には `2` を入力してください。
    - ポートは `8983` と `7574` （デフォルト）を指定します。 両ノードは、ログに出力されるスタートコマンドで起動されます。 
      
      

       ```
       Starting up Solr on port 8983 using command:
       "bin/solr" start -cloud -p 8983 -s "example/cloud/node1/solr"

       Waiting up to 180 seconds to see Solr running on port 8983 [|]  [-]  
       Started Solr server on port 8983 (pid=8846). Happy searching!


       Starting up Solr on port 7574 using command:
       "bin/solr" start -cloud -p 7574 -s "example/cloud/node2/solr" -z localhost:9983

       Waiting up to 180 seconds to see Solr running on port 7574 [|]  [/]  
       Started Solr server on port 7574 (pid=9026). Happy searching!
       ```


    - コレクション名 *liferay*

    - コレクションを2つのシャードに分割します。
    - シャードごとに2つのレプリカを指定します。
    - コンフィギュレーションを選択するプロンプトが表示されたら、 *liferay_configs*と入力します。 クラスタが起動すると、以下のようなログメッセージが表示されます。 
      

    ```bash
    SolrCloud example running, please visit http://localhost:8983/solr
    ```


これで、ローカルのSolrCloudクラスターに *liferay* という新しいコレクションができました。 `status` コマンドを実行して、その状態を確認します。



```bash
./bin/solr status
```


ログ出力では、ノードが見つかったことと、各ノードの情報が一覧表示されます。



```
Found 2 Solr nodes: 

Solr process 725273 running on port 8983
{
  "solr_home":"/home/me/_temp/solr-8.11.2/example/cloud/node1/solr",
  "version":"8.11.2 17dee71932c683e345508113523e764c3e4c80fa - mdrob - 2022-06-13 11:27:54",
  "startTime":"2023-01-05T20:29:45.779Z",
  "uptime":"0 days, 0 hours, 1 minutes, 29 seconds",
  "memory":"99.6 MB (%19.4) of 512 MB",
  "cloud":{
    "ZooKeeper":"localhost:9983",
    "liveNodes":"2",
    "collections":"1"}}
...
```


SolrCloudモードで実行中のSolrを停止するには、次のように `stop` コマンドを使用します。



```bash
./bin/solr stop -all
```




## SolrCloud用Solrコネクタの設定

Liferay で SolrCloud をサポートするには、Liferay の Solr コネクタでクライアントタイプを *CLOUD* と指定します。

1. システム設定」またはOSGiの設定ファイルから、 *Client Type* を *CLOUD*に設定します。 
   
   

   ```properties
   clientType="CLOUD"
   ```


1. Liferayを起動します。 Solr コネクタ LPKG をインストールした後に初めて起動した場合は、ログに記載されている指示に従って Liferay を再起動してください。

![［Solr システム設定］のエントリーから、「Client Type」を「Cloud」に設定します。](./installing-solr/images/03.png)



## Solr コネクタ設定リファレンス

以下は、デフォルトの設定と、Solr コネクター・アプリケーションをインストールしたときに利用可能になる設定（システム設定検索カテゴリまたは `.config` ファイルで構成可能）です。 これらの設定は、限られた値を受け入れるものです。

**設定ファイル：** `com.liferay.portal.search.solr8.configuration.SolrConfiguration.config`\

**システム設定のエントリーです。** *Solr 8*



```properties
authenticationMode=["BASIC" or "CERT"]
clientType=["REPLICATED" or "CLOUD"]
defaultCollection="liferay"
logExceptionsOnly=B"true"
readURL="http://localhost:8983/solr/liferay"
writeURL="http://localhost:8983/solr/liferay"
zkHost="localhost:9983"
```


**設定ファイル：** `com.liferay.portal.search.solr8.configuration.SolrHttpClientFactoryConfiguration.config`\.

**システム設定のエントリーです。** *Solr 8 HTTP Client Factory*



```properties
basicAuthPassword="solr"
basicAuthUserName="solr"
defaultMaxConnectionsPerRoute="20"
maxTotalConnections="20"
```


**設定ファイル：** `com.liferay.portal.search.solr8.configuration.SolrSSLSocketFactoryConfiguration.config`\.

**システム設定のエントリーです。** *Solr 8 SSL Factory*



```properties
keyStorePassword="secret"
keyStorePath="classpath:/keystore.jks"
keyStoreType="JKS"
trustStorePassword="secret"
trustStorePath="classpath:/truststore.jks"
trustStoreType="JKS"
verifyServerCertificate=B"true"
verifyServerName=B"true"
```
