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

1. Download and unzip [liferay-b9f3.zip](./liferay-b9f3.zip).

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/using-search/developer-guide/liferay-b9f3.zip -O
   ```

   ```bash
   unzip liferay-b9f3.zip
   ```

   Navigate into the `/liferay-b9f3/` folder.

1. Locate the [site ID](../../site-building/site-settings/site-settings-ui-reference.md#site-configuration) for your default site and your global site.

1. Run the `populate_b9f3.sh` script. Replace `1234` with your default site ID and `5678` with your global site ID.

   ```bash
   ./curl/populate_b9f3.sh 1234 5678
   ```

### Simple Query

Here is a simple query for the keyword `baker`:

```bash
curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/portal-search-rest/v1.0/search?search=baker" \
	-d "{}" \
	-u "test@liferay.com:learn"
```

The response returns the search results with two documents.

```bash
{
  "items" : [ {
    "dateModified" : "2023-07-19T21:08:29Z",
    "description" : "Baker",
    "itemURL" : "http://localhost:8080/o/headless-delivery/v1.0/documents/35137",
    "score" : 184.16985,
    "title" : "Able Document"
  }, {
    "dateModified" : "2023-07-19T21:08:32Z",
    "description" : "Baker",
    "itemURL" : "http://localhost:8080/o/headless-delivery/v1.0/documents/35151",
    "score" : 184.16985,
    "title" : "Able Document"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 2
}%  
```

### Simple Query with Embedded Items

Here is a simple query for the keyword `baker` and with a request to return embedded items:

```bash
curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/portal-search-rest/v1.0/search?nestedFields=embedded&&search=baker" \
	-d "{}" \
	-u "test@liferay.com:learn"
```

The response returns much more details on the two documents:

```bash
{
  "items" : [ {
    "dateModified" : "2023-07-19T21:08:29Z",
    "description" : "Baker",
    "embedded" : {
      "actions" : { },
      "adaptedImages" : [ ],
      "contentUrl" : "/documents/20119/0/b9f3.txt/9e95326a-0b38-fd88-ee50-b5aab5fccfac?version=1.0&t=1689800909228&download=true",
      "creator" : {
        "additionalName" : "",
        "contentType" : "UserAccount",
        "familyName" : "Test",
        "givenName" : "Test",
        "id" : 20123,
        "name" : "Test Test"
      },
      "customFields" : [ ],
      "dateCreated" : "2023-07-19T21:08:29Z",
      "dateModified" : "2023-07-19T21:08:29Z",
      "description" : "Baker",
      "documentFolderId" : 0,
      "documentType" : {
        "availableLanguages" : [ ],
        "contentFields" : [ ],
        "description" : "",
        "name" : "Basic Document"
      },
      "encodingFormat" : "text/plain",
      "externalReferenceCode" : "9e95326a-0b38-fd88-ee50-b5aab5fccfac",
      "fileExtension" : "txt",
      "fileName" : "b9f3.txt",
      "id" : 35137,
      "keywords" : [ ],
      "numberOfComments" : 0,
      "relatedContents" : [ ],
      "renderedContents" : [ ],
      "siteId" : 20119,
      "sizeInBytes" : 13,
      "taxonomyCategoryBriefs" : [ ],
      "title" : "Able Document"
    },
    "itemURL" : "http://localhost:8080/o/headless-delivery/v1.0/documents/35137",
    "score" : 184.16985,
    "title" : "Able Document"
  }, {
    "dateModified" : "2023-07-19T21:08:32Z",
    "description" : "Baker",
    "embedded" : {
      "actions" : { },
      "adaptedImages" : [ ],
      "contentUrl" : "/documents/20119/35148/b9f3.txt/62c3475f-2344-eaae-adbb-5ea720af25e7?version=1.0&t=1689800912211&download=true",
      "creator" : {
        "additionalName" : "",
        "contentType" : "UserAccount",
        "familyName" : "Test",
        "givenName" : "Test",
        "id" : 20123,
        "name" : "Test Test"
      },
      "customFields" : [ ],
      "dateCreated" : "2023-07-19T21:08:32Z",
      "dateModified" : "2023-07-19T21:08:32Z",
      "description" : "Baker",
      "documentFolderId" : 35148,
      "documentType" : {
        "availableLanguages" : [ ],
        "contentFields" : [ ],
        "description" : "",
        "name" : "Basic Document"
      },
      "encodingFormat" : "text/plain",
      "externalReferenceCode" : "62c3475f-2344-eaae-adbb-5ea720af25e7",
      "fileExtension" : "txt",
      "fileName" : "b9f3.txt",
      "id" : 35151,
      "keywords" : [ ],
      "numberOfComments" : 0,
      "relatedContents" : [ ],
      "renderedContents" : [ ],
      "siteId" : 20119,
      "sizeInBytes" : 13,
      "taxonomyCategoryBriefs" : [ ],
      "title" : "Able Document"
    },
    "itemURL" : "http://localhost:8080/o/headless-delivery/v1.0/documents/35151",
    "score" : 184.16985,
    "title" : "Able Document"
  } ],
  "lastPage" : 1,
  "page" : 1,
  "pageSize" : 20,
  "totalCount" : 2
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
