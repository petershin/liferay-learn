---
uuid: 0f70c846-c4b4-47b6-9f77-f957c81b20b7
---
# Understanding Liferay Search

Liferay search is a powerful tool that enables users to efficiently find information within a Liferay portal. It leverages the capabilities of a robust search engine to index and retrieve content, providing a seamless search experience for end-users. Let's delve deeper into the core components and architecture of Liferay search.

<!--TASK: Add diagram(s) to this article.-->

## Liferay Search at a High-level

By default, Liferay search leverages [Elasticsearch](https://www.elastic.co/elasticsearch), a powerful open-source search and analytics engine. This technology serves as the backbone for indexing, storing, and retrieving data efficiently at scale.

Liferay stores its information in a database, but searching database tables directly can be resource-intensive. To optimize performance, Liferay indexes content, such as documents and web articles, converting everything into a searchable format. Additionally Liferay uses dedicated search indexes for many of its entities to store searchable fields relevant for each type (e.g., title, content, tags). This enables the search engine to efficiently and effectively process user queries, rank results, and return relevant information without directly querying the database.

Key Liferay entities with indexed content include:

* Blog entries
* Categories and tags
* Content pages
* Documents and media
* Objects
* Web content articles

Liferay search is ready to use right out of the box. However, you have the flexibility to fine-tune your search experience with extensive configuration options in the Liferay UI. You can apply these adjustments at the page, site, or instance level, providing granular control over how search functions across your platform. You can also perform administrative tasks, such as reindexing, search engine connections, and more.

Liferay also offers a rich set of tools for refining search results, including faceting, sorting, filtering, and autocomplete. Liferay Blueprints offer a low-code way to customize the search experience, empowering advanced customization without coding. Additionally, you can leverage blueprints with segmentation and search widgets to personalize search results, tailoring experiences to individual user preferences and behaviors.

## Refining Search Results

Liferay search results can be refined using facets, sorting, or custom filters. Search facets group results by specific criteria, such as content type and categories. Out of the box, Liferay offers a collection of search facets, and we'll see how Clarity can use them in the following lessons.

![Use category facets to refine search results.](./understanding-liferay-search/images/02.png)

Sorting also refines search results by reordering items. By default, search results are sorted by relevance, a score calculated by Elasticsearch's algorithms, but you can also sort alphabetically, chronologically, or by other criteria.

The search bar supports suggestions to help users find what they are looking for more quickly and easily. As a user begins typing a search term, the search engine begins processing the query and suggests possible relevant results.

Finally, custom filters are available for adding query clauses to Liferay's main search query. This can be useful for hiding specific content, boosting query matches, or filtering the results to return only those matching your query. For even more advanced customization, explore Search Blueprints, discussed below.

## Customizing Search Results Pages

Search pages are created using Liferay's intuitive drag-and-drop page builder. With a rich library of search widgets, you can quickly add advanced search functionality to your pages, including facets, sorting options, and suggestions. This empowers even non-technical team members to create search pages effortlessly.

![Create search pages using Liferay's page builder and advanced search functionalities.](./understanding-liferay-search/images/03.png)

With Liferay's segmentation capabilities, you can create unique search experiences for different user groups. Imagine presenting one search results page for general visitors, and another, enriched with additional search widgets and tailored content, for Clarity distributors. Going further, Liferay Blueprints enable you to personalize the search results themselves. Based on user segments, behaviors, or other criteria, you can dynamically adjust what content appears at the top of the list, ensuring each user sees the most relevant information first.

## Search Blueprints

A search blueprint is a Swiss army knife for search experience customization in Liferay. From adding static filter criteria to the search query (like with custom filters) to adding new search request parameters that are consumed in the Blueprint to dynamically change something about the search, you can do it with a blueprint. You can even provide context-aware search: boost search results based on geolocation and prioritize results that are closer in proximity to the user's location.

![Use blueprints to boost the results based on proximity.](./understanding-liferay-search/images/04.png)

Liferay has many out-of-the-box query elements you can use when building your blueprints, but you can craft your own with JSON for ultimate flexibility. Modifying the search query itself typically requires developing custom code, but search blueprints can be configured right from Liferay's UI without the need to deploy any code. This makes it simple enough for even non-technical users to utilize blueprints. Some ways blueprints might be leveraged are:

* Boosting search results based on different criteria
* Conditional search results based on certain keywords or categories
* Limiting the search query based on different criteria
* Hiding certain content and certain results

<!--TASK: Mention collection providers in this list once out of Beta-->

We'll see a specific example of Clarity utilizing search blueprints later in this module.

## Other Advanced Search Options

Liferay offers semantic search, generating results that go beyond matching keywords. Semantic search utilizes natural language processing and tries to understand the meaning or intent of the search term. Note, this is currently a beta feature and is available by enabling the feature flag. See [semantic search](https://learn.liferay.com/web/guest/w/dxp/using-search/liferay-enterprise-search/search-experiences/semantic-search) to learn more.

By default, search results are sorted by the relevance score assigned by Elasticsearch. The higher the relevance score, the higher the ranking in the search results. However, you can use an Elasticsearch Learning to Rank plugin with Liferay to prioritize search results based on your specific criteria. See [learning to rank](https://learn.liferay.com/w/dxp/using-search/liferay-enterprise-search/learning-to-rank) to learn more.

Finally, you can create synonym sets in Liferay to add additional coverage for different search terms. For example, visitors to Clarity's website might search for terms such as *eyeglasses* or *sunglasses*, but some might search for synonyms such as *spectacles* or *shades*. Create synonym sets in Liferay to ensure users find relevant content regardless of their exact keywords. See [synonym sets](https://learn.liferay.com/w/dxp/using-search/search-administration-and-tuning/synonym-sets) to learn more.

## Conclusion

Now that you have an understanding of Liferay's search functionality, let's dive into Clarity's specific use cases.

Next Up: [Understanding and Customizing Search Results Pages](./understanding-and-customizing-search-results-pages.md)

## Additional Resources

See official documentation to learn more about Liferay's search capabilities:

* [Search Overview](https://learn.liferay.com/w/dxp/using-search/getting-started/search-overview)
* [Searching for Content](https://learn.liferay.com/w/dxp/using-search/getting-started/searching-for-content)
