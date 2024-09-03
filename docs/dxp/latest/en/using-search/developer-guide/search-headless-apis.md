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

{bdg-link-primary}`[Release Feature](../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags)`

{bdg-secondary}`7.4 U88+ and GA88+`

You can search with headless APIs using the endpoints at `/o/search`.

## Enabling Search Headless APIs

To enable the search headless API's endpoints, set its [feature flag](../../system-administration/configuring-liferay/feature-flags.md) to `true` with the Instance Settings &rarr; Feature Flags application or a portal property. To enable using a [portal properties file](../../installation-and-upgrades/reference/portal-properties.md), add this to `portal-ext.properties`:

```properties
feature.flag.LPS-179669=true
```

To enable using an [environment variable](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables), add this to your configuration:

```properties
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER7__NUMBER9__NUMBER6__NUMBER6__NUMBER9_=true
```

!!! note 
    The search headless API's `/search` POST endpoint moved from [beta feature flag to release feature flag](#search-headless-api-availability) in Liferay 7.4 2024.Q3/GA125.

## Search Headless API Availability

The search headless API was released behind a [beta feature flag](../../system-administration/configuring-liferay/feature-flags.md) in Liferay 7.4 U88/GA88. It was moved to a release feature flag in Liferay DXP 2024.Q3/Portal GA125.

| Liferay Version    | Feature Status                                                                                              | Feature Flag [Label]                         |
|:-------------------|:------------------------------------------------------------------------------------------------------------|:---------------------------------------------|
| DXP 7.4 U88<br>Portal 7.4 GA88   | [Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) | &#10004; [Search Headless API (LPS-179669)] |
| DXP 2024.Q3+<br>Portal 7.4 GA125+ |  [Release Feature](../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags)                                                                                                         | &#10004; [Search Headless API (LPS-179669)]                                     |

## Related Topics

* [Search Queries and Filters (Java)](search-queries-and-filters.md)
* [Headless Delivery](../../headless-delivery.md)
