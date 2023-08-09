# `nestedFields` を使って関連するエントリーをクエリーする。

{bdg-secondary}`Liferay 7.4 U69+/GA69+で利用可能`

`nestedFields` パラメータは、Liferay が1つの GET リクエストで複数のレベルの関連オブジェクトエントリを返すようにします。 `nestedFields` パラメータに、クエリに含めるリレーションシップ名をコンマで区切って渡します： `nestedFields=[firstObjectRelationship],[secondObjectRelationship]`. リレーションシップが複数のレベルにまたがる場合は、 `nestedFieldsDepth` パラメータを必要な深さに設定します。 最大5レベルまで含めることができる（例： `nestedFieldsDepth=5`）。

```{tip}
nestedFields` パラメータは、複数のリクエストを必要とするような関連するエントリを取得することで、リクエストを最適化します。 関連するエントリーのみを返すために、Liferayは専用の[関連API](./../understanding-object-integrations/headless-framework-integration.md#relationship-rest-apis) を提供します。 概要については、[関連REST APIの利用](./using-relationship-rest-apis.md)を参照してください。
```

続行するには、新しいLiferay 7.4インスタンスを[セットアップ](#setting-up-a-liferay-instance)し、提供されたチュートリアルコードを[準備](#preparing-the-sample-code)します。 次に、 [スクリプトを実行する。](#creating-and-querying-related-object-entries) 関連エントリーを作成し、 `nestedFields` パラメーターを使用してクエリーする。

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

次に、3つのオブジェクト定義を作成し、関連付けます。

### 関連オブジェクト定義の作成

1. グローバル・メニュー(![グローバル・メニュー](../../../../images/icon-applications-menu.png))を開き、[コントロール・パネル(*Control Panel*)]タブに移動し、[オブジェクト(*Objects*)]をクリックします。

1. [Create](../../creating-and-managing-objects/creating-objects.md) 3つのオブジェクトドラフトを作成します。

   最初のオブジェクト

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | `Able` |
   | 複数形のラベル | `Ables` |
   | 名前 | `Able` |

   2番目のオブジェクト

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | `Baker` |
   | 複数形のラベル | `Bakers` |
   | 名前 | `Baker` |

   3番目のオブジェクト

   | フィールド | 値 |
   | :--- | :--- |
   | ラベル | `Charlie` |
   | 複数形のラベル | `Charlies` |
   | 名前 | `Charlies` |

1. 各オブジェクトのドラフトに`名前`テキストフィールドを追加する。

   | ラベル | フィールド名 | タイプ | 必須 |
   | :--- | :--- | :--- | :--- |
   | `名前` | `名前` | &#10004; |

1. 以下の関係を定義する。

   エイブルの場合：

   | ラベル | リレーションシップ名 | タイプ | オブジェクト |
   | :--- | :--- | :--- | :--- |
   | `Able to Baker` | `ableToBaker` | `1人から多数へ` | Baker |

   パン職人の場合

   | ラベル | リレーションシップ名 | タイプ | オブジェクト|
   | :--- | :--- | :--- | :--- |
   | `Baker to Charlie` | `bakerToCharlie` | 1人から多人数へ | Charlie |

   チャーリーの場合:

   | ラベル | 関係名 | タイプ | オブジェクト |
   | :--- | :--- | :--- | :--- |
   | `Charlie to Able` | `charlieToAble` | 多対多 | 有能 |

1. [パブリッシュ](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 各オブジェクト。

公開されると、ヘッドレスAPI経由で各オブジェクトにアクセスできるようになります。

## サンプルコードの準備

以下のコマンドを実行して、提供されているサンプルコードをダウンロードし、解凍してください：

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-w4s7.zip -O
```

```bash
unzip liferay-w4s7.zip
```

ZIPは、REST APIを使用してオブジェクトエントリを作成、関連付け、照会するためのcURLコマンドを実行するシェルスクリプトを提供します。 これには、関連エントリーを照会するための2つのGETコマンドが含まれる。

```{tip}
サイトオブジェクトと会社オブジェクトに対して生成されるAPIの完全なリストについては、[オブジェクトのヘッドレスフレームワークの統合](../../understanding-object-integrations/headless-framework-integration.md)を参照してください。 カスタムオブジェクトAPIは、LiferayAPIエクスプローラーを通して`[server]:[port]/o/api` （例：`localhost:8080/o/api`）で表示およびテストできます。 *RESTアプリケーション*をクリックし、APIを選択します。
```

## 関連オブジェクト・エントリーの作成と照会

1. `liferay-w4s7`プロジェクトの`curl`フォルダに移動します。

   ```bash
   cd liferay-w4s7/curl
   ```

1. `Able_POST_ToCompany` を実行して、Ableエントリーを作成する。

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   次のPOSTコマンドで使用するために、最初のエントリーのIDをコピーします。

   ```json
   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1"
   }

   {
     ...
     "externalReferenceCode" : "able-two",
     "id" : 47514,
     ...
     "name" : "Able 2"
   }

   {
     ...
     "externalReferenceCode" : "able-three",
     "id" : 47516,
     ...
     "name" : "Able 3"
   }
   ```

1. `able-one` のIDをパラメータとして、 `Baker_POST_ToCompany` を実行する。

   ```bash
   ./Baker_POST_ToCompany.sh [ableId]
   ```

   これは3つのBakerエントリーを作成し、 `ableToBaker` リレーションシップを使用して、指定されたAbleエントリーに関連付けます。

   それぞれの Baker エントリには 3 つの `ableToBaker` リレーションフィールドがあります： `ableToBakerERC`、`r_ableToBaker_c_ableId`、`r_ableToBaker_c_ableERC` です。

   ```json
   {
     ...
     "externalReferenceCode" : "baker-one",
     "id" : 47518,
     ...
     "name" : "Baker 1",
     "ableToBakerERC" : "able-one",
     "r_ableToBaker_c_ableId" : 47512,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-two",
     "id" : 47520,
     ...
     "name" : "Baker 2",
     "ableToBakerERC" : "able-one",
     "r_ableToBaker_c_ableId" : 47512,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-three",
     "id" : 47522,
     ...
     "name" : "Baker 3",
     "ableToBakerERC" : "able-one",
     "r_ableToBaker_c_ableId" : 47512,
     "r_ableToBaker_c_ableERC" : "able-one"
   }
   ```

   次の POST コマンドで使用するために、最初のベーカー・エントリ ID をコピーする。

1. `baker-one` のIDをパラメータとして、 `Charlie_POST_ToCompany` を実行する。

   ```bash
   ./Charlie_POST_ToCompany.sh [bakerId]
   ```

   これは、3 つの Charlie エントリを作成し、 `bakerToCharlie` リレーションシップを使用して、指定した Baker エントリに関連付けます。

   ```json
   {
     ...
     "externalReferenceCode" : "charlie-one",
     "id" : 47524,
     ...
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlieERC" : "baker-one",
     "name" : "Charlie 1",
     "r_bakerToCharlie_c_bakerId" : 47518
   }

   {
     ...
     "externalReferenceCode" : "charlie-two",
     "id" : 47526,
     ...
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlieERC" : "baker-one",
     "name" : "Charlie 2",
     "r_bakerToCharlie_c_bakerId" : 47518
   }

   {
     ...
     "externalReferenceCode" : "charlie-three",
     "id" : 47528,
     ...
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlieERC" : "baker-one",
     "name" : "Charlie 3",
     "r_bakerToCharlie_c_bakerId" : 47518
   }
   ```

   これで、3つのチャーリー・エントリーが1つのベイカー・エントリーに関連し、そのエントリー自体がエイブル・エントリーに関連していることになる。 しかし、基本的なGETリクエストでチャーリーエントリーを問い合わせた場合、レスポンスにはチャーリーエントリーの詳細しか含まれません。 関連するベイカーやエイブルのエントリーの詳細は含まれていない。 これらのエントリの詳細を返すには、 `nestedFields` および `nestedFieldsDepth` パラメータを使用する必要があります。

   次のGETコマンドで使用するために、最初のエントリーのIDをコピーします。

1. `Charlie_GET_ById` をチャーリーエントリーのIDをパラメータとして実行する。

   ```bash
   ./Charlie_GET_ById.sh [charlieId]
   ```

   このGETリクエストは、 `nestedFields` と `nestedFieldsDepth` パラメータを持つ `o/c/charlies` エンドポイントを呼び出す。

   ```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
      :language: bash
   ```

   `nestedFields`: クエリに含めるリレーションシップを指定します (`ableToBaker,bakerToCharlie`)。

   `nestedFieldsDepth`: 含めるエントリーの深さを決定する (`2`)。

   このコマンドは、3つのレベルの関連オブジェクト（すなわち、Charlie、Baker、Able）をすべて返す。

   ```json
   {
     ...
     "externalReferenceCode" : "charlie-one",
     "id" : 47524,
     ...
     "r_bakerToCharlie_c_baker" : {
       ...
       "externalReferenceCode" : "baker-one",
       "id" : 47518,
       ...
       "r_ableToBaker_c_able" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "bakerToCharlie" : [ {
         ...
         "externalReferenceCode" : "charlie-one",
         "id" : 47524,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 1",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-two",
         "id" : 47526,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 2",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-three",
         "id" : 47528,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 3",
         "r_bakerToCharlie_c_bakerId" : 47518
       } ],
       "name" : "Baker 1",
       "ableToBaker" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "r_ableToBaker_c_ableId" : 47512,
       "r_ableToBaker_c_ableERC" : "able-one"
     },
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlie" : {
       ...
       "externalReferenceCode" : "baker-one",
       "id" : 47518,
       ...
       "r_ableToBaker_c_able" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "bakerToCharlie" : [ {
         ...
         "externalReferenceCode" : "charlie-one",
         "id" : 47524,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 1",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-two",
         "id" : 47526,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 2",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-three",
         "id" : 47528,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 3",
         "r_bakerToCharlie_c_bakerId" : 47518
       } ],
       "name" : "Baker 1",
       "ableToBaker" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "r_ableToBaker_c_ableId" : 47512,
       "r_ableToBaker_c_ableERC" : "able-one"
     },
     "name" : "Charlie 1",
     "r_bakerToCharlie_c_bakerId" : 47518
   }
   ```

1. これらのERCで `Charlie_PUT_CharlieToAble_ByExternalReferenceCode` を実行する。

   ```bash
   ./Charlie_PUT_CharlieToAble_ByExternalReferenceCode.sh charlie-one charlie-two charlie-three able-one
   ```

   これは、 `charlieToAble` のリレーションシップを使用して、3つのチャーリーエントリーをすべて、指定された `able-one` エントリーと直接リレーションします。

1. Able エントリーの ERC で `Able_GET_ByExternalReferenceCode` を実行する。

   ```bash
   ./Able_GET_ByExternalReferenceCode.sh able-one
   ```

   このGETリクエストは、 `o/c/ables` エンドポイントを、 `nestedFields` パラメータで呼び出す。

   ```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Able_GET_ByExternalReferenceCode.sh
      :language: bash
   ```

   `nestedFields`: クエリに含めるリレーションシップを決定します (`charlieToAble`)。

   このコマンドは、 `able-one` の詳細を、関連する3つのCharlieエントリーのすべての詳細とともに返す。

   ```json
   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "charlieToAble" : [ {
       ...
       "externalReferenceCode" : "charlie-one",
       "id" : 47524,
       ...
       "r_bakerToCharlie_c_bakerERC" : "baker-one",
       "bakerToCharlieERC" : "baker-one",
       "name" : "Charlie 1",
       "r_bakerToCharlie_c_bakerId" : 47518
     }, {
       ...
       "externalReferenceCode" : "charlie-two",
       "id" : 47526,
       ...
       "r_bakerToCharlie_c_bakerERC" : "baker-one",
       "bakerToCharlieERC" : "baker-one",
       "name" : "Charlie 2",
       "r_bakerToCharlie_c_bakerId" : 47518
     }, {
       ...
       "externalReferenceCode" : "charlie-three",
       "id" : 47528,
       ...
       "r_bakerToCharlie_c_bakerERC" : "baker-one",
       "bakerToCharlieERC" : "baker-one",
       "name" : "Charlie 3",
       "r_bakerToCharlie_c_bakerId" : 47518
     } ],
     "name" : "Able 1"
   }
   ```

## `Charlie_GET_ById.sh`

```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
   :language: bash
```

## `Able_GET_ByExternalReferenceCode.sh`

```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Able_GET_ByExternalReferenceCode.sh
   :language: bash
```

## 関連トピック

* [オブジェクトAPIの基本](./object-api-basics.md)
* [バッチAPIの使用](./using-batch-apis.md)
* [REST APIでの集計用語の使用](./using-aggregation-terms-with-rest-apis.md)
