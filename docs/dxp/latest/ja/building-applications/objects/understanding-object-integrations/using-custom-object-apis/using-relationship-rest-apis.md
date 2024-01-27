# 関連REST APIの利用

{bdg-secondary}`liferay 7.4 U70+/GA70+`.

カスタムオブジェクトやシステムオブジェクトに関連を追加すると、Liferayはそれらの関連にアクセスするためのRESTエンドポイントを生成します。 エントリーの関連付けや関連付けの解除、エントリーの関連エントリーを返すことができます。 これらのエンドポイントは、1対多の関連では親オブジェクトに、多対多の関連では両方のオブジェクトに追加されます。

先に進むには、 [セットアップ](#setting-up-a-liferay-instance) 新しい Liferay 7.4 インスタンスをセットアップし、 [準備](#preparing-the-sample-code) 提供されたチュートリアルコードを準備します。 その後、スクリプトを実行してオブジェクトエントリーを作成し、互いの関連を管理します。

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

次に、 [](../../creating-and-managing-objects/creating-objects.md) 関連する3つのカスタム・オブジェクトを作成する：

1. _グローバルメニュー_ (![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、*［コントロールパネル］*タブで*［オブジェクト］*をクリックします。

1. 3つのオブジェクトドラフトを作成します。

   最初のオブジェクト：

   | 項目      | 値       |
   | :------ | :------ |
   | ラベル     | `Able`  |
   | 複数形のラベル | `Ables` |
   | 名前      | `Able`  |

   第二の目的

   | 項目      | 値        |
   | :------ | :------- |
   | ラベル     | `Baker`  |
   | 複数形のラベル | `Bakers` |
   | 名前      | `Baker`  |

   第3の目的

   | 項目      | 値          |
   | :------ | :--------- |
   | ラベル     | `Charlie`  |
   | 複数形のラベル | `Charlies` |
   | 名前      | `Charlie`  |

1. 各オブジェクトドラフトに以下の`name`フィールドを追加します。

   | ラベル    | 項目名    | 種類       | 必須       |
   | :----- | :----- | :------- | :------- |
   | `Name` | `name` | テキストボックス | &#10004; |

1. これらの関係をableオブジェクトに追加する：

   | ラベル               | リレーション名         | 種類   | オブジェクト |
   | :---------------- | :-------------- | :--- | :----- |
   | `Able to Baker`   | `ableToBaker`   | 1 対多 | ベーカー   |
   | `Able to Charlie` | `ableToCharlie` | 1 対多 | チャーリー  |

1. [Publish](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 各オブジェクト。

公開されると、以下のリレーションシップAPIを含むREST APIにアクセスできる：

| オブジェクト | HTTP メソッド | HTTPエンドポイント                                                        | Javaメソッド                          |
| :----- | :-------- | :----------------------------------------------------------------- | :-------------------------------- |
| エイブル   | GET       | `/{ableId}/ableToBaker`                                            | `getAbleAbleToBakerBakerPage`     |
| エイブル   | GET       | `/{ableId}/ableToCharlie`                                          | `getAbleAbleToCharlieCharliePage` |
| エイブル   | DELETE    | `/{ableId}/ableToBaker/{bakerId}`                                  | `deleteAbleAbleToBakerBaker`      |
| エイブル   | PUT       | `/{ableId}/ableToBaker/{bakerId}`                                  | `putAbleAbleToBakerBaker`         |
| エイブル   | DELETE    | `/{ableId}/ableToCharlie/{charlieId}`                              | `deleteAbleAbleToCharlieCharlie`  |
| エイブル   | PUT       | `/{ableId}/ableToCharlie/{charlieId}`                              | `putAbleAbleToCharlieCharlie`     |
| エイブル   | PUT       | `/by-external-reference-code/{ableERC}/ableToBaker/{bakerERC}`     | `putAbleAbleToBakerBaker`         |
| エイブル   | PUT       | `/by-external-reference-code/{ableERC}/ableToCharlie/{charlieERC}` | `putAbleAbleToCharlieCharlie`     |
| チャーリー  | GET       | `/{charlieId}/ableToCharlie`                                       | `getCharlieAbleToCharlieAblePage` |
| チャーリー  | DELETE    | `/{charlieId}/ableToCharlie/{ableId}`                              | `deleteCharlieAbleToCharlieAble`  |
| チャーリー  | PUT       | `/{charlieId}/ableToCharlie/{ableId}`                              | `putCharlieAbleToCharlieAble`     |
| チャーリー  | PUT       | `/by-external-reference-code/{ableERC}/ableToCharlie/{charlieERC}` | `putCharlieAbleToCharlieAble`     |

```{tip}
サイトオブジェクトとカンパニーオブジェクト用に生成されたAPIの完全なリストについては、 [Objects Headless Framework Integration](../../understanding-object-integrations/using-custom-object-apis.md) を参照してください。 カスタムオブジェクトAPIは、LiferayAPIエクスプローラーを通して`[server]:[port]/o/api` （例：`localhost:8080/o/api`）で表示およびテストできます。 *RESTアプリケーション*をクリックし、APIを選択します。
```

## サンプルコードを準備する

以下のコマンドを実行し、提供されたサンプルコードをダウンロードし、解凍してください：

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-f9m2.zip -O
```

```bash
unzip liferay-f9m2.zip
```

サンプルコードには、各オブジェクトのエントリーを作成し、その関連APIを使用するためのコマンドが含まれています。

## サンプルコードを使用する

REST APIを使用して、オブジェクトのエントリーを追加し、その関連を管理します。

1. `liferay-f9m2`プロジェクトの`curl` フォルダに移動します。

   ```bash
   cd liferay-f9m2/curl
   ```

1. `POST`コマンドを実行して、各オブジェクトに3つのエントリーを作成する。 これらのエントリーは、`[objectname]-[number]`の命名パターン（例：`able-one`）に従った定義済みの外部参照コード（ERC）を持つ。

   ```bash
   ./Able_POST_Batch.sh
   ```

   ```bash
   ./Baker_POST_Batch.sh
   ```

   ```bash
   ./Charlie_POST_Batch.sh
   ```

1. `able-one`のERCと3つのベーカーERC全てを使って `Able_PUT_AbleToBaker_ByExternalReferenceCode` を実行する。

   ```bash
   ./Able_PUT_AbleToBaker_ByExternalReferenceCode.sh able-one baker-one baker-two baker-three
   ```

   これにより、ableエントリとbakerエントリが関連付けられ、そのレスポンスが出力されます。

   ```json
   {
     ...
     "externalReferenceCode" : "baker-one",
     "id" : 42427,
     ...
     "name" : "Baker 1",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-two",
     "id" : 42429,
     ...
     "name" : "Baker 2",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-three",
     "id" : 42431,
     ...
     "name" : "Baker 3",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }
   ```

1. `      able-one`の ID と`baker-three`の ID を指定して`Able_DELETE_AbleToBaker_ById` を実行する。

   ```bash
   ./Able_DELETE_AbleToBaker_ById.sh {able-entry-id} {baker-entry-id}
   ```

   これにより、エントリーの関連付けが解除されます。

1. 同じable IDで`Able_GET_AbleToBaker_ById`を実行し、関連性がなくなったことを確認する。

   ```bash
   ./Able_GET_AbleToBaker_ById.sh {able-entry-id}
   ```

   ```json
   {
     ...
     "externalReferenceCode" : "baker-two",
     "id" : 42429,
     ...
     "name" : "Baker 2",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   },
   {
     ...
     "externalReferenceCode" : "baker-one",
     "id" : 42427,
     ...
     "name" : "Baker 1",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }
   ```

1. `able-one`ERCと3つのcharlie ERCすべてを使って`Able_PUT_AbleToCharlie_ByExternalReferenceCode`を実行する。

   ```bash
   ./Able_PUT_AbleToCharlie_ByExternalReferenceCode.sh able-one charlie-one charlie-two charlie-three
   ```

   これにより、ableエントリーとcharlieエントリーが関連付けられ、そのレスポンスが出力されます。

   ```json
   {
     ...
     "externalReferenceCode" : "charlie-one",
     "id" : 42433,
     ...
     "name" : "Charlie 1"
   }
   {
     ...
     "externalReferenceCode" : "charlie-two",
     "id" : 42435,
     ...
     "name" : "Charlie 2"
   }
   {
     ...
     "externalReferenceCode" : "charlie-three",
     "id" : 42437,
     ...
     "name" : "Charlie 3"
   }
   ```

1. `Charlie_GET_AbleToCharlie_ById`に`charlie-one`のIDを指定して実行する。

   ```bash
   ./Charlie_GET_AbleToCharlie_ById.sh {charlie-entry-id}
   ```

   指定されたcharlieエントリーに関連するすべてのableエントリーのリストを返します。

   ```json
   {
     ...
     "items" : [ {
       ...
       "externalReferenceCode" : "able-one",
       "id" : 42421,
       ...
       "name" : "Able 1"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 1,
     "totalCount" : 1
   }
   ```

1. `charlie_PUT_AbleToCharlie_ByExternalReferenceCode`を`charlie-one`と`able-two` の ERC で実行する。

   ```bash
   ./Charlie_PUT_AbleToCharlie_ByExternalReferenceCode.sh charlie-one able-two
   ```

   これは、charlieエントリーを別のableエントリーに関連付けるものです。

   ```json
   {
     ...
     "externalReferenceCode" : "able-two",
     "id" : 42423,
     ...
     "name" : "Able 2"
   }
   ```

1. `Charlie_GET_AbleToCharlie_ById`を`charlie-one`のIDで実行し、関連する2つの可能なエントリーがあることを確認する。

   ```bash
   ./Charlie_GET_AbleToCharlie_ById.sh {charlie-entry-id}
   ```

   ```json
   {
     ...
     "items" : [ {
       ...
       "externalReferenceCode" : "able-two",
       "id" : 42423,
       ...
       "name" : "Able 2"
     }, {
       ...
       "externalReferenceCode" : "able-one",
       "id" : 42421,
       ...
       "name" : "Able 1"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 2,
     "totalCount" : 2
   }
   ```

1. `able-one`の ID を指定して`Able_GET_ById` を実行する。

    ```bash
    ./Able_GET_ById.sh {able-entry-id}
    ```

    このコマンドは `nestedFields` パラメータを使用して、関連するすべてのベーカーとチャーリーのエントリーを返す。

    ```json
    {
      "externalReferenceCode" : "able-one",
      "id" : 42421,
      ...
      "ableToCharlie" : [ {
        ...
        "externalReferenceCode" : "charlie-one",
        "id" : 42433,
        ...
        "name" : "Charlie 1"
      }, {
        ...
        "externalReferenceCode" : "charlie-two",
        "id" : 42435,
        ...
        "name" : "Charlie 2"
      }, {
        ...
        "externalReferenceCode" : "charlie-three",
        "id" : 42437,
        ...
        "name" : "Charlie 3"
      } ],
      "name" : "Able 1",
      "ableToBaker" : [ {
        ...
        "externalReferenceCode" : "baker-one",
        "id" : 42427,
        ...
        "name" : "Baker 1",
        "r_ableToBaker_c_ableId" : 42421,
        "r_ableToBaker_c_ableERC" : "able-one"
      }, {
        ...
        "externalReferenceCode" : "baker-two",
        "id" : 42429,
        ...
        "name" : "Baker 2",
        "r_ableToBaker_c_ableId" : 42421,
        "r_ableToBaker_c_ableERC" : "able-one"
      } ]
    }
    ```

    `nestedFields`パラメータの詳細については、 [Using nestedFields to Query Related Entries](./using-nestedfields-to-query-related-entries.md) を参照のこと。

## コードを調べる

### `Charlie_PUT_AbleToCharlie_ByExternalReferenceCode`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Charlie_PUT_AbleToCharlie_ByExternalReferenceCode.sh
   :language: bash
```

### `Charlie_GET_AbleToCharlie_ById`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Charlie_GET_AbleToCharlie_ById.sh
   :language: bash
```

### `Able_DELETE_AbleToBaker_ById`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Able_DELETE_AbleToBaker_ById.sh
   :language: bash
```

### `Able_GET_ById.sh`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Able_GET_ById.sh
   :language: bash
```

## 関連トピック

* [ヘッドレス・フレームワークの統合](../../understanding-object-integrations/using-custom-object-apis.md)
* [REST APIでネストされたフィールドを使う](./using-nestedfields-to-query-related-entries.md)
* [オブジェクトの関係の定義](../../creating-and-managing-objects/relationships/defining-object-relationships.md)
