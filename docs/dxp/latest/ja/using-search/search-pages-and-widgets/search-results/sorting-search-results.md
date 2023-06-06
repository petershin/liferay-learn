# 検索結果の並べ替え

[検索結果](./search-results.md) ウィジェットに表示される検索結果は、デフォルトで [関連性スコア](./search-results.md#search-results-relevance) （ [検索エンジン](https://www.elastic.co/guide/en/elasticsearch/guide/master/scoring-theory.html) が算出したもの）順に並んでいます。 Sortウィジェットを使用すると、ユーザーは返された結果の順序を制御することができます。

[検索ページ](../working-with-search-pages/search-pages.md) にウィジェットを追加すると、結果の並べ替えを開始します。

アウトオブボックスでは、関連性ソートの代わりに、これらの方法で結果を順序付けることができます：

- タイトル別アルファベット
- 更新日順（デフォルトでは新しいものから、または古いものから選択可能）
- 作成日順（デフォルトでは新しいものから、または古いものから選択できます。）
- 各アセットを作成したユーザーのアルファベット順

ソートウィジェットは、あらかじめ設定されたソート戦略から1つを選択するか、独自の戦略を設定することができます。

また、ウィジェットから不要なソートオプションを削除することも可能です。

## ページにSort Widgetを追加する

ソートウィジェットを使い始めるには

1. ページの［追加］メニュー（![Add](../../../images/icon-add-widget.png)）を開き、［ウィジェット］セクションを展開します。

1. ［検索］カテゴリから、並べ替えウィジェットをページにドラッグします。

## ソートウィジェットの設定

```{note}
Liferay 7.4 DXP Update 29+/CE GA 29+で、Sortウィジェットの設定画面が更新されました。 一定期間、_Switch to Classic View_というリンクをクリックすることで、古い設定画面を使用することを選択できます。

![従来のソート設定と、より直感的な新しい設定画面を切り替える](./sorting-search-results/images/03.png)

従来の設定画面を使用するオプションは、将来のアップデート/GAで削除される予定です。
```

ソートウィジェットの設定画面では、以下のことができます。

- デフォルトの「関連性」ソートオプションを無効にします。
- 既存のソートオプションを編集する
- オプションの削除
- 新規オプションの追加

![ソートウィジェットで検索結果の並び替えが可能です。](./sorting-search-results/images/04.gif)

```{note}
関連性はオン・オフが可能ですが、完全に取り除くことはできません。 関連性を有効にすると、デフォルトの検索エンジンの動作が使用されます：結果は関連性の高い降順でソートされます（最も高いスコアを最初に）。
```

ウィジェット構成画面にアクセスするには、ウィジェットの［オプション］メニュー（![Options](../../../images/icon-app-options.png)）を開き、［**構成**］をクリックします。

各ソートオプションには3つの設定があります： **インデックス付きフィールド** 、 **表示ラベル** 、 **順序** 。

**Indexed Field（インデックス・フィールド）：** ソートするインデックス付きフィールドの `fieldName` を入力します。 ほとんどの場合、これは [キーワード](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/keyword.html) フィールドです。 その他、 `date` および任意の [numeric datatype](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/number.html) が使用可能です。 さらに、 `テキスト` フィールドを強制的にソートウィジェットで動作させる方法もあります（下記参照）。

**表示ラベル：** 設定されているソートの種類に応じた表示ラベルを設定します。

**順序を指定します：** 昇順または降順で並べ替えるかどうかを選択します。 クラシックビューを使用している場合、または更新された設定UIを含まない以前のLiferayのバージョンを使用している場合は、 [クラシック設定でのソート順序を制御する](#controlling-the-sort-order-in-the-classic-configuration) をご覧ください。

![ソートウィジェットの設定から、ソートオプションの追加、編集、削除を行います。](./sorting-search-results/images/02.png)

## デフォルトのソート動作の変更

初期設定では、関連性オプションがソートウィジェットのリストで最初に表示され、ページに適用されるデフォルトの並べ替えになります。 そのため、検索を実行すると、結果は関連性の高い順に並べられます。 関連性による検索は、ほとんどのユーザーにとって期待されるデフォルトの動作ですが、ソートウィジェット設定の最初のオプションを変更することで、デフォルトの検索に異なるソート戦略を及ぼすことができます。

デフォルトのソートオプションを変更するには、次のようにします。

1. ウィジェットオプションの ![Widget Options](../../../images/icon-widget-options.png) ボタンをクリックして、ソートウィジェットの設定画面を開きます。

1. 関連性オプションの下にある追加![Add](../../../images/icon-duplicate.png) ボタンをクリックします。

1. 現在の関連性オプションの値を複製します。これにより、関連性がリストの2番目のオプションになります。

1. ここで、トップオプションを変更します。 既存のオプションを選択した場合は、削除![Minus](../../../images/icon-minus.png)をクリックして重複したオプションを削除してください。

1. 設定を保存します。 検索を入力すると、新しいソートが適用されたことがわかります。

## ソート可能なフィールドを探す

適切な権限を持つユーザーは、 **コントロールパネル** &rarr; ［**設定**］ &rarr; ［**検索機能**］ へ行き、ソートウィジェットで使用できるフィールドを見つけることができます。  そこから、［フィールドマッピング］タブを開き、各インデックスのマッピングを参照します。  マッピングの `プロパティ` セクションまでスクロールし、 `キーワード` フィールド、 `日付` フィールド、または数値データ型を持つフィールドを見つけます。 `タイプ` の項目が参考になる：

    "type" : "keyword"
    
    "type" : "date"
    
    "type" : "long"

どうしても `テキスト` のフィールドでソートしたい場合は、新しいバージョンのフィールドをタイプ `キーワード`でインデックスに追加してください。 上記のフィールドマッピング画面で、 `liferay-［companyID］`というインデックスの `firstName` フィールドを確認します。

```
"firstName" : {
    "type" : "text",
    "store" : true
},
"firstName_sortable" : {
    "type" : "keyword",
    "store" : true
},
```

`_sortable`という接尾辞を持ち、ソートに適したタイプの対応するフィールドがあります（`keyword`）。 ソート可能なフィールドは、 [ポータルのプロパティ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Lucene%20Search) を通して得られたものです。

```properties
index.sortable.text.fields=firstName,jobTitle,lastName,name,screenName,title
```

ここに挙げたすべてのテキストフィールドには、 `fieldName_sortable` の対応表がインデックスに自動的に作成されます。 さらに追加するには、このプロパティをLiferay Homeフォルダの [`portal-ext.properties`](./../../../installation-and-upgrades/reference/portal-properties.md) ファイルにコピーし、ソートする必要がある新しいフィールド名を追加して、サーバーを再起動します。

## 新しいソートオプションの追加

新しいフィールドまたは適切なタイプの既存のフィールドでソートするには、 **Add Option** ボタンをクリックします。

```{tip}
ウィジェットの設定で、テキストフィールドの `fieldName_sortable` バージョンを必ず使用してください。 
```

すでに適切なデータ型になっているソートオプションを新たに追加するには、任意のオプションの **フィールド** 設定の下にあるプラス記号を使い、フィールドを埋めてください。 設定画面でのオプションの順序は、検索用ウィジェットを設定する際の選択リストでの順序と同じです。

## ソートオプションの編集・削除

既存のオプションを編集するには、その設定セクションのテキストを編集します。

既存のオプションを削除するには、ゴミ箱アイコンを使用します。

## クラシック構成でソート順を制御する

クラシック構成でソートオプションの順序を制御するには、 `fieldName`の後にプラスまたはマイナスの記号を追加してください。 **作成済み** と **作成済み（古い順**） というラベルのついた既存のソートオプションで、どのように動作するのかを見てみましょう：

**ラベル：** **作成日_** フィールド：** `create-date`となります。

フィールド名の後に続く `-` の記号は、順序が **降順であることを示します** 。  この方法でソートすると、最近作成された検索結果がリストの一番上に表示されます。

**ラベル：** **作成日（古い順**）**フィールド。** `createDate⁺`となります。

フィールド名の後に続く `+` の記号は、順序が **昇順であることを示します** 。  この方法でソートすると、作成日の古い結果がリストの上位に表示されます。

## ネストしたフィールドでのソート

### オブジェクト定義フィールドによる並べ替え

{bdg-secondary}`7.4 u72+/ga72+`

[オブジェクト定義](../../../building-applications/objects.md) フィールドは、Elasticsearch ではネストされたフィールドとしてインデックスされます。 インデックス内の既存の文書にあるオブジェクトフィールドを検索するには、検索結果ウィジェットの [Display Results in Document Form](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) 設定を使用します。

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
     "fieldName" : "luckyNumber",
     "valueFieldName" : "value_integer",
     "value_integer" : "19"
   }
],
```

オブジェクトのフィールドでソートするには、 `nestedFieldArray のパターンに従った特別な表記が必要です。[fieldName][valueFieldName]`. 例えば、上記の入れ子配列の `lastAccessed` 日付フィールドでソートするには、Sort ウィジェット構成の Indexed Field として `nestedFieldArray.lastAccessed.value_date` を入力します。

### Webコンテンツ構造フィールドによる並べ替え

{bdg-secondary}`7.2 FP12+、7.3 FP2+、7.4（すべてのアップデート）`

ソートウィジェットは、キーワード、日付、数値の各フィールドに対応しています。 インデックス内の既存文書にあるウェブコンテンツ構造（DDM）フィールドを検索するには、検索結果ウィジェットの [Display Results in Document Form](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) 設定を使用します。

ドキュメントは、 `ddmFieldArray` オブジェクトを持ち、ネストされたコンテンツを持ちます：

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

これらのフィールドをソート構成で使用するには、 `ddmFieldName` の値（例： `ddm__keyword__40806__Testb5mx_en_US`）を Indexed Field 設定として入力してください。

お使いのバージョンによっては、 [ネストされたフィールドストレージ](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) がElasticsearchのデフォルトで有効になっている場合があります：

| Liferayのバージョン    | ネストされたフィールドはデフォルトで有効 |
|:---------------- |:-------------------- |
| 7.4 すべてのアップデート   | &#10004;             |
| 7.3 すべてのアップデート   | &#10004;             |
| DXP 7.2 SP3/FP8+ | &#10008;             |

動作を変更するには、システム設定 &rarr; Dynamic Data Mapping Indexer の **Enable Legacy Dynamic Data Mapping Index Fields** の設定を使用します。

