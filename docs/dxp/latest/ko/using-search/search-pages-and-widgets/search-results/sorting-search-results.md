# 검색 결과 정렬

[검색 결과](./search-results.md) 위젯에 표시되는 검색 결과는 기본적으로 [관련성 점수](./search-results.md#search-results-relevance) (검색 엔진 [에 의해 계산됨)별로](https://www.elastic.co/guide/en/elasticsearch/guide/master/scoring-theory.html)됩니다. 정렬 위젯을 사용하여 사용자는 반환된 결과의 순서를 제어할 수 있습니다.

[검색 페이지](../working-with-search-pages/search-pages.md) 에 위젯을 추가하여 결과 정렬을 시작합니다.

기본적으로 관련성 정렬 대신 다음과 같은 방식으로 결과를 정렬할 수 있습니다.

- 제목 가나다순
- 수정 날짜 기준(기본적으로 최신순 또는 가장 오래된순 선택)
- 생성 날짜 기준(기본적으로 최신순 또는 가장 오래된순 선택)
- 일치하는 각 자산을 생성한 사용자의 알파벳순

정렬 위젯의 미리 구성된 정렬 전략 중 하나를 선택하거나 직접 구성하십시오.

위젯에서 원하지 않는 정렬 옵션을 삭제할 수도 있습니다.

## 페이지에 정렬 위젯 추가

정렬 위젯을 시작하려면

1. 페이지의 추가 메뉴(![Add](../../../images/icon-add-widget.png))를 열고 위젯 섹션을 확장합니다.

1. 검색 범주에서 정렬 위젯을 페이지로 드래그합니다.

## 정렬 위젯 구성

```{note}
정렬 위젯의 구성 화면이 Liferay 7.4 DXP 업데이트 29+/CE GA 29+에서 업데이트되었습니다. 일정 기간 동안 _클래식 보기로 전환_ 링크를 클릭하여 이전 구성 화면을 사용하도록 선택할 수 있습니다.

![클래식 정렬 구성과 더 새롭고 직관적인 구성 화면 사이를 전환합니다.](./sorting-search-results/images/03.png)

클래식 구성 보기를 사용하는 옵션은 향후 업데이트/에서 제거됩니다. 조지아
```

정렬 위젯의 구성 화면에서 다음을 수행할 수 있습니다.

- 기본 관련성 정렬 옵션을 비활성화합니다.
- 기존 정렬 옵션 편집
- 삭제 옵션
- 새 옵션 추가

![사용자는 정렬 위젯을 사용하여 검색 결과를 재정렬할 수 있습니다.](./sorting-search-results/images/04.gif)

```{note}
관련성은 켜거나 끌 수 있지만 완전히 제거할 수는 없습니다. 관련성이 활성화되면 기본 검색 엔진 동작이 사용됩니다. 결과는 관련성의 내림차순으로 정렬됩니다(가장 높은 점수 먼저).
```

위젯 구성 화면에 액세스하려면 위젯 옵션 메뉴(![Options](../../../images/icon-app-options.png))를 열고 _구성_를 클릭합니다.

각 정렬 옵션에는 _인덱싱된 필드 이름_, _표시 레이블_및 _순서_의 세 가지 설정이 있습니다.


**색인 필드 이름:** 정렬할 색인 필드의 `fieldName` 을 입력합니다. 대부분의 경우 이것은 [키워드](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/keyword.html) 필드입니다. 다른 허용 가능한 옵션은 `날짜` 및 [숫자 데이터 유형](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/number.html)입니다. 정렬 위젯을 사용하여 `텍스트` 필드가 작동하도록 강제하는 방법도 있습니다(아래 참조).

**표시 레이블:** 구성 중인 정렬 유형에 대해 표시된 레이블을 설정합니다.

**순서:** 오름차순 또는 내림차순으로 정렬하도록 선택합니다. 클래식 보기를 사용 중이거나 업데이트된 구성 UI가 포함되지 않은 이전 Liferay 버전을 사용 중인 경우 [클래식 구성에서 정렬 순서 제어](#controlling-the-sort-order-in-the-classic-configuration) 을 참조하십시오.

![정렬 위젯의 구성에서 정렬 옵션을 추가, 편집 또는 제거합니다.](./sorting-search-results/images/02.png)

## 기본 정렬 동작 변경

기본적으로 관련성 옵션은 정렬 위젯 목록의 첫 번째로 페이지에 적용되는 기본 정렬입니다. 따라서 검색이 실행될 때 결과는 관련성을 기준으로 정렬됩니다. 관련성별 검색은 대부분의 사용자에게 예상되는 기본 동작이지만 정렬 위젯 구성에서 첫 번째 옵션을 변경하여 기본 검색에 다른 정렬 전략을 적용할 수 있습니다.

기본 정렬 옵션을 변경하려면

1. 위젯 옵션 ![Widget Options](../../../images/icon-widget-options.png) 버튼을 클릭하여 정렬 위젯의 구성 화면을 엽니다.

1. 관련성 옵션 아래에 있는 ![Add](../../../images/icon-duplicate.png) 추가 버튼을 클릭합니다.

1. 현재 관련성 옵션의 값을 복제합니다. 그러면 관련성이 목록의 두 번째 옵션이 됩니다.

1. 이제 상단 옵션을 변경하십시오. 기존 옵션 중 하나를 선택하는 경우 Remove ![Minus](../../../images/icon-minus.png)을 클릭하여 중복 항목을 제거해야 합니다.

1. 구성을 저장합니다. 검색어를 입력하면 새 정렬이 적용된 것을 볼 수 있습니다.

## 정렬 가능한 필드 찾기

정렬 위젯에서 사용할 수 있는 필드를 찾으려면 적절한 권한이 있는 사용자가 *제어판* &rarr; *구성* &rarr; *검색*으로 이동할 수 있습니다.  여기에서 필드 매핑 탭을 열고 각 인덱스에 대한 매핑을 찾습니다.  매핑의 `속성` 섹션으로 스크롤하고 `키워드` 필드, `날짜` 필드 또는 숫자 데이터 유형이 있는 필드를 찾습니다. `유형` 필드는 유익합니다.

    "type" : "keyword"
    
    "type" : "date"
    
    "type" : "long"

`텍스트` 필드로 정렬해야 하는 경우 유형 `키워드`을 사용하여 인덱스에 새 버전의 필드를 추가합니다. 위에서 언급한 필드 매핑 화면에서 `liferay-[companyID]`라는 인덱스의 `firstName` 필드를 확인합니다.

```
"firstName" : {
    "type" : "text",
    "store" : true
},
"firstName_sortable" : {
    "type" : "keyword",
    "store" : true
},
```

접미사가 `_sortable`이고 올바른 정렬 유형(`키워드`)이 있는 해당 필드가 있습니다. 정렬 가능한 필드는 [포털 속성](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Lucene%20Search)을 통해 도착했습니다.

```properties
index.sortable.text.fields=firstName,jobTitle,lastName,name,screenName,title
```

여기에 나열된 모든 텍스트 필드에는 인덱스에 자동으로 생성된 `fieldName_sortable` 대응 항목이 있습니다. 더 추가하려면 이 속성을 Liferay Home 폴더의 [`Portal-ext.properties`](./../../../installation-and-upgrades/reference/portal-properties.md) 파일에 복사하고 정렬해야 하는 새 필드 이름을 추가한 다음 서버를 다시 시작하십시오.

## 새 정렬 옵션 추가

새 필드 또는 적절한 유형의 기존 필드를 기준으로 정렬하려면 _옵션_ 추가 버튼을 클릭합니다.

```{tip}
위젯 구성에서 텍스트 필드의 `fieldName_sortable` 버전을 사용해야 합니다. 
```

이미 적절한 데이터 유형인 새 정렬 옵션을 추가하려면 옵션의 _필드_ 구성 아래에 있는 더하기 기호를 사용하고 필드를 채우십시오. 구성 화면의 옵션 순서는 검색을 위해 위젯을 구성할 때 선택 목록의 순서와 일치합니다.

## 정렬 옵션 편집 및 삭제

기존 옵션을 편집하려면 구성 섹션에서 텍스트를 편집하십시오.

기존 옵션을 삭제하려면 휴지통 아이콘을 사용하십시오.

## 클래식 구성에서 정렬 순서 제어

클래식 구성에서 정렬 옵션의 순서를 제어하려면 `fieldName`뒤에 더하기 또는 빼기 기호를 추가하십시오. 작동 방식을 이해하려면 _생성됨_ 및 _생성됨(오래된 것부터)_ 으로 레이블이 지정된 기존 정렬 옵션이 어떻게 수행되는지 살펴보십시오.

**레이블:** _생성됨_
**필드:** `createDate-`

필드 이름 뒤에 있는 `-` 기호는 순서가 _내림차순_임을 나타냅니다. 이 방법으로 정렬하면 가장 최근에 생성된 검색 결과가 목록의 맨 위에 표시됩니다.

**라벨:** _생성됨(오래된 것부터)_ 
**필드:** `createDate+`

필드 이름 뒤에 오는 `+` 기호는 순서가 _오름차순_임을 나타냅니다.  이 방법으로 정렬하면 가장 오래된(만든 날짜 기준) 결과가 목록의 맨 위에 표시됩니다.

## 중첩된 필드로 정렬

{bdg-secondary}`사용 가능 7.2 FP12+, 7.3 FP2+, 7.4(모든 업데이트)`

[중첩된 DDM 필드 액세스](../search-facets/custom-facet.md#accessing-nested-ddm-fields)에 설명된 대로 DDM 필드는 Liferay 7.2 SP3+/FP8+(및 모든 Liferay 7.3 버전)에서 [중첩된 필드](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) 가 되었습니다. 7.2 및 7.3의 최신 수정 팩 및 GA 릴리스에서는 이러한 중첩 필드를 설명하기 위해 [Elasticsearch 중첩 쿼리](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-nested-query.html) 이 지원됩니다.

Elasticsearch 문서의 루트에 있는 `ddm__keyword__*` 필드에 의존하는 정렬 구성은 계속 유효합니다. 검색 프레임워크 자체는 중첩 필드 유형을 고려하여 조정되었습니다. 더 이상 문서의 루트에 있지 않더라도 정렬 위젯의 _필드_ 구성에서 평소와 같이 이러한 필드를 사용하십시오.

정렬 위젯은 키워드, 날짜 및 숫자 필드에서 작동합니다. 색인의 기존 문서에서 DDM 키워드 필드를 찾으려면

```json
GET liferay-20097/_search
{
  "query": {
    "nested": {
      "path": "ddmFieldArray",
      "query": {
        "wildcard":  { "ddmFieldArray.ddmFieldName": "ddm__keyword*" }
      }
    }
  }
}
```

인스턴스 값과 일치하도록 인덱스 이름 매개변수에서 Company Id---`20097`---을 바꿉니다.

반환된 문서에는 중첩된 콘텐츠가 있는 `ddmFieldArray` 개체가 있습니다.

```json
 "ddmFieldArray" : [
    {
      "ddmFieldName" : "ddm__keyword__40806__Textb5mx_en_US",
      "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
      "ddmFieldValueKeyword_en_US_String_sortable" : "some text has been entered",
      "ddmFieldValueKeyword_en_US" : "some text has been entered"
    },
    {
      "ddmFieldName" : "ddm__keyword__40806__Selectjdw0_en_US",
      "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
      "ddmFieldValueKeyword_en_US_String_sortable" : "option 3",
      "ddmFieldValueKeyword_en_US" : "value 3"
    },
    {
      "ddmFieldName" : "ddm__keyword__40806__Boolean15cg_en_US",
      "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
      "ddmFieldValueKeyword_en_US" : "true",
      "ddmFieldValueKeyword_en_US_String_sortable" : "true"
    }
  ],
```

정렬 구성에서 이러한 필드 중 하나를 사용하려면 `ddmFieldName` 값(예: `ddm__keyword__40806__Testb5mx_en_US`)을 _필드_ 설정으로 입력하십시오.
