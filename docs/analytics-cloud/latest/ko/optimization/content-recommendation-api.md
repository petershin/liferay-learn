# 콘텐츠 추천 API

Liferay Analytics Cloud의 Content Recommendation API는 Liferay DXP 인스턴스의 콘텐츠와의 사용자 상호 작용을 기반으로 콘텐츠를 제안합니다. 이는 Liferay DXP가 Analytics Cloud에 연결되면 사용자가 페이지를 방문할 때마다 상호 작용 이벤트를 전송하기 때문에 가능합니다. 이러한 각 이벤트에는 사용자가 소비하는 콘텐츠에 대한 정보가 포함되어 있습니다. Analytics Cloud는 이 정보를 수집하고 처리합니다.

Content Recommendation API에는 다음을 지원하는 서비스가 포함되어 있습니다.

* 사용자가 탐색 중인 현재 태그를 기반으로 유사한 태그(콘텐츠)를 검색합니다.
* 시간 경과에 따른 사용자의 관심을 기반으로 태그를 검색합니다.

## 유사한 태그 발견

이 서비스는 매개변수로 전달된 것과 유사한 태그(용어) 목록을 반환합니다. 유사 용어 목록을 가중치로 정렬하여 JSON으로 반환합니다.

이 API의 끝점은 다음과 같습니다.

**가져오기:** `{url}/api/1.0/interests/terms/related{?page,size,terms}`

매개변수는 다음과 같습니다.

`int page (defaultValue = 0)`: 결과 페이지. 예를 들어 기본값 0은 결과의 첫 번째 페이지를 지정합니다.

`int size (defaultValue = 5)`: 각 페이지에 포함할 결과 수. 기본값 `5` 은 각 페이지에 5개의 결과를 지정합니다.

`목록<String> 용어`: 유사한 태그 목록을 결정하기 위해 사용하는 태그. 이것은 유일한 필수 매개변수입니다.

`double termWeightThreshold (defaultValue = 0.01)`: 관련 용어를 결정하기 위한 관련성 수준(가중치). 기본값 `0.01` 은 가중치가 1%를 초과하는 모든 태그를 반환합니다.

`페이지` 및 `크기` 매개변수는 함께 응답에 포함할 유사한 용어의 수를 제어합니다. 이 API는 최대 100개의 용어를 반환할 수 있습니다. 용어 수가 해당 제한을 초과하면 API가 오류를 반환합니다.

예를 들어 다음은 관련 용어가 포함된 JSON 응답입니다.

```json
{
  "_embedded": {
    "interest-terms": [
      "jquery",
      "html",
      "sql",
      "mysql",
      "java"
    ]
  },
  "page": {
    "number": 0,
    "size": 5,
    "totalPages": 7,
    "totalElements": 35
  }
}
```

## 관심사 기반 태그 발견

이 서비스는 특정 사용자와 관련된 태그(용어) 목록을 반환합니다. 해당 사용자의 ID를 매개변수로 전달해야 합니다. 유사 용어 목록을 가중치로 정렬하여 JSON으로 반환합니다.

이 API의 끝점은 다음과 같습니다.

**가져오기:** `{url}/api/1.0/interests/terms/{userId}`

또한 사용할 수 있는 세 가지 선택적 매개변수가 있습니다. 이러한 매개변수를 사용하여 API가 반환하는 용어를 미세 조정할 수 있습니다. 주제는 용어 그룹입니다.

`int termsPerTopic (defaultValue = 3)`: 주제/주제당 고려할 용어 수.

`double termWeightThreshold (defaultValue = 0.01)`: 관심 용어 결정을 위한 관련성 수준입니다. 기본값 `0.01` 은 가중치가 1%를 초과하는 모든 용어를 반환합니다.

`inttopicLength (defaultValue = 3)`: 고려할 주제의 수.

`termPerTopic` 을 줄이고</code> `늘리면 주제 변형이 증가할 수 있습니다(다른 주제의 용어가 사용자에게 권장됨).</p>

<p spaces-before="0">다음은 사용자 ID만 포함하는 예제 요청입니다.</p>

```
{url}/api/1.0/interests/terms/953be104-5540-abf8-59b8-55f895200acc
```

다음은 JSON 형식의 응답 예시입니다.

```json
{
  "_embedded": {
    "interest-topics": [
      {
        "terms": [
          {
            "weight": 0.0945945945945946,
            "keyword": "javascript"
          },
          {
            "weight": 0.08648648648648649,
            "keyword": "jquery"
          },
          {
            "weight": 0.07027027027027027,
            "keyword": "html"
          }
        ],
        "weight": 0.08653350323695352,
        "id": 7
      },
      {
        "terms": [
          {
            "weight": 0.1322314049586777,
            "keyword": "php"
          },
          {
            "weight": 0.06060606060606061,
            "keyword": "sql"
          },
          {
            "weight": 0.05509641873278237,
            "keyword": "mysql"
          }
        ],
        "weight": 0.08027610626914822,
        "id": 1
      },
      {
        "terms": [
          {
            "weight": 0.15204678362573099,
            "keyword": "java"
          },
          {
            "weight": 0.10526315789473684,
            "keyword": "android"
          },
          {
            "weight": 0.023391812865497075,
            "keyword": "multithreading"
          }
        ],
        "weight": 0.07511374008317741,
        "id": 9
      }
    ]
  }
}
```
