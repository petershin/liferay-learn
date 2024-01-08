# 리소스 유형 및 구조

**속성**

* `activeIndividualsCount`(숫자): 계정에 속한 활성 개인의 수입니다.
* `dateCreated`(날짜): 시스템에 계정이 생성된 날짜입니다.
* `dateModified`(날짜): 계정 속성이 마지막으로 수정된 날짜입니다.
* `ID`(문자열): 계정의 고유 식별자입니다.
* `individualsCount`(숫자): 계정에 속한 개인 수, 활성 또는 비활성 개인이 이 측정항목에서 고려됩니다.
* `속성`: 계정 동적 속성의 키/값(문자열) 맵, 예로는 산업, 팩스, 전화 등이 포함될 수 있습니다.

## 개인

개인은 포털에 액세스한 모든 사용자를 나타냅니다. 개인은 알려질 수도 있고 익명일 수도 있습니다. 알려진 개인은 연락처 동기화 중에 데이터가 강화된 개인입니다. 강화 후 알려진 개인은 이메일, 인구 통계 등과 같은 추가 속성을 갖게 됩니다. 개별 리소스와 해당 속성은 아래에 설명되어 있습니다.

```json
{
   "demographics":{
      "gender":"male",
      "givenName":"Joe",
      "familyName":"Bloggs",
      "birthDate":"1970-01-01T00:00:00.000Z",
      "email":"email@domain.com"
   },
   "id":"370982554530167442",
   "_links":{
      "self":{
         "href":"http://localhost:8080/api/reports/individuals/370982554530167442"
      },
      "activities":{
         "href":"http://localhost:8080/api/reports/individuals/370982554530167442/activities"
      },
      "interests":{
         "href":"http://localhost:8080/api/reports/individuals/370982554530167442/interests"
      },
      "segments":{
         "href":"http://localhost:8080/api/reports/individuals/370982554530167442/segments"
      }
   }
}
```

**속성**

* `인구통계` 키/값(문자열:) 개인 인구통계 동적 속성의 맵입니다. 예에는 성별, 생년월일, 이메일 등이 포함될 수 있습니다.
* `ID`(문자열): 개인의 고유 식별자입니다.

## 세그먼트

세그먼트는 유사한 특성을 공유하는 개인의 그룹입니다. 세그먼트는 **정적** 또는 **동적** 일 수 있습니다. 정적 세그먼트는 선택된 개인의 정적 그룹입니다. 동적 세그먼트는 기준(예: 미국에서 탐색하는 모든 개인을 그룹화)을 기반으로 합니다. 정의된 기준에 따라 Liferay Analytics Cloud UI의 동적 세그먼트에 포함된 개인이 결정됩니다. 세그먼트 리소스는 아래에 설명되어 있습니다.

```json
{ 
   "dateCreated":"2019-12-27T19:17:49.924Z",
   "id":"386700296216137268",
   "individualCount":5,
   "knownIndividualCount":5,
   "name":"Account: 386700295379617992",
   "segmentType":"DYNAMIC",
   "includeAnonymousUsers":false,
   "_links":{ 
      "self":{ 
         "href":"http://192.168.108.90:9090/api/reports/segments/386700296216137268"
      },
      "individuals":{ 
         "href":"http://192.168.108.90:9090/api/reports/segments/386700296216137268/individuals?page=0"
      }
   }
}
```

**속성**

* `dateCreated`(날짜): 세그먼트가 시스템에 생성된 날짜입니다.
* `ID`(문자열): 세그먼트의 고유 식별자입니다.
* `individualCount`(숫자): 세그먼트에 속한 개인의 수입니다. 이 지표는 익명 또는 알려진 개인을 모두 고려합니다.
* `knownIndividualsCount`(숫자): 세그먼트에 속하는 알려진 개인의 수입니다.
* `name`(문자열): 세그먼트의 이름입니다.
* `segmentType`(문자열): 세그먼트가 정적인지 동적인지 여부.
* `includeAnonymousUsers`(부울): 세그먼트에 익명 사용자가 포함되어 있는지 여부입니다. false인 경우 personalCount와 KnownIndividualCount는 항상 동일합니다.

## 페이지

페이지 정보는 추적된 페이지와의 집계된 상호 작용 데이터를 나타냅니다. 각 페이지 URL에는 페이지에 머문 시간, 페이지 조회수 등과 같은 속성이 포함됩니다. 모든 속성은 아래에서 볼 수 있습니다.

```json
{ 
   "title":"Home - Liferay DXP",
   "metrics":{ 
      "ctrMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
          },
          "value":0.0
      },
      "timeOnPageMetric":{ 
         "previousValue":0.0,
         "trend":{ 
             "percentage":null,
             "trendClassification":"NEUTRAL"
         },
         "value":264283.0
      },
      "exitRateMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":0.0
      },
      "ctpMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":0.0
      },
      "sessionsMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":1.0
      },
      "bounceMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":0.0
      },
      "avgTimeOnPageMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":264283.0
      },
      "maxScrollDepthMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":0.0
      },
      "visitorsMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":1.0
      },
      "viewsMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":5.0
      },
      "bounceRateMetric":{ 
        "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":0.0
      },
      "indirectAccessMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":5.0
      },
      "entrancesMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":0.0
      },
      "directAccessMetric":{ 
         "previousValue":0.0,
         "trend":{ 
            "percentage":null,
            "trendClassification":"NEUTRAL"
         },
         "value":0.0
      }
   },
   "url":"http://172.16.22.127:8080/web/guest",
   "_links":{ 
      "self":{ 
         "href":"http://192.168.108.90:9090/api/reports/pages/http%253A%252F%252F172.16.22.127%253A8080%252Fweb%252Fguest?rangeKey=30"
      }
   }
}
```

**속성**

* `title`(문자열): 페이지 제목입니다.
* `metrics`(메트릭): 페이지의 측정항목 값 목록입니다. 각 페이지는 제목, URL 쌍으로 고유하게 식별됩니다.
  * `메트릭`(객체): 메트릭 값을 나타내는 객체입니다. 메트릭 속성은 아래에 설명되어 있습니다.
    * 경향
      * `백분율`(숫자) - 이전 측정항목 값과 현재 측정항목 값의 상대적 변화입니다.
      * `trendClassfication`(문자열), POSITIVE, NEUTRAL, NEGATIVE 값을 가정할 수 있습니다. 이전 값과 비교할 때 측정항목의 성능이 얼마나 좋은지 고려합니다.
    * '값'(숫자): 측정항목 값은 rangeKey에 따라 다릅니다. 선택한 rangeKey가 30인 경우 값은 지난 30일 동안 집계된 데이터를 나타냅니다.
    * `previousValue`(숫자): 이전 측정항목 값입니다. 또한 요청된 rangeKey에 따라 달라지며, 선택한 rangeKey가 30인 경우 이전 값은 오늘(60일)부터 오늘(30일)까지 데이터를 집계합니다.
* `url`(문자열): 페이지 URL

## 자산

자산 정보는 추적된 자산 페이지와의 집계된 상호 작용 데이터를 나타냅니다. 모든 페이지 URL에는 여러 자산이 포함될 수 있습니다. 자산 지표는 페이지 보고서를 보완하며 페이지 상호 작용에 대한 보다 심층적인 보기를 제공합니다. 블로그, 문서 및 미디어, 양식, 웹 콘텐츠 등 4가지 자산을 사용할 수 있습니다. 이러한 각 자산에는 특정 엔드포인트가 있습니다.

* 블로그 - [https://analytics.liferay.com/api/reports/blogs](https://analytics.liferay.com/api/reports/blogs) 
* 문서 및 미디어 - [https://analytics.liferay.com/api/reports/documents-and-media](https://analytics.liferay.com/api/reports/documents-and-media) 
* 양식 - [https://analytics.liferay.com/api/reports/forms](https://analytics.liferay.com/api/reports/forms) 
* 웹 콘텐츠 - [https://analytics.liferay.com/api/reports/web-contents](https://analytics.liferay.com/api/reports/web-contents) 

각 자산에는 고유한 속성 집합이 포함되어 있습니다.

### 블로그

```json
 {
      "id": "107694635",
      "title": "Awesome Web Portal Examples",
      "metrics": {
        "readingTimeMetric": {
          "value": 71788.99821937321
        },
        "clicksMetric": {
          "value": 1969.0
        },
        "viewsMetric": {
          "value": 3253.0
        },
        "ratingsMetric": {
          "value": 0.0
        },
        "commentsMetric": {
          "value": 0.0
        }
      },
      "_links": {
        "self": {
          "href": "https://analytics.liferay.com/api/reports/blogs/107694635?blogTitle=16%20Awesome%20Web%20Portal%20Examples&rangeKey=30"
        }
      }
```

**속성**

* `ID`(문자열): 블로그의 고유 식별자입니다.
* `Title`(문자열) : 블로그에 사용되는 제목입니다.
* `읽는 시간 측정항목`(Double): 사용자가 블로그를 읽는 데 소요한 평균 시간입니다.
* `클릭수 측정항목`(Double): 블로그에 대한 사용자 클릭의 합계입니다.
* `Views Metric`(Double): 블로그의 사용자 조회수 합계입니다.
* `평점 측정항목`(이중): 해당 선택 기간 동안 블로그의 평균 평점(1~5 범위)입니다.
* `댓글 측정항목`(Double): 블로그에 추가된 댓글의 합계입니다.

### 문서 및 미디어

```json
{
      "id": "320981007",
      "title": "My Awesome Document",
      "metrics": {
        "downloadsMetric": {
          "value": 6.0
        },
        "ratingsMetric": {
          "value": 0.0
        },
        "commentsMetric": {
          "value": 0.0
        },
        "previewsMetric": {
          "value": 286.0
        }
      },
      "_links": {
        "self": {
          "href": "https://analytics.liferay.com/api/reports/documents-and-media/320981007?documentTitle=My%20Awesome%20Document&rangeKey=30"
      }
}
```

**속성**

* `ID`(문자열): 문서 또는 미디어의 고유 식별자입니다.
* `Title`(문자열) : 문서 또는 미디어에 사용되는 제목입니다.
* `다운로드 지표`(Double): 문서 또는 미디어의 사용자 다운로드 합계입니다.
* `등급 지표`(이중): 해당 선택 기간 동안 문서 또는 미디어의 평균 등급(1-5 범위)입니다.
* `댓글 지표`(Double): 문서나 미디어에 추가된 댓글의 합계입니다.
* `미리보기 측정항목`(Double): 문서 또는 미디어의 사용자 미리보기 합계입니다.

### 양식

```json
{
      "id": "872a3ca0-324d-438a-9d82-e4cad68c3a20",
      "title": "Blog Subscription",
      "metrics": {
        "viewsMetric": {
          "value": 20409.0
        },
        "abandonmentsMetric": {
          "value": 0.9989710421872703
        },
        "submissionsMetric": {
          "value": 22.0
        },
        "completionTimeMetric": {
          "value": 33645.77272727273
        }
      },
      "_links": {
        "self": {
          "href": "https://analytics.liferay.com/api/reports/forms/872a3ca0-324d-438a-9d82-e4cad68c3a20?formTitle=Blog%20Subscription&rangeKey=30"
        },
        "pages": {
          "href": "https://analytics.liferay.com/api/reports/forms/872a3ca0-324d-438a-9d82-e4cad68c3a20/pages?formTitle=Blog%20Subscription&rangeKey=30"
        }
      }
```

**속성**

* `ID`(문자열): 양식의 고유 식별자입니다.
* `Title`(문자열): 양식에 사용되는 제목입니다.
* `Views Metri`(Double): 양식의 사용자 조회수 합계입니다.
* `Abandonments Metric`(Double): 양식 포기 비율(0-1 범위)입니다.
* `제출 지표`(Double): 양식 제출의 합계입니다.
* `완료 시간 측정항목`(Double): 사용자가 양식을 완료하는 데 걸린 평균 시간입니다.

페이지 링크를 따라가면 양식 페이지 측정항목 정보를 볼 수도 있습니다. 페이지 및 양식 필드별로 양식 측정항목을 표시합니다.

```json
{
  "formId": "872a3ca0-324d-438a-9d82-e4cad68c3a20",
  "formTitle": "Blog Subscription",
  "formPages": [
    {
      "id": "0",
      "title": "",
      "fields": {
        "name_field": {
          "metrics": {
            "fieldInteractionsMetric": {
              "value": 6.0
            },
            "fieldInteractionsDurationMetric": {
              "value": 0.0
            },
            "fieldRefilledMetric": {
              "value": 3.0
            },
            "fieldAbandonmentsMetric": {
              "value": 3.0
            }
          }
        },
        "email_field": {
          "metrics": {
            "fieldInteractionsMetric": {
              "value": 86.0
            },
            "fieldInteractionsDurationMetric": {
              "value": 223983.0
            },
            "fieldRefilledMetric": {
              "value": 34.0
            },
            "fieldAbandonmentsMetric": {
              "value": 10.0
            }
          }
        }       
      },
      "metrics": {
        "pageViewsMetric": {
          "value": 20409.0
        },
        "pageAbandonmentsMetric": {
          "value": 20388.0
        }
      }
    }
  ],
  "_links": {
    "self": {
      "href": "https://analytics.liferay.com/api/reports/forms/872a3ca0-324d-438a-9d82-e4cad68c3a20/pages?formTitle=Blog%20Subscription&rangeKey=30"
    },
    "parent": {
      "href": "https://analytics.liferay.com/api/reports/forms/872a3ca0-324d-438a-9d82-e4cad68c3a20?formTitle=Blog%20Subscription&rangeKey=30"
    }
  }
}
```

**속성**

* `양식 ID`(문자열): 양식의 고유 식별자입니다.
* `양식 제목`(문자열): 양식에 사용되는 제목입니다.
* `필드 상호 작용 측정항목`(Double): 양식 필드의 사용자 상호 작용 합계입니다.
* `필드 상호 작용 기간 측정항목`(Double): 양식 필드의 평균 상호 작용 시간입니다.
* `Field Abandonments Metric`(Double): 이 필드에서 사용자가 양식을 포기한 합계입니다.
- '페이지 조회수 측정항목'(Double): 양식 페이지의 사용자 조회수 합계입니다.
- '페이지 이탈 측정항목'(Double): 이 페이지에서 사용자가 양식을 이탈한 합계입니다.

### 웹 콘텐츠

```json
 {
      "id": "231976097",
      "title": "My Web Content",
      "metrics": {
        "viewsMetric": {
          "value": 280756.0
        }
      },
      "_links": {
        "self": {
          "href": "https://analytics.liferay.com/api/reports/web-contents/231976097?webContentTitle=My%20Web%20Content&rangeKey=30"
        }
      }
    }
```

**속성**

* `ID`(문자열): 웹 콘텐츠의 고유 식별자입니다.
* `Title`(문자열): 웹 콘텐츠에 사용되는 제목입니다.
* `Views Metric`(Double): 웹 콘텐츠의 사용자 조회수 합계입니다.
