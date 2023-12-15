# 検索設定のリファレンス

Liferay DXPの検索は様々な方法で設定できます。 [設定範囲](../system-administration/configuring-liferay/understanding-configuration-scope.md) の概念を理解すれば、ある設定画面がどこにあるのかがわかるようになります。

* 検索設定の多くはシステムスコープに影響を与えます（アクションの再インデックス化や検索エンジンコネクタの設定など）。
* 検索チューニングの設定は、仮想インスタンスに影響を与えます。
* 新しい検索ページの作成は、サイトスコープでの検索に影響します。
* 検索ウィジェットの設定は、ウィジェットスコープの設定ですが、一部はページスコープの設定と考えることもできます。

つまり、「検索を設定する」という用語は、利用可能なすべてのスコープに対応するため、非常に幅広いのである。 ここでは、どのような検索動作が設定可能か、そして重要なこととして、どこに検索設定オプションがあるのかについて、高いレベルで説明します。

## Widget Scoped Searchの設定

ページ上に設置できる検索ウィジェットをご用意しました。 それぞれに設定オプションがあります。

![Each widget's configuration will be unique.](./search-configuration-reference/images/03.png)

### 検索ウィジェット

検索ウィジェットの詳細については、 [ページとウィジェットの検索](./getting-started/search-overview.md#search-pages-and-widgets) をご覧ください。

**検索結果** ：検索結果の表示方法を設定します。 詳しくは、 [検索結果の表示](./search-pages-and-widgets/search-results/configuring-the-search-results-widget.md#displaying-search-results) をご覧ください。

**検索バー** :検索キーワードの処理方法を設定します。 詳しくは、 [検索バーを設定する](./getting-started/searching-for-content.md#configuring-the-search-bar) をご覧ください。

**検索ファセット** ：各ファセットの動作とURLパラメータを設定します。 詳しくは、 [ファセット](./search-pages-and-widgets/search-facets.md) をご覧ください。

**検索オプション** ：これは特別なケースで、このウィジェットを設定することで、ページスコープの動作が定義されます。 ［検索オプション］ウィジェットをページに追加し、「検索ページ」に2つのブーリアンを定義します。

* 空の検索を許可する：デフォルトでは、キーワードを入力しなかった場合、検索結果は表示されません。 これを有効にすると、検索バーにキーワードが入力されていない場合、すべての検索結果が返されます。
* 基本的なファセット選択。デフォルトでは、ファセット数はファセットを選択するたびに再計算されます。 これを有効にすると、ファセットリカウンティングがオフになります。

**検索提案** ：より良いクエリとスペルチェッククエリを提案します。 詳しくは、 [サジェスチョン・コンフィギュレーション・リファレンス](./search-pages-and-widgets/search-results/enabling-search-suggestions.md#suggestions-configuration-reference) を参照してください。

**検索インサイト** ：ユーザーがキーワードを入力した際に、バックエンドの検索コードによって構築される完全なクエリー文字列を検査するために、検索ページにこれを追加します。 テストや開発にしか使えません。 詳しくは、 [検索インサイト](./search-pages-and-widgets/search-insights.md) をご覧ください。

**カスタムフィルター** ：検索結果に適用したいフィルターごとに、ページにウィジェットを追加します。 検索ページのユーザがフィルタを見たり操作したりできるようにするか、フィルタを不可視にしたり、不変にしたりする。 詳細については、 [検索結果のフィルタリング](./search-pages-and-widgets/search-results/filtering-search-results.md) を参照してください。

**ソート** ： インデックス内の特定のキーワードフィールドの値に基づいて検索結果を並べ替えることができます。例えば、Titleフィールドのアルファベット順に結果を表示します。デフォルトの並び順は検索エンジンの **関連度** 計算によって決定されます。詳しくは[検索結果の並べ替え](./search-pages-and-widgets/search-results/sorting-search-results.md)を参照してください。

**Low Level Search Options:****Company Index** 以外のインデックスを対象とした検索に参加するように検索ウィジェットを設定します。 会社インデックスはLiferay DXPアセットがデータのインデックスを作成する場所なので、多くのインストールではこのウィジェットは必要ありません。 詳しくは、 [低レベル検索オプションを理解する](./search-pages-and-widgets/search-results/understanding-low-level-search-options.md) をご覧ください。

**類似検索結果：** ページに表示されているアセットに類似した検索結果を表示します。 詳細は、 [類似結果](./search-pages-and-widgets/similar-results.md) を参照してください。

[Liferay Enterprise Search] をご覧ください。 **Elasticsearchモニタリング:** Liferay Enterprise Searchのサブスクライバーは、Liferay DXPページに設置されたウィジェット内で [ElasticのKibana](https://www.elastic.co/kibana) モニタリングツールにアクセスできます。 詳しくは[Elasticsearch](./liferay-enterprise-search/monitoring-elasticsearch.md) の監視]を参照してください。

## サイトスコープ検索の設定

[サイトスコープの構成](../system-administration/configuring-liferay/understanding-configuration-scope.md) の厳密な定義では、検索には何もありません。 しかし、 [検索ページ](./search-pages-and-widgets/working-with-search-pages/search-pages.md) は、サイト固有の検索動作に影響を与えます。 通常、検索ページには、特定のサイト内のすべてのコンテンツを検索するように設定された検索ウィジェットが含まれています。

![Configure the scope of a search.](./search-configuration-reference/images/04.png)

検索ウィジェットを使用する際には、いくつかの重要な設定上の注意点があります。

ヘッダー検索バー（デフォルトテーマに埋め込まれた検索バー）が検索バーウィジェットを使用する場合、その設定には常に **destination page** を設定する必要があり、ユーザーが他の検索ウィジェット（結果、ファセット、サジェストなど）とやり取りしながら検索アクティビティを完了するためにリダイレクトされます。 [検索先ページ](./search-pages-and-widgets/working-with-search-pages/creating-a-search-page.md) は、検索ウィジェットを搭載した通常のページです。 検索ウィジェットを持つページは、サイト全体でいくつでも持つことができます。

検索バーウィジェットはインスタンス化が可能なので、1つのページに複数の検索バーウィジェットを設定することができます。 すべての検索バーのインスタンスは、サイト内の検索ページを指していないと効果がありません。

```{important}
宛先の検索ページに、（Liferayのデフォルトテーマのように）テーマに埋め込まれたヘッダー検索バーの他に検索バーウィジェットインスタンスがある場合、ヘッダー検索バーの設定がページのウィジェットインスタンスよりも優先されます。

逆に、他のページのSearch Barウィジェットインスタンスからの検索では、ヘッダのSearch Barの設定と異なっていても、その設定が尊重されます。
```

詳しくは、 [検索バーを設定する](./getting-started/searching-for-content.md#configuring-the-search-bar) をご覧ください。

## インスタンススコープの検索構成

検索は、 [インスタンス設定](../system-administration/configuring-liferay/understanding-configuration-scope.md#system-settings-and-instance-settings) パネルにインスタンススコープエントリを持ちません。 しかし、多くの検索ウィジェットのインスタンスワイドなデフォルトの [ウィジェットテンプレート](../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md) を構成するためのエントリがあります。 テンプレートが定義されているサイトID（多くの場合、サイト設定パネルにあるグローバルサイトのID）と、サイトメニューの &rarr; デザイン &rarr; ウィジェットテンプレートにあるウィジェットテンプレートのIDを入力します。

検索に関するインスタンス・スコープの設定は、Global Menuの &rarr; Applications &rarr; Search Tuningのエントリーのみです。

**検索結果のランキング：** 特定のエイリアスの結果を非表示にしたり、固定したり、追加したりすることで、検索結果を手動でカスタマイズします。 詳しくは、 [結果ランキング](./search-administration-and-tuning/result-rankings.md) をご覧ください。

**類義語:** 類義語セットを作成することで、同義語の検索語は検索語と完全に一致するようにマッチングされ、スコアリングされます。 詳細は、 [シノニムセット](./search-administration-and-tuning/synonym-sets.md) を参照してください。

## システムスコープ検索の設定

システムスコープの検索設定は、主に [システム設定](../system-administration/configuring-liferay/system-settings.md) にあります。

1. グローバルメニューで、 **コントロールパネル** &rarr; **設定** &rarr; **システム設定** に進みます。

1. プラットフォームセクションの下にある **検索** カテゴリーをクリックします。

   あるいは、「**search**」を検索する。

![There are numerous system scoped entries for search in System Settings.](./search-configuration-reference/images/01.png)

[OSGi設定ファイル](../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) を経由してシステム設定を設定できます。 ファイル名はここに記載されています。

### カテゴリファセットフィールド

{bdg-secondary}`7.4 U47+とGA47+について`

**設定ファイル：** `com.liferay.portal.search.configuration.CategoryFacetConfiguration.config`

カテゴリーファセットフィールドのエントリーには、カテゴリーファセットフィールドという1つの設定が含まれています。 この設定は、Category Facetで集計を作成する際に使用するインデックス付きフィールドを指定します。 デフォルト値は `assetCategoryIds` である。 代わりに、`assetVocabularyCategoryIds`を使用して、Category Facetウィジェットに表示する語彙とカテゴリを選択する必要があります。 詳しくは、 [Category Facet documentation](./search-pages-and-widgets/search-facets/category-facet.md) をご覧ください。

### デフォルト・キーワードクエリ

**設定ファイル:** `com.liferay.portal.search.configuration.DefaultKeywordQueryConfiguration.config`

デフォルト・キーワードクエリエントリには1つの設定があります。

**`disabledEntryClassNames`** ：`DefaultKeywordQueryContributor`コードは、キーワード検索クエリに `description`、`userName`、`title` フィールドを自動的に追加します。 DefaultKeywordQueryContributor` が無視するエントリクラス名を指定します。

### デフォルト検索結果パーミッションフィルター

**設定ファイル:** `com.liferay.portal.search.configuration.DefaultSearchResultPermissionFilterConfiguration.config`

Default Search Result Permission Filter項目は、 **post-filtering permission checking**（検索インデックスから結果が返された後に行われるデータベース権限チェック）の設定を可能にする。 これらの設定の詳細については、 [最終権限設定](./search-pages-and-widgets/search-results/search-results-behavior.md#final-permissions-checking) を参照してください。

* **`permissionFilteredSearchResultAccurateCountThreshold`**

* **`searchQueryResultWindowLimit`**

### インデックス・ステータス・マネージャー

**設定ファイル：** `com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config`

ステータス マネージャーをインデックスするエントリーの設定は1つです。

**`indexReadOnly`** ：これを有効にすると、すべてのインデックス作成操作と検索エンジンへの書き込みを一時停止する。 検索では、すでにインデックスされている文書のみが返されます。 この機能は、大規模なデータのインポートを高速化するのに便利ですが、インポートが終了したら、無効にして完全な再インデックスを実行する必要があります。

### インデックス書き込みヘルパー

**設定ファイル：** `com.liferay.portal.search.configuration.IndexWriterHelperConfiguration.config`

インデックスライターヘルパーエントリには、1つのエントリが含まれています。

**`indexCommitImmediately`** ： **true**（デフォルト）の場合、各書き込みリクエストはサーチエンジンにインデックスリーダーをリフレッシュさせ、ディスクにトランザクションをフラッシュさせる可能性がある。 これは、検索エンジンのパフォーマンスに悪影響を与える可能性があります。 デフォルトの動作は、個々のアセットへのインデックス書き込み（例：blog の追加、blog の更新）については直ちにコミットしますが、一括したインデックス書き込み操作（例：すべてのユーザーのインデックス化、すべてのフォームエントリのインデックス化）については、すべてのエントリが検索エンジンに送信されるまでコミットを遅らせます。 この設定をfalseにすると、個々のインデックス操作の動作が変化し、Asset Publisherなどのアプリケーションで、新しく追加されたコンテンツを表示する際にレスポンスが遅れることがあります。 詳しくは、 [Elasticsearchのドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/near-real-time.html) をご覧ください。

### インデクサー登録

**設定ファイル：** `com.liferay.portal.search.configuration.IndexerRegistryConfiguration.config`

インデックス要求のバッファリングを設定する。

**buffered`** ：インデックス作成リクエストのバッファリングを有効 (デフォルト) あるいは無効にする。

**`bufferedExecutionMode`** ：管理者が `IndexerRequest`の実行に使用する`IndexerRequestBufferExecutor`を選択できるようにする。 エグゼキューターの1つの実装が、そのまま提供される（**DEFAULT**）。 新しい`IndexerRequestBufferExecutor`の実装がデプロイされると、必要なプロパティの1つに`buffered.execution.mode` がある。 この値を **DEFAULT** の代わりに使うことができる。

**maximumBufferSize`** ：バッファリングが有効になっている場合は、追加のインデックス作成要求が即座に実行されるように最大バッファサイズを設定します。

**minimumBufferAvailabilityPercentage`** ：バッファの容量が指定されたパーセンテージしか残っていない場合、 バッファ内の既存のリクエストはまとめて実行され、バッファから取り除かれます。

### インデックス・クエリ・プロセッサー

**設定ファイル:** `com.liferay.portal.search.configuration.QueryPreProcessConfiguration.config`

このエントリは、1つの繰り返し可能なプロパティを持っています（ [OSGi構成ファイル](../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) で定義している場合は、配列構文を使用します）。

**fieldNamePatterns`** ：ここで設定されたパターンにマッチする名前を持つフィールドは、非分析キーワードフィールドとして扱われます。 スコアリングされたフルテキストクエリの代わりに、スコアリングされていないワイルドカードクエリによってマッチングが行われます。 これはリソースを消費する操作で、インデックスが大きくなると検索エンジンのパフォーマンスが低下します。 部分文字列の照合では、 [ngram tokenizer](https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-ngram-tokenizer.html) に頼る方が、通常は良い結果が得られます。

### 再インデクス

**設定ファイル:** `com.liferay.portal.search.configuration.ReindexConfiguration.config`

このエントリーには、1つのプロパティしか含まれていません。

**`indexingBatchSizes`** ：バッチインデックスをサポートするモデルタイプに対して、バッチごとにインデックスされるドキュメントの数(デフォルト値は1000)を設定します。 大規模なドキュメントを持つモデルでは、この値を小さくすることで、完全な再インデックスを実行する際の安定性が向上する場合があります。

### エンジンヘルパー

**設定ファイル：** `com.liferay.portal.search.configuration.SearchEngineHelperConfiguration.config`

このエントリは、1つの繰り返し可能なプロパティを持っています（ [OSGi構成ファイル](../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) で定義している場合は、配列構文を使用します）。

**`excludedEntryClassNames`** ：Search アプリケーション用に構築されたキャッチオールクエリで、アセットタイプを検索対象から除外します。 例えば、ユーザーと組織
アプリケーションから検索できるように、組織アセットのフィールドにインデックスを付ける必要がありますが、検索アプリケーションでは検索できません。 したがって、Organizationsは `excludedEntryClassNames`に追加される。

### 権限チェッカー

**設定ファイル:** `com.liferay.portal.search.configuration.SearchPermissionCheckerConfiguration.config`

このエントリーは、Liferay DXP 7.3では1つの設定オプションがあります。

**`permissionTermsLimit`** ：このレベルのパーミッションチェックが中断されるまでに、検索クエリに追加されるパーミッション検索句の数を制限する。 パーミッションチェックは、 [デフォルト検索結果パーミッションフィルター](#default-search-result-permission-filter) セクションで説明されている最終的なパーミッションフィルタリングにのみ依存します。

### タイトルフィールドクエリビルダー

**設定ファイル:** `com.liferay.portal.search.configuration.TitleFieldQueryBuilderConfiguration.config`

ドキュメントの「タイトル」フィールドにマッチした場合の検索の応答方法を設定します。

**`exactMatchBoost`** ：検索されたキーワードが文書の `title` フィールドと完全に一致した場合に、さらにブーストをかける。

**`maxExpansions`** ：フレーズのプレフィックスとして `title` フィールドに検索されたキーワードをマッチさせる際に返すドキュメント数を制限する。 詳しくはElasticsearchの [Match Phrase Queryのドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-match-query-phrase.html) を参照してください。

### クラスター横断レプリケーション

このエントリは、Liferay Enterprise Searchのサブスクリプションで利用可能なクラスター横断レプリケーションモジュールを導入した場合にのみ表示されます。 これらの設定プロパティについては、専用の [クラスター横断レプリケーション](./liferay-enterprise-search/cross-cluster-replication/cross-cluster-replication.md) のドキュメントで説明されています。

### Elasticsearch の監視

**設定ファイル:** `com.liferay.portal.search.elasticsearch.monitoring.web.internal.configuration.MonitoringConfiguration.config`

Liferay Enterprise Searchのサブスクリプションで利用可能なLiferay Enterprise Search Monitoringモジュールを導入している場合、Elasticsearch Monitoringの構成を使用できます。 これらの設定プロパティについては、専用の [Elasticsearchをモニタリング](./liferay-enterprise-search/monitoring-elasticsearch.md) のドキュメントで説明しています。

### Elasticsearch 7

**設定ファイル:** `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config`

LiferayとElasticsearch 7の接続を設定します。 これらのプロパティの詳細については、 [コネクターを構成する](./installing-and-upgrading-a-search-engine/elasticsearch/connecting-to-elasticsearch.md#configuring-the-connector) を参照してください。

### Elasticsearch接続

**設定ファイル:** `com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConnectionConfiguration-[connectionId].config`

Liferay 7.3は、複数のElasticsearchクラスタに接続することができます。 接続はElasticsearch接続エントリで定義されます。 これにより、低レベル検索オプションおよび検索結果ウィジェットと組み合わせて使用することで、Elasticsearchクラスターを使用しているサードパーティシステムからの結果を表示することができます。 また、 [クラスター横断レプリケーション](./liferay-enterprise-search/cross-cluster-replication/cross-cluster-replication.md) のドキュメントでも紹介されています。

### Learning to Rank

**設定ファイル:** `com.liferay.portal.search.learning.to.rank.configuration.LearningToRankConfiguration.config`

Liferay Enterprise Searchのサブスクリプションで利用可能なLiferay Enterprise Search Learning to Rankモジュールを導入している場合、Learning to Rank構成を使用できます。 これらの設定プロパティについては、専用の [Learning to Rank](./liferay-enterprise-search/learning-to-rank.md) ドキュメントで説明しています。

### ウェブ検索

**設定ファイル：** `com.liferay.portal.search.web.internal.configuration.SearchWebConfiguration.config`

このエントリーには1つのプロパティが含まれています。

**`classicSearchPortletInFrontPage`** ：デフォルトの検索エクスペリエンスを、新しい検索ウィジェットの使用から、過去のリリースで標準だった非推奨のクラシック検索ポートレットに戻します。

### 同義語

**設定ファイル：** `com.liferay.portal.search.tuning.synonyms.web.internal.configuration.SynonymsConfiguration.config`

このエントリは、1つの繰り返し可能なプロパティを持っています（ [OSGi構成ファイル](../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) で定義している場合は、配列構文を使用します）。

**`synyonymFilterNames`** ：適用する類義語フィルター名を設定する。 これらのフィルターはElasticsearch Index Settingsで定義する必要があります。 [Creating New Synonym Language Filters](./search-administration-and-tuning/synonym-sets.md#creating-new-synonym-language-filters) を参照してください。

### 検索管理

**コントロールパネル**&rarr;**設定**&rarr;**検索** には、3つの管理用UIがある：Connections、Index Actions、Field Mappings です。

詳しくは、専用の [検索管理とチューニング](./search-administration-and-tuning.md) のドキュメントをご覧ください。

#### つながり

検索エンジンへの接続情報が表示されます。 例えば、

* 検索エンジンベンダー：Elasticsearch
* クライアントのバージョン：7.16.3
* 有効な接続：1
* 稼働状態：緑
* 接続ID：\_REMOTE\_
* 接続タイプ：読み取り/書き込み
* クラスター名：LiferayElasticsearchCluster
* ノード：1
* ノード名：lr-es
* ノードバージョン：7.17.14

#### インデックス管理

アクションをインデックスでは、これらのレベルのいずれかでインデックスを再作成します。

* すべてのインデックス可能アセット
* 個々のインデックス可能アセット
* すべてのスペルチェック用インデックス

#### フィールドマッピング

### ポータルプロパティ

ポータルプロパティは、システムにも適用されます。 [Lucene検索](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Lucene%20Search) ポータルプロパティは、低レベルの検索動作を構成します。 プロパティとその説明を見て、自分の検索条件に当てはまるかどうかを判断します。

## 関連する内容

* [検索管理およびチューニング](search-administration-and-tuning.md)
* [Elasticsearch Connector 構成リファレンス](./installing-and-upgrading-a-search-engine/elasticsearch/elasticsearch-connector-configuration-reference.md)
* [Elasticsearch を始める](./installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md)
