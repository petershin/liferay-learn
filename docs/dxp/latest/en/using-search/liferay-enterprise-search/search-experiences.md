---
toc:
  - ./search-experiences/search-blueprints.md
  - ./search-experiences/semantic-search.md
taxonomy-category-names:
- Search
- Liferay Enterprise Search
- Search Experiences and Blueprints
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 4955593b-f8dd-4b87-bffa-6cb10c97e9e2
---
# Search Experiences

{bdg-primary}`[LES Subscription](./activating-liferay-enterprise-search.md)`
{bdg-secondary}`DXP 7.4 U5+; 7.3 U6+`

The Liferay Enterprise Search Experiences app includes a suite of features granting fine-grained control over the end user's search experience.

## Search Blueprints

[Search Blueprints](./search-experiences/search-blueprints.md) is the first feature in the Search Experiences application. With it you can

- Make minor tweaks to Liferay's default search page behavior
- Override the search page behavior completely
- Configure context-aware search results based on attributes of the search user

## Semantic Search

{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md)`

[Semantic Search](./search-experiences/semantic-search.md) parses index content and users' natural language search phrases with a machine learning model, so that results better reflect the intent of their search.

## Getting Liferay Search Experiences

Liferay Search Experiences is available to Liferay DXP customers with a [Liferay Enterprise Search](../liferay-enterprise-search.md) subscription in Liferay DXP 7.3, and [bundled with Liferay DXP in  Liferay 7.4](./activating-liferay-enterprise-search.md). Check the [LES Compatibility Matrix](https://help.liferay.com/hc/en-us/articles/360016511651#DXP-7.3-LES) for details:

| Version Availability | Installation Method | Fix Delivery Method |
| :---- | :---- | :---- |
| DXP 7.4 Update 5+ | [Bundled and Activated](activating-liferay-enterprise-search.md) | [DXP Updates](../../installation-and-upgrades/maintaining-a-liferay-installation/updating-liferay.md) |
| DXP 7.3 Update 6+ | [Downloaded](https://customer.liferay.com/downloads/-/download/liferay-enterprise-search-for-liferay-dxp-7-3) and Installed (steps below) | App Releases |


In Liferay DXP 7.3, Search Experiences is available as an add-on application to LES subscribers:
1. Download the app from the [Customer Portal](https://customer.liferay.com/downloads/-/download/liferay-enterprise-search-for-liferay-dxp-7-3).
1. Install the application into Liferay DXP
   * If running a Liferay bundle, copy the LPKG into the `[Liferay Home]/deploy` folder. If Liferay isn't running you can copy it directly to `[Liferay Home]/osgi/marketplace` before starting Liferay.
   * If running a Liferay Docker container, [install the LPKG in one of the supported ways](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/installing-apps-and-other-artifacts-to-containers.md).

## Search Experiences REST API

The Search Experiences applications publish and consume REST API endpoints (under the path `search-experiences-rest`) to remain consistent with Liferay's other native applications.

```{warning}
It is not advisable for third party code to consume the Search Experiences APIs as they are volatile: this includes the `/search` endpoint which is only intended to be used by the [Blueprints preview feature](./search-experiences/search-blueprints/creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar). Schema changes are expected to happen as the features evolve, and Liferay will not support custom code that uses the Search Experiences APIs. This decision may change in the future as the APIs become more stable.
```
