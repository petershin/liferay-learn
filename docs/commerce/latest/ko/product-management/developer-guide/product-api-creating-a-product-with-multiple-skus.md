# 제품 API - 여러 SKU로 제품 만들기

제품 API를 사용하거나 제품 애플리케이션에서 여러 활성 SKU가 있는 제품을 만들 수 있습니다. 이러한 제품을 생성하려면 먼저 [옵션 API](./option-api-basics.md) 사용하거나 옵션 애플리케이션을 통해 생성된 옵션 템플릿이 있어야 하며 옵션에 대한 값이 있어야 합니다. 옵션 애플리케이션에서 값을 추가하거나 [옵션 값 API](./option-value-api-basics.md)을 사용할 수 있습니다.

```{note}
제품의 옵션 탭에서 옵션 템플릿을 생성할 수도 있습니다. 그러나 여기에 추가된 값은 제품에 따라 다르며 전역 메뉴(![응용 프로그램 메뉴 아이콘](../../images/icon-applications-menu.png) 아래에 있는 옵션 템플릿에 추가되지 않습니다. ) &rarr; 상업 &rarr; 옵션. 
```

## SKU가 여러 개인 제품 추가

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [제품 API - 여러 SKU가 있는 제품 추가](./liferay-q8t5.zip) 를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/commerce/latest/en/product-management/developer-guide/liferay-q8t5.zip -O
   ```

   ```bash
   unzip liferay-q8t5.zip
   ```

1. 제품은 카탈로그로 범위가 지정되며 카탈로그 ID는 필수 매개변수 중 하나입니다. 활성 SKU가 여러 개 있으려면 제품에 옵션도 있어야 합니다. 옵션 템플릿을 생성하여 여러 제품에서 재사용할 수 있습니다. 옵션 템플릿을 제품에 연결하려면 옵션 ID가 필요합니다.

   카탈로그 ID를 얻으려면 **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))를 열고 **상거래** &rarr; **카탈로그** 로 이동하십시오. 제품을 추가할 카탈로그를 선택하고 이름 옆에 있는 ID를 기록해 둡니다.

   옵션 ID를 얻으려면 **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../../images/icon-applications-menu.png)), **상거래** &rarr; **옵션** 로 이동합니다. 제품에 연결할 옵션을 선택하고 이름 옆에 있는 ID를 기록해 둡니다.

   ```{important}
   이 예에서는 'Baker'와 'Charlie'라는 두 값을 포함하는 'Able'이라는 이름으로 생성된 옵션 템플릿이 있다고 가정합니다. 
   ```

1. cURL 스크립트를 사용하여 SKU가 여러 개인 새 제품을 카탈로그에 추가하십시오. 명령줄에서 `curl` 폴더로 이동합니다. 카탈로그 ID 및 옵션 ID를 매개변수로 사용하여 `Product_POST_ToCatalog.sh` 스크립트를 실행하십시오.

   ```bash
   ./Product_POST_ToCatalog.sh 1234 5678
   ```

   JSON 응답은 여러 SKU가 추가된 새 제품을 보여줍니다.

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

   `skuFormatted` 필드에 `(다중 SKU)` 표시되어 둘 이상의 SKU 생성을 확인합니다.

1. **글로벌 메뉴**(![Applications Menu icon](../../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **제품** 로 이동하여 이를 확인하십시오. **옵션** 탭을 클릭하면 연결된 제품 옵션을 볼 수 있습니다. **SKU** 탭을 클릭하면 승인됨 상태의 새 SKU 2개가 표시됩니다.

   ![SKU가 여러 개인 새 제품이 추가되었는지 확인합니다.](./product-api-creating-a-product-with-multiple-skus/images/01.png)

1. Java 클라이언트를 사용하여 REST 서비스를 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `Product_POST_ToCatalog` 클래스를 실행합니다. `catalogId` 및 `optionId` 을 적절한 값으로 바꿉니다.

   ```bash
   java -classpath .:* -DcatalogId=1234 -DoptionId=5678 Product_POST_ToCatalog
   ```

## cURL 명령 검사

`Product_POST_ToCatalog.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./product-api-creating-a-product-with-multiple-skus/resources/liferay-q8t5.zip/curl/Product_POST_ToCatalog.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | 묘사                      |
|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/products"`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | REST 서비스 끝점             |
| `-d "{\"active\": true, \"catalogId\": \"${1}\", \"name\": {\"en_US\": \"Foo\"}, \"productOptions\": [{\"fieldType\": \"select\", \"key\": \"able\", \"name\": {\"en_US\": \"Able\"}, \"optionId\": \"${2}\", \"required\": true, \"skuContributor\": true}], \"productType\": \"simple\", \"skus\": [{\"published\": true, \"purchasable\": true, \"sku\": \"SKU-01\", \"skuOptions\": [{\"key\": \"able\", \"value\": \"Baker\"}]}, {\"published\": true, \"purchasable\": true, \"sku\": \"SKU-02\", \"skuOptions\": [{\"key\": \"able\", \"value\": \"Charlie\"}]}]}"` | 게시할 데이터                 |
| `-u "test@liferay.com:learn"`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2) 을 통해 사용자를 인증해야 합니다. 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/using-oauth2-to-authorize-users) 를 참조하세요. OAuth2를 활용합니다.
```

## Java 클래스 검토

`Product_POST_ToCatalog.java` 클래스는 제품 관련 서비스를 호출하여 여러 SKU가 있는 제품을 추가합니다.

```{literalinclude} ./product-api-creating-a-product-with-multiple-skus/resources/liferay-q8t5.zip/java/Product_POST_ToCatalog.java
   :dedent: 1
   :language: java
   :lines: 14-85
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                   | 묘사                                                      |
|:------------------------------------------------------------------------ |:------------------------------------------------------- |
| `ProductResource.Builder builder = ...`                                  | `ProductResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.         |
| `ProductResource productResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `ProductResource` 서비스 인스턴스를 생성합니다.          |
| `productResource.postProduct(...);`                                      | `productResource.postProduct` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.commerce.admin.catalog.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

## 페이로드 검토

이것은 두 개의 활성 SKU가 있는 하나의 제품을 생성하는 데 사용되는 예제 페이로드입니다.

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

JSON에는 총 6개의 필드가 있습니다.

| 분야               | 묘사                                                                                                                                                                                                                                                                                         |
|:---------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `active`         | 제품의 가시성을 변경하려면 true 또는 false로 설정하십시오.                                                                                                                                                                                                                                                      |
| `catalogId`      | 제품 카탈로그의 ID입니다.                                                                                                                                                                                                                                                                            |
| `name`           | 제품의 이름입니다.                                                                                                                                                                                                                                                                                 |
| `productOptions` | 다양한 제품 옵션. [제품 옵션](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/dto/v1_0/ProductOption.java) 보기 |
| `productType`    | 제품 유형(단순, 그룹화, 가상 또는 다이어그램).                                                                                                                                                                                                                                                               |
| `skus`           | 제품 SKU의 배열입니다. [SKU](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/dto/v1_0/Sku.java) 참조         |

`productOptions` 필드에는 제품에 연결된 옵션에 대한 정보가 포함됩니다.

| 분야               | 묘사                                                                                                                      |
|:---------------- |:----------------------------------------------------------------------------------------------------------------------- |
| `fieldType`      | 옵션 필드의 유형입니다. `"text"`, `"select"`, `"radio"`, `"checkbox_multiple"`, `"date"`, `"numeric"`또는 `"checkbox"`중 하나일 수 있습니다. |
| `key`            | 옵션의 키입니다.                                                                                                               |
| `name`           | 옵션의 이름입니다.                                                                                                              |
| `optionId`       | 옵션의 ID입니다.                                                                                                              |
| `required`       | true인 경우 체크아웃하기 전에 옵션을 선택해야 합니다.                                                                                        |
| `skuContributor` | true인 경우 각 옵션은 SKU에 연결됩니다. SKU가 여러 개인 제품의 경우 필수입니다.                                                                     |

`sku` 필드에는 제품의 SKU에 대한 정보가 포함되어 있습니다.

| 분야            | 묘사                                                                                                                                                                                                                                                                                                                                          |
|:------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `published`   | true인 경우 SKU가 상점 첫화면에 표시됩니다.                                                                                                                                                                                                                                                                                                                |
| `purchasable` | true인 경우 SKU를 구매할 수 있습니다.                                                                                                                                                                                                                                                                                                                   |
| `sku`         | SKU의 이름입니다.                                                                                                                                                                                                                                                                                                                                 |
| `skuOptions`  | SKU 옵션의 배열입니다. [SkuOption](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/headless/headless-commerce/headless-commerce-admin-catalog-client/src/main/java/com/liferay/headless/commerce/admin/catalog/client/dto/v1_0/SkuOption.java) 을 참조하십시오. `키` 옵션 템플릿의 키이고 `값` 옵션 값 중 하나를 지정합니다. |

```{note}
`skuOptions` 내부의 `key` 및 `value`를 `optionId` 및 `optionValueId`로 대체할 수 있습니다. 
```

## 관련 항목

* [제품 API 기본 사항](./product-api-basics.md)
* [옵션 API 기본 사항](./option-api-basics.md)
* [옵션 값 API 기본 사항](./option-value-api-basics.md)
