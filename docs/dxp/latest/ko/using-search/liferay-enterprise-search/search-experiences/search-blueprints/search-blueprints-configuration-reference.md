# 청사진 구성 참조 검색

검색 청사진 사용자 인터페이스에는 청사진 생성을 위한 쿼리 빌더가 있습니다. 요소를 추가하고 쿼리 설정을 구성하는 것 외에도 많은 블루프린트 사용 사례에 중요한 추가 구성이 있습니다. 이러한 구성으로 작업하려면 전역 메뉴 &rarr; 응용 프로그램 &rarr; 청사진으로 이동합니다. 새 청사진을 추가하거나 기존 청사진을 연 다음 _구성_ 탭을 클릭합니다.

![JSON을 사용하여 검색 청사진을 구성합니다.](./search-blueprints-configuration-reference/images/01.png)

각 구성 필드는 JSON 문자열을 허용하는 단일 텍스트 영역으로 구성됩니다.

## 집계 설정

검색 청사진에서 [집계](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/search-aggregations.html) 구성합니다. 집계는 쿼리 결과를 가져와서 데이터를 논리적 집합으로 그룹화합니다. 복잡한 데이터 요약을 제공하도록 집계를 구성할 수 있습니다.

검색 청사진에 추가된 집계는 검색 요청에 이미 있는 집계(예: 패싯에서)에 추가로 적용됩니다.

```{note}
집계를 구성하고 검색 응답에 반환할 수 있지만 Liferay의 UI에서 Blueprint 추가 집계를 표시하거나 처리할 수 있는 기본 방법은 없습니다. Blueprint에 추가된 집계를 사용하려면 사용자 지정 코드가 필요합니다.
```

청사진에 집계를 추가하려면

1. 청사진 편집기에서 _구성_ 탭을 클릭합니다.
1. Aggregation Configuration 텍스트 영역을 찾아 유효한 JSON을 입력합니다. Elasticsearch DSL을 사용하여 JSON을 만듭니다.

   ```{warning}
   일부 집계 속성은 Liferay의 검색 API에서 지원되지 않습니다.
   ```

   ```json
   {
      "aggs": {
         "date_histogram-test": {
            "date_histogram": {
               "date_histogram_interval": "minute",
               "field": "modified",
               "keyed": true,
               "min_doc_count": 1,
               "order": {
                  "_count": "asc"
               }
            }
         }
      }
   }
   ```

## 하이라이트 설정

검색 청사진에서 [하이라이트](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/highlighting.html) 구성합니다. 검색 청사진에서 하이라이트 구성을 추가하면 기본 검색 하이라이트 구성을 재정의합니다.

청사진에 하이라이트를 추가하려면,

1. 청사진 편집기에서 _구성_ 탭을 클릭합니다.
1. 하이라이트 구성 텍스트 영역을 찾아 유효한 JSON을 입력합니다. 속성 및 가능한 값은 [Elasticsearch 설명서](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/highlighting.html) 에 자세히 설명되어 있습니다.

   ```json
   {
      "fields": {
         "content${context.language_id}": {},
         "title${context.language_id}": {}
      },
      "fragment_size": 100,
      "number_of_fragments": 10,
      "post_tags": [
         "</liferay-hl>"
      ],
      "pre_tags": [
         "<liferay-hl>"
      ],
      "require_field_match": true
   }
   ```

## 정렬 설정

검색 청사진에서 [정렬](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/sort-search-results.html) 구성합니다. 검색 청사진을 통해 추가된 정렬은 검색 요청(예: 정렬 위젯에서)에 이미 있는 정렬에 추가로 적용됩니다. 단, Search Blueprint에 추가된 Sort는 Sort 위젯의 UI나 설정 화면에 반영되지 않습니다.

```{warning}
검색 페이지에서 정렬을 구성하기 위해 정렬 위젯과 블루프린트를 모두 사용하지 마십시오. 정렬 위젯의 정렬과 검색 청사진의 정렬 구성을 결합하면 일관된 동작을 보장할 수 없습니다.
```

청사진에 정렬을 추가하려면

1. 청사진 편집기에서 _구성_ 탭을 클릭합니다.
1. 정렬 구성 텍스트 영역을 찾아 유효한 JSON을 입력합니다.

   ```json
   {
      "sorts": [
         {
            "title_sortable": "desc"
         }
      ]
   }
   ```

## 매개 변수 구성

검색 컨텍스트 특성에서 새 템플릿 변수를 선언합니다. 예를 들어 사용자 지정 필터 위젯을 위젯 템플릿 및 청사진과 결합하여 최종 사용자가 게시되지 않은 콘텐츠와 초안 콘텐츠 간에 검색 결과를 전환할 수 있습니다.

이 예에서는 속성 값이 _true_인 경우 검색 결과에서 웹 콘텐츠를 제외하는 새 검색 컨텍스트 속성을 추가합니다.

1. 새 청사진에 매개변수 구성을 추가합니다. _구성_ 탭으로 이동하여 매개변수 구성 텍스트 상자를 찾습니다. 추가

   ```json
   {
      "parameters": {
         "exclude.journal_articles": {
            "type": "String"
         }
      }
   }
   ```

1. 청사진에 사용자 지정 요소 추가: _쿼리 빌더_ 탭으로 이동하여 사용자 지정 JSON 요소를 찾은 다음 _추가_클릭합니다. 기존 콘텐츠를 덮어씁니다.

   ```json
   {
      "description_i18n": {
         "en_US": "Conditionally exclude journal articles from the search."
      },
      "elementDefinition": {
         "category": "hide",
         "configuration": {
            "queryConfiguration": {
               "queryEntries": [
                  {
                     "clauses": [
                        {
                           "context": "query",
                           "occur": "filter",
                           "query": {
                              "bool": {
                                 "should": [
                                    {
                                       "bool": {
                                          "must_not": [
                                             {
                                                "term": {
                                                   "entryClassName": {
                                                   "value": "com.liferay.journal.model.JournalArticle"}
                                                }
                                             }
                                          ]
                                       }
                                    },
                                    {
                                       "bool": {
                                          "must": [
                                             {
                                                "term": {
                                                   "discussion": false
                                                }
                                             }
                                          ]
                                       }
                                    }
                                 ]
                              }
                           }
                        }               
                     ],
                     "condition": {
                        "contains": {
                           "parameterName": "exclude.journal_articles",
                           "value": "true"
                        }
                     }
                  }
               ]
            }
         },
         "icon": "hidden"
      },
      "title_i18n": {
         "en_US": "Exclude Journal Articles"
      }
   }
   ```

1. 검색 컨텍스트 특성을 추가합니다. 테스트 목적으로 [미리보기](creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar) 사이드바에서 이 작업을 수행할 수 있습니다.

1. _미리보기_클릭합니다. 기어 아이콘(![Gear](../../../../images/icon-cog3.png))을 클릭하여 Blueprint 미리보기 검색에 검색 컨텍스트 속성을 추가합니다. 속성에 대한 키/값 쌍을 입력하십시오: `exclude.journal_articles`/`true`

1. 그런 다음 _완료_클릭합니다.

**체크포인트:** 웹 콘텐츠 기사를 반환할 것으로 예상되는 검색을 실행하고(필요한 경우 추가) 기사가 반환되지 않는지 확인합니다. 속성 구성을 다시 열고 값을 _false_로 설정합니다. 이제 미리보기 검색에 웹 콘텐츠가 포함되는지 확인합니다.


   ```{tip}
   [하위 수준 검색 옵션](../../../search-pages-and-widgets/search-results/understanding-low-level-search-options) 을 사용하여 검색 페이지에서 검색 컨텍스트 속성을 구성할 수 있습니다. md) 위젯입니다.
   ```

## 고급 설정

```{warning}
이것은 거의 필요하지 않은 고급 기능입니다. Liferay UI의 기본 기능이 이 구성에 응답하지 않기 때문에 사용자 지정 코드만 검색 응답에서 이 구성의 결과를 사용할 수 있습니다.
```

고급 구성은 검색 요청 매개변수로 [소스 포함 및](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/mapping-source-field.html#include-exclude) 제외를 추가합니다. `_source` 필드에는 인덱스 요청에 전달된 저장된 문서 본문이 포함됩니다. 이 필드 자체는 인덱싱되지 않습니다. Blueprints의 고급 구성을 사용하면 필드에서 포함하거나 제외할 필드를 지정하여 `_source` 필드를 정리할 수 있습니다. 기능이 겹치고 하위 수준 검색 옵션 위젯의 _필드에서_ 반환 구성과 충돌할 수 있으므로 두 접근 방식을 동시에 사용해서는 안 됩니다. 청사진에 고급 구성을 추가하려면

1. 청사진 편집기에서 _구성_ 탭을 클릭합니다.
1. 고급 구성 텍스트 영역을 찾아 필요한 `제외` 및 `포함` 입력합니다. 와일드카드가 허용됩니다.

```json
{
    "source":{
        "excludes":[
            "<fieldName1>",
            "<fieldName2>"
        ],
        "fetchSource":true,
        "includes":[
            "<fieldName3>",
            "<fieldName4>"
        ]
    }
}
```

## 제어판에서 검색 Blueprint 구성

검색 청사진에 대한 대부분의 구성은 청사진 애플리케이션과 검색 페이지 자체에서 직접 찾을 수 있습니다. 그러나 검색 청사진에서 지리적 위치 기능을 지원하는 서비스를 활성화하는 두 가지 시스템/인스턴스 구성이 있습니다.

두 구성 항목 모두 제어판 &rarr; 시스템/인스턴스 설정의 검색 경험 범주에서 찾을 수 있습니다.

![Search Blueprints에서 지리적 위치 기능을 활성화하도록 ipstack 및 OpenWeatherMap 서비스를 구성합니다.](./search-blueprints-configuration-reference/images/02.png)

[Ipstack](https://ipstack.com/) 사용자의 IP 주소를 기반으로 지리적 위치 정보를 제공합니다.

| IP스택 구성 | 기정값                    | 묘사                                            |
|:------- |:---------------------- |:--------------------------------------------- |
| 가능하게 하는 | 틀린                     | 상자를 선택하여 ipstack 서비스를 활성화합니다.                 |
| API 키   | 아무도                    | 서비스를 활성화하려면 ipstack.com에서 API 키를 얻어야 합니다.     |
| API URL | http://api.ipstack.com | 서비스에 대한 URL을 제공하십시오.                          |
| 캐시 타임아웃 | 604800                 | 캐시된 데이터가 만료되고 API가 다시 호출될 때까지의 시간(ms)을 설정합니다. |

[OpenWeatherMap](https://openweathermap.org) 은 ipstack과 함께 사용되어 사용자의 위치를 기반으로 날씨 정보를 제공합니다. 검색 청사진에서 이것을 사용하려면 ipstack도 활성화해야 합니다.

| IP스택 구성 | 기정값                                            | 묘사                                                |
|:------- |:---------------------------------------------- |:------------------------------------------------- |
| 가능하게 하는 | 틀린                                             | OpenWeatherMap 서비스를 활성화하려면 확인란을 선택하십시오.           |
| API 키   | 아무도                                            | 서비스를 활성화하려면 openweathermap.org에서 API 키를 얻어야 합니다.  |
| API URL | http://api.openweathermap.org/data/2.5/weather | 서비스에 대한 URL을 제공하십시오.                              |
| 캐시 타임아웃 | 604800                                         | 캐시된 데이터가 만료되고 API가 다시 호출될 때까지의 시간(ms)을 설정합니다.     |
| 단위      | 측정항목                                           | 날씨 데이터 단위에 대한 시스템을 설정합니다: 임페리얼, 미터법 또는 표준을 선택합니다. |

