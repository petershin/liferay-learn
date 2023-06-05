# カスタムファセット

カスタムファセットは、標準機能の検索ファセットの中でもユニークなものです。 結果を単一の静的フィールド（更新日やアセットタイプなど）でグループ化するのではなく、カスタムファセットを使用して結果をグループ化するフィールドを選択します。 さらにカスタマイズして、まったく新しいファセットを作成できます。

## カスタムファセットの設定

1. ページ上部の **追加** アイコン（![Add icon](../../../images/icon-add-app.png)）をクリックします。

1. カスタムファセットを見つけて、左側のファセットのコレクションにドラッグします。 カスタムファセットは、ウィジェットの［検索機能］セクションにあります。

   ![検索ウィジェットの下でカスタムファセットを見つけます。](custom-facet/images/01.png)

1. ファセットの **オプション** アイコン（![Options icon](../../../images/icon-app-options.png)）をクリックし、 ［**設定**］ をクリックします。

   ![［設定］オプションをクリックします。](custom-facet/images/02.png)

   カスタムファセットには、以下で説明するいくつかの設定オプションがあります。

1. オプションの設定が終了したら、 ［**保存**］ ボタンをクリックします。

**ディスプレイの設定：****デフォルト** 、 **コンパクトレイアウト** 、 **ラベルレイアウト** の中から選択します。 デフォルトのレイアウトでは、各用語の横にチェックボックスが表示されますが、コンパクトレイアウトでは表示されません。 ラベルレイアウトでは、用語ごとにクリック可能な小さなラベルが表示されます。

詳細設定には、追加のオプションが含まれています。

**集約フィールド：** 結果を集計するインデックス付きフィールドの名前を入力します。 これは、分析されていないキーワードフィールドでなければなりません。 詳細は、以下を参照してください。

**カスタム見出し：** このファセットに表示する見出しを入力します。 設定されていない場合、集約されたフィールド名が表示されます。

**カスタムパラメータ名：** 選択した値のURLパラメーター名を指定します。 設定されていない場合、集約されたフィールド名が使用されます。

**最大ターム数：** ファセットに一致する用語がいくつ見つかったかに関係なく、表示するファセット用語の最大数を設定します。

**頻度の閾値：** 用語がファセット用語のリストに表示されるために必要な最小頻度を設定します。 たとえば、ファセットの頻度の閾値が3に設定されている場合、一致する結果が2つの用語は用語結果リストに表示されません。

**用語の並べ替え順序：** Liferay 7.4 U60+/GA60+では、［用語頻度（降順）］（デフォルト）、［用語頻度（昇順）］からファセット用語のソート戦略を選択することができます。 デフォルトのソートでは、ファセット用語の一致数が多いものから少ないものへと並べ替えられます。

**表示頻度：** 用語頻度を表示するかどうかを選択します。

**統合検索キー：** このウィジェットが参加している代替検索のキーを入力します。 設定されていない場合、このウィジェットはデフォルトの検索に参加します。 この値は通常、アプリケーション定義のインデックスの名前です。


## インデックス付きフィールドの検索

カスタムファセットを使用するには、構成で使用する非分析キーワードフィールドを知っておく必要があります。

```{tip}
Elasticsearchは複数の方法でフィールドのインデックス化をサポートしています。 いくつかのテキストフィールドは、マッピングの中で `raw` [multi-fields](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/multi-fields.html) とネストされている場合や、そのフィールドが `fieldName_sortable` として (`keyword` として) 別のフィールドマッピングで追加マッピングされている場合にキーワードフィールドとして使用することができます。 以下の例では、カスタムフィールドのファセットを作成し、Elasticsearchのマルチフィールドのコンセプトを活用しています。
```

使用可能なフィールドのリスト全体を参照するには、［**コントロールパネル**］→［**構成**］→［**検索**］（［**フィールドマッピング**］タブをクリック）からフィールドマッピングを調べます。 ここでは、数多くのインデックスを見ることができます。 興味のあるLiferayアセットは、 [company index](../../search-administration-and-tuning/elasticsearch-indexes-reference.md)にインデックスされており、 `liferay-20101` のような名前になっています（`20101` はカンパニーID）。

あるいは、検索エンジンのAPIを使ってマッピングを閲覧することもできます。 Elasticsearchでは、端末からcURLを使ってフィールドマッピングにアクセスし、 [Get Mapping API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/indices-get-mapping.html) を呼び出すことができます。

```{tip}
 [Kibanaの](../../liferay-enterprise-search/monitoring-elasticsearch.md) 開発ツールコンソールは、Elasticsearch APIの呼び出しを行うのに、cURL よりも便利です。
```

 ```bash
curl -X GET "localhost:9200/_mapping/LiferayDocumentType"?pretty
 ```

Solrは [ListFields API](https://lucene.apache.org/solr/guide/6_6/schema-api.html#SchemaAPI-ListFields) を使用します。

```bash
curl http://localhost:8983/solr/liferay/schema/
```

以下は、Elasticsearchの例からの出力の一部です。

```json
"ddmStructureKey": {
  "store": true,
  "type": "keyword"
},
"ddmTemplateKey": {
  "store": true,
  "type": "keyword"
},
"defaultLanguageId": {
  "store": true,
  "type": "keyword"
},
"description": {
  "store": true,
  "term_vector": "with_positions_offsets",
  "type": "text"
},
"discussion": {
  "store": true,
  "type": "keyword"
},
```

## カスタムフィールドへのアクセス

[カスタムフィールド](./../../../system-administration/configuring-liferay/adding-custom-fields.md) を作成し、 **キーワードとして検索可能** という設定を有効にすると、カスタムフィールドはバックアセット（Blogs Entriesなど）と一緒にインデックス化されます。 再インデックス化後は、既存のエントリーにも適用されます。 フィールド自体はテキストフィールドで、`expando__keyword__custom_fields__Enabled`のような名前ですが（カスタムフィールドUIで **Enabled** というフィールド名をつけた場合）、別の`raw`のキーワードフィールドを作成するためのネストしたフィールドマッピングが含まれています。

カスタム・ファセットで生のフィールドを使用するには、 `.raw` を、 **集約フィールド** .raw のカスタム・フィールド名に追加します。

`expando__keyword__custom_fields__Enabled.raw`

以下は、Kibanaで実行してテキストフィールドのマッピングを検査するためのクエリです（インデックス名のパラメータで、Company Id---`20097`---を置き換えます）。

```bash 
GET /liferay-20097/_mapping/field/expando__keyword__custom_fields__Enabled
```

JSONが返されます。

```json
{
  "liferay-20097" : {
    "mappings" : {
      "expando__keyword__custom_fields__Enabled" : {
        "full_name" : "expando__keyword__custom_fields__Enabled",
        "mapping" : {
          "expando__keyword__custom_fields__Enabled" : {
            "type" : "text",
            "store" : true,
            "fields" : {
              "raw" : {
                "type" : "keyword"
              }
            },
            "analyzer" : "keyword_lowercase"
          }
        }
      }
    }
  }
}
```

すべての生のフィールドを見るには、インデックスに `*.raw` フィールドを問い合わせます。

```bash 
GET /liferay-20097/_mapping/field/*.raw
```

カスタムフィールドを検索可能に設定することは、エンティティが変更されたとき、または再インデックスがトリガーされたときに、フィールドの値がインデックスされることを意味します。 `java.lang.String` フィールドのみを検索可能にすることができます。

## ネストされたフィールドにアクセスする

オブジェクト定義フィールドとウェブコンテンツ構造フィールドは、Elasticsearchではネストされたフィールドとしてインデックスされます。

Liferay 7.4 U72/GA72+では、Custom FacetウィジェットのAggregation Fieldの設定でこれらのフィールドを使用することができます。 そのためには、これらの要素をピリオドで区切って入力します：

* 親フィールド

* フィールド名を保持するフィールド名

* 値を保持するフィールドの名前

この例では、オブジェクトフィールドを参照しています：

```
nestedFieldArray.lastAccessed.value_date
```

この例では、Web コンテンツ構造フィールドを参照しています：

```
ddmFieldArray.ddm__keyword__40806__Textb5mx_en_US.ddmFieldValueKeyword_en_US_String_sortable
```

### Custom FacetでObject Definition Fieldsを使用する。

{bdg-secondary}`7.4 u72+/ga72+`

[オブジェクト定義](../../../building-applications/objects.md) フィールドをインデックス内の既存のドキュメントで見つけるには、検索結果ウィジェットの [結果をドキュメントフォームで表示](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) 設定を使用します。

文書には、 `nestedFieldArray` フィールドがあり、内容が入れ子になっています：

```json
"nestedFieldArray" : [
   {
     "fieldName" : "lastAcessed",
     "valueFieldName" : "value_date",
     "value_date" : "20230502000000"
   },
   {
     "fieldName" : "immunityType",
     "valueFieldName" : "value_keyword",
     "value_keyword" : "diplomatic"
   },
   {
     "fieldName" : "randomNumber",
     "valueFieldName" : "value_integer",
     "value_integer" : "19"
   }
],
```

Custom FacetウィジェットのAggregation Field構成でオブジェクトフィールドを使用するには、親フィールド（例： `nestedFieldArray`）、フィールド名を保持するフィールド名（例： `fieldName`）、値を保持するフィールド名（例： `value_date`）を指定します。 このパターンを使用します: `nestedFieldArray.[fieldName][valueFieldName]`.

例えば、 `nestedFieldArray.lastAccessed.value_date`と入力すると、上の入れ子配列の `lastAccessed` の日付フィールドでソートできます。

### Custom FacetでWeb Content Structure Fieldsを使用する。

[ネストされたウェブコンテンツ構造（DDM）フィールド](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) をインデックス内の既存文書で見つけるには、検索結果ウィジェットの [結果を文書フォームで表示](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) 設定を使用します。

文書には、 `ddmFieldArray` フィールドがあり、ネストされたコンテンツがあります：

```json
 "ddmFieldArray" : [
    {
      "ddmFieldName" : "ddm__keyword__40806__Textb5mx_en_US",
      "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
      "ddmFieldValueKeyword_en_US_String_sortable" : "some text has been entered",
      "ddmFieldValueKeyword_en_US" : "some text has been entered"
    },
    {
      "ddmFieldName" : "ddm__keyword__40806__Selectjdw0_en_US",
      "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
      "ddmFieldValueKeyword_en_US_String_sortable" : "option 3",
      "ddmFieldValueKeyword_en_US" : "value 3"
    },
    {
      "ddmFieldName" : "ddm__keyword__40806__Boolean15cg_en_US",
      "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
      "ddmFieldValueKeyword_en_US" : "true",
      "ddmFieldValueKeyword_en_US_String_sortable" : "true"
    }
  ],
```

これらのフィールドをカスタムファセットで使用するには、ウィジェットの集計フィールドに `ddmFieldName` の値（例： `ddm__keyword__40806__Testb5mx_en_US`）を入力します。

お使いのバージョンによっては、DDMフィールドの [ネストされたフィールドストレージ](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) がElasticsearchのデフォルトで有効になっている場合があります：

| Liferayのバージョン    | ネストされたフィールドはデフォルトで有効 |
|:---------------- |:-------------------- |
| 7.4 すべてのアップデート   | &#10004;             |
| 7.3 すべてのアップデート   | &#10004;             |
| DXP 7.2 SP3/FP8+ | &#10008;             |

動作を変更するには、システム設定 &rarr; Dynamic Data Mapping Indexer の **Enable Legacy Dynamic Data Mapping Index Fields** の設定を使用します。
