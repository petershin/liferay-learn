---
uuid: 5c79adbb-9deb-459b-9615-71e2941f5cd8
---
# Search Headless API

{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

{bdg-secondary}`Available Liferay 7.4 U87+ and GA87+`

You can [search for content](../../using-search/getting-started/searching-for-content.md) from a Liferay search page, but you can also use the `portal-search-rest` API endpoint. If you're running Liferay locally, while logged in you can visit <http://localhost:8080/o/api?endpoint=http://localhost:8080/o/portal-search-rest/v1.0/openapi.json> to explore the API.

```{important}
When you search in the UI, the search engine documents are returned in the response. The API response instead returns each entity type according to it's own API's response schema.
```

## Enabling Search Headless APIs

To enable the search headless APIs, set its [beta feature flag](../../system-administration/configuring-liferay/feature-flags.md) to `true`. To enable using a [portal property](../../installation-and-upgrades/reference/portal-properties.md), add this to `portal-ext.properties`:

```properties
feature.flag.LPS-179669=true
```

To enable using an [environment variable](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables), add this to your configuration:

```properties
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER7__NUMBER9__NUMBER6__NUMBER6__NUMBER9_=true
```

To enable guest access to the API, [create a new service access policy](../../installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies.md#creating-a-service-access-policy) as follows:

| Field | Entry |
| :--- | :--- |
| Name | SEARCH |
| Enabled | Checked |
| Default | Checked |
| Title | Public Access to Search API |
| Service Class Name | `com.liferay.portal.search.rest.internal.resource.v1_0.SearchResultResourceImpl` |
| Method Name | `postSearchPage` |

## Searching for Sample Content

Follow these steps to generate and search for sample content. The commands below work with basic authentication and assume that you are running Liferay locally at <http://localhost:8080>, using an administrator with the email `test@liferay.com` and the password `learn`.

1. Locate your [site ID](../../site-building/site-settings/site-settings-ui-reference.md#site-configuration) or retrieve it with the following command: 

   ```bash
   curl \
       "http://localhost:8080/o/headless-admin-user/v1.0/sites/by-friendly-url-path/guest" \
       -u "test@liferay.com:learn"
   ```

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

You can build more complex requests using the supported parameters and request body properties.

## Search Parameters

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

## Search Request Body

Empty requests are allowed (e.g., specify `{}` as the request body), but there are two properties available for influencing the response:

| Property | Description |
| :--- | :--- |
| `attributes` | Set search context attributes. Set the `search.experiences.blueprint.external.reference.code` (preferred) or the `search.experiences.blueprint.id` to set a [search blueprint](../liferay-enterprise-search/search-experiences/search-blueprints.md). Set `search.empty.search` to true to return results even if the `search` parameter is omitted from the request. |
| `facetConfiguration` | Set the facet configuration to return facets in the response.|

### Adding Attributes to the Request

To search with a blueprint, use this request body syntax:

```json
{
  "attributes": {
    "search.experiences.blueprint.external.reference.code": ""
  }
}
```

### Adding Facet Configurations to the Request

To search with a facet configuration, use this request body syntax:
```json
{
  "facetConfigurations": [
    {
      "aggregationName": "",
      "attributes": {},
      "frequencyThreshold": "",
      "maxTerms": "",
      "name": "",
      "values": []
    }
  ]
}
```

A facet configuration can have several properties:

| Property | Description |
| :--- | :--- |
| `aggregationName` | Choose a unique name for the aggregation. This is required if multiple instances of the same type (set in the `name` property) are added. |
| `attributes` | Some facets require additional attributes. <!-- How will anyone know what these are if we don't document them? --> |
| `frequencyThreshold` | Set the minimum frequency required for terms to appear in the list of facet terms. |
| `maxTerms` | Set the maximum number of facet terms to display, regardless of how many matching terms are found for the facet. |
| `name` | Set the type of facet: `category`, `custom`, `date-range`, `folder`, `nested`, `site`, `tag`, `type`, or `user`. See the [Search Facets](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/search-facets) documentation for more information on each type.
| `values` | Post filter the results by selecting values. This is like clicking facet terms in the facet widget. |

