# Product API - 複数のSKUを持つ商品の作成

商品APIまたは商品アプリケーションを使用して、複数のアクティブなSKUを持つ商品を作成できます。 このような商品を作成するには、まず [Option API](./option-api-basics.md) を使用して、または Options アプリケーションを使用してオプション・テンプレートを作成し、オプションに値を設定する必要があります。 Optionsアプリケーションから値を追加するか、 [Option Value API](./option-value-api-basics.md)を使用します。

```{note}
また、商品のオプションタブからオプションテンプレートを作成することもできます。 しかし、ここで追加された値は、製品固有のものであり、グローバルメニュー(![アプリケーションメニューアイコン](../../images/icon-applications-menu.png))の下にあるオプションテンプレートには追加されません。 &rarr; コマース &rarr; オプション。 
```

## 複数のSKUを持つ商品を追加する

```{include} /_snippets/run-liferay-dxp.md
```

その後、以下の手順に従ってください：

1. Product API - Adding a Product with Multiple SKUs](./liferay-q8t5.zip)をダウンロードして解凍します。

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-q8t5.zip -O
   ```

   ```bash
   unzip liferay-q8t5.zip
   ```

1. 製品はカタログにスコープされ、カタログIDは必須パラメータの1つである。 複数のアクティブなSKUを持つには、商品にもオプションが必要です。 オプションテンプレートを作成して、複数の商品で再利用することができます。 オプション・テンプレートを商品にリンクするには、オプション ID が必要です。

   カタログIDを取得するには、 **Global Menu**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Catalogs** にアクセスしてください。 商品を追加するカタログを選択し、名前の横にあるIDをメモする。

   オプションIDを取得するには、 **グローバルメニュー**(![アプリケーションメニューアイコン](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Options** にアクセスする。 商品にリンクさせたいオプションを選択し、商品名の横にあるIDを控えてください。

   ```{important}
   この例では、`Baker`と`Charlie`の2つの値を含む`Able`という名前のオプションテンプレートが作成されていると仮定します。 
   ```

1. cURLスクリプトを使用して、複数のSKUを持つ新製品をカタログに追加します。 コマンドラインで、`curl`フォルダに移動します。 `Product_POST_ToCatalog.sh` ス ク リ プ ト を、 カ タ ロ グ ID と オプシ ョ ン ID を引数 と し て実行 し ます。

   ```bash
   ./Product_POST_ToCatalog.sh 1234 5678
   ```

   JSONレスポンスは、複数のSKUを持つ新しい商品が追加されたことを示しています：

   ```bash
   {
      "actions" : {
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/46860"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/46860"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products/46860"
         }
      },
      "active" : true,
      "catalogId" : 1234,
      "categories" : [ ],
      "createDate" : "2023-06-09T11:32:27Z",
      "customFields" : [ ],
      "description" : {
         "en_US" : ""
      },
      "displayDate" : "2023-06-09T11:32:00Z",
      "expando" : { },
      "externalReferenceCode" : "82462cc8-1af3-0d14-30f2-d47b38946cf2",
      "id" : 46860,
      "metaDescription" : {
         "en_US" : ""
      },
      "metaKeyword" : {
         "en_US" : ""
      },
      "metaTitle" : {
         "en_US" : ""
      },
      "modifiedDate" : "2023-06-09T11:32:27Z",
      "name" : {
         "en_US" : "Foo"
      },
      "productAccountGroupFilter" : false,
      "productChannelFilter" : false,
      "productId" : 46861,
      "productStatus" : 0,
      "productType" : "simple",
      "productTypeI18n" : "Simple",
      "shortDescription" : {
         "en_US" : ""
      },
      "skuFormatted" : "(Multiple SKUs)",
      "tags" : [ ],
      "thumbnail" : "/o/commerce-media/default/?groupId=43744",
      "urls" : {
         "en_US" : "foo"
      },
      "version" : 1,
      "workflowStatusInfo" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      }
   }
   ```

   `skuFormatted` フィールドには、 `(Multiple SKUs)` が表示され、複数の SKU が作成されていることが確認できます。

1. **グローバルメニュー**(![Applications Menu icon](../../images/icon-applications-menu.png)) を開き、 ［**コマース**］ &rarr; ［**Products**］ に移動して確認してください。 **オプション** タブをクリックすると、リンクされた製品オプションが表示されます。 **SKUs** タブをクリックすると、承認ステータスの新しい SKU が 2 つ表示されます。

   ![複数のSKUを持つ新製品が追加されたことを確認してください。](./product-api-creating-a-product-with-multiple-skus/images/01.png)

1. Javaクライアントを使用してRESTサービスを呼び出すこともできる。 `curl` フォルダから、 `java` フォルダに移動します。 ソースファイルをコンパイルします。

   ```bash
   javac -classpath .:* *.java
   ```

1. `Product_POST_ToCatalog` クラスを実行します。 `catalogId` と `optionId` を適切な値に置き換える。

   ```bash
   java -classpath .:* -DcatalogId=1234 -DoptionId=5678 Product_POST_ToCatalog
   ```

## cURLコマンドの検証

`Product_POST_ToCatalog.sh`スクリプトは、cURLコマンドでRESTサービスを呼び出します。

```{literalinclude} ./product-api-creating-a-product-with-multiple-skus/resources/liferay-q8t5.zip/curl/Product_POST_ToCatalog.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | 説明                              |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products"`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | RESTサービスのエンドポイント                |
| `-d "{\"active\": true, \"catalogId\": \"${1}\", \"name\": {\"en_US\": \"Foo\"}, \"productOptions\": [{\"fieldType\": \"select\", \"key\": \"able\", \"name\": {\"en_US\": \"Able\"}, \"optionId\": \"${2}\", \"required\": true, \"skuContributor\": true}], \"productType\": \"simple\", \"skus\": [{\"published\": true, \"purchasable\": true, \"sku\": \"SKU-01\", \"skuOptions\": [{\"key\": \"able\", \"value\": \"Baker\"}]}, {\"published\": true, \"purchasable\": true, \"sku\": \"SKU-02\", \"skuOptions\": [{\"key\": \"able\", \"value\": \"Charlie\"}]}]}"` | 投稿するデータ                         |
| `-u "test@liferay.com:learn"`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境では、 [OAuth 2.0を使用する](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 経由でユーザーを認証する必要があります。 OAuth2を活用したReactアプリケーションのサンプルは、 [OAuth2によるユーザーの認証](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) をご覧ください。
```

## Javaクラスを調べる

`Product_POST_ToCatalog.java` クラスは、商品関連サービスを呼び出すことで、複数のSKUを持つ商品を追加します。

```{literalinclude} ./product-api-creating-a-product-with-multiple-skus/resources/liferay-q8t5.zip/java/Product_POST_ToCatalog.java
   :dedent: 1
   :language: java
   :lines: 14-85
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                   | 説明                                                     |
|:------------------------------------------------------------------------ |:------------------------------------------------------ |
| `ProductResource.Builder builder = ...`                                  | `ProductResource` サービスインスタンスを生成するための `Builder` を取得します。 |
| `ProductResource productResource = builder.authentication(...).build();` | 基本認証を指定し、 `ProductResource`サービスインスタンスを生成します。           |
| `productResource.postProduct(...);`                                      | `productResource.postProduct`メソッドを呼び出し、データをpostに渡します。  |

プロジェクトには、依存関係として`com.liferay.headless.commerce.admin.catalog.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

## ペイロードの見直し

これは、2つのアクティブなSKUを持つ1つの製品を作成するために使用されるペイロードの例です。

```json
{
   "active": true,
   "catalogId": 1234,
   "name": {
     "en_US": "Foo"
   },
   "productOptions":[
      {
         "fieldType": "select",
         "key": "able",
         "name": {
            "en_US": "Able"
         },
         "optionId": 5678,
         "required": true,
         "skuContributor": true
      }
   ],
   "productType": "simple",
   "skus": [
      {
         "published": true,
         "purchasable": true,
         "sku": "SKU-01",
         "skuOptions":[{
            "key": "able",
            "value": "Baker"
         }]
      },
      {
         "published": true,
         "purchasable": true,
         "sku": "SKU-02",
         "skuOptions":[{
            "key": "able",
            "value": "Charlie"
         }]
      }
   ]
}
```

JSONには合計6つのフィールドがある。

| 項目               | 説明                                                                                                                                                                                                                                                                                                    |
|:---------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `active`         | trueまたはfalseに設定することで、商品の可視性を変更することができます。                                                                                                                                                                                                                                                              |
| `catalogId`      | 製品カタログのID。                                                                                                                                                                                                                                                                                            |
| `name`           | 商品名。                                                                                                                                                                                                                                                                                                  |
| `productOptions` | 豊富な製品オプション。 [ProductOption](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/dto/v1_0/ProductOption.java) を参照。 |
| `productType`    | 製品のタイプ（シンプル、グループ化、バーチャル、ダイアグラム）。                                                                                                                                                                                                                                                                      |
| `skus`           | 製品SKUの配列。 参照 [Sku](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/dto/v1_0/Sku.java)                        |

`productOptions` フィールドには、商品にリンクされているオプションに関する情報が含まれています。

| 項目               | 説明                                                                                                                        |
|:---------------- |:------------------------------------------------------------------------------------------------------------------------- |
| `fieldType`      | オプション・フィールドのタイプ。 `"text"`, `"select"`, `"radio"`, `"checkbox_multiple"`, `"date"`, `"numeric"`, または `"checkbox"`のいずれかである。 |
| `key`            | オプションの鍵                                                                                                                   |
| `name`           | オプションの名前。                                                                                                                 |
| `optionId`       | オプションのID。                                                                                                                 |
| `required`       | trueの場合、チェックアウトの前にオプションを選択する必要があります。                                                                                      |
| `skuContributor` | trueの場合、各オプションはSKUにリンクされる。 これは、複数のSKUを持つ製品には必須です。                                                                         |

`skus` フィールドには、商品のSKUに関する情報が含まれています。

| 項目            | 説明                                                                                                                                                                                                                                                                                                                                            |
|:------------- |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `published`   | trueの場合、SKUはストアフロントに表示されます。                                                                                                                                                                                                                                                                                                                   |
| `purchasable` | trueの場合、そのSKUは購入可能である。                                                                                                                                                                                                                                                                                                                        |
| `sku`         | SKUの名前。                                                                                                                                                                                                                                                                                                                                       |
| `skuOptions`  | スキューオプションの数々。 [SkuOption](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/dto/v1_0/SkuOption.java) を参照。 `キー` はオプション・テンプレートのキーで、 `値` はオプションの値の1つを指定する。 |

```{note}
`skuOptions` 内の `key` と `value` は `optionId` と `optionValueId` で置き換えることができる。 
```

## 関連トピック

* [製品APIの基本](./product-api-basics.md)
* [オプションAPIの基本](./option-api-basics.md)
* [オプション値APIの基本](./option-value-api-basics.md)
