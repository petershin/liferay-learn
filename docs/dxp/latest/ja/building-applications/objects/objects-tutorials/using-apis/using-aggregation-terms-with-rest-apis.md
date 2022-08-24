# REST APIでの集計用語の使用

REST APIを使用してオブジェクトエントリーを照会する場合、オブジェクトのフィールドをファセット基準として使用してエントリーデータを集計できます。 これを行うには、GETリクエストに `aggregationTerms` パラメーターを追加し、ファセット基準として使用したいデータフィールドを指定します。 これらの基準には、カスタムフィールド、デフォルトのメタデータフィールド、またはリレーションシップフィールドを含めることができます。 その後、リクエストレスポンスは指定されたデータファセットを単一の`facets`ブロックにグループ化します。

ここでは、 `aggregatedTerms` パラメーターを、基本的なカスタムオブジェクトと一緒に使用します。

先に進む前に、新しい Liferay DXP/Portal 7.4インスタンスを [セットアップ](#setting-up-a-liferay-instance) し、提供されたチュートリアルコードを [準備](#preparing-the-sample-code) します。

## Liferayインスタンスのセットアップ
```{include} /_snippets/run-liferay-portal.md
```

次に、下記の手順で、このチュートリアルの基本オブジェクトを[作成](../../creating-and-managing-objects/creating-objects.md)します。

1. **グローバルメニュー**(![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブをクリックして、 ［**オブジェクト**］ に移動します。

1. **追加** ボタン(![追加ボタン](../../../../images/icon-add.png))をクリックし、下記の値を入力します。

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | `Able` |
   | 複数形ラベル | `Ables` |
   | 名前 | `Able` |

1. 新規の **オブジェクト** ドラフトを選択し、 **フィールド** タブに移動して、単一のテキストフィールドを追加します。

   | ラベル | フィールド名 | タイプ | 要否 |
   | :--- | :--- | :--- | :--- |
   | 名前 | 名前 | テキスト | &#10004; |

1. ［**詳細**］ タブで [**公開**](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) をクリックします。

   ```{important}
   このチュートリアルでは、下記の値を使用する必要があります。
   ```

公開後は、ヘッドレスAPIでオブジェクトにアクセスすることができます。

## サンプルコードを準備する

以下のコマンドを実行して、提供されたサンプルコードをダウンロードし、解凍してください。

```bash
curl https://learn.liferay.com/dxp/latest/ja/building-applications/objects/objects-tutorials/using-apis/liferay-b3x5.zip -O
```

```bash
unzip liferay-b3x5.zip
```

これらのスクリプトには、以下のAPIが含まれています。

| HTTP メソッド | HTTPエンドポイント | 説明                                                                  |
|:--------- |:----------- |:------------------------------------------------------------------- |
| GET       | `/`         | Liferayインスタンスのオブジェクトエントリーの完全なリストを返します。結果は、ページ分割、絞り込み、検索、およびソートが可能です |
| POST      | `/batch`    | API呼び出しで提供された詳細を使用して複数のオブジェクトエントリーを作成します                            |

## サンプルコードを使用する

1. サンプルコードをダウンロード後、 `lliferay-b3x5`プロジェクト内の`curl`フォルダに移動します。

   ```bash
   cd liferay-b3x5/curl
   ```

1. `Ables_POST_Batch`を実行します。 複数のオブジェクトエントリーを作成します。

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

1. `Ables_GET_FromCompany`を実行すると、 `aggregatedTerms` パラメーターで作成されたすべてのエントリーのリストが返されます。

   レスポンスには、`dateModified` と `description`の2つのファセット基準を持つ `facets` ブロックが含まれる必要があります。

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

この一括GETメソッドには、`dateModified`と`description`という2つの値を持つ `aggregationTerms` URLパラメーターが含まれています。 これらは、リクエスト応答内のオブジェクトエントリーからデータを集約するために使用されるファセット基準を決定します。

## 追加情報

* [オブジェクトAPIの基本](./object-api-basics.md)
* [バッチAPIの使用](./using-batch-apis.md)
* [REST APIでネストしたフィールドの使用](./using-nested-fields-with-rest-apis.md)
