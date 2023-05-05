# 청사진 요소 참조 검색

요소는 [검색 청사진](understanding-search-blueprints.md#what-is-a-blueprint) 의 기본 빌딩 블록 중 하나입니다. 사용 가능한 모든 요소를 탐색하려면 전역 메뉴(![Global](../../../../images/icon-applications-menu.png)) &rarr; 애플리케이션 &rarr; 청사진으로 이동합니다. 요소 탭을 열고 관심 있는 요소를 찾아 클릭합니다. 요소의 전체 JSON 표현이 표시됩니다.

청사진에 요소를 추가하려면 청사진 [](./creating-and-managing-search-blueprints.md) 만들고 Query Builder &rarr; Query Elements 사이드바를 사용하여 요소를 검색하고 추가합니다.

![검색 청사진 애플리케이션에서 쿼리 요소를 구성합니다.](./search-blueprints-elements-reference/images/13.png)

Blueprints &rarr; 쿼리 요소 화면에서 작업하는 동안 요소에 대한 쿼리 구성 JSON을 보려면 작업 아이콘(![Actions](../../../../images/icon-actions.png)) &rarr; 요소 JSON 보기를 클릭합니다.

블루프린트의 제목 표시줄에 있는 토글 스사이트를 사용하여 블루프린트에서 각 요소를 비활성화하거나 활성화할 수 있습니다. Blueprint에서 요소를 간소화하여 보기 위해 요소의 제목 표시줄에 있는 아래쪽 화살표 아이콘(![Down Arrow Icon](../../../../images/icon-angle-down.png))을 사용하여 요소의 콘텐츠를 축소할 수 있습니다.

각 요소에는 구성 옵션이 있으며, 그 중 다수는 Elasticsearch [Query DSL 설명서](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl.html) 에 정의된 쿼리 속성에 직접적으로 해당합니다. 특정 쿼리 유형에 대한 링크는 아래에 적절하게 제공됩니다.

## 일부 결과 향상

[Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-term-query.html#term-field-params) 쿼리에 구성된 `부스트` 일치 결과의 관련성 점수를 조정합니다. 1.0 이상의 값은 점수를 높이고 0에서 1.0 사이의 값은 점수를 낮춥니다.

특정 결과를 부스트할 때 특정 요구 사항을 충족하도록 부스트 값을 조정해야 합니다. [미리보기 사이드바](creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar)  사용하여 문서의 점수가 매겨지는 방식을 검사하고 부스트 값을 미세 조정합니다.

### 모든 키워드 일치 부스트

주어진 필드에서 검색 키워드가 일치하는 경우 다중 일치 쿼리를 사용하여 결과를 높입니다. 요소의 다중 일치 쿼리 절을 전체적으로 부스트하고 각 개별 필드에 대한 일치를 부스트할 수 있습니다. **Text to Match** 구성 필드는 선택 사항입니다. 비워 두면 검색 사용자의 키워드가 쿼리에 전달됩니다.

![다중 일치 쿼리에 대한 일치를 유연하게 향상합니다.](./search-blueprints-elements-reference/images/01.png)

- 필드: 검색할 필드와 개별적으로 부스트할지 여부를 선택합니다.
- 일치 유형: Elasticsearch에서 내부적으로 쿼리를 처리하는 방식을 지정합니다. **Most Fields** 지정된 각 필드에 대한 일치 쿼리를 생성하고 점수를 결합하므로 아마도 가장 기본적인 유형일 것입니다.
- 부스트: 일치하는 결과의 관련성 점수를 조정합니다. 기본값은 1.0이므로 1.0보다 큰 값은 점수를 높이고 0에서 1.0 사이의 값은 점수를 낮춥니다.
- 일치시킬 텍스트: 하드코딩된 키워드를 일치시키거나 사용자의 검색 키워드와 일치하도록 비워 둡니다.

**외부 참조** : Elasticsearch [다중 일치](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-multi-match-query.html) 쿼리 문서를 참조하십시오.

### 부스트 자산 유형

주어진 자산 유형을 부스트합니다. 등록된 [Assets](../../../../building-applications/data-frameworks/asset-framework.md) 목록에서 Asset Type(필수)을 선택하고 부스트 값을 설정합니다.

### 현재 언어에 대한 부스트 콘텐츠

`context.language_id` 필드에 저장된 현재 세션 언어와 일치하는 기본 언어가 있는 부스트 페이지 및 웹 콘텐츠. 부스트 값을 구성합니다.

### 키워드 일치로 카테고리의 콘텐츠 부스트

사용자의 검색 키워드에 구성된 키워드가 포함된 경우 카테고리의 콘텐츠를 부스트합니다. 키워드 및 저작물 카테고리 ID가 필요합니다.

Elasticsearch 인덱스(예: Kibana 사용)를 쿼리하여 `assetCategoryId`을 포함하는 자산 범주에 대한 검색 문서를 찾을 수 있습니다. 이 경우 검색 중인 범주의 제목은 **business** 입니다.

```json
GET /_search
{
  "query": {
    "multi_match": {
      "fields": [
        "localized_title_en_US",
        "title_en_US",
        "title"
      ],
      "query": "business"
    }
  }
}
```

```{tip}
검색할 필드가 현지화되었는지 여부가 확실하지 않은 경우 위 스니펫에서와 같이 다중 일치 쿼리를 사용하여 필드의 여러 변형을 검색하십시오.
```

또는 적절한 권한이 있는 사용자는 사이트 메뉴 &rarr; 분류 &rarr; 범주로 이동하여 자산 범주 ID를 찾을 수 있습니다. 범주를 열고 해당 URL을 확인하십시오. 예를 들어,

[http://localhost:8080/group/guest/~/control_panel/manage/-/categories_admin/vocabulary/41891/category/41892](http://localhost:8080/group/guest/~/control_panel/manage/-/categories_admin/vocabulary/41891/category/41892)

필요한 ID는 URL의 마지막 부분입니다. 이 경우 `41892` 입니다.

### 일정 기간 동안 카테고리의 콘텐츠 부스트

주어진 기간 동안 카테고리의 콘텐츠를 부스트합니다. 저작물 카테고리 ID, 시작 시간 및 종료 시간이 모두 필요합니다. 이 요소는 조건부입니다. 현재 날짜가 구성된 날짜 범위를 벗어나면 쿼리 및 부스트가 실행되지 않습니다.

![주어진 날짜 범위에서 특정 범주로 결과를 부스트하십시오.](./search-blueprints-elements-reference/images/02.png)

### 사용자 세그먼트에 대한 범주의 부스트 콘텐츠

주어진 [사용자 세그먼트](../../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)에 속하는 사용자에 대한 카테고리의 부스트 콘텐츠. 둘 이상의 사용자 세그먼트 ID를 입력하는 경우 텍스트 상자에 쉼표를 입력하여 다음 ID 입력을 시작하십시오. 자산 범주 ID 및 사용자 세그먼트 ID는 필수 필드입니다. 이것은 조건부 요소입니다. `user.active_segment_entry_ids` 에 지정된 세그먼트 ID가 포함된 경우에만 쿼리가 실행되고 부스트됩니다.

![주어진 세그먼트의 사용자에 대해 특정 범주로 결과를 부스트합니다.](./search-blueprints-elements-reference/images/03.png)

### 게스트 사용자를 위한 카테고리의 부스트 콘텐츠

사용자가 로그인하지 않은 경우 카테고리의 부스트 콘텐츠. 저작물 카테고리 ID가 필요합니다. 이는 `user.is_signed_in` 매개변수가 `false`인 경우에만 쿼리가 실행되고 강화된다는 점에서 조건부 요소입니다.

### 신규 사용자 계정 카테고리의 콘텐츠 부스트

주어진 시간 내에 생성된 사용자 계정에 대한 카테고리의 콘텐츠를 부스트합니다. 저작물 카테고리 ID와 시간 범위(일수)가 필요합니다. 주어진 일수 내에 생성된 계정은 새 계정으로 간주되며 이러한 사용자에 대해 특정 결과가 향상됩니다. 이것은 조건부 요소입니다. 쿼리는 실행되고 `user.create_date` 매개변수가 주어진 시간 범위 내의 값을 갖는 경우에만 부스트됩니다.

![특정 범주의 신규 사용자로 결과를 높이십시오.](./search-blueprints-elements-reference/images/04.png)

### 시간대별 카테고리의 콘텐츠 부스트

시간대를 기준으로 카테고리의 콘텐츠를 부스트합니다. 다음 시간 범위 중 하나를 선택하십시오.

- 아침: 오전 4시~오후 12시
- 오후: 12PM-5PM
- 저녁: 오후 5시~8시
- 야간: 오후 8시~오전 4시

![주어진 시간 동안 특정 범주로 결과를 부스트하십시오.](./search-blueprints-elements-reference/images/05.png)

### 카테고리의 부스트 콘텐츠

주어진 카테고리의 콘텐츠를 부스트하고 홍보합니다. 저작물 카테고리 ID가 필요합니다.

### 내 사이트의 부스트 콘텐츠

사용자가 회원인 사이트의 부스트 콘텐츠. 이 요소에는 필수 필드가 없습니다. 다른 부스팅 요소와 마찬가지로 부스트 값을 원하는 대로 구성합니다. 검색 컨텍스트에는 현재 사용자의 그룹을 추적하기 위한 매개변수 `user.group_ids` 이 포함되어 있으며 현재 사이트의 ID가 해당 목록의 일부인 경우 쿼리가 일치하고 부스트가 적용됩니다.

### 더 많은 버전으로 콘텐츠 향상

더 많은 버전이 있는 부스트 결과. 이 요소는 `versionCount_sortable` 키워드 필드에서 `field_value_factor` 함수를 사용하여 함수 점수 쿼리를 실행합니다. Factor 및 Modifier는 필수이며 요소에서 구성할 수 있습니다. 요소, 수정자, 버전 수 및 부스트의 조합에 따라 결과가 부스트되는 방식이 결정됩니다.

![더 높은 버전 수로 결과를 높이십시오.](./search-blueprints-elements-reference/images/06.png)

- 계수: 필드 값을 곱할 계수를 설정합니다. 기본값은 1.2입니다.
- 수정자: 수정자를 사용하여 필드 값에 적용합니다. 기본값은 제곱근입니다. 다른 옵션으로는 None, log, log1p, log2p, ln, ln1p, ln2p, Square 또는 Reciprocal이 있습니다.
- 부스트: 초기 부스트 값을 설정합니다. 기본값은 10입니다. 부스트 값에 함수 점수를 곱하여 최종 점수 조정을 얻습니다.

**예:** 문서의 버전 수가 `8`이고 기본값이 요소에서 사용된 경우 문서의 점수는 다음과 같이 계산됩니다.

`10 * (sqrt (1.2 * 8))`

따라서 이 문서에는 이 요소로 인해 약 `30` 의 점수가 추가됩니다.

**외부 참조:** Elasticsearch [함수 점수 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-function-score-query.html) 설명서를 참조하십시오.

### 신선도 향상

Gaussian 함수를 사용하여 최근 수정된 부스트 내용.

![부스트 결과가 더 최근에 수정되었습니다.](./search-blueprints-elements-reference/images/07.png)

문서의 신선도에 따라 점수를 매기는 데 사용되는 가우시안 함수를 조정해야 할 수도 있습니다. Boost Freshness Element 구성에서 Decay, Scale, Offset 및 Boost를 조정할 수 있습니다.

- Decay는 자산의 신선도가 Scale 및 Offset 값의 합과 같을 때 부스트 값을 줄이는 요인을 정의합니다.
- 오프셋은 감쇠 함수에 의해 계산된 대로 결과의 관련성이 저하되기 시작하는 지금부터 (과거의) 일 수입니다.
- 결과의 관련성이 감쇠 매개변수와 같게 되는 지금부터 (과거의) 일 수를 결정하기 위해 오프셋에 배율이 추가됩니다.
- 부스트는 정의된 척도 내에 있는 결과를 부스트하기 위한 시작 숫자 값입니다.

**외부 참조:** 자세한 내용은 Elasticsearch [함수 점수 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-function-score-query.html) 설명서를 참조하십시오.

### 더 긴 콘텐츠 부스트

Function Score Query의 Field Value Factor를 사용하여 사용자의 현재 언어로 된 더 긴 콘텐츠 필드 데이터로 결과를 향상시킵니다.

`context.language_id` 매개변수는 `content_{context.language_id}_length_sortable` 필드의 값인 숫자 필드를 가져오는 데 사용됩니다. 숫자 필드 값과 함께 함수(기본적으로 자연 로그)를 사용하여 문서 점수에 대한 수정 사항이 계산됩니다.

![더 긴 콘텐츠로 결과를 높이십시오.](./search-blueprints-elements-reference/images/08.png)

요소 구성에서 Boost, Factor 및 Modifier를 조정할 수 있습니다.

- 부스트는 함수에 의해 점수가 매겨진 후 결과를 부스트하는 숫자 값입니다.
- Factor는 필드 값에 곱할 값입니다.
- 수정자는 필드 값을 수정할 때 사용할 기능을 정의합니다.

**외부 참조:** 자세한 내용은 Elasticsearch [함수 점수 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-function-score-query.html) 설명서를 참조하십시오.

### 근접성 향상

가우시안 함수로 검색 사용자에게 더 가까운 콘텐츠를 부스트합니다.

Boost Proximity 요소는 [ipstack](https://ipstack.com) 서비스를 사용하여 문서에서 [geopoint](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/geo-point.html) 필드로 표시된 사용자 사이트에 더 가까운 검색 결과를 향상시킵니다.

ipstack 서비스 및 Boost Proximity Element와 함께 작동하려면 검색 문서에 [geopoint 필드](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/geo-point.html) 이 있어야 합니다. Liferay에는 기존 자산에 사용자 정의 필드로 추가할 수 있는 호환 가능한 지리적 사이트 필드가 포함되어 있습니다.

ipstack 서비스 설정, 사용자 정의 지리적 사이트 필드 사용, Blueprint에 Boost Proximity 요소 추가에 대한 자세한 내용은 [검색 경험 개인화](./personalizing-the-search-experience.md) 참조하십시오.

### 부스트 태그 콘텐츠

주어진 태그 중 하나 이상을 포함하는 콘텐츠를 부스트합니다. 쉼표로 구분된 목록을 사용하여 여러 태그 이름을 입력합니다.

### 부스트 태그 매치

태그와 정확히 일치하는 키워드로 콘텐츠를 홍보하세요. 검색 사용자의 키워드는 `assetTagNames.raw` 필드 내용과 비교되고(이렇게 하면 `assetTagNames` 텍스트 필드에서 키워드 필드가 만들어짐) 문서에서 용어 쿼리가 일치하면 구성된 값만큼 점수가 상승합니다.

**외부 참조:** Elasticsearch [용어 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-term-query.html) 설명서를 참조하십시오.

### 키워드 일치로 웹 콘텐츠 부스트

사용자의 검색 키워드에 주어진 키워드가 포함된 경우 특정 웹 콘텐츠를 부스트합니다. 일치하도록 기사 ID 및 키워드를 구성합니다.

## 결과 필터링

검색 결과를 필터링하면 예 또는 아니오로 질문하게 됩니다. 문서의 필드가 쿼리와 일치합니까? 이 경우 관련성에 대해 걱정하지 않아도 됩니다(즉, 얼마나 잘 일치합니까?). 검색 결과에 반환되는 범위를 좁힐 수 있도록 여러 필터링 요소가 제공됩니다. 그들은 모두 메인 [검색 요청](./understanding-search-blueprints.md#understanding-the-search-request) 의 `필터` 블록에 쿼리를 제공합니다.

### 정확한 용어 일치로 필터링

용어 쿼리를 사용하여 하나 이상의 용어를 필드 값에 일치시켜 결과를 필터링합니다. 필터를 적용하려면 하나 이상이 일치해야 합니다.

![지정된 필드에서 정확히 일치하는 결과를 필터링합니다.](./search-blueprints-elements-reference/images/09.png)

**외부 참조:** [Elasticsearch 용어 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-terms-query.html) 설명서를 참조하십시오.

### 일정 기간 동안 생성된 콘텐츠로 검색 제한

범위 쿼리를 사용하여 결과를 필터링합니다. 시간 범위를 구성합니다.

**외부 참조:** [Elasticsearch 범위 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-range-query.html) 설명서를 참조하십시오.

### HEAD 버전으로 검색 제한

웹 콘텐츠 기사의 최신 버전만 반환하도록 검색을 제한합니다. 이 요소는 Liferay 검색 프레임워크 쿼리 절의 기능을 복제하며 고급 사용 사례에 가장 유용합니다. 예를 들어 Liferay의 검색 프레임워크가 기본 검색 절을 제공하지 못하도록 비활성화한 경우 이 요소를 사용하여 손실된 기능의 일부를 복원할 수 있습니다.

### 내 콘텐츠로 검색 제한

사용자가 소유한 콘텐츠로 검색을 제한합니다. 이 요소는 `userId` 필드에 대한 용어 쿼리로 결과를 필터링하여 `user.id` 컨텍스트 매개변수와 일치시킵니다.

### 내 사이트로 검색 제한

사용자가 구성원인 사이트로 검색 범위를 제한합니다. 이 요소는 `scopeGroupId` 필드에 대한 용어 쿼리로 결과를 필터링하여 `user.group_ids` 컨텍스트 매개변수와 일치시킵니다.

### PDF 파일로 검색 제한

검색을 PDF 파일로 제한하십시오. 이 요소는 `mimeType` 필드의 Term 쿼리로 결과를 필터링하고 해당 값을 하드코딩된 쿼리 값 `application_pdf`과 일치시킵니다.

### 게시된 콘텐츠로 검색 제한

게시된 콘텐츠로 검색을 제한합니다. 이 요소는 Liferay 검색 프레임워크 쿼리 절의 기능을 복제하며 고급 사용 사례에 가장 유용합니다. 예를 들어 Liferay의 검색 프레임워크가 기본 검색 절을 제공하지 못하도록 비활성화한 경우 이 요소를 사용하여 손실된 기능의 일부를 복원할 수 있습니다.

이 요소는 `상태` 필드에 대한 용어 쿼리를 사용하여 결과를 필터링하고 해당 값을 [Liferay의 작업 흐름 시스템](../../../../process-automation/workflow/introduction-to-workflow.md#understanding-workflow-status) 에 게시된 콘텐츠를 나타내는 `0`의 하드코딩된 값과 일치시킵니다.

### 현재 사이트로 검색 제한

현재 사이트로 검색을 제한합니다. 이 요소는 `scopeGroupId` 필드에서 용어 쿼리를 사용하여 결과를 필터링하고 해당 값을 컨텍스트 매개변수 `context.scope_groupId`과 일치시킵니다.

이 요소의 기능은 [검색 표시줄의](../../../getting-started/searching-for-content.md#configuring-the-search-bar) 범위 구성 옵션과 겹칩니다.

### 이 사이트로 검색 제한

검색 범위를 지정된 사이트로 제한합니다. `scopeGroupId` 필드에서 용어 쿼리를 사용하여 결과를 필터링하고 해당 값을 구성된 그룹 ID와 일치시킵니다.

![지정된 사이트에서만 결과를 반환하도록 검색을 제한합니다.](./search-blueprints-elements-reference/images/10.png)

사이트의 ID는 사이트 설정 &rarr; 사이트 구성 화면에 표시됩니다.

이 요소의 기능은 [검색 표시줄의](../../../getting-started/searching-for-content.md#configuring-the-search-bar) 범위 구성 옵션과 겹칩니다. 이 요소가 작동하려면 검색 표시줄 범위를 **Everything** 로 설정해야 합니다.

## 일부 결과 숨기기

Must Not 발생 절이 있는 부울 쿼리에서 쿼리를 래핑하면 쿼리와 일치하는 경우 결과를 숨길 수 있습니다.

**외부 참조:** [Elasticsearch 부울 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-bool-query.html) 설명서를 참조하십시오.

### 정확한 용어 일치로 숨기기

주어진 필드에서 용어가 정확히 일치하는 콘텐츠를 숨깁니다. 현지화된 텍스트 필드를 선택하면 현지화 옵션이 구성에 나타납니다.

![검색어와 일치하는 결과를 숨깁니다.](./search-blueprints-elements-reference/images/11.png)

### 댓글 숨기기

댓글 검색하지 마세요. 이 요소는 'discussion' 필드가 있는 문서를 찾습니다. 필드가 존재하고 해당 콘텐츠가 'false'가 아닌 경우 해당 문서는 검색 결과에 포함되지 않습니다.

### 게스트 사용자를 위해 범주에서 콘텐츠 숨기기

사용자가 로그인하지 않은 경우 범주에서 결과를 숨깁니다. 이것은 조건부 요소입니다. `user.is_signed_in` 컨텍스트 매개변수가 `false`인 경우 구성된 자산 카테고리 ID와 일치하는 `assetCategoryIds` 필드가 있는 결과가 반환되지 않습니다.

### 카테고리에서 콘텐츠 숨기기

지정된 카테고리로 결과를 숨깁니다. 용어 쿼리는 `assetCategoryIds` 필드에서 실행됩니다. 구성된 자산 범주 ID가 일치하면 문서가 검색 결과에 반환되지 않습니다.

### 숨겨진 콘텐츠 숨기기

검색 불가능으로 표시된 자산을 숨깁니다. 이 요소는 Liferay 검색 프레임워크 쿼리 절의 기능을 복제하며 고급 사용 사례에 가장 유용합니다. 예를 들어 Liferay의 검색 프레임워크가 기본 검색 절을 제공하지 못하도록 비활성화한 경우 이 요소를 사용하여 손실된 기능의 일부를 복원할 수 있습니다.

이 요소는 반환된 결과에 `hidden` 필드가 없어야 하며, 있는 경우 해당 값은 `false`이어야 함을 지정합니다.

### 태그가 지정된 콘텐츠 숨기기

주어진 태그로 결과를 숨깁니다. 용어 쿼리는 `assetTagNames.raw` 필드에서 실행됩니다(원시 필드는 `assetTagNames` 텍스트 필드에서 키워드 필드를 만듭니다). 구성된 자산 태그가 일치하면 문서가 검색 결과에 반환되지 않습니다.

## 기타 요소

### 모든 Elasticsearch 쿼리 붙여넣기

Elasticsearch DSL 쿼리 본문을 있는 그대로 요소에 붙여넣습니다. 발생 절을 지정하십시오. 요소는 제공된 JSON 문자열을 가져와서 백그라운드에서 래퍼 쿼리를 생성합니다.

예를 들어 제목이 쿼리 키워드 "bruno"와 일치하는 경우 문서가 반환되지 않도록 하려면 3개의 공통 제목 필드에 다중 일치 쿼리를 추가하고 Must Not 발생 절을 지정합니다.

![Elasticsearch 쿼리 본문을 요소에 붙여넣습니다.](./search-blueprints-elements-reference/images/12.png)

**외부 참조:** [Elasticsearch Wrapper 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-wrapper-query.html) 설명서를 참조하십시오.

### 스케줄링 인식

표시 날짜가 미래가 아닌 콘텐츠만 표시하고 만료된 콘텐츠는 표시하지 않습니다. 이 요소는 Liferay 검색 프레임워크 쿼리 절의 기능을 복제하며 고급 사용 사례에 가장 유용합니다. 예를 들어 Liferay의 검색 프레임워크가 기본 검색 절을 제공하지 못하도록 비활성화한 경우 이 요소를 사용하여 손실된 기능의 일부를 복원할 수 있습니다.

### Lucene 구문으로 검색

쿼리 문자열 쿼리 구문을 사용하여 하나 이상의 필드를 일치시킵니다. 모든 검색 키워드가 일치해야 하는지(AND) 또는 하나만 일치해야 하는지(OR)를 결정하는 데 사용할 기본 부울 연산자(OR 또는 AND)를 지정합니다. 이 요소를 사용하면 부울 연산자, 와일드카드 등을 사용하여 고급 검색 키워드 문자열을 입력할 수 있습니다.

**외부 참조:** [Elasticsearch 쿼리 문자열 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-query-string-query.html#query-string-syntax) 설명서를 참조하십시오.

### 스테이징 인식

라이브 사이트에 게시된 콘텐츠만 표시합니다. 준비 사이트에 게시되고 준비된 콘텐츠를 표시합니다. 이 요소는 Liferay 검색 프레임워크 쿼리 절의 기능을 복제하며 고급 사용 사례에 가장 유용합니다. 예를 들어 Liferay의 검색 프레임워크가 기본 검색 절을 제공하지 못하도록 비활성화한 경우 이 요소를 사용하여 손실된 기능의 일부를 복원할 수 있습니다.

### 여러 필드에 대한 텍스트 일치

여러 텍스트 필드에서 일치하는 텍스트를 검색합니다. 검색 사용자의 키워드 또는 요소 구성에서 일치하도록 구성된 텍스트를 일치시킵니다. 이것은 여러 필드에 고도로 구성 가능한 전체 텍스트 쿼리를 추가하므로 Elements의 [Swiss Army Knife](https://en.wikipedia.org/wiki/Swiss_Army_knife#Cultural_impact) 입니다.

- 필드 구성을 사용하여 검색할 필드를 선택하십시오. 분석된 텍스트 필드만 선택하십시오.
- 연산자는 분석된 모든 검색 키워드가 각 필드에 나타나야 하는지(AND) 또는 각 필드에 하나만 나타나야 하는지(OR)를 결정합니다. 정확한 동작은 일치 유형의 영향을 받습니다.
- 일치 유형은 Elasticsearch에서 내부적으로 쿼리를 처리하는 방식을 결정합니다. **Most Fields** 지정된 각 필드에 대한 일치 쿼리를 생성하고 점수를 결합하므로 아마도 가장 기본적인 유형일 것입니다.
- 퍼지는 부정확한 일치에 대한 동작을 설정합니다. 0, 1 또는 2를 설정하면 쿼리가 일치 항목을 반환하도록 허용되는 [Levenshtein 편집 거리](https://en.wikipedia.org/wiki/Levenshtein_distance) 직접 지정합니다. AUTO는 검색되는 용어의 길이를 기준으로 편집 거리를 생성합니다. 자세한 내용은 [Elasticsearch 퍼지 문서](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/common-options.html#fuzziness) 을 참조하십시오.
- 최소 일치해야 함은 검색에서 반환할 문서에 대해 일치해야 하는 최소 절 수를 설정합니다. 자세한 내용은 [Elasticsearch의 minimum **should** match](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-minimum-should-match.html) 설명서를 참조하십시오.
- Slop은 구문 및 구문 접두사 검색 유형에서 사용됩니다. 구문이 일치하지 않고 여전히 일치할 수 있는 단어 수를 지정하여 부정확한 구문 일치를 허용합니다. 예를 들어 구문 유형과 슬롭 1을 사용하여 "liferay blogs"를 검색하면 여전히 "liferay dxp blogs"가 포함된 필드와 일치할 수 있습니다.
- 이 요소에서 제공하는 절과 일치하는 모든 문서를 부스트하도록 부스트를 설정합니다.
- 쿼리 절과 일치해야 하는 값을 하드코딩하려면 Text to Match를 설정하십시오. 사용자의 키워드로만 검색하려면 이 항목을 공백으로 두십시오.

**외부 참조:** [Elasticsearch 다중 일치 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-multi-match-query.html) 설명서를 참조하십시오.

## 추가 정보

- [검색 Blueprint 생성 및 관리](./creating-and-managing-search-blueprints.md)
- [검색 경험 개인화](./personalizing-the-search-experience.md)
- [수입 카테고리 탐색](../../../search-pages-and-widgets/search-results.md)
