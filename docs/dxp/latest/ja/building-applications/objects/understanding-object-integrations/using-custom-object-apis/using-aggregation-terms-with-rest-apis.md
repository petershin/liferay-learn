# REST APIでの集計用語の使用

REST APIを使用してオブジェクトエントリーを照会する場合、オブジェクトのフィールドをファセット基準として使用してエントリーデータを集計できます。 これを行うには、GETリクエストに `aggregationTerms` パラメータを追加し、ファセット基準として使用したいデータフィールドを指定します。 これらの基準には、カスタム・フィールド、デフォルトのシステム・フィールド、またはリレーションシップ・フィールドを含めることができます。 リクエストのレスポンスは、指定されたデータファセットを一つの `facets` ブロックにグループ化する。

ここでは、`aggregatedTerms`パラメータと基本的なカスタムオブジェクトを使用します。

先に進む前に、新しい Liferay DXP/Portal 7.4インスタンスを [セットアップ](#setting-up-a-liferay-instance) し、提供されたチュートリアルコードを [準備](#preparing-the-sample-code) します。

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

[次に、以下の手順に従って、](../../creating-and-managing-objects/creating-objects.md) このチュートリアルの基本的なオブジェクトを作成します：

1. _グローバルメニュー_ (![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、*［コントロールパネル］_タブで_［オブジェクト］*をクリックします。

2. 追加*ボタン(![追加ボタン](../../../../images/icon-add.png))をクリックし、以下の値を入力する：

   | 項目      | 値       |
   | :------ | :------ |
   | ラベル     | `Able`  |
   | 複数形のラベル | `Ables` |
   | 名前      | `Able`  |

3. 新しい_オブジェクト_ドラフトを選択し、_フィールド_タブに行き、以下のテキストフィールドを追加する：

   | ラベル | 項目名 | 種類       | 必須       |
   | :-- | :-- | :------- | :------- |
   | 名前  | 名前  | テキストボックス | &#10004; |
   | 説明  | 説明  | テキストボックス |          |

4. 詳細*タブに移動し、 [_公開_](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) をクリックします。

   ```{important}
   このチュートリアルでは、上記の値を使用する必要があります。
   ```
公開後は、ヘッドレスAPIでオブジェクトにアクセスすることができます。

## サンプルコードを準備する

以下のコマンドを実行して、提供されたサンプルコードをダウンロードし、解凍してください。

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-b3x5.zip -O
```

```bash
unzip liferay-b3x5.zip
```

これらのスクリプトには、以下のAPIが含まれています。

| HTTP メソッド | HTTPエンドポイント | 説明                                                                  |
| :-------- | :---------- | :------------------------------------------------------------------ |
| GET       | `/`         | Liferayインスタンスのオブジェクトエントリーの完全なリストを返します。結果は、ページ分割、絞り込み、検索、およびソートが可能です |
| POST      | `/batch`    | API呼び出しで提供された詳細を使用して複数のオブジェクトエントリーを作成します                            |

## サンプルコードを使用する

1. サンプルコードをダウンロードしたら、`liferay-b3x5`プロジェクトの`curl`フォルダに移動します。

   ```bash
   cd liferay-b3x5/curl
   ```

2. Ables_POST_Batch` を実行する。 複数のオブジェクトエントリーを作成します。

   ```bash
   ./Ables_POST_Batch.sh
   ```

   端末には同様の出力が表示されるはずです。

   ```bash
   {
     "className" : "com.liferay.object.rest.dto.v1_0.ObjectEntry",
     "contentType" : "JSON",
     "errorMessage" : "",
     "executeStatus" : "STARTED",
     "externalReferenceCode" : "",
     "failedItems" : [ ],
     "id" : 1,
     "importStrategy" : "ON_ERROR_FAIL",
     "operation" : "CREATE",
     "processedItemsCount" : 0,
     "startTime" : "2022-04-27T00:18:23Z",
     "totalItemsCount" : 0
   }
   ```

3. Ables_GET_FromCompany`を実行すると、作成されたすべてのエントリーのリストを`aggregatedTerms` パラメータで返します。

   レスポンスには、`dateModified` と `description` という2つのファセット基準を持つ `facets` ブロックが含まれていなければならない。

   ```bash
   ...
   "facets" : [ {
       "facetCriteria" : "dateModified",
       "facetValues" : [ {
         "numberOfOccurrences" : 3,
         "term" : "20220427001823"
       } ]
     }, {
       "facetCriteria" : "description",
       "facetValues" : [ {
         "numberOfOccurrences" : 1,
         "term" : "bar"
       }, {
         "numberOfOccurrences" : 1,
         "term" : "foo"
       }, {
         "numberOfOccurrences" : 1,
         "term" : "goo"
       } ]
   } ],
   ...
   ```

   このブロックの後に、標準的なGETレスポンスが続きます。

   ```bash
   {
     ...
     "id" : 41969,
     ...
     "name" : "Able 1",
     "description" : "Foo"
     ...
   }, {
     ...
     "id" : 41971,
     ...
     "name" : "Able 2",
     "description" : "Bar"
   }, {
     ...
     "id" : 41973,
     ...
     "name" : "Able 3",
     "description" : "Goo"
   }
   ...
   ```

## コードを調べる

```{literalinclude} ./using-aggregation-terms-with-rest-apis/resources/liferay-b3x5.zip/curl/Ables_GET_FromCompany.sh
   :language: bash
```

この一括GETメソッドには、2つの値を持つ `aggregationTerms` URLパラメータが含まれる：dateModified`と `description` である。 これらは、リクエスト応答内のオブジェクトエントリーからデータを集約するために使用されるファセット基準を決定します。

## 関連トピック

* [オブジェクトAPIの基礎](./object-api-basics.md) 
* [バッチAPIの使用](./using-batch-apis.md) 
* [](./using-nestedfields-to-query-related-entries.md) `nestedFields` を使った関連エントリーのクエリー
