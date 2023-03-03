---
uuid: ee4ef207-d58a-4840-af34-f74fb4a031dc
---

# 검색 결과 필터링

```{note}
이 기능은 [Elasticsearch에서만](../../installing-and-upgrading-a-search-engine/solr/solr-limitations.md) 작동합니다.
```

사용자 지정 필터를 사용하면 기본 검색 쿼리에 쿼리를 추가하여 검색 결과를 필터링하여 검색 결과 위젯에 반환되는 내용을 제어할 수 있습니다. 필터 위젯을 표시하거나 숨길 수 있으며 변경할 수 있는지 변경할 수 없는지 결정할 수 있습니다.

![사용자 정의 필터를 적용하여 특정 검색 결과를 걸러냅니다.](./filtering-search-results/images/03.png)

사용자 지정 필터를 검색 페이지에 통합하여 만족하는 많은 사용 사례가 있습니다.

지금은 다음과 같은 기본 사용법을 고려하십시오.

| 사용 사례                                                               | `구성` _(값)_                                                                                                                  |
|:------------------------------------------------------------------- |:--------------------------------------------------------------------------------------------------------------------------- |
| **사용자 제목 필터:** 최종 사용자는 필터 키를 직접 조작하여 제목을 사용하여 원하는 결과로 결과를 구체화합니다.   | `필터 필드` _(title\_en\_US)_ <br /> `필터 값` _(팟캐스트)_ <br /> `필터 쿼리 유형` _(일치)_ <br /> `발생 유형` _(must_not)_ |
| **하드 코딩된 필터링:** 관리 사용자가 최종 사용자에게 보이지 않고 변경할 수 없는 필터로 검색 페이지를 구성합니다. | **_위 구성에 추가_** <br /> `보이지 않음` _(True-체크됨)_ <br /> `변경 불가능` _(True-체크됨)_                                        |

사용자 지정 필터는 많은 작업을 수행할 수 있으므로 모두 나열하는 것은 불가능합니다. 다음은 위젯 구성 둘러보기입니다. [사용자 정의 필터 예](./custom-filter-examples.md) 에서 몇 가지 예시 구성을 볼 수 있습니다.

## 사용자 지정 필터 추가

사용자 정의 필터 위젯에 있는 모든 옵션을 탐색하려면 페이지에 하나가 필요합니다.

1. 페이지의 추가 메뉴(![Add](../../../images/icon-add-widget.png))를 열고 위젯 섹션을 확장합니다.

1. 검색 섹션에서 사용자 지정 필터를 페이지로 드래그합니다.

![사용자 지정 필터는 구성될 때까지 아무런 영향을 미치지 않습니다.](./filtering-search-results/images/01.png)

## 사용자 지정 필터 구성

검색 결과 필터링을 시작하려면 위젯의 옵션 메뉴(![Options](../../../images/icon-app-options.png))를 열고 _구성_클릭하십시오.

**필터 필드(텍스트):** 대부분의 경우 필터는 특정 필드에서 작동합니다. 필터링할 인덱싱된 필드의 이름을 설정합니다(예: `title`). Filter Query Type이 _Regexp_과 같이 필드가 필요하지 않은 유형으로 설정된 경우에는 필요하지 않습니다.

쿼리 문자열 및 스크립트 쿼리에는 필터 필드를 설정할 필요가 없습니다.  다른 모든 쿼리에는 하나 이상의 필드가 필요합니다.
<!--Note: Multi Match and Simple Query String take an array of fields according to the Elasticsearch docs, but our config doesn't seem to support it. -->

Liferay DXP 색인에 있는 필드를 찾으려면 [제어판의 필드 매핑 UI](#finding-fields) 를 사용하십시오.

**필터 값(텍스트):** 대부분의 필터의 경우 지정된 필드에서 필터를 적용할 텍스트를 _하는 텍스트 값을 여기에 입력해야 합니다(_ : _일치_ 쿼리를 `title_en_US` 필드). 일부 필터 쿼리 유형에는 [_Regexp_](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-regexp-query.html) 쿼리의 경우와 같이 특별한 표기가 필요합니다.

**필터 쿼리 유형(선택 목록):** 결과를 필터링할 쿼리 유형을 선택합니다. 사용 가능한 유형에는 Bool, Date Range, Exists, Fuzzy, Match, Match Phrase, Match Phrase Prefix, Multi Match, Prefix, Query String, Regexp, Script, Simple Query String, Term, Wildcard가 포함됩니다.

이러한 쿼리에 대해 자세히 알아보려면 [Elasticsearch 설명서](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl.html) 을 방문하십시오.

**Occur(선택 목록):** 검색에 제공되는 쿼리의 발생 유형을 설정합니다. 옵션에는 Filter, must, must_not 및 should가 포함됩니다.

각 유형을 이해하려면 [Elasticsearch 문서](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-bool-query.html) 을 참조하십시오.

**쿼리 이름(텍스트):** 기여한 쿼리의 이름을 설정합니다. 이 필터가 하위 절을 제공하는 다른 필터에 대한 상위 쿼리로 작동하지 않는 한 이것은 필요하지 않습니다. 이 경우 이 필터의 쿼리 이름을 하위 필터의 상위 쿼리 이름으로 설정합니다.  이 상위/하위 동작은 Bool 유형의 필터에만 사용할 수 있습니다.

**상위 쿼리 이름(텍스트):** 하위 절을 Bool 쿼리에 제공할 때 상위 사용자 지정 필터 위젯에 구성된 쿼리 이름과 일치하도록 설정합니다. 그렇지 않으면 비워 둡니다.

**부스트(숫자):** [부스트](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-term-query.html#term-field-params) 이 쿼리와 일치하는 결과의 점수. 여기에 의미가 있는 정수 또는 십진수를 지정하십시오.

항상 이와 일치하는 결과를 맨 위에 표시하려면 Boost 값을 매우 높게 설정하십시오(예: _1000_).

**사용자 지정 제목(텍스트):** 이 필터에 대해 표시할 제목을 입력합니다. 설정하지 않으면 필터 필드의 값이 표시됩니다.

**사용자 정의 매개변수 이름(텍스트):** 필터의 URL 매개변수 이름을 지정합니다. 설정하지 않으면 필터 필드의 값이 사용됩니다.

**보이지 않음(부울):** 체크하면 일반 사용자에게 위젯이 보이지 않습니다. 구성의 필터 값이 기본적으로 적용되지만 사용자는 여전히 URL 매개변수를 통해 다른 값을 필터링할 수 있습니다. Immutable 설정으로 URL 매개변수 필터링을 방지할 수 있습니다(아래 참조).

**변경 불가능(부울):** 일반 사용자가 필터 값을 변경할 수 없도록 하려면 이 옵션을 활성화합니다. 위젯은 그들에게 보이지 않게 됩니다. URL 매개변수를 통해 설정된 _및_ 필터 값은 허용되지 않습니다. 위젯 구성에서 설정한 필터 값은 항상 적용됩니다(비활성화되지 않은 경우). Immutable을 true로 설정하면 Custom Parameter Name 값이 무시됩니다.

**비활성화됨(부울):** 선택하면 쿼리가 무시되고 검색에 참여하지 않습니다. 이렇게 하면 필터를 빠르게 중지할 수 있지만 나중에 다시 활성화할 수 있도록 구성을 유지할 수 있습니다.

**통합 검색 키(텍스트):** 이 위젯이 참여하는 대체 검색의 키를 입력합니다. 설정된 경우 기본 색인은 전혀 검색되지 않는다는 점에 유의하십시오. 설정하지 않으면 이 위젯이 기본 검색에 참여합니다.

이 필드의 값은 일반적으로 애플리케이션 정의 색인의 이름과 일치합니다.

## 필드 찾기

사용자 정의 필터 위젯에서 필터링할 수 있는 필드를 찾으려면 적절한 권한이 있는 사용자가 _제어판_ &rarr; _구성_ &rarr; _검색_으로 이동할 수 있습니다.  여기에서 Field Mappings 탭을 열고 `liferay-[companyId]` 인덱스에 대한 매핑을 찾습니다. 매핑의 [`속성`](https://www.elastic.co/guide/en/elasticsearch/reference/current/properties.html) 섹션으로 스크롤합니다.

![Liferay DXP의 인덱싱된 필드를 찾으려면 필드 매핑을 찾아보십시오.](./filtering-search-results/images/04.png)

## 중첩 필드 찾기 및 사용

{bdg-secondary}`사용 가능 7.2 FP10+, 7.3 FP1+, 7.4(모든 업데이트)`

[중첩된 DDM 필드 액세스](../search-facets/custom-facet.md#accessing-nested-ddm-fields) 에 설명된 대로 DDM 필드는 Liferay 7.2 SP3+/FP8+(및 모든 Liferay 7.3 버전)에서 [중첩된 필드](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) 가 되었습니다. 7.2 및 7.3의 최신 수정 팩 및 GA 릴리스에서는 이러한 중첩 필드를 설명하기 위해 [Elasticsearch 중첩 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-nested-query.html) 지원됩니다.

색인의 기존 문서에서 DDM 필드를 찾으려면

1. 검색 결과 위젯의 구성에서 _표시 결과를 문서 양식_ 로 활성화한 다음 중첩 필드를 사용하는 결과를 검색합니다.

1. 결과의 _Details_ 보기를 확장한 다음 `ddmFieldArray` 필드를 찾아 해당 값을 복사합니다. 예를 들어,

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

사용자 정의 필터 구성에서 중첩 필드를 사용하려면 세 개의 사용자 정의 필터 위젯이 필요합니다.  필수 하위 쿼리를 래핑하기 위해 [중첩 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-nested-query.html) 추가되었습니다. 하나의 하위 쿼리는 필드 이름과 일치하고 다른 하나는 값과 일치합니다.

```{important}
동일한 페이지의 여러 중첩 필드에 대한 사용자 정의 필터가 필요한 경우 각 하위 쿼리에 대해 별도의 사용자 정의 매개변수 이름을 구성해야 합니다. 예를 보려면 [사용자 정의 필터 예](./custom-filter-examples.md#boosting-matches-to-nested-fields) 를 참조하십시오. 
```

사용자 정의 필터 위젯과 함께 DDM 구조 필드의 사용을 보여 주는 예는 [중첩 필드에 대한 일치 부스팅](custom-filter-examples.md#boosting-matches-to-nested-fields) 참조하십시오.

## 관련 내용

- [사용자 정의 필터 예](./custom-filter-examples.md)
- [결과 순위](../../search-administration-and-tuning/result-rankings.md)
- [동의어 세트](../../search-administration-and-tuning/synonym-sets.md)
