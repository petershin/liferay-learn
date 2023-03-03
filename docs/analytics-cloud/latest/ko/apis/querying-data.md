# 데이터 쿼리

Liferay Analytics Cloud의 루트 엔드포인트는 <https://analytics.liferay.com/api/reports>입니다. 위 URL에 GET을 요청하여 모든 데이터 유형 엔드포인트 목록을 가져올 수 있습니다. 컬로 시도

```
curl -L -H "Authorization: Bearer {token}" https://analytics.liferay.com/api/reports
```

다음 응답이 반환되어야 합니다.

```json
{
   "_links":{
      "accounts":{
         "href": "https://analytics.liferay.com/api/reports/accounts"
      },
      "individuals":{
         "href": "https://analytics.liferay.com/api/reports/individuals"
      },
      "pages":{
         "href": "https://analytics.liferay.com/api/reports/pages"
      },
      "segments":{
         "href": "https://analytics.liferay.com/api/reports/segments"
      }
   }
}
```

여기에서 다양한 API를 호출하여 계정, 개인, 페이지 및 세그먼트에 대한 데이터를 얻을 수 있습니다.

분석 데이터에 대한 모든 서버 응답은 동일한 데이터 구조를 따릅니다. 응답은 Liferay Analytics Cloud에서 계산된 엔터티의 페이징된 결과입니다. 기본적으로 각 페이지에는 20개의 요소가 포함되며 페이지 쿼리 매개변수를 교체하여 탐색할 수 있습니다. 합계는 사용 가능한 요소의 총 수를 보여줍니다. 아래에서 응답 형식을 볼 수 있습니다.

```json
{"results":[],"total":0}
```

## 계정 데이터 액세스

계정 데이터는 다음 명령으로 검색할 수 있습니다.

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/accounts
```

### 매개 변수

* `페이지` (정수): 결과 페이지 번호

## 개인 데이터 액세스

개인 데이터는 다음 명령으로 검색할 수 있습니다.

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals
```

### 매개 변수

* `페이지` 정수: 결과 페이지 번호
* `query` String: 개인의 인구통계정보와 매칭할 키워드

## 개별 활동

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{id}/activities
```

개인이 수행한 활동 목록을 반환합니다.

각 활동의 구조는 아래에 설명되어 있습니다.

```json
{
   "ownerId": "371000621354447876",
   "startTime": "2019-10-28T21:49:05.674Z",,
   "applicationId":"WebContent",
   "eventId":"webContentViewed",
   "eventProperties":{
      "numberOfWords":"13",
      "articleId":"232001430",
      "title":"Navigation Content - Partner Resources Basic (for launch)",
      "pageViewActivityId":"8ed2e0d9-ed41-4b3d-bbe1-e1219448e9eb"
   }
}
```

### 재산

* `ownerId` (문자열): 개별 ID에 해당하는 활동의 소유자입니다.
* `startTime` (Date): 활동이 발생한 날짜 타임스탬프입니다.
* `applicationId` (String): 이벤트를 트리거한 애플리케이션의 ID입니다.
* `eventId` (문자열): 개인이 수행한 분석 이벤트의 ID입니다. 이벤트 ID는 개인이 수행한 작업을 나타냅니다.
* `eventProperties` (객체): 이벤트에 대한 메타데이터 정보로 eventId에 따라 다릅니다.

## 개인의 이익

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{id}/interests
```

개인의 관심사 목록을 반환합니다. 각 관심사의 구조는 아래에 설명되어 있습니다.

```json
{
   "score":0.6908830400645879,
   "ownerId":"385450976494153117",
   "dateRecorded":null,
   "id":"389978452012791133",
   "name":"Digital Experience Software Tailored"
}
```

### 재산

* `점수` (숫자): 개인이 특정 주제에 얼마나 관심이 있는지를 수치로 나타냅니다. 범위는 0에서 1까지입니다.
* `ownerId` (문자열): 개별 ID에 해당하는 활동의 소유자입니다.
* `dateRecorded` (Date): 이자가 계산된 날짜 타임스탬프입니다.
* `applicationId` (String): 이벤트를 트리거한 애플리케이션의 ID입니다.
* `id` (문자열): 관심 분야의 고유 식별자입니다.
* `이름` (문자열): 관심사의 이름.

## 개별 세그먼트

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{id}/segments
```

개인이 속한 세그먼트 목록을 반환합니다. 각 세그먼트의 구조는 데이터 유형 > 세그먼트 섹션에 설명되어 있습니다.

## 세그먼트 데이터 액세스

세그먼트 데이터는 다음 명령으로 검색할 수 있습니다.

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments
```

### 재산

`page` : 정수, 결과 페이지 번호

## 세그먼트 개인

세그먼트에 속한 개인의 목록을 반환합니다.

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments/{id}/individuals
```

## 페이지 데이터 액세스

페이지 데이터는 다음 명령으로 검색할 수 있습니다.

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/pages 
```

### 재산

* `페이지` (정수): 결과 페이지 번호.
* `keywords` (String): 페이지 제목 또는 url 정보와 일치시킬 키워드.
* `rangeKey` (Integer): 데이터 그룹화에 사용할 범위. 가능한 값은 0(지난 24시간 데이터), 1(어제 데이터), 7(지난 7일 데이터), 28(지난 28일 데이터), 30(기본값, 지난 30일 데이터)입니다. 일), 90(지난 90일 동안의 데이터.
* `sortMetric` (문자열): 결과를 정렬할 메트릭을 정의했으며 기본값은 viewsMetrics입니다. 가능한 값은 ctrMetric, timeOnPageMetric, exitRateMetric, ctpMetric, sessionsMetric, avgTimeOnPageMetric, boundMetric, maxScrollDepthMetric, 방문자 지표, viewsMetric, boundRateMetric, indirectAccessMetric, entrancesMetric, directAccessMetric입니다.
* `sortOrder` (문자열), 가능한 값은 **asc** 또는 **desc** 입니다. sortMetric에 따라 결과를 오름차순 또는 내림차순으로 정렬합니다. 기본값은 설명입니다.
