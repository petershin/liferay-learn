# REST APIでネストしたフィールドの使用

{bdg-secondary}`利用可能 Liferay 7.4 U69+/GA69+`

カスタムオブジェクトAPIでは、 `nestedFields` パラメータを使用すると、1つのGETリクエストで複数レベルの関連オブジェクトを返すことができます。 `nestedFieldsDepth` パラメータは、クエリに含まれるオブジェクトエントリの深さを決定する： `0-5`.

```{tip}
`nestedFields`パラメータは、通常複数のリクエストを必要とする情報を取得するのに便利な方法です。 これを使えば、あるエントリーとその関連エントリーを一緒に取り出すことができます。 関連するエントリのみを返すために、Liferayは専用の [関係API](./../understanding-object-integrations/headless-framework-integration.md#relationship-rest-apis) を提供します。 [関係性REST APIの使用](./using-relationship-rest-apis.md)を参照し、紹介します。
```

[押立てる](#setting-up-a-liferay-instance) Liferay 7.4 のインスタンスを新規に立ち上げ、  提供されたチュートリアルコードを準備します。 [装う](#preparing-the-sample-code) 次に、スクリプトを実行して関連エントリーを作成し、 `nestedFields` パラメータを使用してクエリーを実行します。

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

次に、3つのオブジェクトを[作成](../../creating-and-managing-objects/creating-objects.md)してください：

1. [グローバルメニュー](./../../.../.../images/icon-applications-menu.png) を開き、[コントロールパネル] タブに移動し、[オブジェクト]をクリックします。

1. オブジェクトの下書きを3つ作成します。

   最初のオブジェクトです：

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | `Able` |
   | 複数形ラベル | `Ables` |
   | 名前 | `Able` |

   第2オブジェクト

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | `Baker` |
   | 複数形ラベル | `ベーカーズ` | 
   | 名前 | `Baker` |

   第3のオブジェクト

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | `Charlie` | 
   | 名前 | `Charlie` |

1. 各オブジェクトのドラフトに`name`テキストフィールドを追加します。

   | ラベル | フィールド名 | タイプ | 必須 | を追加する。
   | :--- | :--- | :--- | :--- |
   | `名前` | `名前` | テキスト |  &#10004; |

1. 次の関係を定義する。

   Ableの場合：

   | ラベル | リレーション名 | 種類 | オブジェクト |
   | :--- | :--- | :--- | :--- |
   | `Able to Baker` | `ableToBaker` | 1対多 | Baker |

   For Baker:

   | ラベル | リレーション名 | 種類 | オブジェクト |
   | :--- | :--- | :--- | :--- |
   | `Baker to Charlie` | `bakerToCharlie` | 1対多 | Charlie |

1. 各オブジェクトを [Publish](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) します。

公開されると、Headless APIで各オブジェクトにアクセスできるようになります。

## サンプルコードの準備

以下のコマンドを実行し、提供されたサンプルコードをダウンロードし、解凍してください：

```bash
curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-w4s7.zip -O
```

```bash
unzip liferay-w4s7.zip
```

サンプルコードには、各オブジェクトの POST コマンドと、 `Charlie`の GET コマンドが含まれています。

```{tip}
サイトオブジェクトとカンパニーオブジェクトに対して生成されるAPIの完全なリストは、[オブジェクトヘッドレスフレームワーク統合](../../understanding-object-integrations/headless-framework-integration.md) を参照してください。 カスタムオブジェクトの API は Liferay API Explorer を介して `[server]:[port]/o/api` (例: `localhost:8080/o/api`) で閲覧、テストすることができます。 **REST Applications** をクリックし、APIを選択します。
```

## サンプルコードを使用する

以下の手順で、関連オブジェクトのエントリーを追加し、照会します：

1. `liferay-w4s7`プロジェクトの`curl`フォルダに移動します。

   ```bash
   cd liferay-w4s7/curl
   ```

1. `Able_POST_ToCompany`を実行し、`Able`エントリーを作成します。

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   次のPOSTコマンドで使用するために、最初のエントリーのIDをコピーします。

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

1. `Able`のエントリーIDをパラメータとして、`Baker_POST_ToCompany`を実行します。

   ```bash
   ./Baker_POST_ToCompany.sh {able-entry-id}
   ```

   これにより、指定された`Able`エントリーに関連する`Baker`エントリーが作成されます。 次のPOSTコマンドで使用するために、最初のBakerエントリーのIDをコピーします。

   ```json
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
     "name" : "Baker 3"
     "r_ableToBaker_c_ableId" : 41969
   }
   ```

1. `Baker`エントリーIDをパラメータとして、`Charlie_POST_ToCompany`を実行します。

   ```bash
   ./Charlie_POST_ToCompany.sh {baker-entry-id}
   ```

   これにより、直前の`Baker`エントリーに関連する`Charlie`エントリーが作成されます。 次のGETコマンドで使用するために、最初のエントリーのIDをコピーします。

   ```json
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

   これは、ネストされたフィールドを使用してエントリに問い合わせ、関連するオブジェクトの3つのレベルすべてについてスキーマを返します。

   ```json
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

```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
   :language: bash
```

提供されたGETメソッドは、`nestedFields` と `nestedFieldsDepth`パラメーターを持つURLを呼び出します。

`nestedFields`: クエリーに含まれるエントリーの種類を決定します(例： `ableToBaker,bakerToCharlie`）。

`nestedFieldsDepth`：取り込みたいエントリーの深さを決定します。0〜5の間で設定可能です。

## 追加情報

* [オブジェクトAPIの基本](./object-api-basics.md)
* [バッチAPIの使用](./using-batch-apis.md)
* [REST APIでの集計用語の使用](./using-aggregation-terms-with-rest-apis.md)
