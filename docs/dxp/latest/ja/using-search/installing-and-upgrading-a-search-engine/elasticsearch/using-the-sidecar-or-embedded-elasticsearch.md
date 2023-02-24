# サイドカーまたはEmbedded モードのElasticsearchの使用

ZIPファイルまたはDockerイメージを介してインストールされたLiferay Tomcatバンドルには、Liferayで始まるElasticsearchノードが含まれています。 Liferay 7.3+ と 7.4+ のノードはサイドカーサーバーとして別のJVMで動作し、Liferay 7.2 のノードはLiferayサーバーに埋め込まれています。

Elasticsearchサーバーには、次のURLからアクセスできます。

* Liferay 7.3+と7.4+の場合は<http://localhost:9201>
* Liferay 7.2の場合は<http://localhost:9200>

サイドカーサーバーの出力例は次のとおりです。

```json
{
  "name" : "liferay",
  "cluster_name" : "LiferayElasticsearchCluster",
  "cluster_uuid" : "_lcJyLZXQ2WY5No5oW8edg",
  "version" : {
    "number" : "7.17.0",
    "build_flavor" : "unknown",
    "build_type" : "unknown",
    "build_hash" : "bee86328705acaa9a6daede7140defd4d9ec56bd",
    "build_date" : "2022-01-28T08:36:04.875279988Z",
    "build_snapshot" : false,
    "lucene_version" : "8.11.1",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}
```

バンドルされているElasticsearchサーバーは開発とテストには便利ですが、どちらも本番環境には適していません。

```{note}
本番環境でサポートされている構成ではありませんが、KibanaをインストールしてバンドルされているElasticsearchサーバーを監視することは、開発やテストの際に役立ちます。 
- Liferay 7.3では、 [KibanaがビルトしたOSSのみ](https://www.elastic.co/downloads/kibana-oss) をインストールします。
- Liferay DXP 7.4 U17以降とLiferay Portal 7.4 GA17以降では、無料版の [Kibana](https://www.elastic.co/downloads/past-releases#kibana) をインストールしてください。

[セットアップでエラーが発生した場合のトラブルシューティングの項目](#error-connecting-to-the-sidecar-elasticsearch-from-kibana) をご覧ください。
```

HSQLのような組み込みデータベースを本番環境で実行したり、バンドルされたElasticsearchサーバーを本番環境で実行したりしないでください。 代わりに、Elasticsearchをスタンドアロンサーバーまたはサーバーノードのクラスターとしてリモートモードで実行します。

```{important}
検索チューニングアプリの [同義語セット](../../search-administration-and-tuning/synonym-sets.md) と [結果ランキング](../../search-administration-and-tuning/result-rankings.md) は Liferay 7.2 と 7.3 でプライマリデータストレージとして検索インデックスを使用しました。 これらのアプリのデータは、Liferayのデータベースには保存されていません。 そのため、Liferay 7.2や7.3でサイドカーやEmbedded モードのElasticsearchを使用中に同義語セットや結果ランキングを設定した場合、リモートElasticsearchサーバーに切り替えて再インデックス化しても、それらの設定は復元 _されません_ 。 その代わり、同義語セットと結果ランキングをリモートのElasticsearchクラスタに手動で取り込む必要があります。 Elasticの [スナップショットと復元](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/snapshot-restore.html) 機能を使ってこれらのインデックスを保持する方法については、[アップグレードガイド](../elasticsearch/upgrading-elasticsearch.md)で詳細を確認してください。
```

## バンドルされているElasticsearchサーバーのユースケース

デフォルトのElasticsearchサーバー（サイドカーおよびEmbedded）の一般的な使用法は次のとおりです。

* カスタムの [検索機能とインデックスコード](../../developer-guide.html) のテスト
* Kibanaを介してElasticsearchで直接クエリを実行して検索クエリを開発する
* [検索の調整](../../search-administration-and-tuning.md)機能のテスト
* [検索ウィジェット](../../search-pages-and-widgets.md)の調査と設定

## アプリサーバーの違い

Liferay 7.4 (DXP、Portal)、Liferay DXP 7.3、Liferay Portal 7.3 GA4+ では、Elasticsearch サイドカーサーバーが Tomcat バンドルと Docker イメージに同梱されています。 サポートされているアプリケーションサーバーにLiferay WARをインストールする場合、いくつかの重要な違いがあります。

```{note}
下表において、_7.3+_という表記には、Liferay 7.4 (DXPとPortal）が含まれています。
```

| Liferay DXPのフレーバー        | デフォルトのElasticsearch | 事前インストール | 手動による介入が必要               |
|:------------------------ |:------------------- |:-------- |:------------------------ |
| Tomcatバンドル：7.3以降         | サイドカー               | &#10004; | &#10008;                 |
| Tomcat：7.3以降             | サイドカー               | &#10008; | &#10008; (自動ダウンロードされました) |
| Docker: 7.3以降            | サイドカー               | &#10004; | &#10008;                 |
| JBoss：7.3以降              | サイドカー               | &#10008; | &#10008; (自動ダウンロードされました) |
| Wildfly：7.3以降            | サイドカー               | &#10008; | &#10008; (自動ダウンロードされました) |
| WebSphere：7.3以降          | サイドカー               | &#10008; | &#10004;                 |
| Weblogic：7.3以降           | サイドカー               | &#10008; | &#10004;                 |
| **すべてのフレーバー：7.2/7.3 GA3-** | **埋め込み** | &#10004; | &#10008;                 |

Tomcat以外のアプリケーションサーバーのバンドルをダウンロードした場合、サーバーを起動すると、Elasticsearchディストリビューションがオンザフライでダウンロードされ、サイドカーサーバーとして起動されます。

[WebSphere](../../../installation-and-upgrades/installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md)および[Weblogic](../../../installation-and-upgrades/installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md)アプリケーションサーバーへの Liferayのインストール手順には、サイドカーサーバーを初期化するために必要な Elasticsearchアーカイブを手動で提供する手順が含まれています。

```{important}
バンドルされているElasticsearchサーバは、開発およびテスト目的に有用であり、本番環境では使用しないでください。 リモート検索エンジンのインストールについては、[Elasticsearchのインストール](./getting-started-with-elasticsearch.md)をご参照ください。
```

## Embeddedとサイドカーの比較

ElasticsearchサーバーのEmbeddedモードとサイドカーモードの比較を次に示します。

| Embedded                              | サイドカー                                                                                                                          |
|:------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------ |
| 安全な接続を構成できません                         | 安全な接続を構成できません                                                                                                                  |
| ElasticsearchのOSSバージョンを使用します          | Liferay 7.3は、OSSバージョンのElasticsearchを使用し、<br />Liferay DXP 7.4 U17とLiferay Portal 7.4 GA17ではOSS Elasticsearchを使用しなくなりました。 |
| <http://localhost:9200>で実行します         | <http://localhost:9201>で実行します                                                                                                  |
| すべてのLiferayディストリビューションに事前インストールされています | 常に事前インストールされているわけではありません                                                                                                       |
| 本番環境ではサポートされていません                     | 本番環境ではサポートされていません                                                                                                              |
| アプリサーバーに特別な手順は必要ありません                 | [一部のアプリサーバー](#app-server-differences) では追加の手順が必要です                                                                              |

## サイドカー／Embedded モードのElasticsearchのトラブルシューティング
./elasticsearchBe Started

これらのエラーは、起動時のElasticsearch Sidecarのインストールに問題があることを示しています。

```
2022-03-02 17:32:22.952 ERROR [main][ElasticsearchConnectionManager:81] Elasticsearch sidecar could not be started. Search will be unavailable. Manual installation of Elasticsearch and activation of remote mode is recommended.
```

```
2022-03-04 10:41:13.249 ERROR [com.liferay.portal.search.elasticsearch7.internal.sidecar.SidecarMainProcessCallable@3da0921a[-Xms1g -Xmx1g -XX:+AlwaysPreTouch -Des.path.conf=/home/tibusz/liferay/bundles/master/tomcat-9.0.56/temp/sidecar5219314832153809763/config -Des.networkaddress.cache.ttl=60 -Des.networkaddress.cache.negative.ttl=10 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Dio.netty.allocator.type=unpooled -Dio.netty.allocator.numDirectArenas=0 -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dfile.encoding=UTF-8 -Djava.io.tmpdir=/home/tibusz/liferay/bundles/master/tomcat-9.0.56/temp/sidecar5219314832153809763 -Djava.security.policy=jar:file:/home/tibusz/liferay/bundles/master/osgi/state/org.eclipse.osgi/257/0/bundleFile!/META-INF/sidecar.policy -Djna.nosys=true]-][Sidecar:198] Abort subprocess piping
java.io.InvalidClassException: org.elasticsearch.ElasticsearchException; local class incompatible: stream classdesc serialVersionUID = 4568865521165719982, local class serialVersionUID = -7656133510021522625
    at java.io.ObjectStreamClass.initNonProxy(ObjectStreamClass.java:689) ~[?:?]
```

```
2022-03-04 10:41:30.191 ERROR [main][SidecarManager:93] bundle com.liferay.portal.search.elasticsearch7.impl:6.0.34 (257)[com.liferay.portal.search.elasticsearch7.internal.sidecar.SidecarManager(973)] : The activate method has thrown an exception 
java.util.concurrent.CancellationException: null
    at java.util.concurrent.FutureTask.report(FutureTask.java:121) ~[?:?]
    at java.util.concurrent.FutureTask.get(FutureTask.java:191) ~[?:?]
    at com.liferay.portal.search.elasticsearch7.internal.sidecar.Sidecar._waitForPublishedAddress(Sidecar.java:591) ~[?:?]
```

```
2022-03-04 10:41:30.162 WARN  [com.liferay.portal.search.elasticsearch7.internal.sidecar.SidecarMainProcessCallable@3da0921a[-Xms1g -Xmx1g -XX:+AlwaysPreTouch -Des.path.conf=/home/tibusz/liferay/bundles/master/tomcat-9.0.56/temp/sidecar5219314832153809763/config -Des.networkaddress.cache.ttl=60 -Des.networkaddress.cache.negative.ttl=10 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Dio.netty.allocator.type=unpooled -Dio.netty.allocator.numDirectArenas=0 -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dfile.encoding=UTF-8 -Djava.io.tmpdir=/home/tibusz/liferay/bundles/master/tomcat-9.0.56/temp/sidecar5219314832153809763 -Djava.security.policy=jar:file:/home/tibusz/liferay/bundles/master/osgi/state/org.eclipse.osgi/257/0/bundleFile!/META-INF/sidecar.policy -Djna.nosys=true]-][Sidecar:632] Sidecar Elasticsearch process is aborted
java.util.concurrent.ExecutionException: com.liferay.petra.process.TerminationProcessException: Subprocess terminated with exit code 130
    at java.util.concurrent.FutureTask.report(FutureTask.java:122) ~[?:?]
    at java.util.concurrent.FutureTask.get(FutureTask.java:191) ~[?:?]
    at com.liferay.portal.search.elasticsearch7.internal.sidecar.Sidecar$RestartFutureListener.complete(Sidecar.java:628) [bundleFile:?]
    at com.liferay.petra.concurrent.DefaultNoticeableFuture$OnceFutureListener.complete(DefaultNoticeableFuture.java:111) [com.liferay.petra.concurrent.jar:?]
    at com.liferay.petra.concurrent.DefaultNoticeableFuture.done(DefaultNoticeableFuture.java:85) [com.liferay.petra.concurrent.jar:?]
    at java.util.concurrent.FutureTask.finishCompletion(FutureTask.java:381) [?:?]
    at java.util.concurrent.FutureTask.setException(FutureTask.java:250) [?:?]
    at com.liferay.petra.concurrent.DefaultNoticeableFuture.setException(DefaultNoticeableFuture.java:79) [com.liferay.petra.concurrent.jar:?]
    at java.util.concurrent.FutureTask.run(FutureTask.java:269) [?:?]
    at java.lang.Thread.run(Thread.java:834) [?:?]
Caused by: com.liferay.petra.process.TerminationProcessException: Subprocess terminated with exit code 130
    at com.liferay.petra.process.local.LocalProcessExecutor$SubprocessReactor.call(LocalProcessExecutor.java:309) ~[com.liferay.petra.process.jar:?]
    at com.liferay.petra.process.local.LocalProcessExecutor$SubprocessReactor.call(LocalProcessExecutor.java:161) ~[com.liferay.petra.process.jar:?]
    at java.util.concurrent.FutureTask.run(FutureTask.java:264) ~[?:?]
```

```
Caused by: org.elasticsearch.bootstrap.StartupException: java.lang.IllegalArgumentException: Could not load codec 'Lucene87'.  Did you forget to add lucene-backward-codecs.jar?
```

このようなエラーを解決するには

1. Liferayを停止します。

1. `[Liferay Home]/elasticsearch-sidecar/` または `[Liferay Home]/elasticsearch7`を削除します。 このフォルダーには、Sidecar Elasticsearchランタイムが含まれています。

1. `[Liferay Home]/data/elasticsearch7`を削除します。 このフォルダーには、インデックスデータが含まれています。

1. Liferayを再起動します。

1. ポータルは、 [選択したアプリケーションサーバー](./using-the-sidecar-or-embedded-elasticsearch.md#embedded-versus-sidecar) (例: Tomcatなど)上で、起動時にElasticsearchランタイムをダウンロードし、展開します。

