---
toc:
- ./search-experiences/understanding-search-blueprints.md
- ./search-experiences/creating-and-managing-search-blueprints.md
- ./search-experiences/using-a-search-blueprint-on-a-search-page.md
- ./search-experiences/personalizing-the-search-experience.md
- ./search-experiences/search-blueprints-elements-reference.md
- ./search-experiences/search-blueprints-configuration-reference.md
- ./search-experiences/creating-and-managing-elements.md
---
# Search Experiences

{bdg-link-secondary}`[Available Liferay DXP 7.4 Update 5+; 7.3 Update 6+](#getting-liferay-search-experiences)`

```{toctree}
:maxdepth: 1

search-experiences/understanding-search-blueprints.md
search-experiences/creating-and-managing-search-blueprints.md
search-experiences/using-a-search-blueprint-on-a-search-page.md
search-experiences/personalizing-the-search-experience.md
search-experiences/search-blueprints-elements-reference.md
search-experiences/search-blueprints-configuration-reference.md
search-experiences/creating-and-managing-elements.md
```

> **Liferay Enterprise Search (LES) Subscribers**

The Liferay Enterprise Search Experiences app includes a suite of features granting fine-grained control over the end user's search experience. As the search administrator you can use Search Experiences for search customizations varying in complexity:

- Make minor tweaks to Liferay's default search page behavior
- Override the search page behavior completely
- Configure context-aware search results based on attributes of the search user

## Search Blueprints

Search Blueprints is the first feature in the Search Experiences application. To learn about it's capabilities and fundamental components, see

- [Understanding Blueprints](./search-experiences/understanding-search-blueprints.md)
- [Creating and Managing Search Blueprints](./search-experiences/creating-and-managing-search-blueprints.md)
- [Using a Search Blueprint on a Search Page](./search-experiences/using-a-search-blueprint-on-a-search-page.md)
- [Personalizing the Search Experience](./search-experiences/personalizing-the-search-experience.md)
- [Search blueprints Elements Reference](./search-experiences/search-blueprints-elements-reference.md)
- [Search Blueprints Configuration Reference](./search-experiences/search-blueprints-configuration-reference.md)
- [Creating and Managing Elements](./search-experiences/creating-and-managing-elements.md)
  - [Creating Elements](./search-experiences/creating-and-managing-elements/creating-elements.md)
  - [Managing Elements](./search-experiences/creating-and-managing-elements/managing-elements.md)
  - [Predefined Element Variables Reference](./search-experiences/creating-and-managing-elements/predefined-element-variables-reference.md)

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
It is not advisable for third party code to consume the Search Experiences APIs as they are volatile: this includes the `/search` endpoint which is only intended to be used by the [Blueprints preview feature](./search-experiences/creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar). Schema changes are expected to happen as the features evolve, and Liferay will not support custom code that uses the Search Experiences APIs. This decision may change in the future as the APIs become more stable.
```
