# nestedFields を使用した関連エントリーのクエリー

{bdg-secondary}`liferay 7.4 U69+/GA69+`.

`nestedFields` パラメータは、Liferay が一つの GET リクエストで複数のレベルの関連オブジェクトエントリを返すようにします。 `nestedFields=[firstObjectRelationship],[secondObjectRelationship]` のように、クエリに含めるリレーションシップの名前を `nestedFields` パラメータに渡す。 リレーションシップが複数のレベルにまたがる場合は、`nestedFieldsDepth` パラメータを必要な深さに設定する。 最大5レベルまで含めることができる（例：`nestedFieldsDepth=5`）。

```{tip}
`nestedFields` パラメータは、複数のリクエストを必要とするような関連するエントリを取得することで、リクエストを最適化します。 関連するエントリーのみを返すために、Liferay は専用の [リレーションシップ API](../using-custom-object-apis.md#relationship-rest-apis) を提供しています。 [Using Relationship REST API](./using-relationship-rest-apis.md) を参照してください。
```

先に進むには、 [セットアップ](#setting-up-a-liferay-instance) 新しい Liferay 7.4 インスタンスをセットアップし、 [準備](#preparing-the-sample-code) 提供されたチュートリアルコードを準備します。 次に、 [スクリプトを実行する。](#creating-and-querying-related-object-entries) 関連するエントリーを作成し、`nestedFields` パラメーターを使ってクエリーする。

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

次に、3つのオブジェクト定義を作成し、関連付ける。

### 関連オブジェクト定義の作成

1. **グローバルメニュー**(![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］**タブで***［ オブジェクト**］ をクリックします。

1. [作成](../../creating-and-managing-objects/creating-objects.md) 3つのオブジェクトドラフトを作成する。

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

1. 各オブジェクトドラフトに以下の`name`テキストフィールドを追加します。

   | ラベル    | 項目名    | 種類       | 必須       |
   | :----- | :----- | :------- | :------- |
   | `Name` | `name` | テキストボックス | &#10004; |

1. 以下の関連を定義します。

   エイブルのために：

   | ラベル             | リレーション名       | 種類   | オブジェクト |
   | :-------------- | :------------ | :--- | :----- |
   | `Able to Baker` | `ableToBaker` | 1 対多 | ベーカー   |

   ベーカーのために

   | ラベル                | リレーション名          | 種類   | オブジェクト |
   | :----------------- | :--------------- | :--- | :----- |
   | `Baker to Charlie` | `bakerToCharlie` | 1 対多 | チャーリー  |

   チャーリーのために

   | ラベル               | リレーション名         | 種類  | オブジェクト |
   | :---------------- | :-------------- | :-- | :----- |
   | `Charlie to Able` | `charlieToAble` | 多対多 | エイブル   |

1. [Publish](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 各オブジェクト。

公開後は、ヘッドレスAPIで各オブジェクトにアクセスすることができます。

## サンプルコードを準備する

以下のコマンドを実行して、提供されているサンプルコードをダウンロードし、解凍してください：

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-w4s7.zip -O
```

```bash
unzip liferay-w4s7.zip
```

ZIPは、REST APIを使用してオブジェクトエントリを作成、関連付け、照会するためのcURLコマンドを実行するシェルスクリプトを提供します。 これには、関連エントリーを照会するための2つのGETコマンドが含まれる。

```{tip}
サイトオブジェクトとカンパニーオブジェクト用に生成されたAPIの完全なリストについては、 [Objects Headless Framework Integration](../using-custom-object-apis.md) を参照してください。 カスタムオブジェクトAPIは、LiferayAPIエクスプローラーを通して`[server]:[port]/o/api` （例：`localhost:8080/o/api`）で表示およびテストできます。 *RESTアプリケーション*をクリックし、APIを選択します。
```

## 関連オブジェクト・エントリーの作成と照会

1. `liferay-w4s7`プロジェクトの`curl` フォルダに移動します。

   ```bash
   cd liferay-w4s7/curl
   ```

1. `Able_POST_ToCompany`を実行して、Ableエントリーを作成する。

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

1. `able-one`の ID をパラメータとして`Baker_POST_ToCompany` を実行する。

   ```bash
   ./Baker_POST_ToCompany.sh [ableId]
   ```

   これは 3 つのベーカーエントリーを作成し、`ableToBaker` リレーションシップを使って指定されたエイブルエントリーに関連付けます。

   それぞれの Baker エントリには 3 つの `ableToBaker` リレーションフィールドがあります：`ableToBakerERC`、`r_ableToBaker_c_ableId`、`r_ableToBaker_c_ableERC` です。

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

1. `baker-one`の ID をパラメータとして`Charlie_POST_ToCompany` を実行する。

   ```bash
   ./Charlie_POST_ToCompany.sh [bakerId]
   ```

   これは3つのCharlieエントリーを作成し、`bakerToCharlie`リレーションシップを使用して指定されたBakerエントリーに関連付けます。

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

   これで、3つのチャーリー・エントリーが1つのベイカー・エントリーに関連し、そのエントリー自体がエイブル・エントリーに関連していることになる。 しかし、基本的なGETリクエストを使ってチャーリーエントリーを問い合わせた場合、レスポンスにはチャーリーエントリーの詳細しか含まれません。 関連するベイカーやエイブルのエントリーの詳細は含まれていない。 これらのエントリの詳細を返すには、 `nestedFields` と `nestedFieldsDepth` パラメータを使用する必要がある。

   次のGETコマンドで使用するために、最初のエントリーのIDをコピーします。

1. チャーリーエントリーの ID をパラメータとして `Charlie_GET_ById` を実行する。

   ```bash
   ./Charlie_GET_ById.sh [charlieId]
   ```

   この GET リクエストは `nestedFields` と `nestedFieldsDepth` パラメータを持つ `o/c/charlies` エンドポイントを呼び出す。

   ```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
      :language: bash
   ```

   `nestedFields`：クエリに含めるリレーションシップを指定する (`ableToBaker,bakerToCharlie`)。

   `nestedFieldsDepth`：含めるエントリの深さを指定する (`2`)。

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

1. これらのERCで`Charlie_PUT_CharlieToAble_ByExternalReferenceCode`を実行する。

   ```bash
   ./Charlie_PUT_CharlieToAble_ByExternalReferenceCode.sh charlie-one charlie-two charlie-three able-one
   ```

   これは、`charlieToAble`リレーションシップを使用して、3つのチャーリーエントリーを指定された`able-one`エントリーに直接関連付けます。

1. エイブル・エントリーの ERC で `Able_GET_ByExternalReferenceCode` を実行する。

   ```bash
   ./Able_GET_ByExternalReferenceCode.sh able-one
   ```

   この GET リクエストは `nestedFields` パラメータを持つ `o/c/ables` エンドポイントを呼び出す。

   ```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Able_GET_ByExternalReferenceCode.sh
      :language: bash
   ```

   `nestedFields`：クエリに含めるリレーションシップを決定する (`charlieToAble`)。

   このコマンドは`able-one`の詳細を、関連する3つのチャーリーエントリーの全詳細とともに返す。

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

* [オブジェクトAPIの基礎](./object-api-basics.md)
* [バッチAPIの使用](./using-batch-apis.md)
* [REST APIでの集計用語の使用](./using-aggregation-terms-with-rest-apis.md)
