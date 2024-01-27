# リソースの種類とストラクチャー

**プロパティ**

* `activeIndividualsCount` (数値)：アカウントに属するアクティブな個人の数。
* `dateCreated`（日付）：アカウントがシステムに作成された日付。
* `dateModified`（日付）：アカウントのプロパティが最後に変更された日付。
* `ID` (文字列)：アカウントの一意な識別子；
* `individualsCount` (数値)：アカウントに属する個人の数。アクティブな個人、非アクティブな個人がこのメトリクスで考慮される。
* `プロパティ`：アカウントの動的プロパティのキー/値 (文字列) マップ。

## 個人

ユーザーはポータルにアクセスしたすべてのユーザーを表します。 ユーザーは既知でも匿名でも構いません。 既知のユーザーとは、連絡先の同期中にデータが濃縮された人のことです。 充実させた後、既知のユーザーは、メールや人口統計などの追加属性を持つようになります。 個々のリソースとそのプロパティについて、以下の通りです。

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

**プロパティ**

* `Demographics` Key/Value (String:) 個人のデモグラフィックのダイナミックプロパティのマップ。
* `ID` (文字列)：個人の一意な識別子。

## セグメント

セグメントとは、似たような特徴を持つユーザーのグループのことです。 セグメントは_静的_か_動的_のどちらかになる。 静的セグメントは、選択されたユーザーの静的なグループです。 動的セグメントは、基準に基づいています（例えば、米国から閲覧しているすべてのユーザーをグループ化する）。 定義された基準は、Liferay Analytics Cloud UIの動的セグメントに含まれるユーザーを決定します。 セグメントのリソースについては以下の通りです：

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

**プロパティ**

* `dateCreated`（日付）：セグメントがシステムに作成された日付。
* `ID` (文字列)：セグメントの一意な識別子。
* `individualCount`（数値）：このメトリクスは匿名または既知の個人の両方を考慮する。
* `unknownIndividualsCount` (数値)：セグメントに属する既知の個体の数。
* `name` (文字列)：セグメントの名前；
* `segmentType` (String)：セグメントが静的か動的か。
* `includeAnonymousUsers`（ブール値）：セグメントに匿名ユーザーを含めるかどうか。 falseの場合、individualCountとknownIndividualCountは常に等しくなります。

## ページ

ページ情報は、追跡されたページでのインタラクションデータを集約したものです。 各ページのURLには、ページ滞在時間やページの閲覧数などのプロパティが含まれます。 すべてのプロパティは以下の通りです。

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

**プロパティ**

* `タイトル` (文字列)：ページのタイトル。
* `metrics`（メトリック）：各ページはタイトルとURLのペアによって一意に識別される。
  * `Metric`（オブジェクト）：メトリックのプロパティを以下に示す：
    * トレンド
      * `パーセンテージ` (数値) * 前と現在の指標値の相対的な変動。
      * trendClassfication`(文字列): POSITIVE、NEUTRAL、NEGATIVEのいずれかを指定する。 この指標は、以前の値と比較して、どれだけパフォーマンスが向上しているかを考慮しています。
    * `Value` (Number): メトリック値。rangeKey に依存し、rangeKey が 30 の場合、value は過去 30 日間の集計データを表す。
    * `previousValue` (数値): メトリックの前回値。 また、要求されたレンジキーにもよりますが、選択されたレンジキーが30の場合、前の値は今日-60日目から今日-30日目までのデータを集約します。
* `url` (文字列)：ページの URL

## アセット

アセット情報は、追跡されたアセットページでのインタラクションデータを集約したものです。 どのページURLにも複数のアセットを含めることができます。 アセットメトリクスは、ページレポートを補完するもので、ページのインタラクションをより詳細に見ることができます。 ブログ、ドキュメントとメディア、フォーム、そしてWebコンテンツの4つのアセットが用意されています。 これらの各アセットには、特定のエンドポイントがあります：

* ブログ - [https://analytics.liferay.com/api/reports/blogs](https://analytics.liferay.com/api/reports/blogs) 
* ドキュメントとメディア - [https://analytics.liferay.com/api/reports/documents-and-media](https://analytics.liferay.com/api/reports/documents-and-media) 
* フォーム - [https://analytics.liferay.com/api/reports/forms](https://analytics.liferay.com/api/reports/forms) 
* Webコンテンツ - [https://analytics.liferay.com/api/reports/web-contents](https://analytics.liferay.com/api/reports/web-contents) 

各アセットには、それぞれのプロパティが含まれています。

### ブログ

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

**プロパティ**

* `ID` (文字列)：ブログの一意な識別子。
* `タイトル` (String) ：ブログのタイトル。
* `読書時間メトリクス` (Double)：ブログを読むのに費やしたユーザーの平均時間。
* `Clicks Metric` (Double)：ブログに対するユーザーのクリック数の合計。
* `Views Metric` (Double)：ブログのユーザー閲覧数の合計。
* `評価メトリック` (Double)：選択期間中のブログの平均評価 (1-5の範囲)。
* `コメントメトリック` (Double)：ブログに追加されたコメントの合計。

### ドキュメントとメディア

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

**プロパティ**

* `ID` (文字列)：ドキュメントまたはメディアの一意な識別子。
* `タイトル` (String) ：ドキュメントまたはメディアのタイトル。
* `Downloads Metric` (Double)：ドキュメントまたはメディアのユーザーダウンロード数の合計。
* `評価メトリック` (Double)：選択期間中のドキュメントまたはメディアの平均評価 (1-5の範囲)。
* `コメントメトリック` (Double)：ドキュメントやメディアに追加されたコメントの合計。
* `プレビューメトリック` (Double)：ドキュメントやメディアに対するユーザーのプレビュー数の合計。

### フォーム

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

**プロパティ**

* `ID` (文字列)：フォームの一意な識別子。
* `タイトル` (文字列)：フォームのタイトル。
* `Views Metric` (Double)：フォームに対するユーザーの閲覧数の合計。
* `放棄メトリック` (Double)：フォームの放棄率 (0-1 の範囲)。
* `投稿数メトリクス` (Double)：フォームの投稿数の合計。
* `完了時間メトリクス` (Double)：ユーザーがフォームを完了するまでの平均時間。

また、ページのリンクに移動すると、フォームのページメトリクス情報を見ることができます。 ページおよびフォームフィールドごとにフォームメトリックが表示されます。

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

**プロパティ**

* `フォームID` (文字列)：フォームの一意な識別子。
* `フォームのタイトル` (String)：フォームのタイトル。
* `Field Interactions Metric` (Double)：フォームフィールドのユーザーインタラクションの合計。
* `Field Interactions Duration Metric` (Double)：フォームフィールドの平均インタラクション時間。
* `Field Abandonments Metric` (Double)：このフィールドでユーザーがフォームを放棄した数の合計。
* `Page Views Metric` (Double)：フォームページのユーザービューの合計。
* `Page Abandonments Metric` (Double)：このページでユーザーがフォームを放棄した数の合計。

### Webコンテンツ

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

**プロパティ**

* `ID` (文字列)：ウェブコンテンツの一意な識別子。
* `タイトル` (文字列)：ウェブコンテンツのタイトル。
* `Views Metric` (Double)：ウェブコンテンツのユーザー閲覧数の合計。
