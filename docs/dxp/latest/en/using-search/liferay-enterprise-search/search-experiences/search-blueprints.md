---
toc:
  - ./search-blueprints/understanding-search-blueprints.md
  - ./search-blueprints/creating-and-managing-search-blueprints.md
  - ./search-blueprints/using-a-search-blueprint-on-a-search-page.md
  - ./search-blueprints/collections-with-search-blueprints.md
  - ./search-blueprints/personalizing-the-search-experience.md
  - ./search-blueprints/sorting-results-in-a-search-blueprint.md
  - ./search-blueprints/search-blueprints-configuration-reference.md
  - ./search-blueprints/search-blueprints-elements-reference.md
  - ./search-blueprints/creating-and-managing-elements.md
  - ./search-blueprints/optimizing-search-response-size.md
  - ./search-blueprints/collapsing-search-results.md
taxonomy-category-names:
- Search
- Liferay Enterprise Search
- Search Experiences and Blueprints
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 216dc540-09fa-468d-8b4f-a6bbdb866fc2
---
# Search Blueprints

{bdg-link-primary}`[LES Subscription](../activating-liferay-enterprise-search.md)`
{bdg-secondary}`DXP 7.4 U5+; 7.3 U6+`

Search Blueprints is the first feature in the Search Experiences application. With it you can

- Make minor tweaks to Liferay's default search page behavior
- Override the search page behavior completely
- Configure [context-aware search results](./search-blueprints/personalizing-the-search-experience.md) based on attributes of the search user
- Populate [collections](../../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md) with the results of custom search query
- Shrink the [search response size](./search-blueprints/optimizing-search-response-size.md) by filtering out stored fields
- [Collapse results](./search-blueprints/collapsing-search-results.md) with identical field values

Search Blueprints does not work well with [Result Rankings](../../search-administration-and-tuning/result-rankings.md). If a result pinned by Result Rankings is filtered out in the blueprint, it still appears at the top of the results. If possible, avoid using these features together.
