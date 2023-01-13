# 검색창 제안 청사진

{bdg-primary}`구독`
{bdg-secondary}`7.4 U36+ 및 GA36+`

검색창 제안은 기본적으로 일반 [검색창 쿼리](../search-insights.md) 을 사용합니다. [Liferay Enterprise Search 사용자](../../liferay-enterprise-search/activating-liferay-enterprise-search.md) 은 [검색 청사진](../../liferay-enterprise-search/search-experiences/understanding-search-blueprints.md)을 사용하여 쿼리에 영향을 미치거나 재정의할 수 있습니다.

먼저, [청사진을 만듭니다](../../liferay-enterprise-search/search-experiences/creating-and-managing-search-blueprints.md). 청사진이 있으면

1. 인스턴스 설정에서 검색창 제안이 활성화되어 있는지 확인하십시오. 기본적으로 활성화되어 있습니다.

1. 검색창 위젯 구성에서 검색창 제안을 구성합니다.
   - 옵션(![Options](../../../images/icon-widget-options.png)) 메뉴를 클릭하고 _구성_를 선택합니다.

1. Suggestions Contributor를 _Blueprint_로 변경합니다.

1. _선택_을 클릭하여 청사진을 선택합니다.

1. _저장_을 클릭합니다.

이제 Search Bar Suggestions는 Blueprint에서 제공하는 쿼리 절 및 구성을 사용하여 맞춤형 요청을 Elasticsearch로 보냅니다.

사용할 수 있는 몇 가지 추가 구성이 있습니다.

## 청사진을 사용하도록 검색창 제안 구성

Blueprint Suggestions Contributor를 선택하면 검색 표시줄 위젯 구성에 새 구성 필드가 나타납니다.

![청사진 기여자는 추가 구성을 사용합니다.](./search-bar-suggestions-blueprints/images/01.png)

**청사진:** 이것은 유일하게 필요한 추가 설정입니다. 사용할 청사진을 선택합니다.

**자산 URL 포함:** 응답과 함께 결과에 대한 링크를 반환하려면 이 옵션을 활성화합니다. 검색 사용자가 액세스할 수 있는 페이지에 자산이 나타나는 경우 결과를 클릭하면 사용자가 해당 디스플레이 페이지로 이동합니다. 그렇지 않으면 자산이 검색 페이지의 컨텍스트 아래 자산 게시자에 표시됩니다. 비활성화된 경우 제안 목록에서 결과를 클릭해도 아무 작업도 수행되지 않습니다.

**자산 요약 포함:** 응답과 함께 결과 요약 [을 반환하려면 이 옵션을 활성화](../search-results/search-results-behavior.md#result-summaries). 검색 프레임워크에 의해 작성된 요약을 제외하고 보다 간결한 결과 목록을 반환하려면 이 기능을 비활성화하십시오.

**필드:** 응답과 함께 반환할 추가 인덱싱된 필드를 정의합니다. 특정 인덱스 필드와 해당 값을 사용해야 하는 사용자 정의 [위젯 템플릿](../../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md#creating-a-widget-template) 을 만들 때 사용됩니다.
