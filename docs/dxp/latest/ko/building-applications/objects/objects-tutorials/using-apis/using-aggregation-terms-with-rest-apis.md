# REST API에서 집계 용어 사용

REST API를 사용하여 개체 항목을 쿼리할 때 개체의 필드를 항목 데이터 집계를 위한 패싯 기준으로 사용할 수 있습니다. 이렇게 하려면 `aggregationTerms` 매개변수를 GET 요청에 추가하고 패싯 기준으로 사용할 데이터 필드를 지정하십시오. 이러한 기준에는 사용자 정의 필드, 기본 시스템 필드 또는 관계 필드가 포함될 수 있습니다. 그런 다음 요청 응답은 지정된 데이터 패싯을 단일 `패싯` 블록으로 그룹화합니다.

여기에서는 기본 사용자 지정 개체와 함께</code> ``변수를 사용합니다.</p>

<p spaces-before="0">진행하기 전에 <a href="#setting-up-a-liferay-instance">설정</a> 새 Liferay DXP/Portal 7.4 인스턴스 및 <a href="#preparing-the-sample-code">준비</a> 제공된 튜토리얼 코드.</p>

<h2 spaces-before="0">Liferay 인스턴스 설정</h2>

<p spaces-before="0">```{include} /_snippets/run-liferay-portal.md</p>

<pre><code>
Then, follow these steps to [create](../../creating-and-managing-objects/creating-objects.md) a basic Object for this tutorial:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the *Add* button (![Add Button](../../../../images/icon-add.png)) and enter these values:

   | Field | Value |
   | :--- | :--- |
   | Label | `Able` |
   | Plural Label | `Ables` |
   | Name | `Able` |

1. Select the new *Object* draft, go to the *Fields* tab, and add the following text fields:

   | Label | Field Name | Type | Required |
   | :--- | :--- | :--- | :--- |
   | Name | name | Text | &#10004; |
   | Description | description | Text |  |

1. Go to the *Details* tab and click [*Publish*](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts).

   ```{important}
   For this tutorial, you must use the above values.
``</pre>

게시되면 헤드리스 API를 통해 개체에 액세스할 수 있습니다.

## 샘플 코드 준비

다음 명령을 실행하여 제공된 샘플 코드를 다운로드하고 압축을 풉니다.

```bash
curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-b3x5.zip -O
```

```bash
unzip liferay-b3x5.zip
```

이러한 스크립트에는 다음 API가 포함됩니다.

| HTTP 방법 | HTTP 끝점  | 묘사                                                                       |
|:------- |:-------- |:------------------------------------------------------------------------ |
| 가져 오기   | `/`      | Liferay 인스턴스의 전체 객체 항목 목록을 반환합니다. 결과에 페이지를 매기고, 필터링하고, 검색하고, 정렬할 수 있습니다. |
| 우편      | `/batch` | API 호출에 제공된 세부 정보를 사용하여 여러 객체 항목을 생성합니다.                                 |

## 샘플 코드 사용

1. 샘플 코드를 다운로드한 후 `liferay-b3x5` 프로젝트의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-b3x5/curl
   ```

1. `Ables_POST_Batch`을 실행합니다. 이렇게 하면 여러 개체 항목이 생성됩니다.

   ```bash
   ./Ables_POST_Batch.sh
   ```

   터미널에 유사한 출력이 표시되어야 합니다.

   ```bash
   {
     "className" : "com.liferay.object.rest.dto.v1_0.ObjectEntry",
     "contentType" : "JSON",
     "errorMessage" : "",
     "executeStatus" : "STARTED",
     "externalReferenceCode" : "",
     "failedItems" : [ ],
     "id" : 1,
     "importStrategy" : "ON_ERROR_FAIL",
     "operation" : "CREATE",
     "processedItemsCount" : 0,
     "startTime" : "2022-04-27T00:18:23Z",
     "totalItemsCount" : 0
   }
   ```

1. `Ables_GET_FromCompany` 을 실행하여 `aggregatedTerms` 매개변수로 생성된 모든 항목의 목록을 반환합니다.

   응답에는 2개의 패싯 기준( `dateModified` 및 `description`)이 있는 `패싯` 블록이 포함되어야 합니다.

   ```bash
   ...
   "facets" : [ {
       "facetCriteria" : "dateModified",
       "facetValues" : [ {
         "numberOfOccurrences" : 3,
         "term" : "20220427001823"
       } ]
     }, {
       "facetCriteria" : "description",
       "facetValues" : [ {
         "numberOfOccurrences" : 1,
         "term" : "bar"
       }, {
         "numberOfOccurrences" : 1,
         "term" : "foo"
       }, {
         "numberOfOccurrences" : 1,
         "term" : "goo"
       } ]
   } ],
   ...
   ```

   이 블록 다음에는 표준 GET 응답이 옵니다.

   ```bash
   {
     ...
     "id" : 41969,
     ...
     "name" : "Able 1",
     "description" : "Foo"
     ...
   }, {
     ...
     "id" : 41971,
     ...
     "name" : "Able 2",
     "description" : "Bar"
   }, {
     ...
     "id" : 41973,
     ...
     "name" : "Able 3",
     "description" : "Goo"
   }
   ...
   ```

## 코드 검토

```{literalinclude} ./using-aggregation-terms-with-rest-apis/resources/liferay-b3x5.zip/curl/Ables_GET_FromCompany.sh
   :language: bash
```

이 배치 GET 메소드에는 2개의 값( `dateModified` 및 `description`)이 있는 `aggregationTerms` URL 매개변수가 포함됩니다. 이는 요청 응답의 개체 항목에서 데이터를 집계하는 데 사용되는 패싯 기준을 결정합니다.

## 추가 정보

* [개체 API 기본 사항](./object-api-basics.md)
* [배치 API 사용](./using-batch-apis.md)
* [REST API에서 중첩 필드 사용](./using-nested-fields-with-rest-apis.md)
