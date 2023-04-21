# 関連REST APIの利用

{bdg-secondary}`Liferay 7.4 U70+/GA70+で利用可能`

カスタムオブジェクトやシステムオブジェクトに関連を追加すると、Liferayはそれらの関連にアクセスするためのRESTエンドポイントを生成します。 エントリーの関連付けや関連付けの解除、エントリーの関連エントリーを返すことができます。 これらのエンドポイントは、1対多の関連では親オブジェクトに、多対多の関連では両方のオブジェクトに追加されます。

続行するには、新しいLiferay 7.4インスタンスを [セットアップ](#setting-up-a-liferay-instance) し、提供されたチュートリアルコードを [準備](#preparing-the-sample-code) します。 その後、スクリプトを実行してオブジェクトエントリーを作成し、互いの関連を管理します。

## Liferayインスタンスのセットアップ
```{include} /_snippets/run-liferay-portal.md
```

次に、関連する3つのカスタムオブジェクトを[作成](../../creating-and-managing-objects/creating-objects.md) します。

1. **グローバルメニュー**(![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブで ［**オブジェクト**］ をクリックします。

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

1. 各オブジェクトドラフトに以下の`name`フィールドを追加します。

   | ラベル | 項目名 | 種類 | 必須 |
   | :--- | :--- | :--- | :--- |
   | `Name` | `name` | Text | &#10004; |

1. これらの関連をableオブジェクトに追加します。

   | ラベル | 関連名 | タイプ | オブジェクト |
   | :--- | :--- | :--- | :--- |
   | `Able to Baker` | `ableToBaker` | 1対多 | Baker |
   | `Able to Charlie` | `ableToCharlie` | 1対多 | Charlie |

1. 各オブジェクトを [公開](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) します。

公開後、以下の関連APIを含む、それらのREST APIにアクセスできます。

| オブジェクト  | HTTPメソッド | HTTPエンドポイント                                                      | Java メソッド                       |
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
サイトオブジェクトと会社オブジェクトの両方に対して生成されるAPIの完全なリストについては、[オブジェクトのヘッドレスフレームワークの統合](../../understanding-object-integrations/headless-framework-integration.md) を参照してください。 カスタムオブジェクトAPIは、LiferayAPIエクスプローラーを通して`[server]:[port]/o/api` (例：`localhost:8080/o/api`）で表示およびテストできます。 *RESTアプリケーション*をクリックし、APIを選択します。
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

1. `POST`コマンドを実行し、各オブジェクトに3つのエントリーを作成します。 これらのエントリーは、 `[objectname]-[number]`の命名パターンに従って、あらかじめ定義された外部参照コード(ERC）を持っています(例： `able-one`)。

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

   `nestedFields`パラメーターの詳細については、 [REST APIでネストしたフィールドの使用](./using-nested-fields-with-rest-apis.md) を参照してください。

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

## 追加情報

* [ヘッドレスフレームワークの統合](../../understanding-object-integrations/headless-framework-integration.md)
* [REST APIでネストしたフィールドの使用](./using-nested-fields-with-rest-apis.md)
* [オブジェクトリレーションの定義](../../creating-and-managing-objects/relationships/defining-object-relationships.md)
