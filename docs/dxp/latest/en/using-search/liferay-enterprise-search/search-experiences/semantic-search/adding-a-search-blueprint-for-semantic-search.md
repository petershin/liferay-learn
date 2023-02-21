----
uuid: 714a2db2-830e-40a8-8f49-5da57a629ef1
----
# Adding a Search Blueprint for Semantic Search

<!-- A user searching for this might be better served with a title like "Re-Scoring the Query with Text Embeddings". -->

Once a model is selected and the text embeddings are indexed, you must configure Liferay to account for the embeddings at search time. Conceptually you have two choices:

1. Create a blueprint to completely override Liferay's default search request, building one from scratch to execute a pure semantic search query, only using the text embeddings.
1. Use the out-of-the-box Rescore by Text Embedding element to create a blueprint that executes the standard keyword-based query, then rescores the results with a similarity function between the text embeddings of the indexed dense_vector field and the embeddings of the search phrase.

To build a semantic search experience leveraging the text embeddings created by the embedding provider you configured, Liferay includes an out-of-the-box element (in 7.4 Update 50+) called Rescore by Text Embedding that re-scores the results of the original query using the text embedding value. Use the element to build a [search blueprint](./creating-and-managing-search-blueprints.md). With this element and the visual query builder in Blueprints, you can configure and test the search query to build the right semantic search solution.

<!-- For how it works: There's an ootb element rescore by text embedding, ping petteri: it rescores x results using a special function which uses the vector field. produce initial results by keyword, rescore them using the vector representations. the function can be chosen, dotProduct or cosin -->

```{important}
The out-of-the-box Rescore by Text Embedding element (available in 7.4 Update 50+), when configured to work with an embedding provider, can produce more targeted search results for some data sets. However, many semantic search solutions will require manual tweaking and perhaps new elements to achieve a robust search solution.
```

![The Rescore by Text Embedding element brings basic semantic search to Liferay.](./semantic-search/images/01.png)

This element is effective only if the embedding provider is enabled and configured to operate on specific content types and languages. See the Search Experiences entry in System Settings to configure the embedding provider.

## Configuring the Rescore by Text Embedding Element

Several configurable options are provided in the Rescore by Text Embedding element: 

**Boost:** Defaulting to 10, this setting determines by how much to boost re-scored results.

**Vector Field Function:** Choose from the Cosine Similarity or Dot Product functions. Defaulting to use the Cosine Similarity function, the selected function measures similarity between the searched keywords and the target document text embeddings. Check the model's documentation to determine which function is most suitable. 

**Min Score:** Defaulting to 1, this setting's integer (or 0) sets the minimum score a returned document must have to be included in the re-score query. 

**Query Weight:** Defaulting to 0.01, this setting controls the weight of the original query in the final score calculation.

**Rescore Query Weight:** Defaulting to 10, this sets the weight of the re-score query in the final score calculation.

**Score Mode:** Defaulting to Average, this setting dictates the strategy to use when combining the original query scores with the results of the re-score. Choose from Average, Max, Min, Multiply, or Total.

**Rescorer Window Size:** Defaulting to 50, you can choose the number of results to re-score at a time. Choosing a very high window size can impact performance negatively .

