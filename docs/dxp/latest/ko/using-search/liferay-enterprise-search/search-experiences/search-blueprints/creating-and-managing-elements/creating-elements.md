# 요소 생성

[검색 청사진과 함께 제공되는 시스템 요소](../search-blueprints-elements-reference.md)가 많이 있습니다. 요구 사항을 충족하는 시스템 요소가 없는 경우 고유한 검색 청사진 요소를 생성할 수 있는 여러 가지 방법이 있습니다.

* [사용자 지정 JSON 요소](#using-the-custom-json-elements) 을 사용하여 검색 청사진 [쿼리 빌더](../creating-and-managing-search-blueprints.md#using-the-query-builder)에서 요소를 생성합니다.
* [편리한 미리보기 기능과 시스템의 미리 정의된 템플릿 변수 목록을 포함하여 보다 강력한 요소 편집기를 사용하여 요소를 작성하려면 요소 추가 소스 편집기](#using-the-add-element-source-editor) 사용하십시오.
* [시스템 요소](./managing-elements.md) 복제하여 고유한 사용자 정의 요소 개발을 시작하십시오.
* [Elasticsearch 쿼리 DSL](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/query-dsl.html) 사용에 익숙하고 Elasticsearch 쿼리를 기반으로 요소를 빠르게 요리해야 하는 경우 [Paste Any Elasticsearch 쿼리 시스템 요소](../search-blueprints-elements-reference.md#paste-any-elasticsearch-query) 을 사용합니다.

## 사용자 지정 JSON 요소 사용

다른 Blueprint에서 재사용할 의도가 없는 요소는 Blueprint에서 작업하는 동안 [Query Builder](../creating-and-managing-search-blueprints.md#using-the-query-builder) 에 추가할 수 있습니다. 원본 청사진에서만 사용할 수 있으며 검색 청사진의 요소 섹션에는 표시되지 않습니다. 

사용자 지정 JSON 요소를 빌더에 추가하고 상용구 JSON 편집을 시작합니다.

```json
{
   "description_i18n": {
      "en_US": "Editable JSON Text Area"
   },
   "elementDefinition": {
      "category": "custom",
      "configuration": {},
      "icon": "custom-field"
   },
   "title_i18n": {
      "en_US": "Custom JSON Element"
   }
}
```

JSON 편집기에 입력하면 자동 완성 기능이 사용 가능한 속성을 표시합니다. 더 자세히 이해하려면 [스키마 이해](#understanding-the-element-schema)을 참조하십시오.

사용자 지정 JSON 요소에 모든 요소를 작성할 수 있지만 일반적으로 이 접근 방식은 쿼리 절과 조건을 추가하는 단순 요소에 가장 적합합니다. 종종 이들은 `uiConfiguration` 섹션이 필요하지 않으며 요소에서 사용할 수 있는 미리 정의된 템플릿 변수를 광범위하게 사용하지 않습니다. 보다 복잡한 경우에는 [요소 소스 편집기](#using-the-add-element-source-editor)을 사용하십시오.

예를 들어 아래 Exclude Journal Articles 요소는 사용자 정의 JSON 요소를 기반으로 합니다. `exclude.journal_articles` 이라는 매개변수가 `true`인 경우에만 요소의 쿼리가 적용되도록 조건을 추가합니다. 쿼리는 결과가 웹 콘텐츠 기사의 `entryClassName` 필드와 일치하지 않도록 `must_not` term 쿼리 절을 추가합니다.

```json
{
   "description_i18n": {
      "en_US": "Exclude journal articles from the search."
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

이 요소는 블루프린트의 매개변수 구성을 사용하여 추가할 수 있는 사용자 정의 변수에 따라 다릅니다. 청사진에 사용자 지정 변수를 추가하는 방법에 대해 알아보려면 [검색 청사진 구성 참조](../search-blueprints-configuration-reference.md#parameter-configuration) 을 참조하십시오.

## 요소 소스 추가 편집기 사용

보다 강력한 편집 환경을 통해 요소를 만들 수 있습니다. 검색 청사진의 요소 섹션에서 _추가_ (![Add](../../../../../images/icon-add.png))을 클릭합니다. 

요소의 이름을 지정하고 _만들기_클릭합니다. 편집기 왼쪽 창에 미리 정의된 변수가 있는 요소 소스 편집기가 나타납니다. JSON 편집기에 입력하면 자동 완성 기능이 사용 가능한 속성을 표시합니다. 사용 가능한 JSON 속성을 자세히 이해하려면 [스키마 이해](#understanding-the-element-schema)참조하십시오.

![요소 소스 편집기에서 요소를 만듭니다.](./creating-elements/images/02.png)

UI 구성 옵션은 요소 JSON의 `uiConfiguration` 속성에 정의됩니다. 쿼리 빌더에서 요소의 구성 창을 미리 보려면 _미리보기_ 링크(취소 버튼 옆)를 클릭하십시오.

![요소 구성 창을 미리 봅니다.](./creating-elements/images/03.png)

### 미리 정의된 변수 사용

요소 소스 편집기의 요소에 미리 정의된 변수를 삽입하려면 커서를 원하는 사이트에 놓은 다음 왼쪽 사이드바에서 변수를 클릭하십시오. Custom JSON Element에서 변수를 편집기에 직접 입력해야 합니다.

자세한 내용은 [미리 정의된 요소 변수 참조](./predefined-element-variables-reference.md) 을 참조하십시오.

## 요소 스키마 이해

```{warning}
[요소 스키마](#understanding-the-element-schema)는 변경될 수 있습니다. Liferay 버전 간에 스키마가 변경되면 이전 요소의 JSON 가져오기가 실패할 수 있습니다.
```

<!-- TODO: change the link below to use the git tag when we update the version to one that supports this feature. -->

검색 청사진 요소에 대한 스키마는 [sxp-query-element.schema.json](https://github.com/liferay/liferay-portal/blob/master/modules/dxp/apps/search-experiences/search-experiences-web/src/main/resources/META-INF/resources/sxp_blueprint_admin/schemas/sxp-query-element.schema.json) 파일에 정의되어 있습니다. REST API 탐색기에 대한 액세스 권한이 있는 사용자는 스키마를 보다 편리하게 찾아볼 수 있습니다. Liferay 방문에 로그인하는 동안

<http://localhost:8080/o/api?endpoint=http://localhost:8080/o/search-experiences-rest/v1.0/openapi.json>

_POST /v1.0/sxp-blueprints_ 끝점 항목을 확장합니다. 아래로 스크롤하여 _스키마_ 링크( _예제 값_ 링크 옆)를 클릭하십시오.

![API 탐색기에서 요소 스키마를 탐색합니다.](./creating-elements/images/04.png)

```{tip}
요소가 스키마 요소를 사용하여 구성되는 방식을 더 잘 이해하려면 시스템 요소의 구문을 검사하십시오.
```

각 요소에는 두 개의 필수 최상위 속성( `elementDefinition` 및 `title_i18n`이 있습니다. `elementDefinition` `카테고리` 및 `구성` &rarr; `queryConfiguration` 속성을 포함해야 합니다.

```json
{
    "elementDefinition": {
        "category": "custom",
        "configuration": {
            "queryConfiguration": {}
        }
    },
    "title_i18n": {
        "en_US": "Custom JSON Element"
    }
}
```

제목 필드에서 필요한 만큼 많은 언어로 요소의 제목 텍스트를 설정합니다.

### 요소 `만들기 elementDefinition`

`elementDefinition` 에서 대부분의 작업을 수행합니다. 해당 속성에는 `범주`, `구성`, `아이콘`및 `uiConfiguration`이 포함됩니다. 

`카테고리` 요소의 동작을 분류하는 문자열을 제공합니다. `일치`, `부스트`, `조건부`, `필터`, `숨기기`또는 `사용자 지정`지정합니다.

`구성` `queryEntries` 속성을 통해 기여하는 쿼리 절을 보유하는 `queryConfiguration`제공합니다.

`icon` 요소에 사용할 수 있는 아이콘을 설정하는 문자열을 설정합니다. [어휘 아이콘 라이브러리](../../../../../building-applications/developing-a-java-web-application/using-mvc/tag-libraries/clay-tag-library/clay-icons.md) 에서 사용할 수 있는 모든 이미지를 사용할 수 있습니다(예: `엄지 위로`).

`uiConfiguration` UI에 표시할 구성 요소를 설정한 다음 구성된 값과 함께 사용자 지정 요소로 전달합니다. 

예를 들어 `entryClassName` 필드에서 용어 쿼리 일치를 강화하는 요소는 쿼리와 UI를 다음과 같이 구성할 수 있습니다.

```json
"configuration": {
   "queryConfiguration": {
      "queryEntries": [
         {
            "clauses": [
               {
                  "query": {
                     "term": {
                        "entryClassName": {
                           "boost": "${configuration.boost}",
                           "value": "${configuration.entry_class_name}"
                        }
                     }
                  }
               }
            ]
         }
      ]
   }
},
"uiConfiguration": {
   "fieldSets": [
      {
         "fields": [
            {
               "defaultValue": 1,
               "label": "Boost",
               "name": "boost",
               "type": "number",
               "typeOptions": {
                  "min": 0
               }
            }
         ]
      }
   }
```

### 요소 `구성 정의`

`구성` 속성은 중첩된 속성 `queryConfiguration` &rarr; `queryEntries`보유합니다.

`queryEntries` JSON으로 다이빙하면 속성 `절`, `조건`, `활성화`, `postFilterClauses`및 `rescores`을 포함할 수 있습니다. 

- 위 스니펫은 Blueprint 기반 검색에 쿼리 절을 추가하기 위해 `절` (요소 배열)을 사용하는 요소를 보여줍니다. `쿼리`외에 `추가`, `부스트`, `콘텐츠`, `비활성화`, `필드`, `이름`, `발생`, `부모`, `유형`또는 `값` 속성.
- `조건` 부울 검사를 제공합니다. true인 경우 제공된 절이 검색 쿼리에 포함됩니다. 거짓이면 제외됩니다.
- 요소를 비활성화하려면 `활성화됨` 거짓(기본적으로 true임)으로 설정합니다.
- `postFilterClauses` 추가합니다( `절` 요소의 배열). `추가`, `부스트`, `콘텐츠`, `비활성화`, `필드`, `이름`, `발생`, `부모`, `쿼리`, `유형`또는 `값` 속성을 추가할 수 있습니다.
- 쿼리 결과에 대한 관련성 점수를 다시 계산하려면 `rescores` 추가합니다. `쿼리`, `queryWeight`, `rescoreQueryWeight`, `scoreMode`및 `windowSize`지정합니다. 자세한 내용은 [Elasticsearch 설명서](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/filter-search-results.html#rescore) 참조하십시오.

`uiConfiguration` 속성은 중첩된 속성 `fieldSet` 및 `field`를 보유합니다.

UI 구성의 각 필드에 대해 추가할 수 있는 몇 가지 구성 속성이 있습니다.

- `defaultValue` 사용하여 필드의 초기 값을 입력하십시오.
- Blueprints UI의 필드에 대한 도움말 텍스트를 표시하려면 `helpText` 입력합니다.
- 사람이 읽을 수 있는 `라벨`입력하세요.
- 쿼리 절에 필드 값을 전달할 때와 같이 요소의 다른 사이트에서 필드를 참조하는 데 사용할 수 있는 `이름` 입력합니다: `${configuration.name}`.
- 필드의 `유형` 설정합니다. `date`, `fieldMapping`, `fieldMappingList` (사용 가능한 필드 목록, 해당 로케일 및 필드 부스트 포함), `itemSelector`, `json`, `키워드`, `multiselect`, `number`중에서 선택 `선택`, `슬라이더`및 `텍스트`
- `typeOptions` 속성을 사용하여 각 필드 유형에 사용할 수 있는 옵션을 구성합니다. 예를 들어 선택 필드에 대해 `옵션` 표시를 설정합니다. 
     - `부스트` 필드당 숫자 부스트 값을 설정합니다.
   - `형식` 은 허용 가능한 날짜 형식 [](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/mapping-date-format.html) 결정합니다(예: `yyyyMMddHHmmss`).
   - `nullable` null 값을 전달할 수 있는지 여부를 설정합니다.
   - `옵션` 은 선택 필드의 옵션을 설정합니다.
   - `required` 구성에 값이 있어야 하는지 여부를 설정합니다.
   - `단계` 은 숫자 또는 슬라이더 필드의 숫자 증가 또는 감소 값을 설정합니다.
   - `단위` 은 숫자 필드의 측정 단위를 설정합니다.
   - `unitSuffix`는 단위가 있는 숫자 필드에 표시할 단위 표기법을 설정합니다(예를 들어 `unit`이 `km`인 경우 `unitSuffix`를 `km` 또는 `km`로 설정할 수 있음).

## 관련 항목

- [검색 Blueprint 생성 및 관리](../creating-and-managing-search-blueprints.md)
- [청사진 요소 참조 검색](../search-blueprints-elements-reference.md)
- [청사진 구성 참조 검색](../search-blueprints-configuration-reference.md) 
