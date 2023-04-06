
# 검색 청사진 이해

검색 청사진은 검색 경험 도구 집합의 첫 번째 기능입니다. Blueprints를 사용하여 사용자 정의 코드를 배포하지 않고 사용자의 요구에 맞게 검색 페이지 경험을 조정하십시오. 청사진으로 할 수 있는 일

- 컨텍스트 인식 검색 페이지를 만듭니다. 예를 들어 검색 사용자와의 근접성으로 웹 콘텐츠 기사를 홍보합니다.
- 검색할 필드를 명시적으로 선언합니다. 예를 들어 `userName` 필드를 선언하지 않도록 선택할 수 있습니다.
- 특정 기간 동안 특정 범주의 자산을 부스트합니다. 예를 들어 카테고리별로 Liferay Commerce 제품을 홍보하는 계절별 캠페인을 만듭니다.
- [Custom Filter 위젯](../../search-pages-and-widgets/search-results/custom-filter-examples.md) 에서 제공하는 모든 사용 사례는 Blueprint로 만족할 수 있습니다. 예를 들어 검색된 키워드와 일치하는 특정 필드를 부스트합니다.

무엇을 검색해야 하는지 또는 검색 작동 방식을 제어해야 하는 경우 검색 청사진이 필요한 기능입니다.

기본 Liferay 검색 환경의 구성 기능은 시간이 지남에 따라 발전했습니다. 최신 Liferay DXP 릴리스에서는 기본적으로 검색 결과를 조정하고([동의어 세트](../../search-administration-and-tuning/synonym-sets.md) 및 [결과 순위](../../search-administration-and-tuning/result-rankings.md)) [사용자 정의 패싯](../../search-pages-and-widgets/search-facets/custom-facet.md)을 추가하고 [사용자 정의 필터](../../search-pages-and-widgets/search-results/custom-filter-examples.md) 사용하여 복잡한 검색 사용자 정의를 수행할 수 있습니다. 그러나 이러한 구성에는 한계가 있으며 많은 검색 중심 사이트에서는 검색 인프라의 백엔드 코드를 사용자 지정해야 합니다. 이를 위해서는 Java 기반 모듈을 Liferay의 OSGi 런타임에 배포해야 합니다.

코드가 많은 이 기능 세트를 구축하는 대신 Blueprints는 사용자 정의 코드를 배포하지 않고 검색 페이지의 쿼리를 거의 완벽하게 제어해야 하는 사용자를 위해 다른 접근 방식을 취합니다. Blueprints는 거의 모든 사용 사례를 충족할 수 있는 UI 기반 구성 경험을 제공합니다(기능의 초기 반복이 아닌 경우 기능 세트가 훨씬 더 강력한 후속 버전에서).

## 청사진이란 무엇입니까?

간단히 말해 블루프린트는 요소로 구성되어 있으며 그 위에 몇 가지 추가 구성이 뿌려져 있습니다.

**청사진** : 검색 청사진은 Liferay의 검색 동작에 대한 설계 계획입니다. 검색 환경은 대부분의 사용자에게 [검색 표시줄](../../getting-started/searching-for-content.md#using-the-search-bar) 에서 시작됩니다. 검색어를 입력하면 Liferay의 검색 인프라에서 복잡한 쿼리를 구성한 다음 검색 엔진으로 보냅니다. [검색 인사이트](../../search-pages-and-widgets/search-insights.md) 위젯을 사용하여 Liferay의 전체 쿼리를 볼 수 있습니다. 이 쿼리는 검색 대상과 방법을 제어하는 검색 페이지에 대한 Liferay의 기본 청사진으로 생각할 수 있습니다.

**요소** : 요소는 전체 청사진을 만들기 위해 결합되는 시각적 빌딩 블록입니다. 각 요소는 구체적인 검색 동작을 정의하는 JSON 조각으로 뒷받침됩니다. 요소는 검색 경험과 함께 즉시 제공되며 요소 편집기를 사용하면 고유한 요소를 만들거나 기존 요소를 복제하여 필요에 따라 시작점으로 사용할 수 있습니다.

청사진을 만들려면 염두에 두고 있는 사용 사례부터 시작하세요. 기본 검색 페이지 환경에서 무엇을 변경해야 합니까? 그런 다음 제공된 요소를 살펴보고 사용자 정의 작성을 시작하는 데 사용할 수 있는지 확인하십시오. Blueprint를 계획했으면 이제 생성할 차례입니다.

자세한 내용은 [청사진 생성 및 관리](./creating-and-managing-search-blueprints.md)참조하십시오.

## 블루프린트 UI에서 무엇을 할 수 있나요?

Blueprint를 사용하여 검색 솔루션을 생성하려면 Elements를 Blueprint로 구성하고 페이지에 적용합니다. 이를 위해 사용할 수 있는 기능은 다음과 같습니다.

| 특징                                                                                                            | 청사진에서 사용 가능합니까? |
| ------------------------------------------------------------------------------------------------------------- | --------------- |
| Query Builder를 사용하여 Blueprint를 시각적으로 구축                                                                       | &#10004;        |
| Liferay UI에서 JSON으로 Blueprint 작성                                                                              | &#10004;        |
| 즉시 사용 가능한 요소를 활용하여 청사진 생성 간소화                                                                                 | &#10004;        |
| [Elasticsearch 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.16/query-dsl.html) 사용자 지정 요소로 사용 | &#10004;        |
| Elasticsearch 쿼리에서 사용자 정의 요소 생성                                                                               | &#10004;        |
| 내 청사진에 대한 사용자 지정 JSON 요소 생성                                                                                   | &#10004;        |
| JSON을 직접 편집하여 고급 블루프린트 설정 생성                                                                                  | &#10004;        |
| Blueprint가 적용될 때 검색 가능한 Liferay 엔티티를 선택하십시오.                                                                  | &#10004;        |
| Liferay의 인덱서 프레임워크 및 개별 쿼리 절 기여자의 절을 포함할지 여부를 선택합니다.                                                          | &#10004;        |
| JSON을 사용하여 집계, 정렬, 하이라이트 등의 고급 설정을 구성합니다.                                                                     | &#10004;        |

검색 청사진 UI의 기능 외에도 검색 페이지에 청사진을 적용할 수 있도록 검색 위젯이 개선되었습니다.

## 검색 요청 이해

Blueprints를 사용하면 Elasticsearch에 대한 Liferay의 검색 요청 내용을 제어할 수 있습니다. 따라서 사용자의 검색 경험이 작동하는 방식에 대한 이해와 기본 Liferay 검색 쿼리의 주요 구성 요소에 대한 높은 수준의 이해를 결합하는 것이 도움이 됩니다(Blueprints를 시작하는 데 필요하지는 않음).

**검색 요청:** Liferay는 Elasticsearch에 검색 요청을 보냅니다. 여기에는 Elasticsearch에서 반환된 응답을 안내하는 데 도움이 되는 쿼리 본문 및 추가 매개변수가 포함될 수 있습니다.

**쿼리:** 쿼리 본문은 인덱스에서 일치하는 콘텐츠가 있는지 확인하는 방법을 검색에 지시합니다. 예를 들어 `제목` 필드를 포함하는 색인화된 콘텐츠를 검색할 때 어떤 종류의 쿼리를 사용해야 합니까? 그리고 `제목` 필드와 일치하면 점수를 높여야 합니까?

**절:** A 절은 기본 `bool` 쿼리의 독립적인 부분입니다. 가장 자주 중첩된 쿼리 중 하나는 **절** 이라는 단어가 호출될 때 참조되는 것입니다.

기본 Liferay 쿼리는 여러 하위 쿼리를 래핑하는 `bool` 상위 쿼리입니다. `must` 및 `filter`의 두 가지 주요 발생 절로 구성됩니다. 청사진은 두 절 모두에 영향을 미칠 수 있습니다. 필터 절에 필터 유형 요소가 추가되고 쿼리 유형 요소는 `must` 부울 절 아래 절에 추가됩니다.

모든 Liferay 검색은 결국 JSON Elasticsearch 쿼리로 변환됩니다. 다음은 검색 창 위젯에 "test"라는 단어를 입력하여 생성된 쿼리의 작은 스니펫입니다.

```json
{
  "from": 0,
  "size": 20,
  "query": {
    "bool": {
      "must": [
        {
          "bool": {
            "must": [
              {
                "bool": {
                  "should": [
                    {
                      "bool": {
                        "must": [
                          {
                            "match": {
                              "comments": {
                                "query": "test"
                              }
                            }
                          }
                        ],
                        "should": [
                          {
                            "match_phrase": {
                              "comments": {
                                "query": "test",
                                "slop": 50
                              }
                            }
                          },
                          {
                            "match_phrase": {
                              "comments": {
                                "query": "test",
                                "boost": 2
                            }
```

조금 더 자세히 살펴보면 다음 부울 쿼리는 절이 일치 결과의 점수에 기여하려면 콘텐츠 필드의 검색어 "test"에 대해 일치 쿼리가 충족되어야 함을 나타냅니다. 또한 콘텐츠 필드의 [일치 구문 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.16/query-dsl-match-query-phrase.html) 일치하면 결과의 점수가 `2`값만큼 높아집니다.

```json
{
  "bool": {
    "must": [
      {
        "match": {
          "content": {
            "query": "test"
          }
        }
      }
    ],
    "should": [
      {
        "match_phrase": {
          "content": {
            "query": "test",
            "slop": 50
          }
        }
      },
      {
        "match_phrase": {
          "content": {
            "query": "test",
            "boost": 2
          }
        }
      }
    ]
  }
```

이들은 요소로 추가하는 절의 유형입니다.

검색 요청 부분은 Blueprints UI 및 해당 구성 옵션에 매핑할 수 있습니다.

![Blueprints를 사용하면 Elasticsearch로 전송되는 쿼리 및 구성을 구성할 수 있습니다.](./understanding-search-blueprints/images/01.png)
<!-- Needs to be edited to remove the suggestions part: https://docs.google.com/document/d/1TVko7kzDcb8gpa7Ph4aboyeRJ7Lr698mnR21mupG9dQ/edit# -->

## 무다음?

- [검색 Blueprint 생성 및 관리](./creating-and-managing-search-blueprints.md).
