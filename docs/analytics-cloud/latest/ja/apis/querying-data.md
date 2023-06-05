# データのクエリ

Liferay Analytics Cloudのルートエンドポイントは、 <https://analytics.liferay.com/api/reports>です。 上記のURLにGETをリクエストすることで、すべてのデータタイプのエンドポイントのリストを取得することができます。 curlで試します。

```
curl -L -H "Authorization: Bearer {token}" https://analytics.liferay.com/api/reports
```

この応答が返ってくるはずです：

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

ここから、さまざまなAPIを呼び出して、さまざまなデータ型のデータを取得することができます。

アナリティクスデータに対するサーバーの応答は、すべて同じデータ構造に従っています。 レスポンスはLiferay Analytics Cloudで計算されたエンティティのページングされた結果です。 デフォルトでは、各ページに20個の要素が含まれています。 ページクエリパラメータを置き換えることで移動できます。 totalには、使用可能な要素の総数が表示されます。

## ブログデータへのアクセス

このコマンドを使うと、すべてのBlogデータを取得することができます：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/blogs
```

これらのクエリパラメータを利用することができます：

* `channelId` (integer)：Analytics CloudのワークスペースのプロパティIDです。
* `page` (integer)：結果のページ番号。
* `keywords` (string)：アセットのタイトルにマッチするキーワード。
* `rangeKey` (integer)： データをグループ化する時間範囲を指定します。指定できる値は、`0`（24時間以内のデータ）、`1`（昨日のデータ）、`7`（7日以内のデータ）、`28`（28日以内のデータ）、`30`（デフォルト値、30日以内のデータ）、`90`（90日以内のデータ）である。
* `sortMetric`(string)：データをソートするためのメトリックを指定します。 設定可能な値は、 `clicksMetric`, `commentsMetric`, `ratingsMetric`, `readingTimeMetric`, and `viewsMetric`。
* `sortOrder` (string)：結果を表示する順序を指定します。 指定できる値は、 `asc` または `desc`です。

特定のブログ記事に関するデータを取得する場合、

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/blogs/{blogID}
```

## ドキュメントやメディアデータへのアクセス

すべてのDocumentsとMediaのデータを取得するコマンドです：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/documents-and-media
```

これらのクエリパラメータを利用することができます：

* `channelId` (integer)：Analytics CloudのワークスペースのプロパティIDです。
* `page` (integer)：結果のページ番号。
* `keywords` (string)：データ内で一致したキーワード。
* `rangeKey` (integer)： データをグループ化する時間範囲を指定します。指定できる値は、`0`（24時間以内のデータ）、`1`（昨日のデータ）、`7`（7日以内のデータ）、`28`（28日以内のデータ）、`30`（デフォルト値、30日以内のデータ）、`90`（90日以内のデータ）である。
* `sortMetric`(string)：データをソートするためのメトリックを指定します。 可能な値は、 `commentsMetric`, `downloadsMetric`, `previewsMetric`, `ratingsMetrics`.
* `sortOrder` (string)：結果を表示する順序を指定します。 指定できる値は、 `asc` または `desc`です。

特定の文書に関するデータを取得する場合、

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/documents-and-media/{documentId}
```

## フォームデータへのアクセス

すべてのフォームデータを取得する場合は、このコマンドを使用します：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/forms
```

これらのクエリパラメータを利用することができます：

* `channelId` (integer)：Analytics CloudのワークスペースのプロパティIDです。
* `page` (integer)：結果のページ番号。
* `keywords` (string)：データ内で一致したキーワード。
* `rangeKey` (integer)： データをグループ化するための時間範囲。指定できる値は、`0`（24時間以内のデータ）、`1`（昨日のデータ）、`7`（7日以内のデータ）、`28`（28日以内のデータ）、`30`（デフォルト値、30日以内のデータ）、`90`（90日以内のデータ）である。
* `sortMetric`(string)：データをソートするためのメトリックを指定します。 可能な値は、 `abandonmentsMetric`, `completionTimeMetric`, `submissionsMetric`, `viewsMetric`.
* `sortOrder` (string)：結果を表示する順序を指定します。 指定できる値は、 `asc` または `desc`です。

特定のフォームに関するデータを取得する場合、

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/forms/{formId}
```

## ユーザーデータへのアクセス

このコマンドを使用すると、すべての個別データを取得することができます：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals
```

これらのクエリパラメータを利用することができます：

* `channelId` (integer)：Analytics CloudのワークスペースのプロパティIDです。
* `page` (integer)：結果のページ番号。
* `query` （文字列）：個人の `emailAddress`, `firstName`, または `lastName`で検索された任意の単語（複数可） .

特定の個人に関する活動データを取得すること、

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/activities
```

特定の個人に関する興味データを取得するため、

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/interests
```

特定の個人に関するセグメントデータを取得すること、

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/segments
```

## ページデータへのアクセス

このコマンドを使うと、すべてのページデータを取得することができます：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/pages 
```

これらのクエリパラメータを利用することができます：

* `channelId` (integer)：Analytics CloudのワークスペースのプロパティIDです。
* `page` (integer)：結果のページ番号。
* `keywords` (string)：データ内で一致したキーワード。
* `rangeKey` (integer)： データをグループ化するための時間範囲。指定できる値は、`0`（24時間以内のデータ）、`1`（昨日のデータ）、`7`（7日以内のデータ）、`28`（28日以内のデータ）、`30`（デフォルト値、30日以内のデータ）、`90`（90日以内のデータ）である。
* `sortMetric` (string)：データをソートするためのメトリックを指定します。 可能な値は `avgTimeOnPageMetric`, `bounceMetric`, `bounceRateMetric`, `ctaClicksMetric`, `directAccessMetric`, `entrancesMetric`、 `exitRateMetric`, `indirectAccessMetric`, `readsMetric`, `sessionsMetric`, `timeOnPageMetric`, `viewsMetric`, `visitorsMetric`.
* `sortOrder` (string)：結果の表示順を指定します。 指定できる値は、 `asc` または `desc`です。

特定のURLからページデータを取得する場合、

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/pages/{pageURL}
```

## セグメントデータへのアクセス

すべてのSegmentデータを取得する場合は、このコマンドを使用します：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments
```

これらのクエリパラメータを利用することができます：

* `channelId` (integer)：Analytics CloudのワークスペースのプロパティIDです。
* `page` (integer)：結果のページ番号。

特定のセグメントに属するすべての個人を取得する場合、

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments/{segmentsId}/individuals
```

## ウェブコンテンツデータへのアクセス

このコマンドを使うと、すべてのWeb Contentsデータを取得できます：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/web-contents
```

これらのクエリパラメータを利用することができます：

* `channelId` (integer)：Analytics CloudのワークスペースのプロパティIDです。
* `page` (integer)：結果のページ番号。
* `keywords` (string)：データ内で一致したキーワード。
* `rangeKey` (integer)： データをグループ化するための時間範囲。指定できる値は、`0`（24時間以内のデータ）、`1`（昨日のデータ）、`7`（7日以内のデータ）、`28`（28日以内のデータ）、`30`（デフォルト値、30日以内のデータ）、`90`（90日以内のデータ）である。
* `sortMetric`(string)：データをソートするためのメトリックを指定します。 可能な値は、 `viewsMetric`です。
* `sortOrder` (string)：結果を表示する順序を指定します。 指定できる値は、 `asc` または `desc`です。

特定のウェブコンテンツに関するデータを取得すること、

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/web-contents/{webContentsID}
```
