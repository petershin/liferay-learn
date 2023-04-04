---
uuid: fb5824c6-339d-46be-b697-12497bf052ba
---

# 검색 결과 동작

이전에는 검색 결과를 표시하는 방법을 [배웠습니다](./configuring-the-search-results-widget.md). 검색 결과를 개선할 수 있는 추가 검색 결과 개념 및 구성이 있습니다.

* [패싯으로 검색 결과 필터링](#filtering-results-with-facets)
* [검색 결과 관련성 이해](#search-results-relevance)
* [검색 결과에 대한 권한의 영향](#permissions-and-search-results)
* [준비 환경의 검색 결과](#search-and-staging)
* [간행물이 활성화된 경우 검색 결과](#search-and-publications)
* [검색 결과 요약](#result-summaries)
* [검색 결과 용어 강조 표시](#highlighting)
* [검색 결과 및 콘텐츠 페이지](#returning-pages-in-search-results)
* [검색 결과에 개체 반환](#returning-objects-in-search-results)

## 패싯으로 결과 필터링

결과는 패싯을 사용하여 필터링됩니다. 사용자는 검색어를 입력하고 결과 및 검색 패싯 목록을 봅니다. 공통된 특성을 공유하는 경우 결과를 함께 그룹화하는 버킷으로 생각할 수 있습니다.

관리자는 패싯을 구성할 수 있습니다. 자세히 알아보려면 [검색 패싯](../search-facets.md) 에 대해 읽어보세요.

## 검색 결과 관련성

검색 엔진은 관련성(검색 엔진에서 계산한 점수)을 사용하여 결과의 순위를 매깁니다. 사용 중인 검색 엔진에 따라 반환되는 문서의 총 점수에 영향을 미치는 다양한 요소가 있습니다.

* [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/index-modules-similarity.html#bm25)
* [솔라](https://lucene.apache.org/solr/guide/8_0/relevance.html)

[결과 순위](../../search-administration-and-tuning/result-rankings.md) 은 반환된 검색 결과의 순서를 제어하는 데 도움이 됩니다. 

## 권한 및 검색 결과

자산에 대한 보기 권한 [](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 없는 사용자는 검색 결과에 표시되지 않습니다. 사이트 관리자 역할이 있는 로그인 사용자는 게스트보다 더 많은 검색 결과를 볼 수 있습니다. 

두 번의 권한 확인이 있습니다. 첫 번째 권한 확인인 사전 필터링은 검색 엔진의 인덱스에서 발생합니다. 데이터베이스 권한 정보를 확인하는 것보다 빠르지만 때때로 검색 인덱스에 오래된 권한 정보가 있을 수 있습니다. 검색 엔진의 색인에 올바른 최신 권한 정보가 있는지 확인하기 위해 Liferay는 결과를 표시하기 전에 결과에 대해 두 번째, 마지막 권한 검사, 사후 필터링을 수행합니다.

### 초기 권한 확인

검색 결과 권한 필터링의 첫 번째 라운드는 검색 쿼리에 필터 절을 추가합니다. 이렇게 하면 현재 사용자가 볼 수 있는 결과만 포함하여 미리 필터링된 검색 엔진에서 결과가 반환됩니다.

이 초기 권한 확인은 제어판 &rarr; 구성 &rarr; 시스템 설정 &rarr; 검색 &rarr; 권한 검사기에서 구성할 수 있습니다. 

![권한 검사기 설정에서 권한 기간 제한을 설정합니다.](./search-results-behavior/images/01.png)

**권한 기간 제한:** 이 수준의 권한 검사가 중단되기 전에 검색 쿼리에 추가되는 권한 검색 절의 수를 제한합니다. 그런 다음 권한 확인은 아래에 설명된 최종 권한 필터링에만 의존합니다.

권한 조건을 제한하는 유일한 이유는 성능입니다. 많은 사이트 및 조직에 대한 관리 액세스 권한이 있는 사용자는 쿼리에 추가된 많은 권한 용어를 생성합니다. 쿼리에 너무 많은 용어가 있으면 검색 엔진이 시간 초과될 수 있습니다.

### 최종 권한 확인

최종 권한 확인 단계는 UI에 결과를 표시하기 전에 발생합니다. 예를 들어 사용자가 _liferay_을 검색하면 검색 엔진이 모든 관련 포럼 게시물을 반환합니다. 검색 결과는 관련 포럼 게시물 목록을 반복하면서 사용자가 게시물과 해당 범주를 볼 수 있도록 게시물의 마지막 권한 확인을 수행합니다. 사용자가 볼 수 있는 권한이 없는 카테고리에 일치하는 포럼 게시물이 있으면 검색 결과 목록에서 제외됩니다.

권한 확인의 마지막 라운드는 제어판 &rarr; 구성 &rarr; 시스템 설정 &rarr; 검색 &rarr; 기본 검색 결과 권한 필터에서 구성할 수 있습니다. 여기에는 두 가지 설정이 포함됩니다.

![기본 검색 결과 권한 필터 설정에서 추가 권한을 설정합니다.](./search-results-behavior/images/02.png)

**권한 필터링된 검색 결과 정확한 개수 임계값:** 결과가 계산되기 전에 권한 필터에 대한 최대 검색 결과 수를 지정합니다. 임계값이 높을수록 카운트 정확도는 높아지지만 성능은 저하됩니다. 현재 표시된 페이지의 결과는 항상 확인되므로 검색 결과 페이지 매김 델타 아래의 모든 값은 이 동작을 효과적으로 비활성화합니다.

**검색 쿼리 결과 창 제한:** 각 권한 확인 요청에 대한 최대 배치 크기를 설정합니다. 이것은 다시 페이지 매김의 영향을 받습니다. 예를 들어 페이지당 100개의 결과가 있고 사용자가 검색 결과의 200페이지로 이동하려는 경우 사용자에게 권한이 있는지 확인하기 위해 1페이지에서 200페이지 사이의 모든 결과를 확인해야 합니다. 권한 확인 결과는 20,000개입니다. 검색 엔진에서 한 번의 이동으로 이 작업을 수행하면 성능 문제가 발생할 수 있습니다. 각 권한 확인 요청에 대한 최대 배치 크기를 설정합니다.

## 검색 및 스테이징

[스테이징](../../../site-building/publishing-tools/staging/managing-data-and-content-types-in-staging.md)사용하면 콘텐츠가 공개적으로(라이브 사이트에) 게시되기 전에 미리 보기 및 테스트 환경에 먼저 배치됩니다. 검색 색인에 추가된 콘텐츠는 검색 API가 항목의 활성 여부를 해독할 수 있도록 표시됩니다. 사이트의 라이브 버전에서는 라이브 사이트용으로 표시된 콘텐츠만 검색할 수 있습니다. 사이트의 단계적 버전에서는 라이브 또는 단계적 모든 콘텐츠를 검색할 수 있습니다.

## 검색 및 간행물

[발행물](../../../site-building/publishing-tools/publications.md) 활성화되면 콘텐츠가 특정 발행물과 연결됩니다. 간행물에 추가된 콘텐츠는 검색 API가 항목이 생산 중인지 여부를 해독할 수 있도록 표시됩니다. 사이트의 프로덕션 버전에서는 게시되지 [콘텐츠](../../../site-building/publishing-tools/publications/making-and-publishing-changes.md#publishing-your-changes) 검색 결과에 반환될 수 있습니다. 진행 중인 게시에서 프로덕션 콘텐츠 및 해당 특정 게시에 대한 콘텐츠가 반환될 수 있습니다.

## 결과 요약

결과 요약에는 자산의 개발자가 자산을 검색하는 사람들에게 가장 유용하다고 생각한 문서의 정보가 포함됩니다. 각 자산에는 요약에 다른 필드가 포함될 수 있습니다. 텍스트 콘텐츠가 있는 자산의 경우 일반적인 요약 형식에는 제목과 일부 콘텐츠가 포함되며 제목이 먼저 표시됩니다. 자산 유형은 항상 두 번째 줄에 나타나며 검색어와 일치하는 콘텐츠의 스니펫은 마지막 줄에 있습니다. 문서 및 미디어 문서와 같이 콘텐츠 필드가 없는 자산은 대신 설명을 표시합니다.

```{note}
사용자는 다릅니다. 사용자 결과 요약에는 사용자의 전체 이름과 자산 유형(사용자)만 나타납니다.
```

![사용자의 경우 요약에는 사용자의 전체 이름만 표시됩니다.](./search-results-behavior/images/03.png)

다른 자산을 포함하는 자산(웹 콘텐츠 및 문서 & 미디어 폴더) 또는 해당 콘텐츠를 표시할 수 없는 자산(동적 데이터 목록 레코드 및 일정 이벤트)의 경우 결과 요약에 제목, 자산 유형 및 설명을 표시하는 것이 더 합리적입니다. . 

![설명을 요약하여 보여주는 문서 폴더.](./search-results-behavior/images/04.png)

자산 개발자는 요약이 활성화된 필드를 결정하지만 표시할 요약 필드의 일부를 정확하게 결정하는 검색 시 호출되는 논리가 있습니다. 예를 들어 `콘텐츠` 필드에는 많은 텍스트가 있을 수 있지만 요약에는 모든 텍스트가 표시되지 않습니다. 대신 필드 텍스트의 관련 스니펫을 표시합니다. 검색된 키워드가 요약 필드에 있는 경우 필드의 해당 부분이 요약에 사용됩니다. 또한 요약에서 일치하는 키워드가 강조 표시됩니다.

결과 요약에 포함할 필드를 결정하기 위해 검색 결과 위젯은 세 가지 사항을 고려합니다.

1. 요약에 포함할 자산별 필드는 `ModelSummaryContributor` Java 클래스(Liferay 자체 클래스 및 타사 개발자가 배포한 클래스)에 정의되어 있습니다. 이 논리의 이전 구현은 `Indexer.getSummary`에서 제공했습니다.

1. 검색 결과 요약에 표시할 수 있는 필드는 검색 결과 표시 로직([`SearchResultsSummaryDisplayBuilder`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-search/portal-search-web/src/main/java/com/liferay/portal/search/web/internal/result/display/builder/SearchResultSummaryDisplayBuilder.java) 및 [`SearchResultsSummaryDisplayContext`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-search/portal-search-web/src/main/java/com/liferay/portal/search/web/internal/result/display/context/SearchResultSummaryDisplayContext.java))에 의해 정의됩니다.

1. [검색 결과](./configuring-the-search-results-widget.md) 위젯(기본적으로_목록_ )에서 사용하는 [위젯 템플릿](../../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md) 에는 요약에 포함된 사용 가능한 필드를 포함하여 검색 결과 표시와 관련된 모든 항목의 최종 단어가 있습니다.

## 하이라이트

요약에 나타나는 검색어는 기본적으로 <mark>강조 표시</mark> 입니다. 이것이 바람직하지 않은 경우 [위젯 구성 화면](./configuring-the-search-results-widget.md#displaying-search-results)에서 비활성화합니다. 

![결과 목록에서 검색 키워드가 강조 표시됩니다.](./search-results-behavior/images/05.png)

강조 표시는 결과가 반환되는 이유를 암시하는 유용한 시각적 단서이지만 주의하십시오. 적중은 점수가 높을 수 있으므로 요약에 강조 표시 없이 결과 상단 근처에 반환됩니다. 모든 인덱싱된 필드가 요약에 나타나지 않기 때문입니다. Arthur C. Clarke라는 사용자를 생각해 보십시오. 그는 검색 가능한 *acc@authors.org*의 이메일 주소를 가지고 있습니다. 사용자에 대한 결과 요약에는 사용자의 전체 이름만 포함되어 있기 때문에 전자 메일 주소로 Mr. Clarke를 검색하면 사용자가 반환되지만 용어는 강조 표시되지 않습니다.

![일부 결과에는 강조 표시된 용어가 없을 수도 있습니다.](./search-results-behavior/images/06.png)

## 검색 결과에 페이지 반환

Liferay 7.2+에서는 공개 콘텐츠 페이지의 [페이지 콘텐츠](../../../site-building/creating-pages/using-content-pages.md) 검색 결과 위젯에 반환됩니다. 예를 들어 공개 페이지의 단락 조각에서 찾은 텍스트를 검색할 수 있습니다.

반대로 최신 Liferay 7.2 및 7.3 및 모든 Liferay 7.4+ 릴리스에서는 비공개 콘텐츠 페이지 및 준비된 페이지의 페이지 콘텐츠가 인덱싱되지 않으므로 페이지를 볼 수 있는 사용자의 권한에 관계없이 검색 결과 목록에 반환되지 않습니다. .

![비공개 페이지의 콘텐츠는 검색할 수 없습니다.](./search-results-behavior/images/10.png)

콘텐츠 필드는 인덱싱되지 않고 비공개 또는 준비 페이지에 대해 검색할 수 없지만 다른 필드를 사용할 수 있습니다. 예를 들어 공개 및 비공개 콘텐츠 페이지의 제목 필드는 모두 7.2+에서 인덱싱되므로 비공개 콘텐츠 페이지 제목과 일치하는 키워드를 검색하면 여전히 검색 결과 위젯에서 적중이 발생합니다.

![공개 및 비공개 페이지의 제목을 검색할 수 있습니다.](./search-results-behavior/images/11.png)

```{note}
Liferay 7.4 U22+ 및 GA22+의 경우 새 설치에 대해 비공개 페이지가 비활성화됩니다. 그러나 원하는 경우 활성화할 수 있습니다. 자세한 내용은 [비공개 페이지 활성화](../../../site-building/creating-pages/understanding-pages/understanding-pages.md#enabling-private-pages)를 참조하세요.
```

콘텐츠 페이지에 대해 인덱싱된 필드를 검색하려면 검색 결과 위젯의 _문서 양식_ 에 결과 표시 설정을 활성화합니다. 자세한 내용은 [검색 엔진 문서 검사](./configuring-the-search-results-widget.md#inspecting-search-engine-documents) 참조하십시오.

![콘텐츠 페이지의 문서 보기를 검사하여 인덱싱된 필드를 확인합니다.](./search-results-behavior/images/12.png)

Liferay 7.4 GA25+/U25+에서는 위젯 페이지도 검색할 수 있습니다(제목별로만).

## 검색 결과에 개체 반환

Liferay 7.4에는 GUI 기반 애플리케이션 구축 프레임워크인 [Liferay Objects](../../../building-applications/objects.md)이 포함되어 있습니다. 각 개체의 정의 필드는 검색 가능하도록 선언할 수 있습니다. 그런 다음 개체 항목(응용 프로그램 사용자가 제출한 레코드) [쿼리하고](../../getting-started/searching-for-content.md#searching-for-liferay-objects) 검색 결과 위젯에 반환할 수 있습니다.

![개체 항목에 대한 제목 및 내용 요약이 표시됩니다.](./search-results-behavior/images/13.png)

Liferay 7.4 U64+/GA64+의 경우 검색 결과에서 개체 항목을 클릭하면 항목의 [디스플레이 페이지](../../../building-applications/objects/displaying-object-entries.md#creating-display-page-templates-for-objects) 로 리디렉션되어 결과에 대한 자세한 보기를 제공합니다. 개체에 대한 표시 페이지 템플릿이 없으면 기본 레이아웃이 사용됩니다. 항목 세부 정보 보기에서 뒤로 화살표를 클릭하여 검색 페이지로 돌아갑니다.

![아직 존재하지 않는 경우 기본 디스플레이 페이지 템플릿이 생성됩니다.](./search-results-behavior/images/14.png)
