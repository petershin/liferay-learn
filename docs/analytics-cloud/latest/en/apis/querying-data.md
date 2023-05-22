---
uuid: bd2dad66-a3dc-47c2-b5d7-91a0c7fcadce
---
# Querying Data

The root endpoint of Liferay Analytics Cloud is <https://analytics.liferay.com/api/reports>. You can get the list of all data types endpoints by requesting a GET to the above URL. Try with curl

```
curl -L -H "Authorization: Bearer {token}" https://analytics.liferay.com/api/reports
```

These response should be returned:

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

From here you can call different APIs to get data for the different data types.

All the server responses to the analytics data follow the same data structure. The response is a paged results of entities computed by Liferay Analytics Cloud. By default, each page will contain 20 elements and it can be navigated by replacing the page query parameter. Total shows the total number of available elements.

## Accessing Blogs Data

Use this command to retrieve all Blogs data:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/blogs
```

These query parameters are available:

* `channelId` (integer): The Analytics Cloud workspace property ID.
* `page` (integer): The results page number.
* `keywords` (string): The keyword(s) matched within the asset's title.
* `rangeKey` (integer): The time range for grouping the data. Possible values are `0` (data from the last 24 hours), `1` (data from yesterday), `7` (data from the last 7 days), `28` (data from the last 28 days), `30` (default value, data from the last 30 days), `90` (data from the last 90 days).
* `sortMetric`(string): The metric for sorting the data. Possible values are `clicksMetric`, `commentsMetric`, `ratingsMetric`, `readingTimeMetric`, and `viewsMetric`.
* `sortOrder` (string): The order for displaying the results. Possible values are `asc` or `desc`.

To retrieve data about a specific blog post:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/blogs/{blogID}
```

## Accessing Documents and Media Data

Use this command to retrieve all Documents and Media data:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/documents-and-media
```

These query parameters are available:

* `channelId` (integer): The Analytics Cloud workspace property ID.
* `page` (integer): The results page number.
* `keywords` (string): The keyword(s) matched within the data.
* `rangeKey` (integer): The time range for grouping the data. Possible values are `0` (data from the last 24 hours), `1` (data from yesterday), `7` (data from the last 7 days), `28` (data from the last 28 days), `30` (default value, data from the last 30 days), `90` (data from the last 90 days).
* `sortMetric`(string): The metric for sorting the data. Possible values are `commentsMetric`, `downloadsMetric`, `previewsMetric`, `ratingsMetrics`.
* `sortOrder` (string): The order for displaying the results. Possible values are `asc` or `desc`.

To retrieve data about a specific document:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/documents-and-media/{documentId}
```

## Accessing Forms Data

Use this command to retrieve all Forms data:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/forms
```

These query parameters are available:

* `channelId` (integer): The Analytics Cloud workspace property ID.
* `page` (integer): The results page number.
* `keywords` (string): The keyword(s) matched within the data.
* `rangeKey` (integer): The time range for grouping the data. Possible values are `0` (data from the last 24 hours), `1` (data from yesterday), `7` (data from the last 7 days), `28` (data from the last 28 days), `30` (default value, data from the last 30 days), `90` (data from the last 90 days).
* `sortMetric`(string): The metric for sorting the data. Possible values are `abandonmentsMetric`, `completionTimeMetric`, `submissionsMetric`, `viewsMetric`.
* `sortOrder` (string): The order for displaying the results. Possible values are `asc` or `desc`.

To retrieve data about a specific form:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/forms/{formId}
```

## Accessing Individuals Data

Use this command to retrieve all Individuals data:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals
```

These query parameters are available:

* `channelId` (integer): The Analytics Cloud workspace property ID.
* `page` (integer): The results page number.
* `query` (string): Any word(s) searched for in an individual's `emailAddress`, `firstName`, or `lastName`.

To retrieve activities data on a specific individual:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/activities
```

To retrieve interests data on a specific individual:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/interests
```

To retrieve segment data on a specific individual:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{individualsId}/segments
```

## Accessing Pages Data

Use this command to retrieve all Pages data:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/pages 
```

These query parameters are available:

* `channelId` (integer): The Analytics Cloud workspace property ID.
* `page` (integer): The results page number.
* `keywords` (string): The keyword(s) matched within the data.
* `rangeKey` (integer): The time range for grouping the data. Possible values are `0` (data from the last 24 hours), `1` (data from yesterday), `7` (data from the last 7 days), `28` (data from the last 28 days), `30` (default value, data from the last 30 days), `90` (data from the last 90 days).
* `sortMetric` (string): The metric for sorting the data. Possible values are `avgTimeOnPageMetric`, `bounceMetric`, `bounceRateMetric`, `ctaClicksMetric`, `directAccessMetric`, `entrancesMetric`, `exitRateMetric`, `indirectAccessMetric`, `readsMetric`, `sessionsMetric`, `timeOnPageMetric`, `viewsMetric`, `visitorsMetric`.
* `sortOrder` (string): The order to display the results. Possible values are `asc` or `desc`.

To retrieve page data from a specific URL:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/pages/{pageURL}
```

## Accessing Segments Data

Use this command to retrieve all Segments data:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments
```

These query parameters are available:

* `channelId` (integer): The Analytics Cloud workspace property ID.
* `page` (integer): The results page number.

To retrieve all the individuals of a specific segment:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments/{segmentsId}/individuals
```

## Accessing Web Contents Data

Use this command to retrieve all Web Contents data:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/web-contents
```

These query parameters are available:

* `channelId` (integer): The Analytics Cloud workspace property ID.
* `page` (integer): The results page number.
* `keywords` (string): The keyword(s) matched within the data.
* `rangeKey` (integer): The time range for grouping the data. Possible values are `0` (data from the last 24 hours), `1` (data from yesterday), `7` (data from the last 7 days), `28` (data from the last 28 days), `30` (default value, data from the last 30 days), `90` (data from the last 90 days).
* `sortMetric`(string): The metric for sorting the data. The possible value is `viewsMetric`.
* `sortOrder` (string): The order for displaying the results. Possible values are `asc` or `desc`.

To retrieve data about a specific web content:

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/web-contents/{webContentsID}
```
