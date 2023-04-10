# 검색 청사진에서 결과 정렬

검색 결과의 순서를 제어하기 위해 Blueprint를 검색하기 위해 [정렬 구성](./search-blueprints-configuration-reference.md#sort-configuration) 추가합니다.

1. **Global Menu**(![Global Menu](../../../../images/icon-applications-menu.png))을 열고 **Applications** 탭을 클릭한 다음 **Blueprints** 선택합니다.

1. [청사진을 생성하거나](./creating-and-managing-search-blueprints.md) 기존 청사진을 엽니다.

1. **구성** 탭을 클릭하고 정렬 구성 텍스트 영역에 JSON을 입력합니다.

![Blueprint의 결과를 정렬하려면 JSON을 입력합니다.](./sorting-results-in-a-search-blueprint/images/01.png)

```{important}
* [정렬 위젯](../../../search-pages-and-widgets/search-results/sorting-search-results.md)과 검색 청사진을 모두 사용하여 검색 페이지에서 정렬을 구성하지 마세요. . Liferay는 일관된 동작을 보장할 수 없습니다.

* 아래 예시는 간단합니다. 강력한 정렬 구성은 모든 시나리오를 고려해야 합니다. 예를 들어 검색 결과 문서에 정렬 필드가 없으면 [`missing`](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/sort-search-results .html#_missing_values) 매개변수를 사용하여 정렬 동작을 구성합니다.

   자세한 내용은 [Elasticsearch의 정렬 문서](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/sort-search-results.html) 를 참조하세요.
```

## 예 1: 제목으로 정렬

정렬 구성은 오름차순(`asc`) 또는 내림차순(`desc`)으로 정렬할 필드를 정의하는 `sorts` 배열이 있는 JSON 개체입니다.

```json
{
   "sorts": [
      {
         "localized_title_${context.language_id}_sortable": "asc"
      }
   ]
}
```

```{tip}
* 검색 문서는 특히 '제목'과 같은 현지화된 텍스트 필드에 대해 유사한 이름의 필드 변형을 포함할 수 있습니다. `localized_title_en_US_sortable`과 같은 필드의 현지화되고 정렬 가능한 키워드 변형을 사용하십시오. 사용 가능한 필드를 찾으려면 각 엔티티의 문서를 확인하십시오. 예를 들어 `title_sortable`은 공통 필드이지만 동일한 항목에 `localized_title_en_US_sortable`이 포함될 수도 있습니다.

* 언어 ID를 직접 입력하는 대신 `${context.language_id}` 변수를 사용하여 4자로 된 언어 코드(예: `en_US`)를 현재 언어로 자동 입력합니다.

* 문서의 필드를 보려면 청사진의 도구 모음에서 _미리보기_를 클릭하고 검색을 실행한 다음 결과에 대한 필드를 확장합니다.
```

## 예 2: 구조 필드별 정렬

[웹 콘텐츠 구조](../../../../content-authoring-and-management/web-content/web-content-structures.md) 필드는 검색 엔진 문서에서 중첩 필드로 인덱싱됩니다.

문서를 볼 때 중첩된 속성이 `ddmFieldArray`아래에 나타납니다.

```json
"ddmFieldArray" : [
          {
            "ddmFieldName" : "ddm__keyword__30805__department_en_US",
            "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
            "ddmFieldValueKeyword_en_US" : "true",
            "ddmFieldValueKeyword_en_US_String_sortable" : "true"
          }
]
```

중첩된 필드가 있는 문서를 보려면

1. 청사진의 **구성** 탭으로 이동하고 이 JSON을 고급 구성 상자에 입력하여 문서 `_source` 가져오기를 활성화합니다.

    ```json
    {
       "source": {
          "fetchSource": true
       }
    }
    ```

1. 도구 모음에서 **미리보기** 클릭하고 중첩된 필드가 있는 결과를 검색하고 해당 필드를 확장합니다.

중첩 필드의 경우 정렬 구성의 필드 선언이 더 복잡합니다.

```json
{
   "sorts": [
      {
         "ddmFieldArray.ddmFieldValueKeyword_${context.language_id}_String_sortable": {
            "nested": {
               "nested_path": "ddmFieldArray",
               "nested_filter": {
                  "term": {
                     "ddmFieldArray.ddmFieldName": {
                        "value": "ddm__keyword__30805__department_${context.language_id}"
                     }
                  }
               }
            },
            "order": "asc"
         }
      }
   ]
}
```

## 예 3: 개체 필드를 기준으로 정렬

[개체](../../../../building-applications/objects.md) 입력 필드는 검색 엔진 문서에서 중첩 필드로 인덱싱됩니다.

문서를 볼 때 개체의 중첩된 속성이 `nestedFieldArray`아래에 나타납니다.

```json
"nestedFieldArray" : [
            {
              "fieldName": "total",
              "valueFieldName": "value_integer",
              "value_integer": "8"
            }
]
```

중첩된 필드가 있는 문서를 보려면

1. 청사진의 **구성** 탭으로 이동하고 이 JSON을 고급 구성 상자에 입력하여 문서 `_source` 가져오기를 활성화합니다.

    ```json
    {
       "source": {
          "fetchSource": true
       }
    }
    ```

1. 도구 모음에서 **미리보기** 클릭하고 중첩된 필드가 있는 결과를 검색하고 해당 필드를 확장합니다.

이 예는 개체 정수 필드를 기준으로 정렬합니다.

```json
{
   "sorts": [
      {
         "nestedFieldArray.value_integer": {
            "nested": {
               "nested_path": "nestedFieldArray",
               "nested_filter": {
                  "term": {
                     "nestedFieldArray.fieldName": "total"
                  }
               }
            },
            "order": "desc"
         }
      }
   ]
}
```

## 추가 정보

* [청사진 구성 참조 검색](search-blueprints-configuration-reference.md)
* [검색 결과 정렬](../../../search-pages-and-widgets/search-results/sorting-search-results.md)
