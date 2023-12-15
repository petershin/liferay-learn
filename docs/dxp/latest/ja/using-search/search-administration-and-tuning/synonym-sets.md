# 同義語セット

{bdg-primary}`サブスクリプション`

```{note}
この機能は [Elasticsearch](../installing-and-upgrading-a-search-engine/solr/solr-limitations.md) でのみ動作します。
```

同義語セットとは、同じ意味を持つ単語やフレーズを集めたものです。 管理者であるユーザーが同義語セットを作成し、検索ページのエンドユーザーがキーワードやフレーズを検索すると、セット内の同義語も検索されます。

たとえば、ユーザーが「US」という単語を検索するとします。 おそらくユーザーは、 **America** 、 **U.S.A** 、 **United States** などの同義語も含む検索結果を求めるだろう。 同義語セットを作成することで、ユーザーが検索を最大限に活用できるようになります。

## 要求事項と制限事項

同義語セットは、Elasticsearchを検索エンジンとして使用している場合にのみサポートされます。 Elasticsearchのインストールについては、 [Elasticsearchを開始する](../installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.md) を参照してください。

同義語セットは現在、すぐに使用可能なロケール（英語またはスペイン語）のいずれかでインデックス付けされたフィールドで機能します。 これら2つの言語のいずれかでローカライズ可能なフィールドを持つLiferayアセットは、同義語セットで機能します。

Elasticsearch でサポートされている [`=>` フォーマット](https://www.elastic.co/guide/en/elasticsearch/guide/current/synonyms.html) は Synonyms Set UI ではサポートされていません。

## 同義語セットの作成と管理

必要な数の同義語キーワードをセットに追加して、同義語セットを作成します。 同義語セットが保存されると、同じ会社スコープ（同義語が設定された [仮想インスタンス](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md) の任意のサイト）での検索が有効になります。

新しい同義語セットを作成するには、

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))から **アプリケーション** &rarr; **検索チューニング** &rarr; **類義語** に移動します。

   ![Navigate to the Synonyms section in the Applications menu](synonym-sets/images/01.png)

1. 新しい類義語セットを追加するには、 **追加** アイコン（ [追加アイコンをクリック](../../images/icon-add.png) ）をクリックします。

1. セット内の同義語のリストを入力します。 同義語の入力は、 **Enter** をクリックするか、カンマを入力することで行える。

   ![Type your different synonym words into the set.](synonym-sets/images/02.png)

1. 同義語の横にある **X** をクリックすると、同義語を削除することができます。 セットが完了したら、 **Publish** をクリックします。

1. セットを編集または削除するには、 **Options** アイコン(![オプションアイコンをクリックしてください。](../../images/icon-options.png))をクリックし、 **Edit** または **Delete** をクリックします。

   ![Click on edit or delete to make changes.](synonym-sets/images/03.png)

   同義語セットが公開されると、使用できるようになります。

## 同義語セットの使用

セットに保存した同義語キーワードの1つを検索することで、同義語セットをテストできます。 キーワードと同義語に一致する結果が検索結果ウィジェットに返されます。

![Try searching for a synonym from your set.](synonym-sets/images/04.png)

上記の例では、月面車に関するこのブログ記事には「LRV」という単語は含まれていませんが、検索結果の一致として返されるようになりました。 同義語が強調表示されていることにも注目してください。

## 新しいシノニム言語フィルタの作成

> **Availability：Liferay DXP 7.3 FP2+ および Liferay DXP 7.2 FP13+** が利用可能です。

Synonyms Setsは、すぐに [英語とスペイン語のみ](#requirements-and-limitations) の同義語をサポートします。 他の言語に対応するためには、以下のような設定が必要です。

- デフォルトの [French](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/analysis-lang-analyzer.html#french-analyzer) 解析器に必要な変更を加えて再実装し、 [カスタム解析器](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/analysis-custom-analyzer.html) を作成する（パイプラインに追加の [Synonym graph token filter](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/analysis-synonym-graph-tokenfilter.html) を含む）。
- コネクタ構成の追加インデックス設定を使用して、カスタム・アナライザー定義をインデックス設定に追加します。
- コネクタ構成の［タイプマッピングを上書き］設定を使用して、Liferay DXPのデフォルトのタイプマッピングをオーバーライドして、目的のフィールドにカスタム・アナライザーを適用します。
- 新しい設定を適用するためにインデックスを再作成します。

### 前提条件デフォルトマッピングの取得

カスタマイズする前に、Elasticsearch コネクタのデフォルトの JSON マッピングを取得する必要があります。

実行中のLiferayからマッピングを取得する、

1. グローバルメニュー(![グローバルメニュー](../../images/icon-applications-menu.png))を開き、 **コントロールパネル** &rarr; **検索** に進みます。
1. フィールドマッピング_タブをクリックする。
1. マッピングをコピーし (![Copy](../../images/icon-copy.png)) 、保存する。

```{warning}
インデックスのマッピングや設定は、バージョン間で変更されることがあり、場合によっては（Fix PackやService Packによって）マイナーバージョンの中でも変更されることがあります。 マッピングや設定のカスタマイズは、アップグレードや新しいパッチレベルへの移行時に見直し、必要に応じて対応する必要があります。 さらに、Liferayのサーチチームは、将来のバージョンでは、より多くの言語をサポートすることを計画しており、カスタマイズが不要になります。
```

### 言語の追加

これでデフォルトのマッピングファイルができたので、必要な変更を加えてフランス語の同義語に必要な設定を追加します。

1. Elasticsearch接続の「システム設定」エントリ---Elasticsearch 6/7にアクセスしてください。

1. Additional Index Configurations フィールドに `analysis` ブロックを追加：

   ```json
   {
       "analysis": {
           "analyzer": {
               "custom_liferay_analyzer_fr": {
                   "filter": [
                       "french_elision",
                       "lowercase",
                       "french_stop",
                       "my-synonym-filter-fr",
                       "french_stemmer"
                   ],
                   "tokenizer": "standard"
               }
           },
           "filter": {
               "my-synonym-filter-fr": {
                   "lenient": true, 
                   "synonyms": [],
                   "type": "synonym_graph"
               },
               "french_stop":{
                   "type":"stop",
                   "stopwords":"_french_"
               },
               "french_stemmer":{
                   "type":"stemmer",
                   "language":"light_french"
               },
               "french_elision": {
                   "type": "elision",
                   "articles_case": true,
                   "articles": [
                       "l", "m", "t", "qu", "n", "s",
                       "j", "d", "c", "jusqu", "quoiqu",
                       "lorsqu", "puisqu"
                   ]
               }
           }
       }
   }
   ```

   このコンフィギュレーションに設定を追加することで、すぐに使えるインデックス設定に利用可能なものが追加される。 ソースコードの`index-settings.json`ファイルでデフォルトのJSON設定を見つける。 ここでは `custom_liferay_analyzer_fr` という新しいアナライザーを作成し、新しいフィルター `my-synonym-filter-fr` を使っています。 今のところ `synonyms` 配列は空です：UI から作成されたシノニムセットはここに表示されます。

1. コピーしたマッピングファイルを修正する。 冒頭の中かっこ `{` は残し、2行目と3行目（インデックス名の行と `mappings` の行）を完全に削除する：

   ```json
   "liferay-[COMPANY_ID]": {
       "mappings" : {
   ```

   次に、マッピングの最後から、最後の2つの中括弧を削除します。

   ```json
       }
   }
   ```

   ```{note}
   Liferay 7.4 U80 以前では、JSON ファイルの最初に `LiferayDocumentType` 宣言を含める必要があります。 例えば、 [Liferay 7.4 GA80 mappings](https://github.com/liferay/liferay-portal/blob/7.4.3.80-ga80/modules/apps/portal-search-elasticsearch7/portal-search-elasticsearch7-impl/src/main/resources/META-INF/mappings/liferay-type-mappings.json) を参照してください。
   ```

1. Override Type Mappingsフィールドを使用して、`template_fr`ダイナミックフィールドのアナライザーをカスタムアナライザー（`custom_liferay_analyzer_fr`）を使用するように変更します：

   ```{important}
   この例は、簡潔にするために切り取られています。 Override Type Mappingsは、Liferayのデフォルトの型マッピングを完全にオーバーライドして無視しますので、オーバーライドされた部分だけでなく、完全なマッピングファイルを提供する必要があります。   
   ```

   ```json
    {
     "date_detection": false,
     "dynamic_templates": [
         // (...)
         {
             "template_fr": {
                 "mapping": {
                     "analyzer": "custom_liferay_analyzer_fr",
                     "store": true,
                     "term_vector": "with_positions_offsets",
                     "type": "text"
                 },
                 "match": "w+_frb|w+_fr_[A-Z]{2}b",
                 "match_mapping_type": "string",
                 "match_pattern": "regex"
             }
         },
         // (...)
   ```

   ここで重要な変更は、デフォルトで割り当てられているアナライザ (`french`) が、カスタムアナライザ `custom_liferay_analyzer_fr` に置き換えられていることです。

1. 設定の変更を保存します。

   ```{tip}
   Sidecar Elasticsearch サーバーを使用している場合、コンソールにエラーが表示されることがあります。 Liferay DXPを再起動すると問題が解決します。
   ```

1. ここで、「システム設定」の &rarr; 「検索」 &rarr; 「同義語」を選択します。

1. カスタムフィルター名（例：`custom-synonym-filter-fr`）をフィルター名設定に追加し、設定を保存する。

1. 完全な リ イ ンデ ッ ク ス を実行 ： コ ン ト ロール パネル &rarr; Search &rarr; Index Actions で、 All Search Indexes の **Reindex** をク リ ック。

   カスタムマッピングが正常に適用されたことを確認するには、フィールドマッピングタブに移動し、インデックス（例えば `liferay-20101`）を選択し、右側のパネルで `template_fr` を探します。

   カスタムアナライザーを含む追加インデックス設定も追加されていることを確認するには、Elasticsearch に以下の API コールを行います：`http://<host>:<port>/liferay-[company-id]/_settings` と呼び、レスポンスの中にアナライザ名を探します。 例えば、`localhost`で動作している Liferay DXP サーバーの sidecar Elasticsearch サーバーのインデックス設定を`20101` で見るには、 <http://localhost:9201/liferay-20101/_settings>にアクセスしてください。

新しいフィルターが動作していることを確認するため。

1. グローバルメニューのアプリケーションタブで、 **Synonyms**（サーチチューニングの下）をクリックします。

1. 新しい類義語セットを作成する： `maison, logement`.

1. 英語とフランス語の翻訳付きのウェブコンテンツ記事を作成します。 フランス語のタイトルに **maison** を加える。

1. 英語とフランス語の翻訳付きで、別のWebコンテンツ記事を作成します。 フランス語のタイトルに **logement** を加える。

1. フランス語のロケールに切り替え、 **maison** を検索する。 両方の記事が返されます。
