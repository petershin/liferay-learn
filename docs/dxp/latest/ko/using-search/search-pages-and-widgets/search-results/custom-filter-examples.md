---
uuid: e3852b4a-f53d-43b2-835e-e75bcd9469df
---

# 사용자 정의 필터 예

```{note}
이 기능은 [Elasticsearch에서만](../../installing-and-upgrading-a-search-engine/solr/solr-limitations.md) 작동합니다.
```

사용자 정의 필터 위젯은 검색 조정 노력에 강력한 도움이 됩니다. 사용자 지정 코드를 배포하지 않고도 검색 엔진에 전송되는 쿼리를 제어할 수 있습니다. 다음은 사용자 정의 필터 위젯에 접근하는 방법을 이해하는 데 도움이 되는 몇 가지 일반적인 사용 사례입니다.

- [검색 결과에서 콘텐츠 제외](#excluding-certain-content)
- [검색 결과에서 콘텐츠 부스팅](#boosting-fields)
- [여러 사이트 ID로 필터링](#filtering-by-site-id)
- [Elasticsearch의 쿼리 문자열 쿼리 사용](#complex-filter-with-query-string)
- [중첩된 필드에 대한 일치 부스팅](#boosting-matches-to-nested-fields)

사용자 정의 필터 위젯에 대한 자세한 설명은 [검색 결과 필터링](./filtering-search-results.md) 참조하십시오.

## 특정 콘텐츠 제외

`must_not` Occur 구성과 함께 사용할 경우 사용자 정의 필터는 검색 결과에서 문서를 포착하고 제외할 수 있습니다.

### 특정 문서 및 미디어 콘텐츠 제외

경우에 따라 특정 유형의 콘텐츠가 검색 결과에 표시되지 않도록 제외할 수 있습니다. 웹 콘텐츠에 추가할 시스템에만 있는 문서 및 미디어 파일 항목을 제외하려면 먼저 제외할 특정 파일을 검색 색인에서 식별할 수 있는 방식으로 구분해야 합니다. 목적을 선언하는 무언가로 태그를 지정하거나(`wconly` 아마도) 전용 [Documents and Media Folder](./../../../content-authoring-and-management/documents-and-media/uploading-and-managing/using-folders.md)에 넣을 수 있습니다. 문서 및 미디어 폴더를 제외하도록 사용자 정의 필터를 구성하려면 다음 설정을 사용하십시오.

**필터 쿼리 유형:** `일치`

**필터 필드:** `folderId`

**필터 값:** `41103`

**발생:** `must_not`

이 구성은 값이 `41103` 인 `folderId` 필드를 포함하는 검색 문서가 검색 결과에 반환되지 않도록 합니다.

### 특정 확장자가 있는 콘텐츠 제외

검색 결과에서 GIF 파일을 제외해야 할 수도 있습니다. 다음과 같이 사용자 지정 필터를 구성합니다.

**필터 쿼리 유형:** `일치`

**필터 필드:** `확장`

**필터 값:** `gif`

**발생:** `must_not`

이 구성은 문서 및 미디어 [`DLFileEntry` 모델](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/document-library/document-library-service/src/main/java/com/liferay/document/library/internal/search/spi/model/index/contributor/DLFileEntryModelDocumentContributor.java)에서 인덱싱된 `확장` 필드의 존재를 활용합니다. 이는 값이 `gif` 인 `확장자` 필드를 포함하는 검색 문서가 검색 결과에 반환되지 않도록 합니다.

## 부스팅 필드

특정 필드를 기반으로 특정 문서를 강화하는 것은 일반적인 요구 사항이며 사용자 정의 필터 위젯을 사용하면 쉽게 수행할 수 있습니다. 부스트 값은 필요에 맞게 조정해야 하는 경우가 많습니다. _점수 설명 활성화_ 활성화된 검색 인사이트 위젯을 사용하여 문서의 점수가 매겨지는 방식을 검사하고 부스트 값을 미세 조정합니다.

### 날짜 범위별 결과 향상

[사용자 지정 필터 위젯 구성 양식](filtering-search-results.md#custom-filter-configuration) 의 날짜 범위 쿼리 옵션은 [Elasticsearch 범위 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-range-query.html)에 해당합니다. 작년에 생성된 결과를 높이려면 사용자 정의 필터를 페이지에 추가하고 다음과 같이 구성하십시오.

**필터 필드:** `createDate`

**필터 값:** `[지금-1y 지금]`

**필터 쿼리 유형:** `범위`

**발생:** `해야`

**부스트:** `100`

작년에 생성된 결과는 이 사용자 지정 필터의 결과로 향상됩니다. 이를 실제로 보려면 다음 제목과 콘텐츠로 약 3분 간격으로 두 개의 블로그를 만드십시오.

| 블로그 1             | 블로그 2             |
|:----------------- |:----------------- |
| 제목: `liferay dxp` | 제목: `liferay dxp` |
| 내용: `liferay dxp` | 내용: `라이프레이`       |

`dxp` 검색하면 이전 블로그가 더 자주 검색된 키워드를 가지고 있고 둘 다 작년에 만들어졌기 때문에 동등하게 부스팅되었기 때문에 검색 결과에서 상위 블로그가 됩니다.

두 번째 블로그 게시물을 생성한 직후 사용자 지정 필터의 필터 값을 `[now-2m now]`로 구성합니다. 이 값을 조정해야 할 수 있습니다.

다시 검색하면 이제 검색 결과의 블로그 순서에 나중 블로그가 먼저 표시됩니다(구성된 시간 범위 내에서 최신 블로그가 생성되고 이전 블로그는 생성되지 않은 경우).

범위를 지정하는 방법에 대한 자세한 내용은 [Elasticsearch 날짜-수학 문서](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/common-options.html#date-math) 을 참조하십시오.

### 지정된 필드에 대한 일치 부스팅

검색된 키워드와 일치하는 특정 필드가 있는 문서를 강화하려면 다음과 같이 사용자 정의 필터를 구성하십시오.

**필터 쿼리 유형:** `다중 일치`

**필터 필드:** `title_en_US, content_en_US`

**발생:** `해야`

**부스트:** `100`

**맞춤 매개변수 이름:** `q`

이 구성은 영어(미국) 제목 및 콘텐츠에 사용자가 검색 창 위젯에 입력한 키워드가 포함된 경우 일치하는 문서를 향상시킵니다. 검색 표시줄의 키워드 매개변수 이름 구성과 동일한 값으로 사용자 정의 매개변수 이름을 입력하면 검색 표시줄에 전달된 값이 사용자 정의 필터에 의해 증폭되는 값임을 의미합니다(검색 색인의 문서와 일치하는 경우).

다중 일치 쿼리는 한 번에 여러 필드를 일치시킬 수 있습니다. 그렇지 않으면 구성 값의 나머지 부분이 동일한 경우에도 각각의 개별 필드에 대해 사용자 정의 필터를 구성해야 합니다.

### 필드의 존재에 의한 부스트

태그 값에 관계없이 태그가 지정된 콘텐츠를 부스트하려면 다음과 같이 사용자 정의 필터를 구성하십시오.

**필터 쿼리 유형:** `있음`

**필터 필드:** `assetTagNames`

**발생:** `해야`

**부스트:** `100`

쿼리와 일치하는 문서에 태그가 지정되면 `assetTagNames` 필드가 포함됩니다. Exists 쿼리는 필드의 모든 값과 일치합니다.

## 사이트 ID로 필터링

모든 사이트를 검색하지 않고 하나의 검색 페이지에서 여러 사이트를 검색하기 위한 구성은 없습니다. 현재 사이트와 모든 [개 하위 사이트](../../../site-building/sites/site-hierarchies.md) 의 결과를 포함하려면 검색 표시줄의 범위를 구성하여 _모든 항목_으로 설정해야 합니다. 그런 다음 하위 쿼리 절을 수집할 수 있는 Bool 쿼리와 함께 하나의 상위 사용자 정의 필터를 사용합니다. 각 쿼리는 검색에 포함할 사이트의 `groupId` 과 일치시키기 위한 용어 쿼리가 있는 사용자 정의 필터 위젯에서 제공합니다. 결과. 사이트의 ID는 검색 문서의 `groupId` 필드입니다.

1. 사이트 3개 만들기:
   - 하위 사이트가 있는 하나 이상의 상위 사이트를 만듭니다.
   - 검색에 포함되지 않을 추가 사이트를 하나 이상 만듭니다.

   ```{tip}
   사이트의 그룹 ID를 찾으려면 사이트 메뉴에서 구성 > 설정으로 이동합니다. 표시된 '사이트 ID'는 사이트를 필터링하는 데 사용할 수 있는 '그룹 ID'입니다.
   ```

1. 각 사이트(블로그 항목)에 최소한 하나의 콘텐츠를 만들고 각각에 _Liferay_ 이라는 단어를 포함합니다.

1. Search Bar 범위를 _Everything_ 로 설정합니다.

   > **체크포인트:** 모든 사이트의 콘텐츠가 반환되는지 검색하고 확인합니다.

   ![이 세 개의 블로그 항목은 각각 다른 사이트에서 가져온 것입니다.](./custom-filter-examples/images/01.png)

1. 상위 사용자 지정 필터 구성:

   **필터 쿼리 유형:** `부울`

   **발생:** `필터`

   **쿼리 이름:** `SiteBoolQuery`

1. 검색에 포함할 각 사이트에 대한 사용자 지정 필터를 구성합니다.

   **필터 쿼리 유형:** `Term`

   **필터 필드:** `groupId`

   **발생:** `해야`

   **상위 쿼리:** `SiteBoolQuery`

   **필터 값:** `38109`

   위 스크린샷의 예제 콘텐츠에는 사용자 지정 필터가 하나 더 필요합니다. 필터 값이 `38105`이라는 한 가지 예외를 제외하고 위와 동일하게 구성합니다.

   > **체크포인트:** 다시 검색하여 지정된 사이트의 콘텐츠만 반환되는지 확인합니다. 이는 검색 결과가 _문서 형식_ 에 결과 표시로 구성된 경우 세부 정보 보기를 보면 확인할 수 있습니다.

   ![포함된 사이트의 콘텐츠만 표시됩니다.](./custom-filter-examples/images/02.png)

중요한 것은 `groupId` 에 의한 필터는 `SiteBoolQuery` 상위 쿼리로 선언한다는 것입니다. 하위 Term 쿼리(각 사이트에 대해)의 _to_ Occur 절은 OR 연산자 역할을 하므로 `groupId`중 하나라도 일치하면 콘텐츠가 검색 결과 위젯에 표시될 수 있습니다.

## 쿼리 문자열이 포함된 복합 필터

경우에 따라 [쿼리 문자열 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-query-string-query.html)사용하여 여러 쿼리가 필요하지 않을 수 있습니다( [사이트 ID로 필터링](#filtering-by-site-id) 예제에서와 같이). 아래 구성은 하나의 사용자 정의 필터 위젯만 사용하여 검색을 제한하는 방법을 보여줍니다.

- `pdf` 또는 `jpg` 확장자를 가진 문서 및 미디어 파일 일치 또는
- 웹 콘텐츠 기사 일치

다음과 같이 사용자 정의 필터 위젯을 구성하십시오.

**필터 쿼리 유형:** `쿼리 문자열`

**발생:** `필터`

**필터 값:** `((확장자:pdf OR 확장자:jpg) AND entryClassName:com.liferay.document.library.kernel.model.DLFileEntry) OR entryClassName:com.liferay.journal.model.JournalArticle`

의도한 우선 순위가 적용되도록 괄호를 사용하는 것이 좋습니다.

검색 페이지의 구성을 단순화하는 것은 좋지만(종종 복잡한 경우는 하나의 사용자 정의 필터 위젯으로 처리됨) 쿼리 문자열 쿼리가 사용자 정의 필터 위젯의 모든 복잡성에 대한 답은 아닙니다. 일부 쿼리는 쿼리 문자열 유형을 사용하여 모방할 수 없습니다. 예를 들어 중첩된 문서를 검색하는 중첩 쿼리, 분석을 피하기 위한 용어 쿼리 또는 접두사 기반 검색을 위한 접두사 쿼리를 처리할 수 없습니다.

```{warning}
전달되는 값이 검색 표시줄에서 오는 경우 쿼리 문자열 쿼리를 사용하면 안 됩니다('지정된 필드에 대한 일치 항목 부스팅'_에서 설명한 대로). 검색 표시줄의 사용자가 잘못된 구문이 포함된 키워드를 입력하면 오류가 반환됩니다.
```

## 중첩된 필드에 대한 일치 부스팅

{bdg-secondary}`사용 가능 7.2 FP10+, 7.3 FP1+, 7.4(모든 업데이트)`

[중첩된 DDM 필드 액세스](../search-facets/custom-facet.md#accessing-nested-ddm-fields)에 설명된 대로 DDM 필드는 Liferay 7.2 SP3+/FP8+(및 모든 Liferay 7.3 버전)에서 [중첩된 필드](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) 가 되었습니다. 7.2 및 7.3의 최신 수정 팩 및 GA 릴리스에서는 이러한 중첩 필드를 설명하기 위해 [Elasticsearch 중첩 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-nested-query.html) 지원됩니다.

사용자 정의 필터 구성에서 [중첩 필드](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) 을 사용하려면 검색 페이지에 세 개의 사용자 정의 필터 위젯이 필요합니다. 필수 하위 쿼리를 래핑하는 [중첩 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-nested-query.html) 위젯 중 하나에 추가됩니다. 하나의 하위 쿼리는 필드 이름과 일치하고 다른 하나는 값과 일치합니다.

이 예는 특정 DDM 구조 필드에 대한 일치 부스트를 추가하는 방법을 보여줍니다.

1. [구조](../../../content-authoring-and-management/web-content/web-content-structures/creating-structures.md)만들기:
    - 사이트 메뉴에서 콘텐츠 & 데이터 &rarr; 웹 콘텐츠로 이동합니다.
    - _구조_ 탭을 클릭한 다음 추가 버튼 ![Add](../../../images/icon-add.png)을 클릭합니다.
    - 구조에 제목(예: _Boosted Content_)과 다음 필드를 지정합니다.
        - 필드 1:
            - **유형:** `부울`
            - **필드 레이블:** `부스트?`
        - 필드 2:
            - **유형:** `텍스트`
            - **필드 레이블:** `콘텐츠`
    - 구조를 저장합니다.

    구조 필드는 기본적으로 인덱싱됩니다.

1. 새 구조를 사용하는 하나의 웹 컨텐츠를 추가하십시오.

    - **제목:** `부스트`
    - **부스트?** `참`
    - **내용:** `테스트.`

1. 새 구조를 사용하는 두 번째 웹 콘텐츠를 추가합니다.

    - **제목:** `부스트되지 않음`
    - **부스트?** `거짓`
    - **콘텐츠:** `테스트 콘텐츠.`

1. 검색 페이지로 이동하여 _test content_ 을 검색하십시오.

    **체크포인트:** 콘텐츠 필드와 정확히 일치하기 때문에 부스트되지 않은 웹 콘텐츠가 부스트된 웹 콘텐츠 앞에 나타납니다.

1. 검색 결과 위젯의 구성에서 _표시 결과를 문서 양식_ 로 활성화합니다.

1. `ddmFieldArray` 필드를 찾아 해당 값을 복사합니다. 예를 들어,

   ```json
   "ddmFieldArray" : [
               {
                 "ddmFieldName" : "ddm__keyword__44012__Checkbox08350381_en_US",
                 "ddmFieldValueKeyword_en_US" : "true",
                 "ddmFieldValueKeyword_en_US_String_sortable" : "true",
                 "ddmValueFieldName" : "ddmFieldValueKeyword_en_US"
               }
            ],
   ```

1. 검색 페이지로 이동하여 Elasticsearch 응답 데이터를 사용하여 3개의 사용자 지정 필터를 추가합니다.

    - 필터 1, 상위 중첩 쿼리:
        - **필터 필드:** `ddmFieldArray`
        - **필터 쿼리 유형:** `중첩`
        - **발생:** `해야`
        - **쿼리 이름:** `parent_query`
        - **부스트:** `500`
    - 필터 2, 필드 이름에 대한 하위 일치 쿼리.
        - **필터 필드:** `ddmFieldArray.ddmFieldName`
        - **필터 쿼리 유형:** `일치`
        - **발생:** `해야`
        - **값:** `ddm__keyword__44012__Checkbox08350381_en_US`
        - **상위 쿼리 이름:** `parent_query`
        - **사용자 정의 매개변수 이름:** `cparam`
    - 필터 3, 부스트 필드의 `참` 값에 대한 하위 일치 쿼리:
        - **필터 필드:** `ddmFieldArray.ddmFieldValueKeyword_en_US`
        - **필터 값:** `참`
        - **필터 쿼리 유형:** `일치`
        - **발생:** `해야`
        - **상위 쿼리 이름:** `parent_query`
        - **커스텀 파리미터 이름:** `cparam`

      ```{important}
      이 예에서는 하나의 중첩 필드에서만 사용자 정의 필터를 사용하므로 하위 쿼리(`cparam`)의 사용자 정의 매개변수는 실제로 필요하지 않습니다. 동일한 페이지의 여러 중첩 필드에 사용자 정의 필터를 설정하려면 이 예에서 설명한 대로 하위 쿼리에 대한 사용자 정의 매개변수 이름을 구성해야 합니다. 두 번째 중첩 필드에 대한 필터를 추가하려면 다른 사용자 정의 매개변수 이름(예: `cparam2`)을 공유하는 두 개의 하위 사용자 정의 필터가 필요합니다.
      ```

1. 이제 _테스트 콘텐츠_ 검색을 반복하고 Boosted Web Content가 Not Boosted Web Content 위에 나타나는지 확인합니다.

부스트 값은 필요에 맞게 조정해야 하는 경우가 많습니다. _점수 설명 활성화_ 활성화된 검색 인사이트 위젯을 사용하여 문서의 점수가 매겨지는 방식을 검사하고 부스트 값을 미세 조정합니다.

## 관련 내용

- [검색 결과 필터링](./filtering-search-results.md)
- [결과 순위](../../search-administration-and-tuning/result-rankings.md)
- [동의어 세트](../../search-administration-and-tuning/synonym-sets.md)
