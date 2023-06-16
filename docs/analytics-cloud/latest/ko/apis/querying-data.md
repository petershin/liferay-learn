# 데이터 쿼리

Liferay Analytics Cloud의 루트 엔드포인트는 <https://analytics.liferay.com/api/reports>입니다. 위의 URL에 GET을 요청하여 모든 데이터 유형 엔드포인트 목록을 가져올 수 있습니다. 컬로 시도

```
curl -i -L -H "Authorization: Bearer {token}" https://analytics.liferay.com/api/reports
```

다음 응답이 반환되어야 합니다.

```json
{
   "_links":{
        "blogs": {
            "href": "https://analytics.liferay.com/api/reports/blogs{?channelId,page,keywords,rangeKey,sortMetric,sortOrder}",
            "templated": true
        },
        "documents-and-media": {
            "href": "https://analytics.liferay.com/api/reports/documents-and-media{?channelId,page,keywords,rangeKey,sortMetric,sortOrder}",
            "templated": true
        },
        "forms": {
            "href": "https://analytics.liferay.com/api/reports/forms{?channelId,page,keywords,rangeKey,sortMetric,sortOrder}",
            "templated": true
        },
        "individuals": {
            "href": "https://analytics.liferay.com/api/reports/individuals{?channelId,page,query}",
            "templated": true
        },
        "pages": {
            "href": "https://analytics.liferay.com/api/reports/pages{?channelId,page,keywords,rangeKey,sortMetric,sortOrder}",
            "templated": true
        },
        "segments": {
            "href": "https://analytics.liferay.com/api/reports/segments{?channelId,page}",
            "templated": true
        },
        "web-contents": {
            "href": "https://analytics.liferay.com/api/reports/web-contents{?channelId,page,keywords,rangeKey,sortMetric,sortOrder}",
            "templated": true
        }
   }
}
```

여기에서 다양한 API를 호출하여 다양한 데이터 유형에 대한 데이터를 가져올 수 있습니다.

분석 데이터에 대한 모든 서버 응답은 동일한 데이터 구조를 따릅니다. 응답은 Liferay Analytics Cloud에서 계산된 엔터티의 페이징된 결과입니다. 기본적으로 각 페이지에는 20개의 요소가 포함되어 있습니다. 페이지 쿼리 매개변수를 교체하여 탐색할 수 있습니다. 합계는 사용 가능한 요소의 총 수를 보여줍니다.

## 블로그 데이터 액세스

이 명령을 사용하여 모든 블로그 데이터를 검색합니다.

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/blogs
```

다음 쿼리 매개변수를 사용할 수 있습니다.

* `channelId` (정수): Analytics Cloud 작업 영역 속성 ID입니다.
* `페이지` (정수): 결과 페이지 번호입니다.
* `키워드` (문자열): 자산 제목 내에서 일치하는 키워드입니다.
* `rangeKey` (정수): 데이터를 그룹화하기 위한 시간 범위입니다. 가능한 값은 `0` (지난 24시간 데이터), `1` (어제 데이터), `7` (지난 7일 데이터), `28` (지난 28일 데이터), `30입니다.` (기본값, 지난 30일 데이터), `90` (지난 90일 데이터).
* `sortMetric`(문자열): 데이터 정렬을 위한 메트릭입니다. 가능한 값은 `clicksMetric`, `commentsMetric`, `ratingsMetric`, `readingTimeMetric`및 `viewsMetric`입니다.
* `sortOrder` (문자열): 결과를 표시하는 순서입니다. 가능한 값은 `asc` 또는 `desc`입니다.

특정 블로그 게시물에 대한 데이터를 검색하려면

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/blogs/{blogID}
```

## 문서 및 미디어 데이터 액세스

이 명령을 사용하여 모든 문서 및 미디어 데이터를 검색합니다.

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/documents-and-media
```

다음 쿼리 매개변수를 사용할 수 있습니다.

* `channelId` (정수): Analytics Cloud 작업 영역 속성 ID입니다.
* `페이지` (정수): 결과 페이지 번호입니다.
* `키워드` (문자열): 데이터 내에서 일치하는 키워드입니다.
* `rangeKey` (정수): 데이터를 그룹화하기 위한 시간 범위입니다. 가능한 값은 `0` (지난 24시간 데이터), `1` (어제 데이터), `7` (지난 7일 데이터), `28` (지난 28일 데이터), `30입니다.` (기본값, 지난 30일 데이터), `90` (지난 90일 데이터).
* `sortMetric`(문자열): 데이터 정렬을 위한 메트릭입니다. 가능한 값은 `개의 댓글입니다. 측정치`, 다운로드 `회측정치`, 미리보기 `회측정치`, 평가 `회측정치`.
* `sortOrder` (문자열): 결과를 표시하는 순서입니다. 가능한 값은 `asc` 또는 `desc`입니다.

특정 문서에 대한 데이터를 검색하려면

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/documents-and-media/{documentId}
```

## 양식 데이터 액세스

이 명령을 사용하여 모든 Forms 데이터를 검색합니다.

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/forms
```

다음 쿼리 매개변수를 사용할 수 있습니다.

* `channelId` (정수): Analytics Cloud 작업 영역 속성 ID입니다.
* `페이지` (정수): 결과 페이지 번호입니다.
* `키워드` (문자열): 데이터 내에서 일치하는 키워드입니다.
* `rangeKey` (정수): 데이터를 그룹화하기 위한 시간 범위입니다. 가능한 값은 `0` (지난 24시간 데이터), `1` (어제 데이터), `7` (지난 7일 데이터), `28` (지난 28일 데이터), `30입니다.` (기본값, 지난 30일 데이터), `90` (지난 90일 데이터).
* `sortMetric`(문자열): 데이터 정렬을 위한 메트릭입니다. 가능한 값은 `포기 지표`, `완료 시간 지표`, `제출 지표`, `조회 지표`입니다.
* `sortOrder` (문자열): 결과를 표시하는 순서입니다. 가능한 값은 `asc` 또는 `desc`입니다.

특정 양식에 대한 데이터를 검색하려면

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/forms/{formId}
```

## 개인 데이터 액세스

이 명령을 사용하여 모든 개인 데이터를 검색합니다.

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals
```

다음 쿼리 매개변수를 사용할 수 있습니다.

* `channelId` (정수): Analytics Cloud 작업 영역 속성 ID입니다.
* `페이지` (정수): 결과 페이지 번호입니다.
* `쿼리` (문자열): 개인의 `emailAddress`, `firstName`또는 `lastName`에서 검색된 모든 단어.

특정 개인에 대한 활동 데이터를 검색하려면,

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/activities
```

특정 개인에 대한 관심 데이터를 검색하려면,

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/interests
```

특정 개인에 대한 세그먼트 데이터를 검색하려면,

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/segments
```

## 페이지 데이터 액세스

이 명령을 사용하여 모든 페이지 데이터를 검색합니다.

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/pages 
```

다음 쿼리 매개변수를 사용할 수 있습니다.

* `channelId` (정수): Analytics Cloud 작업 영역 속성 ID입니다.
* `페이지` (정수): 결과 페이지 번호입니다.
* `키워드` (문자열): 데이터 내에서 일치하는 키워드입니다.
* `rangeKey` (정수): 데이터를 그룹화하기 위한 시간 범위입니다. 가능한 값은 `0` (지난 24시간 데이터), `1` (어제 데이터), `7` (지난 7일 데이터), `28` (지난 28일 데이터), `30입니다.` (기본값, 지난 30일 데이터), `90` (지난 90일 데이터).
* `sortMetric`(문자열): 데이터를 정렬하기 위한 메트릭입니다. 가능한 값은 `clicksMetric`, `commentsMetric`, `ratingsMetric`, `readingTimeMetric` 및 `viewsMetric`입니다.
* `sortOrder` (문자열): 결과를 표시할 순서입니다. 가능한 값은 `asc` 또는 `desc`입니다.

특정 URL에서 페이지 데이터를 검색하려면

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/pages/{pageURL}
```

## 세그먼트 데이터 액세스

이 명령을 사용하여 모든 세그먼트 데이터를 검색합니다.

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments
```

다음 쿼리 매개변수를 사용할 수 있습니다.

* `channelId` (정수): Analytics Cloud 작업 영역 속성 ID입니다.
* `페이지` (정수): 결과 페이지 번호입니다.

특정 세그먼트의 모든 개인을 검색하려면

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments/{segmentsId}/individuals
```

## 웹 콘텐츠 데이터 액세스

이 명령을 사용하여 모든 웹 콘텐츠 데이터를 검색합니다.

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/web-contents
```

다음 쿼리 매개변수를 사용할 수 있습니다.

* `channelId` (정수): Analytics Cloud 작업 영역 속성 ID입니다.
* `페이지` (정수): 결과 페이지 번호입니다.
* `키워드` (문자열): 데이터 내에서 일치하는 키워드입니다.
* `rangeKey` (정수): 데이터를 그룹화하기 위한 시간 범위입니다. 가능한 값은 `0` (지난 24시간 데이터), `1` (어제 데이터), `7` (지난 7일 데이터), `28` (지난 28일 데이터), `30입니다.` (기본값, 지난 30일 데이터), `90` (지난 90일 데이터).
* `sortMetric`(문자열): 데이터 정렬을 위한 메트릭입니다. 가능한 값은 `viewsMetric`입니다.
* `sortOrder` (문자열): 결과를 표시하는 순서입니다. 가능한 값은 `asc` 또는 `desc`입니다.

특정 웹 콘텐츠에 대한 데이터를 검색하려면

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/web-contents/{webContentsID}
```
