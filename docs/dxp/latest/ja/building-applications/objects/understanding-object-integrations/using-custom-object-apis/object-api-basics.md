# オブジェクトAPIの基本

オブジェクトを公開すると、Liferayは自動的にそのためのREST APIを生成します。 これらのAPIはCompanyスコープとSiteスコープのオブジェクトで異なりますが、いずれも`c/[pluralobjectlabel]`の命名パターンを使用します（例：`c/timeoffrequests`）。 これらのAPIを使用して、オブジェクトエントリーの作成、アクセス、更新、および削除を行うことができます。

ここでは、cURLコマンドを使用して、カスタムオブジェクトの基本的なCRUD操作を実行します。 先に進む前に、 [セットアップ](#setting-up-a-liferay-instance) 新しい Liferay DXP/Portal 7.4 インスタンスをセットアップし、 [準備](#preparing-the-sample-code) 提供されたチュートリアルコードを準備します。

```{tip}
Site Object と Company Object の両方で生成される API の完全なリストについては、[Object's Headless Framework Integration](../using-custom-object-apis.md) を参照してください。カスタム Object API は、Liferay API Explorer の `[server]:[port]/o/api` （例：`localhost:8080/o/api`）から表示したりテストしたりすることができます。これらは *REST Applications* の下に表示されます。
```

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

[次に、以下の手順に従って、](../../creating-and-managing-objects/creating-objects.md) このチュートリアルの基本的なオブジェクトを作成します：

1. グローバルメニュー(![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、 **コントロールパネル** タブを開き、 **オブジェクト** をクリックします。

1. Add_ボタン(![Add Button](../../../../images/icon-add.png))をクリックし、以下の値を入力する：

   | 項目      | 値       |
   | :------ | :------ |
   | ラベル     | `Able`  |
   | 複数形のラベル | `Ables` |
   | 名前      | `Able`  |

1. 新しい **Object** ドラフトを選択し、 **Fields** タブに行き、テキストフィールドを1つ追加する：

   | ラベル | 項目名 | 種類       | 必須       |
   | :-- | :-- | :------- | :------- |
   | 名前  | 名前  | テキストボックス | &#10004; |

1. 「詳細」タブに移動し、「公開」をクリックします。

   ```{important}
   このチュートリアルでは、上記の値を使用する必要があります。
   ```

[オブジェクトの発行](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) データの受信と保存のための新しいアプリケーションを作成し、アクティブにします。 ヘッドレスAPIを介してアクセスできるようになりました。

## サンプルコードを準備する

以下のコマンドを実行して、提供されたサンプルコードをダウンロードし、解凍してください。

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-v1s4.zip -O
```

```bash
unzip liferay-v1s4.zip
```

これらのスクリプトには、以下のAPIが含まれています。

| HTTP メソッド | HTTPエンドポイント       | 説明                                                                  |
| :-------- | :---------------- | :------------------------------------------------------------------ |
| GET       | `/`               | Liferayインスタンスのオブジェクトエントリーの完全なリストを返します。結果は、ページ分割、絞り込み、検索、およびソートが可能です |
| POST      | `/`               | APIコールで提供された詳細を使用して、新しいオブジェクトエントリーを作成します                            |
| DELETE    | `/{objectNameId}` | 指定されたオブジェクトエントリーを削除し、操作が成功した場合は204を返します                             |
| GET       | `/{objectNameId}` | 指定されたオブジェクトエントリーの詳細を返します                                            |
| PUT       | `/{objectNameId}` | 指定されたオブジェクトエントリーの詳細を、API呼び出しで提供されたものに置き換えます                         |

## カスタムオブジェクトのAPIを呼び出す

1. サンプルコードをダウンロードしたら、`liferay-v1s4`プロジェクトの`curl`フォルダに移動します。

   ```bash
   cd liferay-v1s4/curl
   ```

1. `Able_POST_ToCompany` を実行する。 これにより、3つのエントリーが作成されます。

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   ターミナルには、新しく作成されたエントリーの完全なスキーマが表示されます。 次のメソッドで使用するために、最初のエントリーのIDをコピーします。

   ```json
   {
     "id" : 41969,
     ...
     "name" : "Able 1"
   }

   {
     "id" : 41971,
     ...
     "name" : "Able 2"
   }

   {
     "id" : 41973,
     ...
     "name" : "Able 3"
   }
   ```

1. `Ables_GET_FromCompany` を実行する。 オブジェクトエントリーのリストが返されます。

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

1. 最初のエントリーの ID をパラメータとして `Able_PUT_ById` を実行する。 これにより、指定されたエントリーの詳細がAPI呼び出しで提供された詳細に置き換えられます。

   ```bash
   ./Able_PUT_ById.sh {entry-id}
   ```

   ```json
   {
     "id" : 41969,
     ...
     "name" : "Able One"
   }
   ```

1. 同じ ID をパラメータとして `Able_DELETE_ById` を実行する。 これにより、指定したエントリーが削除されます。

   ```bash
   ./Able_DELETE_ById.sh {entry-id}
   ```

1. パラメータと同じ ID で `Able_GET_ById` を実行する。 これにより、指定されたエントリーが存在する場合はその詳細が返されます。

   ```bash
   ./Able_GET_ById.sh {entry-id}
   ```

   前の手順でエントリーを削除したため、次のメッセージが返されます。

   ```json
   {
   	"status": "NOT_FOUND",
   	"title": "No ObjectEntry exists with the primary key 41969"
   }
   ```

## サンプルのcURLスクリプトの検証

以下は、チュートリアルのcURLコマンドの例です。

### `Able_POST_ToCompany.sh`

```{literalinclude} ./object-api-basics/resources/liferay-v1s4.zip/curl/Able_POST_ToCompany.sh
:language: bash
```

### `Able_PUT_ById.sh`

```{literalinclude} ./object-api-basics/resources/liferay-v1s4.zip/curl/Able_PUT_ById.sh
:language: bash
```

## オブジェクトタグとカテゴリの管理

Object API を使用すると、分類が有効になっているオブジェクト・エントリのタグやカテゴリの読み取り、設定、更新を行うことができます。 詳しくは [タグとカテゴリー](../../../../content-authoring-and-management/tags-and-categories.md) をご覧ください。

タグは `keywords` プロパティで表される。 POST、PUT、またはPATCHリクエストの本文に `keywords` 配列を追加することで、タグを設定または更新することができます。

```json
"keywords" : [
   "tag1", "tag2", "tag3"
]
```

オブジェクトエントリーにGETリクエストをした後、同じ `keywords` 配列でそのタグを読むことができる。

POST、PUT、または PATCH リクエストに `taxonomyCategoryIds` 配列を追加することで、オブジェクトエントリのカテゴリを設定したり更新したりすることができます。

```json
"taxonomyCategoryIds" : [
   1234, 5678
]
```

!!! note
    オブジェクトエントリーにカテゴリーを割り当てるには、既存のカテゴリー語彙が必要です。 詳しくは [コンテンツのカテゴリとボキャブラリの定義](../../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) を参照。

この配列には、割り当てられた各カテゴリの `taxonomyCategoryId` と `taxonomyCategoryName` が格納されています。

```json
"taxonomyCategoryBriefs": [
   {
      "taxonomyCategoryId": 1234,
      "taxonomyCategoryName": "Category A"
   },
   {
      "taxonomyCategoryId": 5678,
      "taxonomyCategoryName": "Category B"
   }
]
```

[API クエリパラメータ](../../../../headless-delivery/consuming-apis/api-query-parameters.md) で説明されているルールに従って、`keywords` と `taxonomyCategoryIds` によってオブジェクトエントリをフィルタリングできます。 フィルター文字列の例は以下のようになる：

- `keywords/any(k:k in ('tag1','tag2'))` は `tag1` または `tag2` でタグ付けされたすべてのオブジェクトエントリを検索します。

- `taxonomyCategoryIds/any(k:k in (1234,5678))`は、ID `1234`または`5678\`のカテゴリにリンクされているすべてのエントリを検索します。

## 関連トピック

- [バッチAPIの使用](./using-batch-apis.md)
- [nestedFields を使用した関連エントリーのクエリー](./using-nestedfields-to-query-related-entries.md)
- [REST APIでの集計用語の使用](./using-aggregation-terms-with-rest-apis.md)
