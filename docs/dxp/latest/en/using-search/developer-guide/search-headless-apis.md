---
toc:
  - ./search-headless-apis/search-api.md
  - ./search-headless-apis/suggestions-api.md
taxonomy-category-names:
- Search
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 5c79adbb-9deb-459b-9615-71e2941f5cd8
---
# Search Headless APIs

You can search with headless APIs using the endpoints at `/o/search`.

## Search Headless APIs Availability

The first search headless endpoint, `/portal-search-rest`, was released behind a [beta feature flag](../../system-administration/configuring-liferay/feature-flags.md) in Liferay 7.4 U88/GA88. It was renamed to `search/` and moved to a release feature flag in Liferay DXP 2024.Q3/Portal GA125.

| API                                    | Liferay Version                            | Feature Status                                                                                            |
| :------------------------------------- | :----------------------------------------- | :-------------------------------------------------------------------------------------------------------- | -------- |
| /o/search/v1.0/search                  | DXP 2024.Q3+<br>Portal 7.4 GA125+          | [Release Feature](../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) |
| /o/search/v1.0/suggestions      | DXP 2024.Q3+<br>Portal 7.4 GA125+          | Generally Available                                                                                       |
| /o/portal-search-rest/v1.0/search      | DXP 7.4 U88-2024.Q2<br>Portal 7.4 GA88-124 | [Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)       | &#10004; |
| /o/portal-search-rest/v1.0/suggestions | DXP 7.4 U36-2024.Q2<br>Portal 7.4 GA36-124 | Generally Available                                                                                       |

## Related Topics

* [Search Queries and Filters (Java)](search-queries-and-filters.md)
* [Headless Delivery](../../headless-delivery.md)
