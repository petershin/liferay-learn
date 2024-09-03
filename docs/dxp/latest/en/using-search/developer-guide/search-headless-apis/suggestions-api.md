---
taxonomy-category-names:
- Search
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: e421b21c-2c47-4d72-84ec-c89b0f1c40ab
---
# Search Suggestions API

{bdg-secondary}`DXP 2024.Q3+/Portal GA125+`

You can return suggestions with the headless API using the `/suggestions` endpoint. This endpoint is used by Liferay's [Search Bar Suggestions](../search-pages-and-widgets/search-bar-suggestions.md) feature. There are two suggestions contributors available: the `basic` contributor for returning suggestions based on Liferay's standard indexer based search, and the `sxpBlueprint` contributor for returning suggestions based on a [search blueprint](../search-pages-and-widgets/search-bar-suggestions/search-bar-suggestions-blueprints.md).


Here's an example request made using cURL:
```bash
curl \
	-H "Content-Type: application/json" \
	-X POST \
  "http://localhost:8080/o/portal-search-rest/v1.0/suggestions?currentURL=http%3A%2F%2Flocalhost%3A8080&destinationFriendlyURL=http%3A%2F%2Flocalhost%3A8080%2Fweb%2Fguest%2Fsearch&plid=4&search=able" \
  --data-raw '[ { "attributes": {}, "contributorName": "basic", "displayGroupName": "search", "size": 5 } ]' \
	-u "test@liferay.com:learn"
```

You can configure the service access policy or disable the suggestions endpoint entirely. See [Configuring Search Bar Suggestions](../search-pages-and-widgets/search-bar-suggestions/configuring-search-bar-suggestions.md) for more information.

## Suggestions Query Parameters

| Parameter | Notes |
| :--- | :--- |
| `currentURL` | :--- |
| `destinationFriendlyURL` | :--- |
| `plid` | Set the portal layout ID that identifies a page across virtual instances. |
| `scope` | Specify a list of sites (by ID or ERC) to search. You can mix IDs and ERCs in the same request. |
| `search` | Search by keyword(s). |

## Suggestions Request Body

| Property | Description |
| :--- | :--- |
| `attributes` | Set available search context attributes to configure a search blueprint or enable empty search. See [Available Search Request Attributes for details](#available-search-request-attributes). |
| `contributorName` | Set the contributor that provides the search query (`basic` or `sxpBlueprint`). |
| `displayGroupName` | Se the language key to use as a heading in the UI. | 
| `size` | Set the maximum number of results to return from the endpoint. |

To search with a blueprint, you can use this request body syntax:

```json
[{
  "attributes": {
    "search.experiences.blueprint.external.reference.code": ""
  },
  "contributorName": "sxpBlueprint",
  "displayGroupName": "suggestions",
  "size": 5
}]
```

The available suggestions request attributes are for configuring a search blueprint. Always use the `sxpBlueprint` contributor with these attributes.

| Property | Description |
| :--- | :--- |
| DXP Only<br />`search.experiences.blueprint.external.reference.code` | (Preferred) Set a [search blueprint](../liferay-enterprise-search/search-experiences/search-blueprints.md) to control the search query and configuration. |
| DXP Only<br />`search.experiences.blueprint.id` | Set a [search blueprint](../liferay-enterprise-search/search-experiences/search-blueprints.md) to control the search query and configuration.|
| DXP Only<br />`search.experiences.ip.address` | Set automatically. Only use this to test blueprints [with geolocation](../liferay-enterprise-search/search-experiences/search-blueprints/personalizing-the-search-experience.md#building-a-blueprint-to-personalize-search-results) configured, to simulate different locations. |
| DXP Only<br />`search.experiences.scope.group.id` | Set this when your blueprint uses an [element](../liferay-enterprise-search/search-experiences/search-blueprints/search-blueprints-elements-reference.md) that requires it: Limit Search to the Current Site, Boost Contents in a Category for a User Segment, or Staging Aware. |

## Related Topics

* [Searching for Content](../../getting-started/searching-for-content.md)
* [Headless Delivery](../../../headless-delivery.md)
* [Search Bar Suggestions](../../search-pages-and-widgets/search-bar-suggestions.md)
