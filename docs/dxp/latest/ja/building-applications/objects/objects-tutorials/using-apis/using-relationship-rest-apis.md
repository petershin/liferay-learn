# 関連REST APIの利用

{bdg-secondary}`Liferay 7.4 U70+/GA70+で利用可能`

カスタムオブジェクトやシステムオブジェクトに関連を追加すると、Liferayはそれらの関連にアクセスするためのRESTエンドポイントを生成します。 エントリーの関連付けや関連付けの解除、エントリーの関連エントリーを返すことができます。 これらのエンドポイントは、1対多の関連では親オブジェクトに、多対多の関連では両方のオブジェクトに追加されます。

続行するには、新しいLiferay 7.4インスタンスを [セットアップ](#setting-up-a-liferay-instance) し、提供されたチュートリアルコードを [準備](#preparing-the-sample-code) します。 その後、スクリプトを実行してオブジェクトエントリーを作成し、互いの関連を管理します。

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

次に、[作成](../../creating-and-managing-objects/creating-objects.md) 3 つの関連するカスタム オブジェクトを作成します。

1. **グローバル メニュー**(![グローバル メニュー](../../../../images/icon-applications-menu.png)) を開き、 **コントロール パネル** タブに移動して、 **オブジェクト** 。

1. 3 つのオブジェクト ドラフトを作成します。

    最初のオブジェクト:

    | フィールド | 値 |
    | :--- | :--- |
    | ラベル | `有能` |
    | 複数のラベル | `エイブル` |
    | 名前 | `有能` |

    2 番目のオブジェクト:

    | フィールド | 値 |
    | :--- | :--- |
    | ラベル | `ベイカー` |
    | 複数のラベル | `パン屋` |
    | 名前 | `ベイカー` |

    3 番目のオブジェクト:

    | フィールド | 値 |
    | :--- | :--- |
    | ラベル | チャーリー |
    | 複数のラベル | チャーリーズ |
    | 名前 | チャーリー |

1. 各オブジェクトのドラフトに「name」フィールドを追加します。

    | ラベル | フィールド名 | タイプ | 必須 |
    | :--- | :--- | :--- | :--- |
    | `名前' | `名前` | テキスト | &#10004; |

1. 次の関係をableオブジェクトに追加します。

    | ラベル | 関係名 | タイプ | オブジェクト |
    | :--- | :--- | :--- | :--- |
    | `パン屋ができる` | `ableToBaker` | 1 対多 | ベイカー |
    | 「チャーリーできる」 | `ableToCharlie` | 1 対多 | チャーリー |

1. [発行](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 各オブジェクト。

公開されると、次の関係 API を含む REST API にアクセスできるようになります。

| Object  | HTTP Method | HTTP Endpoint                                                      | Java Method                       |
|:--------|:------------|:-------------------------------------------------------------------|:----------------------------------|
| Able    | GET         | `/{ableId}/ableToBaker`                                            | `getAbleAbleToBakerBakerPage`     |
| Able    | GET         | `/{ableId}/ableToCharlie`                                          | `getAbleAbleToCharlieCharliePage` |
| Able    | DELETE      | `/{ableId}/ableToBaker/{bakerId}`                                  | `deleteAbleAbleToBakerBaker`      |
| Able    | PUT         | `/{ableId}/ableToBaker/{bakerId}`                                  | `putAbleAbleToBakerBaker`         |
| Able    | DELETE      | `/{ableId}/ableToCharlie/{charlieId}`                              | `deleteAbleAbleToCharlieCharlie`  |
| Able    | PUT         | `/{ableId}/ableToCharlie/{charlieId}`                              | `putAbleAbleToCharlieCharlie`     |
| Able    | PUT         | `/by-external-reference-code/{ableERC}/ableToBaker/{bakerERC}`     | `putAbleAbleToBakerBaker`         |
| Able    | PUT         | `/by-external-reference-code/{ableERC}/ableToCharlie/{charlieERC}` | `putAbleAbleToCharlieCharlie`     |
| Charlie | GET         | `/{charlieId}/ableToCharlie`                                       | `getCharlieAbleToCharlieAblePage` |
| Charlie | DELETE      | `/{charlieId}/ableToCharlie/{ableId}`                              | `deleteCharlieAbleToCharlieAble`  |
| Charlie | PUT         | `/{charlieId}/ableToCharlie/{ableId}`                              | `putCharlieAbleToCharlieAble`     |
| Charlie | PUT         | `/by-external-reference-code/{ableERC}/ableToCharlie/{charlieERC}` | `putCharlieAbleToCharlieAble`     |

```{tip}
サイトおよび会社のオブジェクトに対して生成される API の完全なリストについては、[Objects Headless Framework Integration](../../undering-object-integrations/headless-framework-integration.md) を参照してください。 Liferay API Explorer の`[server]:[port]/o/api` (例: `localhost:8080/o/api`) でカスタム オブジェクト API を表示およびテストできます。 *REST アプリケーション* をクリックし、API を選択します。
```

## サンプルコードを準備する

以下のコマンドを実行し、提供されたサンプルコードをダウンロードし、解凍してください：

```bash
curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-f9m2.zip -O
```

```bash
unzip liferay-f9m2.zip
```

サンプルコードには、各オブジェクトのエントリーを作成し、その関連APIを使用するためのコマンドが含まれています。

## サンプルコードを使用する

REST APIを使用して、オブジェクトのエントリーを追加し、その関連を管理します。

1. `liferay-f9m2`プロジェクト内の`curl`フォルダに移動します。

   ```bash
   cd liferay-f9m2/curl
   ```

1. `POST`コマンドを実行し、各オブジェクトに3つのエントリーを作成します。 これらのエントリーは、 `[objectname]-[number]`の命名パターンに従って、あらかじめ定義された外部参照コード（ERC）を持っています（例： `able-one`)。

   ```bash
   ./Able_POST_Batch.sh
   ```

   ```bash
   ./Baker_POST_Batch.sh
   ```

   ```bash
   ./Charlie_POST_Batch.sh
   ```

1. `Able_PUT_AbleToBaker_ByExternalReferenceCode` を `able-one` ERC と 3 つの baker ERC すべてで実行します。

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

1. `Able_DELETE_AbleToBaker_ById`に、`able-one`と`baker-three `の 2 つの ID を付けて実行します。

   ```bash
   ./Able_DELETE_AbleToBaker_ById.sh {able-entry-id} {baker-entry-id}
   ```

   これにより、エントリーの関連付けが解除されます。

1. `Able_GET_AbleToBaker_ById` を同じable IDで実行し、両者の関連性がなくなったことを確認します。

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

1. `Able_PUT_AbleToCharlie_ByExternalReferenceCode`を`able-one` ERC と 3 つの charlie ERC すべてで実行します。

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

1. `Charlie_GET_AbleToCharlie_ById` に `charlie-one`のIDを付けて実行します。

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

1. `Charlie_PUT_AbleToCharlie_ByExternalReferenceCode` を `charlie-one` および `able-two` ERC で実行します。

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

1. `Charlie_GET_AbleToCharlie_ById` を `charlie-one` のIDで実行し、関連する2つのableエントリーが存在することを確認します。

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

1. `Able_GET_ById`に`able-one`のIDを付けて実行します。

   ```bash
   ./Able_GET_ById.sh {able-entry-id}
   ```

   このコマンドは、`nestedFields`パラメーターを使用して、関連するすべての baker および charlie エントリーを返します。

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

   [ `nestedFields` to Query Related Entries](./using-nestedfields-to-query-related-entries.md) を参照。 `nestedFields` パラメータの詳細。

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

* [ヘッドレスフレームワークの統合](../../understanding-object-integrations/headless-framework-integration.md)
* [REST APIでネストしたフィールドの使用](./using-nestedfields-to-query-related-entries.md)
* [オブジェクトリレーションの定義](../../creating-and-managing-objects/relationships/defining-object-relationships.md)
