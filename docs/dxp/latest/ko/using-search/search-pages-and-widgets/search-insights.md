# 검색 인사이트

> **이 기능은 테스트 및 개발 전용입니다.** \
  **Elasticsearch에서만 작동합니다.**

검색 인사이트 위젯은 검색 페이지에 추가될 때 다음 두 가지를 검사하기 위한 것입니다.

- 사용자가 키워드를 입력할 때 백엔드 검색 코드에 의해 구성되는 쿼리 문자열

- 검색 엔진에서 반환된 응답 문자열

```{note}
요청 문자열로 반환된 JSON은 명확성을 위해 여러 Elasticsearch 쿼리 기본값에서 제거되었습니다. Elasticsearch가 처리한 전체 요청 JSON을 보려면 [Elasticsearch 서버의 로깅](https://www.elastic.co/guide/en/elasticsearch/reference/6.x/logging.html)을 조정하세요.
```

_점수 설명 활성화_ 옵션(기본적으로 활성화됨)을 사용하면 통찰력 위젯이 반환된 각 결과에 대한 관련성 점수 설명도 인쇄합니다.

Elasticsearch는 검색 쿼리를 처리할 때 결과를 반환합니다. _관련성_ 의 개념은 결과가 쿼리와 얼마나 잘 일치하는지를 결정합니다. 반환된 검색 문서에 대한 점수 설명은 이상해 보이는 결과를 명확히 하는 데 도움이 되며 관련성 _프로세스를 조정하여 관련성 점수 프로세스를 조정하여 특정 필드의 일치 항목을 더 많이 계산하도록_.

## 검색 쿼리 문자열 검사

작동 중인 검색 인사이트 위젯을 보려면 테스트 서버에서 검색 페이지로 이동하여 추가 메뉴(![Add](../../images/icon-add-widget.png))에서 추가하십시오.

![검색 인사이트 위젯은 테스트 및 개발 중에 유용합니다.](./search-insights/images/01.png)

검색 결과를 반환하는 키워드를 검색하면 검색 인사이트 위젯에 반환된 쿼리 문자열이 그대로 표시됩니다.

![전체 쿼리 문자열은 약한 사람을 위한 것이 아닙니다. 이 예제는 독자를 보호하기 위해 잘렸습니다.](./search-insights/images/02.png)

Liferay 7.4에서 Search Insights 인터페이스의 일부 개선 사항이 도입되었습니다. 위젯에서 형식이 지정된 JSON 요청 및 응답을 검색하고 버튼을 클릭하여 둘 중 하나를 복사할 수 있습니다.

## 검색 결과 설명

설명 옵션을 활성화하거나 비활성화하려면

1. 검색 인사이트 위젯의 구성 화면을 엽니다.

1. 기본적으로 활성화되는 부울 필드는 점수 설명 활성화입니다. 각 결과의 관련성 점수에 대한 설명을 비활성화하려면 선택을 취소하십시오.

내부적으로 검색 인사이트 위젯의 Explain 옵션은 Elasticsearch API를 노출합니다: [Explain](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/search-explain.html). 자세한 내용은 Elasticsearch 설명서를 참조하십시오.

다음은 검색어가 _test_때 테스트 테스트 사용자의 검색 문서에 대한 응답 채점 설명의 축약된 부분입니다.

```json
_explanation":{  
   "value":9.461341,
   "description":"sum of:",
   "details":[  
      {  
         "value":9.461341,
         "description":"sum of:",
         "details":[  
            {  
               "value":1.0,
               "description":"emailAddress:*test*",
               "details":[  

               ]
            },
            {  
               "value":5.0,
               "description":"userName:*test*^5.0",
               "details":[  

               ]
            },
            {  
               "value":0.72928625,
               "description":"sum of:",
               "details":[  
                  ... 

            { 
               "value":1.0027686,
               "description":"sum of:",
               "details":[  
                  ...
                  {  
            {  
               "value":0.72928625,
               "description":"sum of:",
               "details":[  
                  ...
            {  
               "value":1.0,
               "description":"screenName:*test*",
               "details":[  

               ]
            }
         ]
      },
      ...
   ]
}}]}
```

이제 전체 쿼리 문자열, 응답 문자열 및 반환된 각 검색 문서의 점수를 확인할 수 있습니다.
