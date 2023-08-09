# データのクエリ

Liferay Analytics Cloudのルートエンドポイントは、 <https://analytics.liferay.com/api/reports>です。 上記のURLにGETをリクエストすることで、すべてのデータタイプのエンドポイントのリストを取得することができます。 curlで試します。

```
curl -i -L -H "Authorization: Bearer {token}" https://analytics.liferay.com/api/reports
```

この応答が返されるはずである：

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

ここからさまざまなAPIを呼び出して、さまざまなデータタイプのデータを取得することができる。

アナリティクスデータに対するサーバーの応答は、すべて同じデータ構造に従っています。 レスポンスは、Liferay Analytics Cloudによって計算されたエンティティのページングされた結果です。 デフォルトでは、各ページには20の要素が含まれています。 ページクエリーパラメーターを置き換えることでナビゲートできる。 合計は利用可能な要素の総数を示す。

## ブログデータへのアクセス

すべてのブログデータを取得するには、このコマンドを使用します：

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/blogs
```

これらのクエリーパラメーターが利用できる：

* `channelId` (整数)：Analytics Cloud ワークスペースのプロパティ ID。
* `page` (整数)：結果のページ番号。
* `keywords` (文字列)：アセットのタイトルにマッチするキーワード。
* rangeKey` (整数)： データをグループ化する時間範囲。0` (直近24時間のデータ)、`1` (昨日のデータ)、`7` (直近7日間のデータ)、`28` (直近28日間のデータ)、`30` (デフォルト値、直近30日間のデータ)、`90` (直近90日間のデータ) が使用可能。
* sortMetric`(string)： データをソートするためのメトリック。指定できる値は `clicksMetric`、`commentsMetric`、`ratingsMetric`、`readingTimeMetric`、`viewsMetric` である。
* `sortOrder` (文字列)： 結果を表示する順番。指定できる値は `asc` または `desc` である。

特定のブログ記事に関するデータを取得する、

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/blogs/{blogID}
```

## ドキュメントとメディア・データへのアクセス

すべてのDocumentsとMediaデータを取得するには、このコマンドを使用します：

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/documents-and-media
```

これらのクエリーパラメーターが利用できる：

* `channelId` (整数)：Analytics Cloud ワークスペースのプロパティ ID。
* `page` (整数)：結果のページ番号。
* `keywords` (文字列)：データ内でマッチしたキーワード。
* rangeKey` (整数)： データをグループ化する時間範囲。0` (直近24時間のデータ)、`1` (昨日のデータ)、`7` (直近7日間のデータ)、`28` (直近28日間のデータ)、`30` (デフォルト値、直近30日間のデータ)、`90` (直近90日間のデータ) が使用可能。
* `sortMetric`(string)： データをソートするためのメトリック。指定できる値は `commentsMetric`, `downloadsMetric`, `previewsMetric`, `ratingsMetric` である。
* `sortOrder` (文字列)： 結果を表示する順番。指定できる値は `asc` または `desc` である。

特定の文書に関するデータを取得する、

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/documents-and-media/{documentId}
```

## フォームデータへのアクセス

すべてのフォームデータを取得するには、このコマンドを使用します：

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/forms
```

これらのクエリーパラメーターが利用できる：

* `channelId` (整数)：Analytics Cloud ワークスペースのプロパティ ID。
* `page` (整数)：結果のページ番号。
* `keywords` (文字列)：データ内でマッチしたキーワード。
* rangeKey` (整数)： データをグループ化する時間範囲。0` (直近24時間のデータ)、`1` (昨日のデータ)、`7` (直近7日間のデータ)、`28` (直近28日間のデータ)、`30` (デフォルト値、直近30日間のデータ)、`90` (直近90日間のデータ) が使用可能。
* `sortMetric`(string)： データをソートするためのメトリック。指定できる値は `abandonmentsMetric`、`completionTimeMetric`、`submissionsMetric`、`viewsMetric` である。
* `sortOrder` (文字列)： 結果を表示する順番。指定できる値は `asc` または `desc` である。

特定のフォームに関するデータを取得する、

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/forms/{formId}
```

## ユーザーデータへのアクセス

このコマンドを使用して、すべての個人データを取得する：

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals
```

これらのクエリーパラメーターが利用できる：

* `channelId` (整数)：Analytics Cloud ワークスペースのプロパティ ID。
* `page` (整数)：結果のページ番号。
* `query` (文字列)：個人の `emailAddress`, `firstName`, または `lastName`で検索された単語。

特定の個人に関する活動データを検索する、

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/activities
```

特定の個人に関する利益データを検索する、

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/interests
```

特定の個人に関するセグメントデータを検索する、

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/segments
```

## ページ・データへのアクセス

このコマンドを使用して、すべてのページデータを取得する：

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/pages 
```

これらのクエリーパラメーターが利用できる：

* `channelId` (整数)：Analytics Cloud ワークスペースのプロパティ ID。
* `page` (整数)：結果のページ番号。
* `keywords` (文字列)：データ内でマッチしたキーワード。
* rangeKey` (整数)： データをグループ化する時間範囲。0` (直近24時間のデータ)、`1` (昨日のデータ)、`7` (直近7日間のデータ)、`28` (直近28日間のデータ)、`30` (デフォルト値、直近30日間のデータ)、`90` (直近90日間のデータ) が使用可能。
* `sortMetric` (文字列)： データをソートするためのメトリック。指定できる値は `avgTimeOnPageMetric`, `bounceMetric`, `bounceRateMetric`, `ctaClicksMetric`, `directAccessMetric`, `entrancesMetric`, `exitRateMetric`, `indirectAccessMetric`, `readsMetric`, `sessionsMetric`, `timeOnPageMetric`, `viewsMetric`, `visitorsMetric` である。
* `sortOrder` (string)： 結果を表示する順番。指定できる値は `asc` または `desc` である。
特定のURLからページデータを取得する、

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/pages/{pageURL}
```

## セグメントデータへのアクセス

すべてのセグメントデータを取得するには、このコマンドを使用します：

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments
```

これらのクエリーパラメーターが利用できる：

* `channelId` (整数)：Analytics Cloud ワークスペースのプロパティ ID。
* `page` (整数)：結果のページ番号。

特定のセグメントに属するすべての個人を検索する、

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments/{segmentsId}/individuals
```

## ウェブ・コンテンツ・データへのアクセス

すべてのウェブコンテンツのデータを取得するには、このコマンドを使用します：

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/web-contents
```

これらのクエリーパラメーターが利用できる：

* `channelId` (整数)：Analytics Cloud ワークスペースのプロパティ ID。
* `page` (整数)：結果のページ番号。
* `keywords` (文字列)：データ内でマッチしたキーワード。
* rangeKey` (整数)： データをグループ化する時間範囲。0` (直近24時間のデータ)、`1` (昨日のデータ)、`7` (直近7日間のデータ)、`28` (直近28日間のデータ)、`30` (デフォルト値、直近30日間のデータ)、`90` (直近90日間のデータ) が使用可能。
* `sortMetric`(string)： データをソートするためのメトリック。指定できる値は `viewsMetric` である。
* `sortOrder` (文字列)： 結果を表示する順番。指定できる値は `asc` または `desc` である。

特定のウェブコンテンツに関するデータを取得する、

```
curl -i -L -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/web-contents/{webContentsID}
```
