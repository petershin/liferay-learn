# REST APIでネストしたフィールドの使用

カスタムオブジェクトAPIでは、`nestedFields`パラメーターを使用すると、1つのGET要求で複数レベルの関連オブジェクトを返すことができます。 また、`nestedFieldsDepth`パラメーターを使用して、クエリに含まれるオブジェクトエントリーの深さ（`0-5`）を決定できます。 ここでは、cURLスクリプトを使用して、ネストされたフィールドを持つオブジェクトAPIを呼び出すことになります。

```{tip}
ネストされたフィールドは、通常、複数のリクエストを必要とする情報を取得するのに便利な方法です。 こうすることで、関連するエンティティIDで新たにリクエストを送ることなく、エンティティ自身から関連するエンティティの全情報を得られます。
```

先に進む前に、新しい Liferay DXP/Portal 7.4インスタンスを[セットアップ](#setting-up-a-liferay-instance)し、提供されたチュートリアルコードを[準備](#preparing-the-sample-code)します。

## Liferayインスタンスのセットアップ
```{include} /_snippets/run-liferay-portal.md
```

次に、下記の手順で、3つのオブジェクトを[作成](../../creating-and-managing-objects/creating-objects.md)します。

1. **グローバルメニュー**(![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブをクリックして、 ［**オブジェクト**］ に移動します。

1. 3つのオブジェクトドラフトを作成します。

   第一オブジェクト：

      | 項目 | 値 |
      | :--- | :--- |
      | ラベル | `Able` |
      | 複数形のラベル | `Ables` |
      | 名前 | `Able` |

  第二オブジェクト：

      | 項目 | 値 |
      | :--- | :--- |
      | ラベル | `Baker` |
      | 複数形のラベル | `Bakers` |
      | 名前 | `Baker` |

   第三オブジェクト：

      | 項目 | 値 |
      | :--- | :--- |
      | ラベル | `Charlie` |
      | 複数形のラベル | `Charlies` |
      | 名前 | `Charlie` |

1. 各オブジェクトドラフトに以下のテキストフィールドを追加します。

   | ラベル | 項目名 | 種類 | 必須 |
   | :--- | :--- | :--- | :--- |
   | `Name` | `name` | Text | &#10004; |

1. 以下の関連を定義します。

   Ableの場合：

      | ラベル | リレーション名 | 種類 | オブジェクト |
      | :--- | :--- | :--- | :--- |
      | `Able to Baker` | `ableToBaker` | 1対多 | Baker |

   Bakerの場合：

      | ラベル | リレーション名 | 種類 | オブジェクト |
      | :--- | :--- | :--- | :--- |
      | `Baker to Charlie` | `bakerToCharlie` | 1対多 | Charlie |

1. 各オブジェクトを[公開](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts)します。

公開後は、ヘッドレスAPIで各オブジェクトにアクセスすることができます。

## サンプルコードを準備する

以下のコマンドを実行して、提供されたサンプルコードをダウンロードし、解凍してください。

```bash
curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-w4s7.zip -O
```

```bash
unzip liferay-w4s7.zip
```

サンプルコードには、各オブジェクトに対するPOSTコマンドと`Charlie`に対するGETコマンドが含まれています。

```{tip}
サイトオブジェクトと会社オブジェクトの両方に対して生成されるAPIの完全なリストについては、[オブジェクトのヘッドレスフレームワークの統合](../../understanding-object-integrations/headless-framework-integration.md)を参照してください。 カスタムオブジェクトAPIは、LiferayAPIエクスプローラーを通して`[server]:[port]/o/api` （例：`localhost:8080/o/api`）で表示およびテストできます。 これらは、*［RESTアプリケーション］*の下に表示されます。
```

## サンプルコードを使用する

次の手順に従って、関連するオブジェクトエントリーを追加し、照会します。

1. `liferay-w4s7`プロジェクトの`curl`フォルダに移動します。

   ```bash
   cd liferay-p8n6/curl
   ```

1. `Able_POST_ToCompany`を実行し、`Able`エントリーを作成します。

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   次のPOSTコマンドで使用するために、最初のエントリーのIDをコピーします。

   ```bash
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

1. `Able`のエントリーIDをパラメータとして、`Baker_POST_ToCompany`を実行します。

   ```bash
   ./Baker_POST_ToCompany.sh {able-entry-id}
   ```

   これにより、指定された`Able`エントリーに関連する`Baker`エントリーが作成されます。 次のPOSTコマンドで使用するために、最初のBakerエントリーのIDをコピーします。

   ```bash
   {
     "id" : 41975,
     ...
     "name" : "Baker 1"
     "r_ableToBaker_c_ableId" : 41969
   }

   {
     "id" : 41977,
     ...
     "name" : "Baker 2"
     "r_ableToBaker_c_ableId" : 41969
   }

   {
     "id" : 41979,
     ...
     "name"： "Baker 3"
     "r_ableToBaker_c_ableId"：41969
}
   ```

1. `Baker`エントリーIDをパラメータとして、`Charlie_POST_ToCompany`を実行します。

   ```bash
   ./Charlie_POST_ToCompany.sh {baker-entry-id}
   ```

   これにより、直前の`Baker`エントリーに関連する`Charlie`エントリーが作成されます。 次のGETコマンドで使用するために、最初のエントリーのIDをコピーします。

   ```bash
   {
     "id" : 41981,
     ...
     "name" : "Charlie 1",
     "r_bakerToCharlie_c_bakerId" : 41975
   }

   {
     "id" : 41983,
     ...
     "name" : "Charlie 2",
     "r_bakerToCharlie_c_bakerId" : 41975
   }

   {
     "id" : 41985,
     ...
     "name" : "Charlie 3",
     "r_bakerToCharlie_c_bakerId" : 41975
   }
   ```

1. `Charlie`エントリーIDをパラメータとして、`Charlie_GET_ById`を実行します。

   ```bash
   ./Charlie_GET_ById.sh [charlie-entry-id]
   ```

   これは、ネストされたフィールドを使用してエントリーに照会し、関連するオブジェクトの3つのレベルすべてについてスキーマを返します。

   ```bash
   {
     "r_bakerToCharlie_c_baker" : {
       ...
       "id" : 41975,
       ...
       "r_ableToBaker_c_able" : {
         ...
         "id" : 41969,
         ...
         "name" : "Able 1"
       },
       "name" : "Baker 1",
       "r_ableToBaker_c_ableId" : 41969
     },
     "name" : "Charlie 1",
     "r_bakerToCharlie_c_bakerId" : 41975
   }
   ```

## GETスクリプトを調べる

```{literalinclude} ./using-nested-fields-with-rest-apis/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
   :language: bash
```

提供されたGETメソッドは、`nestedFields` と `nestedFieldsDepth`パラメーターを持つURLを呼び出します。

`nestedFields`：クエリーに含まれるエントリーの種類を決定します（例: `able,baker`）。

`nestedFieldsDepth`：取り込みたいエントリーの深さを決定します。0〜5の間で設定可能です。

## 追加情報

* [オブジェクトAPIの基本](./object-api-basics.md)
* [バッチAPIの使用](./using-batch-apis.md)
* [REST APIでの集計用語の使用](./using-aggregation-terms-with-rest-apis.md)
