---
uuid: 5c79adbb-9deb-459b-9615-71e2941f5cd8
---
# Search Headless APIs

{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

{bdg-secondary}`Available Liferay 7.4 U87+ and GA87+`

You can [search for content](../../using-search/getting-started/searching-for-content.md) from within Liferay, but you can also use Liferay's REST APIs. 

## Enabling Search Headless APIs

```{include} /_snippets/run-liferay-dxp.md
```

To enable the search headless APIs using a [portal property](../../installation-and-upgrades/reference/portal-properties.md), add this to `portal-ext.properties`:

```properties
feature.flag.LPS-179669=true
```

To enable the search headless APIs using an [environment variable](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables), add this to your configuration:

```properties
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER7__NUMBER9__NUMBER6__NUMBER6__NUMBER9_=true
```

## Searching for Sample Content

Follow these steps to generate and search for sample content.

1. Locate your [site ID](../../site-building/site-settings/site-settings-ui-reference.md#site-configuration).

1. Run the following command to generate a blog post. Replace `1234` with your site's ID.

```bash
curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/1234/blog-postings" \
	-d "{\"articleBody\": \"Foo\", \"headline\": \"Able\"}" \
	-u "test@liferay.com:learn" 
```

### Simple Query

Here is a simple query for the keyword `able`:

```bash
curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/portal-search-rest/v1.0/search?search=able" \
	-d "{}" \
	-u "test@liferay.com:learn"
```

The response returns the blog post.

```bash
{
  "items" : [ {
    "dateModified" : "2023-07-20T17:15:32Z",
    "description" : "Foo",
    "itemURL" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35384",
    "score" : 318.95966,
    "title" : "Able"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}%  
```

### Simple Query with Embedded Items

Here is a simple query for the keyword `able` and with a request to return embedded items:

```bash
curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/portal-search-rest/v1.0/search?nestedFields=embedded&&search=able" \
	-d "{}" \
	-u "test@liferay.com:learn"
```

The response returns much more details on the blog post:

```bash
{
  "items" : [ {
    "dateModified" : "2023-07-20T17:15:32Z",
    "description" : "Foo",
    "embedded" : {
      "actions" : { },
      "alternativeHeadline" : "",
      "articleBody" : "Foo",
      "creator" : {
        "additionalName" : "",
        "contentType" : "UserAccount",
        "familyName" : "Test",
        "givenName" : "Test",
        "id" : 20123,
        "name" : "Test Test"
      },
      "customFields" : [ ],
      "dateCreated" : "2023-07-20T17:15:32Z",
      "dateModified" : "2023-07-20T17:15:32Z",
      "datePublished" : "2023-07-20T17:15:00Z",
      "description" : "Foo",
      "encodingFormat" : "text/html",
      "externalReferenceCode" : "f73109ce-8db6-36e3-f2c7-4505c6454ed8",
      "friendlyUrlPath" : "able",
      "headline" : "Able",
      "id" : 35384,
      "keywords" : [ ],
      "numberOfComments" : 0,
      "relatedContents" : [ ],
      "renderedContents" : [ ],
      "siteId" : 20119,
      "taxonomyCategoryBriefs" : [ ]
    },
    "itemURL" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35384",
    "score" : 318.95966,
    "title" : "Able"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 1
}%   
```

## Parameters Reference

Query parameters can be used to further filter the results.

| Parameter | Notes |
| :--- | :--- |
| `entryClassNames` | A comma separated list of `entryClassNames` to be searched. Defaults to all searchable types. |
| `fields` | The fields parameter requests only specific fields to be enumerated in each of the elements in the response. |
| `nestedFields` | Supports `embedded` to get back the embedded with additional data. |
| `restrictFields` | Excludes the given field(s) from being returned. |
| `filter` | Filters across different fields. Supported fields are `groupIds`, `taxonomyCategoryIds`, `keywords`, `dateCreated`, `dateModified`, `creatorId`, `description`, and `title`. |
| `page` | Specify which page to return. |
| `pageSize` | Specify how many items you want per page. |
| `search` | Search by keyword(s). |
| `sort` | Sort by ascending or descending order. |

See [API Query Parameters](../../headless-delivery/consuming-apis/api-query-parameters.md) for more information.
