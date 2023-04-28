# 시맨틱 검색을 위한 검색 청사진 만들기

{bdg-secondary}`7.4 U70+`
{bdg-link-primary}`[베타 기능](../../../../system-administration/configuring-liferay/feature-flags.md)`

모델이 선택되고 텍스트 임베딩이 인덱싱되면 검색 시 임베딩을 처리하도록 Liferay를 구성해야 합니다. 개념적으로 두 가지 선택이 있습니다.

1. Liferay의 기본 검색 요청을 완전히 재정의하는 청사진을 만들고, 텍스트 포함만 사용하여 순수한 시맨틱 검색 쿼리를 실행하기 위해 처음부터 하나를 구축합니다.
1. 즉시 사용 가능한 Rescore by Text Embedding 요소를 사용하여 표준 키워드 기반 쿼리를 실행하는 청사진을 생성한 다음 인덱싱된 `dense_vector` 필드의 텍스트 임베딩과 검색 구문의 임베딩.

구성한 임베딩 공급자가 생성한 텍스트 임베딩을 활용하여 시맨틱 검색 환경을 구축하기 위해 Liferay에는 텍스트 임베딩 값을 사용하여 원래 쿼리의 결과를 다시 채점하는 Rescore by Text Embedding이라는 즉시 사용 가능한 요소가 포함되어 있습니다. 요소를 사용하여 [검색 청사진](../search-blueprints/creating-and-managing-search-blueprints.md)을 구축합니다. 이 요소와 Blueprints의 시각적 쿼리 빌더를 사용하여 검색 쿼리를 구성하고 테스트하여 올바른 시맨틱 검색 솔루션을 구축할 수 있습니다.

```{important}
Rescore by Text Embedding 요소는 임베딩 공급자와 함께 작동하도록 구성된 경우 일부 데이터 세트에 대해 보다 대상이 지정된 검색 결과를 생성할 수 있습니다. 그러나 많은 시맨틱 검색 솔루션은 강력한 검색 솔루션을 달성하기 위해 수동 조정과 새로운 요소가 필요합니다.
```

![Rescore by Text Embedding 요소는 Liferay에 기본 시맨틱 검색을 제공합니다.](./creating-a-search-blueprint-for-semantic-search/images/01.png)

이 요소는 포함 공급자가 활성화되고 특정 콘텐츠 유형 및 언어에서 작동하도록 구성된 경우에만 유효합니다. [텍스트 임베딩 공급자 설정](./setting-up-a-text-embedding-provider.md)참조하십시오.

## Rescore by Text Embedding 요소 추가

[시맨틱 검색이 활성화된 상태에서](../semantic-search.md#enabling-semantic-search)처음으로 Liferay를 시작하면 [검색 청사진 UI](../search-blueprints/creating-and-managing-elements.md)에서 Rescore by Text Embedding 요소를 사용할 수 있습니다. 인스턴스에 요소가 표시되지 않으면 수동으로 추가할 수 있습니다.

1. Liferay에서 *전역 메뉴* (![Global Menu](../../../../images/icon-applications-menu.png))을 연 다음 *응용 프로그램* &rarr; *청사진*클릭합니다.

1. *요소*클릭한 다음 *추가* (![Add](../../../../images/icon-add.png))을 클릭합니다.

1. 제목 *Rescore by Text Embedding* 을 입력하고 *만들기*클릭합니다.

1. 아래 섹션에서 요소의 JSON을 복사합니다. [참조: Rescore by Text Embedding 요소](#reference-rescore-by-text-embedding-element)

1. 기본 JSON을 아래에서 복사한 JSON으로 덮어씁니다.

![필요한 경우 Rescore by Text Embedding 요소를 추가합니다.](./creating-a-search-blueprint-for-semantic-search/images/02.png)

## 텍스트 임베딩 요소로 재점수 구성

Rescore by Text Embedding 요소에는 몇 가지 구성 가능한 옵션이 제공됩니다.

**부스트:** 기본값이 10인 이 설정은 점수를 다시 매긴 결과를 부스트하는 양을 결정합니다.

**벡터 필드 기능:** 코사인 유사성 또는 내적 기능 중에서 선택합니다. 코사인 유사성 기능을 사용하도록 기본 설정되어 있는 선택된 기능은 검색된 키워드와 대상 문서 텍스트 임베딩 간의 유사성을 측정합니다. 어떤 기능이 가장 적합한지 결정하려면 모델의 문서를 확인하십시오.

**최소 점수:** 기본값이 1인 이 설정의 정수(또는 0)는 반환된 문서가 점수 재지정 쿼리에 포함되어야 하는 최소 점수를 설정합니다.

**쿼리 가중치:** 기본값이 0.01인 이 설정은 최종 점수 계산에서 원래 쿼리의 가중치를 제어합니다.

**재채점 쿼리 가중치:** 기본값은 10이며 최종 점수 계산에서 재채점 쿼리의 가중치를 설정합니다.

**점수 모드:** 평균으로 기본 설정되어 있는 이 설정은 원래 쿼리 점수를 재점수 결과와 결합할 때 사용할 전략을 나타냅니다. 평균, 최대, 최소, 곱하기 또는 합계 중에서 선택합니다.

**Rescorer 창 크기:** 기본값은 50이며 한 번에 다시 채점할 결과 수를 선택할 수 있습니다. 매우 높은 창 크기를 선택하면 성능에 부정적인 영향을 미칠 수 있습니다.

## 참조: 텍스트 임베딩 요소별 재점수

편의를 위해 Rescore by Text Embedding 요소에 대해 이 JSON을 복사할 수 있습니다.

```json
{
    "description_i18n": {
        "en_US": "rescore-by-text-embedding-description"
    },
    "elementDefinition": {
        "category": "semantic search",
        "configuration": {
            "queryConfiguration": {
                "queryEntries": [
                    {
                        "condition": {
                            "exists": {
                                "parameterName": "keywords"
                            }
                        },
                        "rescores": [
                            {
                                "query": {
                                    "script_score": {
                                        "boost": "${configuration.boost}",
                                        "min_score": "${configuration.min_score}",
                                        "query": {
                                            "bool": {
                                                "filter": [
                                                    {
                                                        "exists": {
                                                            "field": "text_embedding_${ml.text_embeddings.vector_dimensions}_${context.language_id}"
                                                        }
                                                    }
                                                ],
                                                "must": [
                                                    {
                                                        "match_all": {
                                                        }
                                                    }
                                                ]
                                            }
                                        },
                                        "script": {
                                            "params": {
                                                "query_vector": "${ml.text_embeddings.keywords_embedding}"
                                            },
                                            "source": "${configuration.vector_field_function}(params.query_vector, 'text_embedding_${ml.text_embeddings.vector_dimensions}_${context.language_id}') + 1"
                                        }
                                    }
                                },
                                "queryWeight": "${configuration.query_weight}",
                                "rescoreQueryWeight": "${configuration.rescore_query_weight}",
                                "scoreMode": "${configuration.score_mode}",
                                "windowSize": "${configuration.window_size}"
                            }
                        ]
                    }
                ]
            }
        },
        "icon": "custom-field",
        "uiConfiguration": {
            "fieldSets": [
                {
                    "fields": [
                        {
                            "defaultValue": 10,
                            "label": "boost",
                            "name": "boost",
                            "type": "number",
                            "typeOptions": {
                                "min": 0
                            }
                        },
                        {
                            "defaultValue": "cosineSimilarity",
                            "helpText": "vector-field-function-field-help",
                            "label": "vector-field-function",
                            "name": "vector_field_function",
                            "type": "select",
                            "typeOptions": {
                                "nullable": false,
                                "options": [
                                    {
                                        "label": "Cosine Similarity",
                                        "value": "cosineSimilarity"
                                    },
                                    {
                                        "label": "Dot Product",
                                        "value": "dotProduct"
                                    }
                                ]
                            }
                        },
                        {
                            "defaultValue": 1,
                            "helpText": "min-score-field-help",
                            "label": "min-score",
                            "name": "min_score",
                            "type": "number",
                            "typeOptions": {
                                "min": 0
                            }
                        },
                        {
                            "defaultValue": 0.01,
                            "helpText": "query-weight-field-help",
                            "label": "query-weight",
                            "name": "query_weight",
                            "type": "slider",
                            "typeOptions": {
                                "min": 0.01,
                                "step": 0.1
                            }
                        },
                        {
                            "defaultValue": 10,
                            "helpText": "rescore-query-weight-field-help",
                            "label": "rescore-query-weight",
                            "name": "rescore_query_weight",
                            "type": "slider",
                            "typeOptions": {
                                "min": 0.01,
                                "step": 0.1
                            }
                        },
                        {
                            "defaultValue": "avg",
                            "helpText": "score-mode-field-help",
                            "label": "score-mode",
                            "name": "score_mode",
                            "type": "select",
                            "typeOptions": {
                                "nullable": false,
                                "options": [
                                    {
                                        "label": "Average",
                                        "value": "avg"
                                    },
                                    {
                                        "label": "Max",
                                        "value": "max"
                                    },
                                    {
                                        "label": "Min",
                                        "value": "min"
                                    },
                                    {
                                        "label": "Multiply",
                                        "value": "multiply"
                                    },
                                    {
                                        "label": "Total",
                                        "value": "total"
                                    }
                                ]
                            }
                        },
                        {
                            "defaultValue": 50,
                            "helpText": "rescore-window-size-field-help",
                            "label": "rescore-window-size",
                            "name": "window_size",
                            "type": "number",
                            "typeOptions": {
                                "min": 1
                            }
                        }
                    ]
                }
            ]
        }
    },
    "externalReferenceCode": "RESCORE_BY_TEXT_EMBEDDING",
    "title_i18n": {
        "en_US": "rescore-by-text-embedding"
    },
    "type": 0
}
```
