<!--Note: See end of article for an example rewrite and some thoughts.-->

---
uuid: 0f70c846-c4b4-47b6-9f77-f957c81b20b7
---
# Working with Liferay Search

<!--Suggestion: I would rename this article "Understanding Liferay Search". -->

Before we talk about searching for Clarity products and site content, let's learn about how Liferay search works and some of its important features.

## About Liferay Search

<!--Suggestion: I would then rename this H2 to something more specific (e.g., "Liferay Search Features").-->

Liferay search works in conjunction with [Elasticsearch](https://www.elastic.co/elasticsearch), a best-of-breed search engine built for modern web applications. By leveraging the power of Elasticsearch, together with its own search infrastructure, Liferay search offers:

* Comprehensive indexing that supports a wide range of content types (e.g. blogs, documents, web content, etc.)
* Search facets and search filters
* Flexible and template driven UI, for highly configurable search pages
* Blueprints for creating personalized search results
* and more ...

Let's take a closer look at how some of this works.

<!-- Suggestion:
The bootcamp describes Liferay search as 'API driven'; this then leads into noting that users can use other search engine implementation if necessary for their industry (e.g., SOLR). This could be a helpful note.
-->

### Comprehensive Search Indexing

Liferay stores its information in a database. However, directly searching database tables can be a time-consuming task. Therefore most of Liferay's entities utilize a search index. Whenever a Liferay entity is created, a separate entry is also created in the search index by Liferay's indexer framework. Each entry has a collection of fields for that entity. For example, a blog entry might contain index fields for the title, content, tags, etc. This index is then used by Elasticsearch to provide an effective and efficient way to search for data. Some of the Liferay entities that use the search index out of the box include:

* Blog entries
* Categories and tags
* Documents and media
* Objects
* Users and organizations
* Web content articles

Therefore, anytime a search is performed, the query occurs against the search index and not the database tables of each asset. The results of the query are then referenced back to the original assets when the search results are displayed to the user.

<!--Suggestion:
Consider mentioning how Liferay's use of multiple internal/functional indexes can improve search results: "Liferay’s search capabilities support indexing a wide range of content types and Liferay leverages multiple internal indexes to ensure fast search results, even with very large data sets." -->

### Refining Search

Together with Liferay's search index, Elasticsearch provides a powerful and effective way to quickly get search results. These search results can be further refined through the use of facets, sorting, and custom search parameters.

Search facets are a way to refine search results across specific content and criteria. Out of the box, Liferay offers a collection of different search facets. For example, a type facet could be used by a visitor to quickly filter out blog entries, documents, or site pages. We'll see in the next lesson how category facets can be used by Clarity to filter across their products.

![Use category facets to refine search results.](./working-with-liferay-search/images/01.png)

Sorting is another way search results can be refined. By default, search results are sorted by relevance. Relevance is a search score calculated by Elasticsearch's algorithms. However, visitors can have options to sort by other parameters such as sorting alphabetically by title or user, by create date or modified date, etc. Users can choose an alternative sorting strategy that meets their needs. 

Liferay blueprints can also be used to alter the relevance score of search results. See below to learn more.

<!-- Consider mentioning search bar suggestions: "Liferay’s Search Bar Suggestions provides search as you type functionality for Clarity’s website visitors"
-->

### Configurable Search Pages

As we saw in module 6, site pages can quickly be built with the use of out of the box widgets. This also applies to search pages. Liferay offers many search widgets that can be dragged and dropped onto a site page to quickly create a customized search results page. All this makes it easy for even non-technical team members to create search pages effortlessly. Liferay even provides search page templates to use without needing to create a page from scratch.

Some of the available search widgets are:

* Low level search options
* Various types of search facets
* Similar results
* Sort
* Suggestions

We'll work with some of these widgets in the next lesson.

### Search Blueprints

Blueprints offer the ability to create targeted search results with the use of implicit search criteria. That is, automatically adding search criteria to a search query that is not part of what the user entered. A simple example might be boosting search results based on geolocation and prioritizing certain results that are closer in proximity to the user's IP address.

![Use blueprints to boost the results based on proximity.](./working-with-liferay-search/images/02.png)

Modifying the search query itself typically requires developing custom code, but search blueprints can be configured right from Liferay's UI without the need to deploy any code. This makes it simple enough for even non-technical members to utilize blueprints. Some ways blueprints might be leveraged are:

* Boosting search results based on different criteria
* Conditional search results based on certain keywords or categories
* Limiting the search query based on different criteria
* Hiding certain content and certain results

We'll see a specific example of Clarity utilizing search blueprints later in this module.

## Additional Search Capabilities

Liferay offers semantic search, giving you results that go beyond just matching keywords. Semantic search utilizes natural language processing and tries to understand the meaning or intent of the search term. Note, this is currently a beta feature and is available by enabling the feature flag. See [semantic search](https://learn.liferay.com/web/guest/w/dxp/using-search/liferay-enterprise-search/search-experiences/semantic-search) to learn more.

Search results are sorted by the ranking of a relevance score. The higher the relevance score, the higher the ranking in the search results. Scoring is automatically assigned based on Elasticsearch's scoring algorithm. However, an Elasticsearch Learning to Rank plugin can be used with Liferay to prioritize search results based on your specific criteria. See [learning to rank](https://learn.liferay.com/w/dxp/using-search/liferay-enterprise-search/learning-to-rank) to learn more.

Synonym sets can be created in Liferay to add additional coverage for different search terms. For example, visitors to Clarity's website might search for terms such as *eyeglasses* or *sunglasses*, but some might search for synonyms such as *spectacles* or *shades*. Create *Synonym Sets* in Liferay to ensure users find relevant content even if they don't use the exact keywords. See [synonym sets](https://learn.liferay.com/w/dxp/using-search/search-administration-and-tuning/synonym-sets) to learn more.

## Conclusion

Now that you have an initial understanding of Liferay's search functionality, let's dive into Clarity's specific use cases.

Next Up: [Understanding and Customizing Search Results Pages](./understanding-and-customizing-search-results-pages.md)

## Additional Resources

See our documentation to learn about working with search in Liferay.

* [Working with Search Pages](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/working-with-search-pages)
* [Search Results](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/search-results)
* [Search Facets](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/search-facets)
* [Search Blueprints](https://learn.liferay.com/w/dxp/using-search/liferay-enterprise-search/search-experiences/search-blueprints)

<!-- Thoughts: Thinking over this article, these topics came to mind. Some of these are already reflected in the above article, though organizing content into "About Liferay Search" and "Additional Search Capabilities" isn't as clear to me. I would use these topics to define more specific H2s

* Understanding Liferay Search
  * Liferay Search Features (Alt: Liferay's Core Search Components)
    * Talk about the general search features.
  * Search Architecture Overview
    * Talk a little more about how Search works
  * Search Configuration
    * Talk generally about available search configurations
  * Refining Search Results
    * Mention the tools are available for refining search results (Faceting, Sorting, Filtering, Autocomplete)
  * Customizing Search Experiences
    * Talk about how you can use Liferay's page builder features and extensive search widgets to design the desired user experience.
  * Personalizing Search Experiences
    * Talk about how you can personalize search experiences in Site Pages using blueprints and segmentation.

I also wonder if any of these topics should be turned into additional articles within the module. Just a thought.
-->

<!-- Example Intro, H2, and Note (you can use it if you want):
# Understanding Liferay Search

Liferay Search is a powerful tool that enables users to efficiently find information within a Liferay portal. It leverages the capabilities of a robust search engine to index and retrieve content, providing a seamless search experience for end-users. Let's delve deeper into the core components and architecture of Liferay Search.

## Liferay Search Features

At the heart of Liferay Search is Elasticsearch, a powerful open-source search and analytics engine. This technology serves as the backbone for indexing, storing, and retrieving vast amounts of search data with remarkable speed and scalability. The process of transforming content into a searchable format is known as indexing. Liferay meticulously indexes a wide array of content types, including documents, web content articles, and blog posts. Once indexed, this data becomes accessible through the search engine, which is responsible for processing user queries, ranking results based on relevance, and delivering the most pertinent information. 

!!! note "Using Alternative Search Engines"
    Liferay search is API driven, which means you can use alternative search engine implementations. While Elastic search provides the best search experience, industry standards may require an alternative search engine (e.g., SOLR)

Beyond these core components, Liferay offers a rich set of tools for refining search results, including faceting, sorting, filtering, and autocomplete. Additionally, it provides extensive capabilities for customizing search experiences through Liferay's page builder features and a variety of search widgets. Personalization of search results is achieved through the use of blueprints and segmentation, tailoring search results to individual user preferences and behaviors.
-->