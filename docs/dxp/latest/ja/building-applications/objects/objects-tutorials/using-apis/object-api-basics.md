# オブジェクトAPIの基本

オブジェクトを公開すると、Liferayは自動的にそのためのREST APIを生成します。 これらのAPIは、会社とサイトに範囲指定されたオブジェクトで異なりますが、すべて`c/[pluralobjectlabel]` の命名パターン（例： `c/timeoffrequests`）を使用します。 これらのAPIを使用して、オブジェクトエントリーの作成、アクセス、更新、および削除を行うことができます。

ここでは、cURLコマンドを使用して、カスタムオブジェクトの基本的なCRUD操作を実行します。 先に進む前に、新しい Liferay DXP/Portal 7.4インスタンスを[セットアップ](#setting-up-a-liferay-instance)し、提供されたチュートリアルコードを[準備](#preparing-the-sample-code)します。

```{tip}
サイトオブジェクトと会社オブジェクトの両方に対して生成されるAPIの完全なリストについては、[オブジェクトのヘッドレスフレームワークの統合](../../understanding-object-integrations/headless-framework-integration.md)を参照してください。 カスタムオブジェクトAPIは、LiferayAPIエクスプローラーを通して`[server]:[port]/o/api` （例：`localhost:8080/o/api`）で表示およびテストできます。 これらは、*REST Applications*の下にリストされています。
```

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順に従って、このチュートリアルで使用する基本的なオブジェクトを [作成](../../creating-and-managing-objects/creating-objects.md)してください：

1. [グローバルメニュー](../../../../../images/icon-applications-menu.png))を開き、[コントロールパネル](*Control Panel*)タブに移動し、[オブジェクト](*Objects*)をクリックします。

1. *追加*ボタン(![ボタンの追加](../../../../images/icon-add.png))をクリックし、以下の値を入力します：

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル| `Able` |
   | 複数形のラベル| `Ables` |
   | 名前 | `Able` |

1. 新しい*オブジェクト*ドラフトを選択し、*フィールド*タブに行き、1つのテキストフィールドを追加する：

   | ラベル | フィールド名 | タイプ | 必須 | 
   | :--- | :--- | :--- | :--- |
   | 名前 | 名前 | テキスト | &#10004; |

1. *詳細*タブに移動し、*公開*をクリックします。

   ```{important}
    このチュートリアルでは、上記の値を使用する必要があります。
   ```

[オブジェクトの公開](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts)は、データの受信と保存のための新規アプリケーションを作成し、有効にします。 ヘッドレスAPIを介してアクセスできるようになりました。

## サンプルコードを準備する

以下のコマンドを実行して、提供されたサンプルコードをダウンロードし、解凍してください。

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-v1s4.zip -O
```

```bash
unzip liferay-v1s4.zip
```

これらのスクリプトには、以下のAPIが含まれています。

| HTTP メソッド | HTTPエンドポイント       | 説明                                                                  |
|:--------- |:----------------- |:------------------------------------------------------------------- |
| GET       | `/`               | Liferayインスタンスのオブジェクトエントリーの完全なリストを返します。結果は、ページ分割、絞り込み、検索、およびソートが可能です |
| POST      | `/`               | APIコールで提供された詳細を使用して、新しいオブジェクトエントリーを作成します                            |
| DELETE    | `/{objectNameId}` | 指定されたオブジェクトエントリーを削除し、操作が成功した場合は204を返します                             |
| GET       | `/{objectNameId}` | 指定されたオブジェクトエントリーの詳細を返します                                            |
| PUT       | `/{objectNameId}` | 指定されたオブジェクトエントリーの詳細を、API呼び出しで提供されたものに置き換えます                         |

## カスタムオブジェクトのAPIを呼び出す

1. サンプルコードをダウンロード後、 `liferay-v1s4`プロジェクト内の`curl`フォルダに移動します。

   ```bash
   cd liferay-v1s4/curl
   ```

1. `Able_POST_ToCompany`を実行します。 これにより、3つのエントリーが作成されます。

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

1. `Ables_GET_FromCompany`を実行します。 オブジェクトエントリーのリストが返されます。

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

1. 最初のエントリーのIDをパラメーターとして`Able_PUT_ById`を実行します。 これにより、指定されたエントリーの詳細がAPI呼び出しで提供された詳細に置き換えられます。

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

1. 同じIDをそのパラメーターとして、`Able_DELETE_ById`を実行します。 これにより、指定したエントリーが削除されます。

   ```bash
   ./Able_DELETE_ById.sh {entry-id}
   ```

1. 同じIDをそのパラメーターとして、`Able_GET_ById`を実行します。 これにより、指定されたエントリーが存在する場合はその詳細が返されます。

   ```bash
   ./Able_GET_ById.sh {entry-id}
   ```

   前の手順でエントリーを削除したため、次のメッセージが返されます。

   ```json
   {
     "status" : "NOT_FOUND",
     "title" : "No ObjectEntry exists with the primary key 41969"
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

## 関連トピック

* [バッチAPIの使用](./using-batch-apis.md)
* [`nestedFields` を使って関連するエントリーをクエリーする。](./using-nestedfields-to-query-related-entries.md)
* [REST APIでの集計用語の使用](./using-aggregation-terms-with-rest-apis.md)
