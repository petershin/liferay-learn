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

The first search headless API was released behind a [beta feature flag](../../system-administration/configuring-liferay/feature-flags.md) in Liferay 7.4 U88/GA88. It was moved to a release feature flag in Liferay DXP 2024.Q3/Portal GA125.

| Endpoint           | Liferay Version                   | Feature Status                                                                                            | Feature Flag [Label]                        |
| :----------------- | :-------------------------------- | :-------------------------------------------------------------------------------------------------------- | :------------------------------------------ |
| /portal-search-api | DXP 7.4 U88<br>Portal 7.4 GA88    | [Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)       | &#10004; [Search Headless API (LPS-179669)] |
| /search            | DXP 2024.Q3+<br>Portal 7.4 GA125+ | [Release Feature](../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) | &#10004; [Search Headless API (LPS-179669)] |
| /suggestions       | DXP 2024.Q3+<br>Portal 7.4 GA125+ | Generally Available                                                                                       | &#10008;                                    |

## Related Topics

* [Search Queries and Filters (Java)](search-queries-and-filters.md)
* [Headless Delivery](../../headless-delivery.md)
