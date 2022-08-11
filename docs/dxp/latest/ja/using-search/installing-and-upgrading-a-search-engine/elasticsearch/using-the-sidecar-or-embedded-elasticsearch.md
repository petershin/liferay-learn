# サイドカーまたはEmbedded モードのElasticsearchの使用

ZIPファイルまたはDockerイメージを介してインストールされたLiferay Tomcatバンドルには、Liferayで始まるElasticsearchノードが含まれています。 Liferay 7.3+ と 7.4+ のノードはサイドカーサーバーとして別のJVMで動作し、Liferay 7.2 のノードはLiferayサーバーに埋め込まれています。

Elasticsearchサーバーには、次のURLからアクセスできます。

* <http://localhost:9201> Liferay 7.3+ と 7.4+ 上で。
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
```

HSQLのような組み込みデータベースを本番環境で実行したり、バンドルされたElasticsearchサーバーを本番環境で実行したりしないでください。 代わりに、Elasticsearchをスタンドアロンサーバーまたはサーバーノードのクラスターとしてリモートモードで実行します。

```{important}
検索の調整アプリの [同義語セット](using-search/search-administration-and-tuning/synonym-sets.md) と [結果ランキング](using-search/search-administration-and-tuning/result-rankings.md) は、Liferay 7.2 と 7.3 で主要データストレージとして検索インデックスを使用しました。 これらのアプリのデータは、Liferayのデータベースには保存されていません。 そのため、Liferay 7.2や7.3でサイドカーやEmbedded モードのElasticsearchを使用中に同義語セットや結果ランキングを設定した場合、リモートElasticsearchサーバーに切り替えて再インデックス化しても、それらの設定は復元 _されません_ 。 その代わり、同義語セットと結果ランキングをリモートのElasticsearchクラスタに手動で取り込む必要があります。 Elasticの [スナップショットと復元](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/snapshot-restore.html) 機能を使ってこれらのインデックスを保持する方法については、[アップグレードガイド](../elasticsearch/upgrading-elasticsearch.md)で詳細を確認してください。
```

## バンドルされているElasticsearchサーバーのユースケース

デフォルトのElasticsearchサーバー（サイドカーおよびEmbedded）の一般的な使用法は次のとおりです。

* カスタムの [検索機能とインデックスコード](../../developer-guide.html) のテスト
* Kibanaを介してElasticsearchで直接クエリを実行して検索クエリを開発する
* [検索の調整](../../search-administration-and-tuning.md)機能のテスト
* [検索ウィジェット](../../search-pages-and-widgets.md)の調査と設定

## アプリサーバーの違い

Liferay 7.4 (DXP、Portal)、Liferay DXP 7.3、Liferay Portal 7.3 GA4+ では、Elasticsearch サイドカーサーバーが Tomcat バンドルと Docker イメージに同梱されています。 Liferay WARをサポートされているアプリケーションサーバーにインストールする場合、いくつかの重要な違いがあります。

```{note}
下表において、_7.3+_という表記は、Liferay 7.4 (DXP、Portal)を含んでいます。
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
| _すべてのフレーバー：7.2/7.3 GA3-_ | _埋め込み_              | &#10004; | &#10008;                 |

Tomcat以外のアプリケーションサーバーのバンドルをダウンロードした場合、サーバーを起動すると、Elasticsearchディストリビューションがオンザフライでダウンロードされ、サイドカーサーバーとして起動されます。

[WebSphere](../../../installation-and-upgrades/installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md)および[Weblogic](../../../installation-and-upgrades/installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md)アプリケーションサーバーへの Liferayのインストール手順には、サイドカーサーバーを初期化するために必要な Elasticsearchアーカイブを手動で提供する手順が含まれています。

```{important}
バンドルされているElasticsearchサーバは、開発およびテスト目的に有用であり、本番環境では使用しないでください。 リモート検索エンジンのインストールについては、【Elasticsearchのインストール】(./getting-started-with-elasticsearch.md)をご参照ください。
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
