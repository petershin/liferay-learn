
# 커스텀 페이셋

사용자 정의 패싯은 기본 검색 패싯 중에서 고유합니다. 단일 정적 필드(예: 수정된 날짜 또는 자산 유형)로 결과를 그룹화하는 대신 사용자 정의 패싯을 사용하여 결과를 그룹화할 필드를 선택합니다. 훨씬 더 많은 사용자 정의를 통해 완전히 새로운 패싯을 생성할 수 있습니다.

## 사용자 정의 패싯 구성

1. 페이지 상단의 **_** 추가 아이콘(![Add icon](../../../images/icon-add-app.png))을 클릭합니다.

1. 사용자 지정 패싯을 찾아 왼쪽의 패싯 컬렉션으로 드래그합니다. 사용자 정의 패싯은 위젯의 검색 섹션 아래에 있습니다.

   ![검색 위젯에서 사용자 정의 패싯을 찾으십시오.](custom-facet/images/01.png)

1. 패싯의 **옵션** 아이콘(![Options icon](../../../images/icon-app-options.png))을 클릭하고 **구성** 클릭합니다.

   ![구성 옵션을 클릭합니다.](custom-facet/images/02.png)

   사용자 정의 패싯에는 아래에 설명된 몇 가지 구성 옵션이 있습니다.

1. 옵션 설정이 끝나면 **저장** 버튼을 클릭합니다.

**디스플레이 설정:** **Default** , **Compact Layout** , **Label Layout** 중에서 선택합니다. 기본 레이아웃은 각 용어 옆에 체크박스를 표시하지만 압축 레이아웃은 그렇지 않습니다. 레이블 레이아웃은 각 용어에 대해 클릭할 수 있는 작은 레이블을 표시합니다.

고급 구성에는 다음과 같은 추가 옵션이 있습니다.

**집계 필드:** 결과를 집계할 인덱싱된 필드의 이름을 입력합니다. 분석되지 않은 키워드 필드여야 합니다. 자세한 내용은 아래를 참조하십시오.

**사용자 지정 머리글:** 이 패싯에 대해 표시할 머리글을 입력합니다. 설정하지 않으면 집계된 필드 이름이 표시됩니다.

**사용자 정의 매개변수 이름:** 선택한 값에 대한 URL 매개변수 이름을 지정합니다. 설정하지 않으면 집계된 필드 이름이 사용됩니다.

**최대 용어:** 패싯에 대해 발견된 일치 용어 수에 관계없이 표시할 패싯 용어의 최대 수를 설정합니다.

**빈도 임계값:** 패싯 용어 목록에 나타나는 용어에 필요한 최소 빈도를 설정합니다. 예를 들어 패싯의 빈도 임계값이 3으로 설정된 경우 두 개의 일치 결과가 있는 용어는 용어 결과 목록에 표시되지 않습니다.

**용어 주문 기준:** Liferay 7.4 U60+/GA60+의 경우 용어 빈도 내림차순(기본값) 또는 용어 빈도 오름차순과 같은 패싯 용어 정렬 전략을 선택할 수 있습니다. 기본 정렬 순서는 패싯 용어가 가장 많이 일치하는 것부터 가장 적게 일치하는 것까지입니다.

**빈도 표시:** 용어 빈도를 표시할지 여부를 선택합니다.

**통합 검색 키:** 이 위젯이 참여하는 대체 검색의 키를 입력합니다. 설정하지 않으면 이 위젯이 기본 검색에 참여합니다. 이 값은 일반적으로 애플리케이션 정의 색인의 이름입니다.


## 인덱싱된 필드 찾기

사용자 정의 패싯을 사용하려면 구성에서 사용할 분석되지 않은 키워드 필드를 알아야 합니다.

```{tip}
Elasticsearch는 다양한 방식으로 인덱싱 필드를 지원합니다. 일부 텍스트 필드는 매핑에서 중첩된 'raw' [multi-fields](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/multi-fields.html) 인 경우 키워드 필드로 사용할 수 있습니다. , 또는 필드가 'fieldName_sortable'('keyword'로)로 매핑되는 별도의 추가 필드에 매핑되는 경우. Elasticsearch 다중 필드 개념을 활용하므로 사용자 정의 필드에 대한 패싯 생성에 대한 아래 예를 참조하십시오.
```

사용 가능한 필드의 전체 목록을 찾아보려면 **제어판** &rarr; **구성** &rarr; **검색**(**필드 매핑** 탭 클릭)에서 필드 매핑을 검사하십시오. 여기에서 수많은 인덱스를 볼 수 있습니다. 관심이 있을 가능성이 있는 Liferay 자산은 `liferay-20101` 과 유사한 이름의 [회사 인덱스](../../search-administration-and-tuning/elasticsearch-indexes-reference.md)에 인덱싱됩니다(`20101` 는 회사 ID임).

또는 검색 엔진의 API를 사용하여 매핑을 찾아보십시오. Elasticsearch에서는 cURL을 사용하여 터미널에서 필드 매핑에 액세스하여 [Get Mapping API](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/indices-get-mapping.html) 호출할 수 있습니다.

```{tip}
[Kibana's](../../liferay-enterprise-search/monitoring-elasticsearch.md) Dev Tools 콘솔은 cURL보다 Elasticsearch API 호출을 만드는 데 더 편리합니다.
```

 ```bash
curl -X GET "localhost:9200/_mapping/LiferayDocumentType"?pretty
 ```

Solr는 [ListFields API](https://lucene.apache.org/solr/guide/6_6/schema-api.html#SchemaAPI-ListFields) 을 사용합니다.

```bash
curl http://localhost:8983/solr/liferay/schema/
```

다음은 Elasticsearch 예제의 출력 스니펫입니다.

```json
"ddmStructureKey": {
  "store": true,
  "type": "keyword"
},
"ddmTemplateKey": {
  "store": true,
  "type": "keyword"
},
"defaultLanguageId": {
  "store": true,
  "type": "keyword"
},
"description": {
  "store": true,
  "term_vector": "with_positions_offsets",
  "type": "text"
},
"discussion": {
  "store": true,
  "type": "keyword"
},
```

## 사용자 정의 필드에 액세스

**키워드** 으로 검색 가능 설정을 사용하여 [사용자 정의 필드](./../../../system-administration/configuring-liferay/adding-custom-fields.md) 을 생성하면 사용자 정의 필드는 지원 자산(예: 블로그 항목)으로 인덱싱됩니다. 색인을 다시 생성하면 기존 항목에도 적용됩니다. 필드 자체는 `expando__keyword__custom_fields__Enabled` (사용자 정의 필드 UI에서 필드 이름을 **Enabled** 지정하는 경우)과 같은 이름의 텍스트 필드이지만 별도의 `raw` 키워드 필드를 생성하기 위한 중첩 필드 매핑을 포함합니다.

Custom Facet에서 raw 필드를 사용하려면 **Aggregation Field** 의 Custom Field 이름에 `.raw` 추가합니다.

`expando__keyword__custom_fields__Enabled.raw`

텍스트 필드의 매핑을 검사하기 위해 Kibana에서 실행할 수 있는 쿼리는 다음과 같습니다(색인 이름 매개변수에서 Company Id---`20097`--- 교체).

```bash 
GET /liferay-20097/_mapping/field/expando__keyword__custom_fields__Enabled
```

JSON이 반환됩니다.

```json
{
  "liferay-20097" : {
    "mappings" : {
      "expando__keyword__custom_fields__Enabled" : {
        "full_name" : "expando__keyword__custom_fields__Enabled",
        "mapping" : {
          "expando__keyword__custom_fields__Enabled" : {
            "type" : "text",
            "store" : true,
            "fields" : {
              "raw" : {
                "type" : "keyword"
              }
            },
            "analyzer" : "keyword_lowercase"
          }
        }
      }
    }
  }
}
```

모든 원시 필드를 보려면 인덱스에서 `*.raw` 필드를 쿼리합니다.

```bash 
GET /liferay-20097/_mapping/field/*.raw
```

사용자 정의 필드를 검색 가능으로 설정하면 엔터티가 수정되거나 재인덱싱이 트리거될 때 필드 값이 인덱싱됩니다. `java.lang.String` 필드만 검색 가능하도록 만들 수 있습니다.

## 중첩된 DDM 필드에 액세스

[7.3 Breaking Changes 문서](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) 에 설명된 대로 Liferay 동적 데이터 매핑 프레임워크가 일부 필드를 인덱싱하는 방식이 변경되었습니다. 이전에는 검색 엔진 문서의 루트에 있었습니다. 이제 중첩된 필드입니다. 이 변경 사항은 Liferay 7.3 및 Liferay 7.2 SP3/FP8+에 영향을 미칩니다(단, 시스템 설정 &rarr; Dynamic Data Mapping Indexer에서 **Enable Legacy Dynamic Data Mapping Index Fields** 설정이 비활성화된 경우에만 해당). 7.3의 최신 수정 팩 및 GA 릴리스에서 이 변경 사항은 Liferay의 검색 API에서 설명되며 구성 업데이트가 필요하지 않습니다. 따라서 Elasticsearch 문서의 루트에 있는 `ddm__text__*` 또는 `ddm__keyword__*` 필드에 의존하는 Custom Facet 위젯이 있는 경우 Custom Facet의 **Aggregation Field** 구성에서 평소와 같이 이러한 필드를 계속 사용하십시오. 더 이상 문서의 루트에 있지 않지만.

색인의 기존 문서에서 DDM 필드를 찾으려면

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

사용자 정의 패싯에서 이러한 필드 중 하나를 사용하려면 사용자 정의 패싯 구성의 **집계 필드** 에 `ddmFieldName` 값(예: `ddm__keyword__40806__Testb5mx_en_US`)을 입력하십시오.
