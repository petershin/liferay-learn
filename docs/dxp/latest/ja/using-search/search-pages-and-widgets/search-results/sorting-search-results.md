# 検索結果の並べ替え

[検索結果](./search-results.md) ウィジェットに表示される検索結果は、デフォルトでは [関連性スコア](./search-results.md#search-results-relevance) ( [検索エンジン](https://www.elastic.co/guide/en/elasticsearch/guide/master/scoring-theory.html) によって計算される) の順に並びます。 Sortウィジェットを使用すると、ユーザーは返された結果の順序を制御することができます。

[検索ページ](../working-with-search-pages/search-pages.md) にウィジェットを追加して、結果の並べ替えを開始します。

箱の外では、関連性の並べ替えの代わりに、これらの方法で結果を並べ替えることができます：

- アルファベット順
- 更新日順 (デフォルトでは新しいものから、または古いものから)
- 作成日順 (デフォルトでは新しいものから、または古いものから選択)
- 一致する各アセットを作成したユーザーによるアルファベット順

並べ替えウィジェットの設定済み並べ替えストラテジーの中から1つを選ぶか、独自の並べ替えストラテジーを設定します。

また、ウィジェットから不要な並べ替えオプションを削除することもできます。

## ソートウィジェットをページに追加する

ソートウィジェットを使い始めるには

1. ページの［追加］メニュー（![Add](../../../images/icon-add-widget.png)）を開き、［ウィジェット］セクションを展開します。

1. ［検索］カテゴリから、並べ替えウィジェットをページにドラッグします。

## ソートウィジェットの設定

```{note}
Liferay 7.4 DXP Update 29+/CE GA 29+でソートウィジェットの設定画面が更新されました。 一定期間、_Switch to Classic View_というリンクをクリックすることで、古い設定画面を使用することができます。

![古典的なソート設定と、より直感的な新しい設定画面を切り替えます。](./sorting-search-results/images/03.png)

古典的な設定ビューを使用するオプションは、将来の更新/GAで削除されます。
```

Sortウィジェットの設定画面では、以下のことができます。

- デフォルトの関連性の並べ替えオプションを無効にします。
- 既存の並べ替えオプションを編集する
- オプションの削除
- 新しいオプションを追加する

![ユーザーは、並べ替えウィジェットで検索結果を並べ替えることができます。](./sorting-search-results/images/04.gif)

```{note}
関連性はオン・オフできるが、完全に取り除くことはできない。 関連性を有効にすると、デフォルトの検索エンジンの動作が使用されます：結果は関連性の降順でソートされます（スコアが高い順）。
```

ウィジェット構成画面にアクセスするには、ウィジェットの［オプション］メニュー（![Options](../../../images/icon-app-options.png)）を開き、［**構成**］をクリックします。

各ソートオプションには3つの設定があります： **インデックス付きフィールド** 、 **表示ラベル** 、 **順序** 。

**インデックス付きフィールド：** ソートするインデックス付きフィールドの `fieldName` を入力します。 ほとんどの場合、これは [キーワード](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/keyword.html) フィールドである。 その他の許容可能なオプションは、 `date` 、任意の [numeric datatype](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/number.html) 。 `テキスト` フィールドを強制的にソートウィジェットで動作させる方法もある（下記参照）。

**表示ラベル：** 設定されているソートタイプの表示ラベルを設定します。

**順序：** 昇順または降順で並べ替えます。 クラシックビューを使用している場合、または更新されたコンフィギュレーションUIを含まない以前のLiferayバージョンを使用している場合は、 [クラシックコンフィギュレーションでソート順序を制御する](#controlling-the-sort-order-in-the-classic-configuration) を参照してください。

![ソートウィジェットの設定から、ソートオプションを追加、編集、または削除します。](./sorting-search-results/images/02.png)

## デフォルトのソート動作の変更

初期設定では、関連性オプションがソートウィジェットのリストで最初に表示され、ページに適用されるデフォルトの並べ替えになります。 そのため、検索を実行すると、結果は関連性の高い順に並べられます。 関連性による検索は、ほとんどのユーザーにとって期待されるデフォルトの動作ですが、ソートウィジェット設定の最初のオプションを変更することで、デフォルトの検索に異なるソート戦略を及ぼすことができます。

デフォルトのソートオプションを変更するには、次のようにします。

1. ウィジェットオプションの ![Widget Options](../../../images/icon-widget-options.png) ボタンをクリックして、ソートウィジェットの設定画面を開きます。

1. 関連性オプションの下にある追加![Add](../../../images/icon-duplicate.png) ボタンをクリックします。

1. 現在の関連性オプションの値を複製します。これにより、関連性がリストの2番目のオプションになります。

1. ここで、トップオプションを変更します。 既存のオプションを選択した場合は、削除![Minus](../../../images/icon-minus.png)をクリックして重複したオプションを削除してください。

1. 設定を保存します。 検索を入力すると、新しいソートが適用されたことがわかります。

## ソート可能なフィールドの検索

適切な権限を持つユーザーは、 **コントロールパネル** &rarr; ［**設定**］ &rarr; ［**検索機能**］ へ行き、ソートウィジェットで使用できるフィールドを見つけることができます。  そこから、［フィールドマッピング］タブを開き、各インデックスのマッピングを参照します。  マッピングの `プロパティ` セクションまでスクロールし、 `キーワード` フィールド、 `日付` フィールド、または数値データ型を持つフィールドを見つける。 `タイプ` フィールドが参考になる：

    "type" : "keyword"
    
    "type" : "date"
    
    "type" : "long"

どうしても `テキスト` フィールドでソートしなければならない場合は、 `キーワード`をタイプとして、新しいバージョンのフィールドをインデックスに追加する。 上記のフィールドマッピング画面で、 `liferay-［companyID］`というインデックスの `firstName` フィールドを確認します。

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

対応するフィールドには、 `_sortable`という接尾辞があり、ソートに適した型（`keyword`）があります。 ソート可能なフィールドは、 [ポータルのプロパティ](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) を通して得られたものです。

```properties
index.sortable.text.fields=firstName,jobTitle,lastName,name,screenName,title
```

ここに挙げたすべてのテキスト・フィールドには、 `fieldName_sortable` の対応するものがインデックスに自動的に作成されます。 さらに追加するには、このプロパティを Liferay Home フォルダの [`portal-ext.properties`](./../../../installation-and-upgrades/reference/portal-properties.md) ファイルにコピーし、並べ替えに必要な新しいフィールド名を追加して、サーバを再起動してください。

## 新しいソートオプションの追加

新しいフィールドまたは適切なタイプの既存のフィールドでソートするには、 **Add Option** ボタンをクリックします。

```{tip}
ウィジェットの設定で、テキストフィールドの`fieldName_sortable`バージョンを使用していることを確認してください。 
```

すでに適切なデータ型になっている新しいソート・オプションを追加するには、任意のオプションの **Field** 設定の下にあるプラス記号を使い、フィールドに記入する。 ここでの設定画面でのオプションの順序は、検索用ウィジェットを設定するときのセレクトリストでの順序と一致する。

## ソート・オプションの編集と削除

既存のオプションを編集するには、その設定セクションのテキストを編集する。

既存のオプションを削除するには、ゴミ箱アイコンを使用します。

## クラシック構成でソート順を制御する

クラシック構成でソート・オプションの順序を制御するには、 `fieldName`の後にプラスまたはマイナスの記号を追加する。 **Created** と **Created (oldest first**) というラベルの付いた既存のソート・オプションがどのように機能するかを理解するために、その方法を見てみよう：

**ラベル：****作成日_** フィールド：** `create-date`となります。

フィールド名に続く `-` の記号は、 **降順であることを示す** 。  この方法で並べ替えると、最近作成された検索結果がリストの一番上に来る。

**ラベル：****作成日（古い順**）**フィールド。** `createDate⁺`となります。

フィールド名に続く `+` の記号は、 **昇順であることを示す** 。  この方法で並べ替えると、最も古い（作成日の）結果がリストの一番上に来る。

## ネストしたフィールドでのソート

### オブジェクト定義フィールドによる並べ替え

{bdg-secondary}`7.4 u72+/ga72+`

[オブジェクト定義](../../../building-applications/objects.md) フィールドは、Elasticsearch ではネストされたフィールドとしてインデックスされます。 インデックス内の既存のドキュメントでオブジェクト・フィールドを検索するには、検索結果ウィジェットの [Display Results in Document Form](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) 設定を使用します。

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

オブジェクトのフィールドでソートするには、 `nestedFieldArrayのパターンに従った特別な表記が必要です。[fieldName][valueFieldName]`. たとえば、上記の入れ子配列の `lastAccessed` 日付フィールドでソートするには、Sortウィジェット構成のIndexed Fieldに `nestedFieldArray.lastAccessed.value_date` と入力します。

### Webコンテンツ構造フィールドによる並べ替え

{bdg-secondary}`7.2 FP12+、7.3 FP2+、7.4 (すべての更新)`

ソートウィジェットは、キーワード、日付、数値の各フィールドに対応しています。 インデックス内の既存のドキュメントでウェブコンテンツ構造（DDM）フィールドを検索するには、検索結果ウィジェットの [Display Results in Document Form](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) 設定を使用します。

ドキュメントは、 `ddmFieldArray` オブジェクトを持ち、ネストされたコンテンツを持つ：

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

これらのフィールドの1つをソート構成で使用するには、 `ddmFieldName` の値（例えば、 `ddm__keyword__40806__Testb5mx_ja_US`）をインデックス付きフィールド設定として入力する。

お使いのバージョンによっては、 [nested field storage](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) がElasticsearchのデフォルトで有効になっている場合があります：

| Liferayのバージョン    | ネストされたフィールドはデフォルトで有効 |
|:---------------- |:-------------------- |
| 7.4 すべてのアップデート   | &#10004;             |
| 7.3 すべてのアップデート   | &#10004;             |
| DXP 7.2 SP3/FP8+ | &#10008;             |

動作を変更するには、［システム設定］ &rarr; ［Dynamic Data Mapping Indexer］の **Enable Legacy Dynamic Data Mapping Index Fields** の設定を使用します。
