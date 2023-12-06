# REST API로 집계 용어 사용

REST API를 사용하여 개체 항목을 쿼리할 때 개체의 필드를 항목 데이터 집계를 위한 패싯 기준으로 사용할 수 있습니다. 이렇게 하려면 GET 요청에 'aggregationTerms' 매개변수를 추가하고 패싯 기준으로 사용할 데이터 필드를 지정하세요. 이러한 기준에는 사용자 정의 필드, 기본 시스템 필드 또는 관계 필드가 포함될 수 있습니다. 그런 다음 요청 응답은 지정된 데이터 패싯을 단일 '패싯' 블록으로 그룹화합니다.

여기서는 기본 맞춤 개체와 함께 `aggregatedTerms` 매개변수를 사용합니다.

계속하기 전에 새로운 Liferay DXP/Portal 7.4 인스턴스를 [설정](#setting-up-a-liferay-instance) 하고 제공된 튜토리얼 코드를 [prepare](#preparing-the-sample-code) 하세요.

## Liferay 인스턴스 설정

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 이 튜토리얼의 기본 객체를 [create]합니다(../../creating-and-managing-objects/creating-objects.md).

1. **전역 메뉴**(![전역 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 후 **개체를 클릭합니다.** .

1. **추가** 버튼(![추가 버튼](../../../../images/icon-add.png))을 클릭하고 다음 값을 입력합니다.

   | 분야    | 가치      |
   | :---- | :------ |
   | 라벨    | `Able`  |
   | 복수 라벨 | `Ables` |
   | 이름    | `Able`  |

1. 새 **개체** 초안을 선택하고 **필드** 탭으로 이동한 후 다음 텍스트 필드를 추가하세요.

   | 라벨 | 필드 이름 | 유형 | 요구하는 |
   | :- | :---- | :- | :--- |
   | 이름 | 이름    | 원본 | ✔    |
   | 묘사 | 묘사    | 원본 |      |

1. **세부정보** 탭으로 이동하여 [**게시**](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 를 클릭하세요.

   ```{important}
   이 자습서에서는 위의 값을 사용해야 합니다.
   ```

게시되면 Headless API를 통해 객체에 액세스할 수 있습니다.

## 샘플 코드 준비

다음 명령을 실행하여 제공된 샘플 코드를 다운로드하고 압축을 풉니다.

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-b3x5.zip -O
```

```bash
unzip liferay-b3x5.zip
```

이러한 스크립트에는 다음 API가 포함됩니다.

| HTTP 방법 | HTTP 엔드포인트 | 묘사                                                                     |
| :------ | :--------- | :--------------------------------------------------------------------- |
| 얻다      | `/`        | Liferay 인스턴스에 있는 개체 항목의 전체 목록을 반환합니다. 결과는 페이지 매김, 필터링, 검색 및 정렬이 가능합니다. |
| 우편      | `/batch`   | API 호출에 제공된 세부정보를 사용하여 여러 개체 항목을 만듭니다.                                 |

## 샘플 코드 사용

1. 샘플 코드를 다운로드한 후 `liferay-b3x5` 프로젝트의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-b3x5/curl
   ```

1. `Ables_POST_Batch`를 실행합니다. 이렇게 하면 여러 개체 항목이 생성됩니다.

   ```bash
   ./Ables_POST_Batch.sh
   ```

   터미널에 비슷한 출력이 표시되어야 합니다.

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

1. `Ables_GET_FromCompany`를 실행하여 `aggregatedTerms` 매개변수로 생성된 모든 항목의 목록을 반환합니다.

   응답에는 'dateModified' 및 'description'이라는 두 가지 패싯 기준이 있는 'facets' 블록이 포함되어야 합니다.

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

   이 블록 뒤에는 표준 GET 응답이 옵니다.

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

이 일괄 GET 메소드에는 `dateModified` 및 `description`이라는 두 가지 값이 있는 `aggregationTerms` URL 매개변수가 포함되어 있습니다. 이는 요청 응답의 개체 항목에서 데이터를 집계하는 데 사용되는 패싯 기준을 결정합니다.

## 관련 주제

* [객체 API 기본](./object-api-basics.md)
* [Batch API 사용](./using-batch-apis.md)
* ['nestedFields'를 사용하여 관련 항목 쿼리](./using-nestedfields-to-query-관련-entries.md)
