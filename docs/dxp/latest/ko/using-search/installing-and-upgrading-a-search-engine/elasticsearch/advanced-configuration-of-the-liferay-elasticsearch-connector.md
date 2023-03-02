---
uuid: 46d35c26-a3bd-4862-bd28-a72a2caea135
---

# Liferay Elasticsearch 커넥터의 고급 구성

[Elasticsearch 연결](./connecting-to-elasticsearch.md) 구성 파일 [를 사용하거나 시스템 설정](./elasticsearch-connector-configuration-reference.md#configuration-files-and-system-settings-entries)통해 구성됩니다.

Elasticsearch 커넥터에는 즉시 사용할 수 있는 많은 구성 옵션이 있습니다. 대부분의 Elasticsearch 설정은 유사하거나 동일한 이름의 Liferay 설정(예: `httpSSLEnabled`)으로 구성할 수 있습니다. 특별한 구성이 필요한 경우 [고급 설정](./../elasticsearch/elasticsearch-connector-configuration-reference.md)사용하여 필요한 구성 옵션을 추가하십시오. 이러한 특수 구성의 대부분은 설정 및 매핑을 추가하거나 재정의합니다.

* [인덱스 구성 추가](#adding-index-configurations)
* [유형 매핑 추가](#adding-type-mappings)
* [유형 매핑 재정의](#overriding-type-mappings)
* [개발 모드 Elasticsearch에 구성 추가](#adding-configurations-to-the-development-mode-elasticsearch)

Elasticsearch에 대해 구성 가능한 항목이 있으면 Elasticsearch 커넥터를 사용하여 구성할 수 있습니다.

## Liferay Elasticsearch 커넥터에 설정 및 매핑 추가

사용 가능한 구성 옵션을 쉽게 구성할 수 있는 가장 일반적인 구성과 YAML 또는 JSON을 입력해야 하는 더 복잡한 구성의 두 그룹으로 나눈다고 생각하십시오.

![시스템 설정에서 현재 사용 가능한 구성에 Elasticsearch 구성을 추가할 수 있습니다.](./advanced-configuration-of-the-liferay-elasticsearch-connector/images/01.png)

### 인덱스 구성 추가

{bdg-link-warning}`재색인 필요`

`additionalIndexConfigurations` 구성은 생성 시 각 [회사 색인](../../search-administration-and-tuning/elasticsearch-indexes-reference.md) (즉, 각 Liferay 가상 인스턴스의 색인)에 적용되는 추가 설정(JSON 또는 YAML)을 정의합니다. 예를 들어 이 설정을 사용하여 사용자 지정 분석기 및 필터를 만들 수 있습니다. 사용 가능한 설정의 전체 목록은 [Elasticsearch 참조](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/index-modules.html)을 참조하십시오.

다음은 필드 또는 동적 템플릿에 적용할 수 있는 [분석](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/index-modules-analysis.html) 구성하는 방법을 보여주는 예입니다(동적 템플릿에 대한 예제 응용 프로그램은 [아래](#overriding-type-mappings) 참조).

```json
{  
    "analysis": {
        "analyzer": {
            "kuromoji_liferay_custom": {
                "filter": [
                    "cjk_width",
                    "kuromoji_baseform",
                    "pos_filter"
                ],
                "tokenizer": "kuromoji_tokenizer"
            }
        },
        "filter": {
            "pos_filter": {
                "type": "kuromoji_part_of_speech"
            }
        }
    }
}
```

### 유형 매핑 추가

{bdg-link-warning}`재색인 필요`

`additionalTypeMappings` 각 [회사 및 시스템 인덱스](../../search-administration-and-tuning/elasticsearch-indexes-reference.md) (즉, 각 Liferay 가상 인스턴스의 인덱스)에 데이터를 인덱싱하기 위한 추가 매핑을 정의합니다. 인덱스가 생성될 때 적용됩니다. JSON 구문을 사용하여 매핑을 추가합니다. 자세한 내용은 [여기](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/mapping.html) , [여기](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/indices-put-mapping.html)참조하십시오. 새 필드(속성`개`) 매핑 및 새 동적 템플릿에 대해 `additionalTypeMappings` 을 사용하되 기존 매핑을 재정의하지 마십시오. 여기에 설정된 매핑이 기존 매핑과 겹치는 경우 인덱스 생성이 실패합니다. `overrideTypeMappings` 사용하여 기본 매핑을 바꿉니다.

동적 템플릿과 마찬가지로 Liferay의 유형 매핑에 하위 필드 매핑을 추가할 수 있습니다. 이를 Elasticsearch에서는 [속성](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/properties.html) 이라고 합니다.

속성을 추가하려면 다음 JSON 구문을 사용합니다.

```json
{ 
    "LiferayDocumentType": {  
        "properties": {   
            "fooName": {
                "index": "true",
                "store": "true",
                "type": "keyword"
            }
        }   
    }
}
```

추가 매핑이 Liferay 매핑에 추가되었는지 확인하려면 추가 사항을 저장하고 다시 인덱싱한 후 `curl` 사용하여 이 URL에 액세스하십시오.

```bash
curl http://[HOST]:[ES_PORT]/liferay-[COMPANY_ID]/_mapping?pretty
```

다음은 Liferay 회사 ID가 `20116`인 `localhost:9200`에서 실행되는 Elasticsearch 인스턴스의 모습입니다.

```bash
curl http://localhost:9200/liferay-20116/_mapping?pretty
```

위의 URL에서 `liferay-20116` 은 인덱스 이름입니다. 이를 포함하면 해당 이름으로 인덱스를 만드는 데 사용된 매핑을 보고 싶다는 의미입니다.

Elasticsearch의 필드 데이터 유형에 대한 자세한 내용은 [here](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/mapping-types.html) 참조하십시오.

위의 예는 `fooName` 필드가 Liferay의 유형 매핑에 추가되는 방법을 보여줍니다. `fooName` 매핑의 기존 속성이 아니므로 제대로 작동합니다. 기존 속성 매핑을 재정의하려고 하면 인덱스 생성이 실패합니다. 대신 `overrideTypeMappings` 설정을 사용하여 매핑에서 `속성` 재정의합니다.

### 유형 매핑 재정의

{bdg-link-warning}`재색인 필요`

`overrideTypeMappings` 사용하여 Liferay의 기본 유형 매핑을 재정의하고 데이터가 [회사 및 시스템 색인](../../search-administration-and-tuning/elasticsearch-indexes-reference.md)으로 색인화되는 방식을 제어합니다. 꼭 필요한 경우에만 사용해야 하는 고급 기능입니다. 이 값을 설정하면 Liferay 소스 코드에서 Liferay 문서 유형을 정의하는 데 사용되는 기본 매핑(예: `liferay-type-mappings.json`)이 완전히 무시되므로 이 속성에 전체 매핑 정의를 포함하십시오. 수정 중인 세그먼트.

수정하려면 URL로 이동하여 인덱스를 만드는 데 사용되는 현재 매핑의 전체 목록을 찾으십시오.

```
http://[HOST]:[ES_PORT]/liferay-[COMPANY_ID]/_mapping?pretty
```

이 속성의 값으로 내용을 복사합니다(시스템 설정 또는 OSGi 구성 파일에). 여는 중괄호 `{`은 그대로 두고 2행과 3행은 완전히 삭제합니다(인덱스 이름이 있는 행과 `매핑이 있는 행`).

```json
"liferay-[COMPANY_ID]": {
    "mappings" : {
```

그런 다음 매핑의 끝에서 닫는 두 개의 중괄호를 삭제합니다.

```json
    }
}
```

이제 원하는 매핑을 수정하십시오. 변경 사항을 저장하고 [Server Administration](../../../system-administration/using-the-server-administration-panel.md)에서 재색인을 트리거하면 변경 사항이 적용됩니다.

다음은 `_ja`로 끝나는 모든 문자열 필드를 분석하기 위해 `additionalIndexConfigurations` 의 분석 구성을 사용하는 [동적 템플릿](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/dynamic-templates.html) 보여주는 부분적인 예입니다. 이를 다른 모든 기본 매핑에 포함하고 제공된 `template_ja` 을 다음 사용자 지정 매핑으로 바꿉니다.

```json
{
    "LiferayDocumentType": {
        "dynamic_templates": [
            {
                "template_ja": {
                    "mapping": {
                        "analyzer": "kuromoji_liferay_custom",
                        "index": "analyzed",
                        "store": "true",
                        "term_vector": "with_positions_offsets",
                        "type": "string"
                    },
                    "match": "\\w+_ja\\b|\\w+_ja_[A-Z]{2}\\b",
                    "match_mapping_type": "string",
                    "match_pattern": "regex"
                }
                ...
            }
        ]
    }
}
```

### 개발 모드 Elasticsearch에 구성 추가

추가 구성(`additionalConfigurations`) 필드를 사용하여 임베디드 또는 사이드카 Elasticsearch 인스턴스에 대한 추가 설정(YAML)을 정의합니다. 이는 테스트 환경에서만 유용합니다. 일반적으로 `elasticsearch.yml` 에 설정된 모든 노드 설정을 여기에서 선언할 수 있습니다. 가능한 모든 노드 설정에 대한 설명은 [Elasticsearch 설명서](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/index.html)  참조하십시오.

## 다중 라인 YAML 구성

OSGi 구성 파일을 사용하여 마지막 섹션의 설정을 구성하는 경우 여러 줄에 걸쳐 있는 YAML 스니펫을 작성해야 할 수 있습니다. 이에 대한 구문은 간단하며 다음과 같이 각 행에 `\n\`을 추가하면 됩니다.

```yaml
additionalConfigurations=\
                    cluster.routing.allocation.disk.threshold_enabled: false\n\
                    cluster.service.slow_task_logging_threshold: 600s\n\
                    index.indexing.slowlog.threshold.index.warn: 600s\n\
                    index.search.slowlog.threshold.fetch.warn: 600s\n\
                    index.search.slowlog.threshold.query.warn: 600s\n\
                    monitor.jvm.gc.old.warn: 600s\n\
                    monitor.jvm.gc.young.warn: 600s
```

간단한 구성에서 기존 유형 매핑 재정의에 이르기까지 Elasticsearch 및 Liferay의 Elasticsearch 커넥터를 구성할 수 있습니다.
