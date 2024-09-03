---
taxonomy-category-names:
- Search
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: a40fe992-790a-45d0-a115-cac2e012e8cf
---
# Search API

You can [search for content](../../getting-started/searching-for-content.md) from a Liferay search page, but you can also use the `search` API endpoint. If you're running Liferay locally, while logged in you can visit <http://localhost:8080/o/api?endpoint=http://localhost:8080/o/search/v1.0/openapi.json> to explore the API.

!!! note
    In the beta release of the headless search API, the endpoint was at `/portal-search-api`. Beginning in Liferay 2024.Q3/Portal 7.4 GA125, the endpoint is moved to `/search`. The endpoint is backwards compatible, so existing calls to `/portal-search-api` will continue to work.

### Searching for Sample Content

Follow these steps to generate and search for sample content. The commands below work with basic authentication and assume that you are running Liferay locally at <http://localhost:8080>, using an administrator with the email `test@liferay.com` and the password `learn`.

1. Locate your [site ID](../../../site-building/site-settings/site-settings-ui-reference.md#site-configuration) or retrieve it with the following command: 

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
      --data-raw '{"articleBody": "Foo", "headline": "Able"}' \
      -u "test@liferay.com:learn" 
   ```

#### Simple Query

Here is a simple query for the keyword `able`:

```bash
curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/search/v1.0/search?search=able" \
	-d "{}" \
	-u "test@liferay.com:learn"
```

The response returns a search result with information about the blog post.

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

#### Simple Query with Embedded Items

To return not only the search result, but the returned entity's fields according to its own API schema, set the `nestedField` parameter to `embedded`. This query for the keyword `able` also requests embedded items:

```bash
curl \
	-H "Content-Type: application/json" \
	-X POST \
	"http://localhost:8080/o/search/v1.0/search?nestedFields=embedded&&search=able" \
	-d "{}" \
	-u "test@liferay.com:learn"
```

The response returns many more details on the blog post:

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

### Search Parameters

Query parameters can be used to further filter the results.

| Parameter | Notes |
| :--- | :--- |
| `entryClassNames` | A comma separated list of `entryClassNames` to be searched. Defaults to all searchable types. |
| `fields` | The fields parameter requests only specific fields to be enumerated in each of the elements in the response. |
| `nestedFields` | Supports `embedded` to get back nested data. |
| `restrictFields` | Excludes the given field(s) from being returned. |
| `filter` | Filters across different fields. Supported fields are `groupIds`, `taxonomyCategoryIds`, `keywords`, `dateCreated`, `dateModified`, `creatorId`, and `title`. For more filtering options, use a search blueprint (DXP subscription).|
| `page` | Specify which page to return. |
| `pageSize` | Specify how many items you want per page. |
| `scope` | Specify a list of sites (by ID or ERC) to search. You can mix IDs and ERCs in the same request. |
| `search` | Search by keyword(s). |
| `sort` | Sort by ascending or descending order. |

!!! warning
    [Search Blueprints](../../liferay-enterprise-search/search-experiences/search-blueprints.md) can also add sort configurations to the search page. Make sure you understand [how these blueprint-added sorts](../../liferay-enterprise-search/search-experiences/search-blueprints/sorting-results-in-a-search-blueprint.md#search-blueprints-versus-the-headless-api) interact with the `sort` parameter if you plan to use both.

See [API Query Parameters](../../../headless-delivery/consuming-apis/api-query-parameters.md) for more information.

### Search Request Body

Empty requests are allowed (e.g., specify `{}` as the request body), but there are two properties available for influencing the response:

| Property | Description |
| :--- | :--- |
| `attributes` | Set available search context attributes to configure a search blueprint or enable empty search. See [Available Search Request Attributes for details](#available-search-request-attributes). |
| `facetConfiguration` | Set the facet configuration to return facets in the response. See [Adding Facet Configurations to the Request](#adding-facet-configurations-to-the-request). |

#### Adding Attributes to the Search Request

To search with a blueprint, use this request body syntax:

```json
{
  "attributes": {
    "search.experiences.blueprint.external.reference.code": ""
  }
}
```

#### Available Search Request Attributes

You can set these `attributes` into the request:

| Property | Description |
| :--- | :--- |
| `search.empty.search` | Set this to true to return results even if the `search` parameter is omitted from the request. |
| DXP Only<br />`search.experiences.blueprint.external.reference.code` | (Preferred) Set a [search blueprint](../../liferay-enterprise-search/search-experiences/search-blueprints.md) to control the search query and configuration. |
| DXP Only<br />`search.experiences.blueprint.id` | Set a [search blueprint](../../liferay-enterprise-search/search-experiences/search-blueprints.md) to control the search query and configuration.|
| DXP Only<br />`search.experiences.ip.address` | Set automatically. Only use this to test blueprints [with geolocation](../../liferay-enterprise-search/search-experiences/search-blueprints/personalizing-the-search-experience.md#building-a-blueprint-to-personalize-search-results) configured, to simulate different locations. |
| DXP Only<br />`search.experiences.scope.group.id` | Set this when your blueprint uses an [element](../../liferay-enterprise-search/search-experiences/search-blueprints/search-blueprints-elements-reference.md) that requires it: Limit Search to the Current Site, Boost Contents in a Category for a User Segment, or Staging Aware. |

#### Adding Facet Configurations to the Request

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
| `aggregationName` | Choose a unique name for the aggregation. This is required to distinguish between instances of the same type (i.e., with the same `name` property). |
| `attributes` | Some facets require additional attributes.<br /><br />**`field`:** The `custom`, `date-range`, and `nested` facets require a String attribute called `field` to set the field to aggregate results by.<br />**`format`** and **`ranges`:** The `date-range` facet also requires a `format` String to specify the date format (e.g., `yyyyMMddHHmmss`) and a `ranges` object array to provide the ranges.<br />**`filterField`**, **`filterValue`**, and **`path`:** The `nested` facet requires a `filterfield` String, a `filtervalue` String, and a `path` String.<br />**`vocabularyIds`:** The `vocabulary` facet requires a String array of `vocabularyIds`. |
| `frequencyThreshold` | Set the minimum frequency required for terms to appear in the list of facet terms. |
| `maxTerms` | Set the maximum number of facet terms to display, regardless of how many matching terms are found for the facet. |
| `name` | Set the type of facet:<br />`category`<br />`custom`<br />`date-range`<br />`folder`<br />`nested`<br />`site`<br />`tag`<br />`type`<br />`vocabulary`<br />`user` |
| `values` | Post filter the results by selecting values. This is like clicking facet terms in the facet widget. |

!!! note
    The `custom` facet recognizes top level fields. Objects and web content structure fields are indexed as nested fields, so you must choose the `nested` facet for these entities.

For example, here's a `date-range` facet's `ranges` attribute:

```json
{
  "ranges": [
    {
      "label": "range-1",
      "range": "[20220411085757 TO 20230413075757]"
    },
    {
      "label": "range-2",
      "range": "[20230409085757 TO 20230413075757]"
    }
  ]
}
```

### Aggregations and Search Facets in the Response

You can see [aggregations](ES) and [search facets](../../search-pages-and-widgets/search-facets.md) in the API response. To see aggregations,

1. Add [aggregations to a search blueprint](../../liferay-enterprise-search/search-experiences/search-blueprints/search-blueprints-configuration-reference.md#aggregation-configuration).
1. Set the attribute `search.experiences.blueprint.external.reference.code` in you search request.

Search facets are returned if you add a [facet configuration](#adding-facet-configurations-to-the-request) to the request. For example, this request body asks for a tag facet:

```json
{
  "facetConfigurations": [
    {
      "name": "tag"
    }
  ]
}
```

In the response, the returned search facet looks like this:

```json
"searchFacets": {
  "tag": [
    {
      "displayName": "business",
      "term": "business",
      "frequency": 26
    },
    {
      "displayName": "fun",
      "term": "fun",
      "frequency": 1
    }
  ]
}
```

## Enabling Guest Access to the Search API

To enable guest access to the API, [create a new service access policy](../../../installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies.md#creating-a-service-access-policy) as follows:

| Field | Entry |
| :--- | :--- |
| Name | SEARCH |
| Enabled | Checked |
| Default | Checked |
| Title | Public Access to Search API |
| Service Class Name | `com.liferay.portal.search.rest.internal.resource.v1_0.SearchResultResourceImpl` |
| Method Name | `postSearchPage` |

## Related Topics
