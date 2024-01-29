# バッチAPIの使用

オブジェクトを公開すると、Liferayは自動的にそのためのREST APIを生成します。 これには、POST、PUT、DELETEの一括操作のためのバッチAPIが含まれます。 ここでは、cURLコマンドを使用して、カスタムオブジェクトのこれらのバッチAPIを呼び出します。

先に進む前に、 [セットアップ](#setting-up-a-liferay-instance) 新しい Liferay DXP/Portal 7.4 インスタンスをセットアップし、 [準備](#preparing-the-sample-code) 提供されたチュートリアルコードを準備します。

```{tip}
Site Objects と Company Objects の両方に生成される API の完全なリストについては、 [Object's Headless Framework Integration](../using-custom-object-apis.md) を参照してください。 カスタムオブジェクトAPIは、LiferayAPIエクスプローラーを通して`[server]:[port]/o/api` （例：`localhost:8080/o/api`）で表示およびテストできます。 これらは、*［RESTアプリケーション］*の下に表示されます。
```

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

[次に、以下の手順に従って、](../../creating-and-managing-objects/creating-objects.md) このチュートリアルの基本的なオブジェクトを作成します：

1. **グローバルメニュー**(![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］**タブで***［ オブジェクト**］ をクリックします。

1. **追加** ボタン(![追加ボタン](../../../../images/icon-add.png))をクリックし、以下の値を入力する：

   | 項目      | 値       |
   | :------ | :------ |
   | ラベル     | `Able`  |
   | 複数形のラベル | `Ables` |
   | 名前      | `Able`  |

1. 新しい **オブジェクト** ドラフトを選択し、 **フィールド** タブに移動し、単一のテキスト **フィールド** を追加します：

   | ラベル | 項目名 | 種類       | 必須       |
   | :-- | :-- | :------- | :------- |
   | 名前  | 名前  | テキストボックス | &#10004 |

1. ［**詳細**］ タブに移動し、 ［**公開**］ をクリックします。

   ```{important}
   このチュートリアルでは、上記の値を使用する必要があります。
   ```

[オブジェクトの発行](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) データの受信と保存のための新しいアプリケーションを作成し、アクティブにします。 ヘッドレスAPIを介してアクセスできるようになりました。

## サンプルコードを準備する

以下のコマンドを実行して、提供されたサンプルコードをダウンロードし、解凍してください。

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-t4r3.zip -O
```

```bash
unzip liferay-t4r3.zip
```

これらのスクリプトには、以下のバッチAPIが含まれています。

| HTTP メソッド | HTTPエンドポイント | 説明                                         |
| :-------- | :---------- | :----------------------------------------- |
| DELETE    | `/batch`    | 複数のオブジェクトエントリーを削除します                       |
| POST      | `/batch`    | API呼び出しで提供された詳細を使用して複数のオブジェクトエントリーを作成します   |
| PUT       | `/batch`    | API呼び出しで提供された詳細を使用して、複数のオブジェクトエントリーを置き換えます |

```{note}
GETメソッドは、デモのために含まれています。 これは、Liferayインスタンスのオブジェクトエントリーの完全なリストを返します。
```

## カスタムオブジェクトのAPIを呼び出す

1. サンプルコードをダウンロードしたら、`liferay-t4r3`プロジェクトの`curl`フォルダに移動します。

   ```bash
   cd liferay-t4r3/curl
   ```

1. `Ables_POST_Batch` を実行する。 複数のオブジェクトエントリーを作成します。

   ```bash
   ./Ables_POST_Batch.sh
   ```

   端末には同様の出力が表示されます。

   ```json
   {
     "className" : "com.liferay.object.rest.dto.v1_0.ObjectEntry",
     "contentType" : "JSON",
     "errorMessage" : "",
     "executeStatus" : "INITIAL",
     "externalReferenceCode" : "",
     "failedItems" : [ ],
     "id" : 4,
     "importStrategy" : "ON_ERROR_FAIL",
     "operation" : "CREATE",
     "processedItemsCount" : 0,
     "startTime" : "2022-04-07T22:51:37Z",
     "totalItemsCount" : 0
   }
   ```

1. `Ables_GET_FromCompany` を実行して、エントリが作成されたことを確認する。 すべてのオブジェクトエントリーのリストが返されます。

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

   各エントリーのIDをコピーして、以下のPUTおよびDELETEメソッドで使用します。

   ```json
   {
     ...
     "items" : [ {
       ...
       "id" : 41985,
       ...
       "name" : "Able 1"
     }, {
       ...
       "id" : 41987,
       ...
       "name" : "Able 2"
     }, {
       ...
       "id" : 41989,
       ...
       "name" : "Able 3"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 20,
     "totalCount" : 3
   }
   ```

1. 各エントリ ID をパラメータとして `Ables_PUT_Batch` を実行する。 これにより、指定されたエントリーの詳細がAPI呼び出しで提供された詳細に置き換えられます。

   ```bash
   ./Ables_PUT_Batch.sh {first-entry-id} {second-entry-id} {third-entry-id}
   ```

   ```json
   {
     "className" : "com.liferay.object.rest.dto.v1_0.ObjectEntry",
     "contentType" : "JSON",
     "errorMessage" : "",
     "executeStatus" : "INITIAL",
     "externalReferenceCode" : "",
     "failedItems" : [ ],
     "id" : 6,
     "importStrategy" : "ON_ERROR_FAIL",
     "operation" : "UPDATE",
     "processedItemsCount" : 0,
     "startTime" : "2022-04-07T23:02:17Z",
     "totalItemsCount" : 0
   }
   ```

1. `Ables_GET_FromCompany` を実行して、エントリが更新されたことを確認する。

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

   ```json
   {
     ...
     "items" : [ {
       ...
       "id" : 41985,
       ...
       "name" : "Able One"
     }, {
       ...
       "id" : 41987,
       ...
       "name" : "Able Two"
     }, {
       ...
       "id" : 41989,
       ...
       "name" : "Able Three"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 20,
     "totalCount" : 3
   }
   ```

1. 各エントリ ID をパラメータとして `Ables_DELETE_Batch` を実行する。 これにより、指定したエントリーが削除されます。

   ```bash
   ./Ables_DELETE_Batch.sh {first-entry-id} {second-entry-id} {third-entry-id}
   ```

1. `Ables_GET_FromCompany` を実行して、エントリが削除されたことを確認する。

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

   前のステップでエントリーを削除したので、エントリーが `NOT FOUND` エラーを返します。

## サンプルのcURLスクリプトの検証

### `Ables_POST_Batch.sh`

```{literalinclude} ./using-batch-apis/resources/liferay-t4r3.zip/curl/Ables_POST_Batch.sh
   :language: bash
```

### `Ables_PUT_Batch.sh`

```{literalinclude} ./using-batch-apis/resources/liferay-t4r3.zip/curl/Ables_PUT_Batch.sh
   :language: bash
```

### `Ables_DELETE_Batch.sh`

```{literalinclude} ./using-batch-apis/resources/liferay-t4r3.zip/curl/Ables_DELETE_Batch.sh
   :language: bash
```

## 関連トピック

* [オブジェクトAPIの基礎](./object-api-basics.md) 
* [nestedFields を使用した関連エントリーのクエリー](./using-nestedfields-to-query-related-entries.md)
* [REST APIでの集計用語の使用](./using-aggregation-terms-with-rest-apis.md)
