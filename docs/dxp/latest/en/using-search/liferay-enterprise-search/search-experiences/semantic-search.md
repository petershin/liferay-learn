---
toc:
  - ./semantic-search/setting-up-a-text-embedding-provider.md
  - ./semantic-search/adding-a-search-blueprint-for-semantic-search.md
uuid: e305b83d-913c-497f-8760-6a9c0ecc87f3
---

# Semantic Search
{bdg-link-primary}`[LES Subscription](../activating-liferay-enterprise-search.md)`
{bdg-secondary}`7.4 U50+`
{bdg-dark}`Beta Feature`

<!--Link to an explainer on what the beta feature badge means -->

```{toctree}
:maxdepth: 1

./semantic-search/setting-up-a-text-embedding-provider.md
./semantic-search/adding-a-search-blueprint-for-semantic-search.md
```

```{important}
An effective semantic search solution requires a model trained in your data domain and fine-tuned on your specific content. Any example configuration shown here is not meant as a production-ready semantic search solution.
```

<!--didn't go with the "feel good" example since I think it's best to be unique from txtai--if this one's not good we can steal from them, after confirming it's okay-->
Semantic search evaluates the intent behind a searched phrase. For example, searching for "Liferay Releases Search Experiences for 7.3" semantically matches the phrase "what's new in tech?" Meanwhile, a lexical search matches a searched phrase to the indexed text fields, and cannot produce a match based on meaning.

Even sophisticated lexical searches like Liferay's (as powered by Elasticsearch) cannot match the user's intent with indexed documents, despite employing inventive techniques like
- analysis to tokenize the keywords and document fields.
- fuzziness and slop to enable imprecise matching.
- stemming to break words down into their roots to allow synonym matching.
- stop words to ignore insignificant words.

Lexical processing of the tokenized keywords and document fields can be enough for many search needs. If you need more from the search experience, semantic search greatly closes the gap between what a lexical search can accomplish and what the user really wants from the search: process not just the words of the search, but their intent.

Semantic search enables an additional content processing pipeline: when enabled, the platform produces a vector representation of the input text (for supported content types*) called a text embedding, and stores it in the index document in Elasticsearch. At search time, the search keywords entered by users go through the same vectorization and embedding process, making it possible to perform similarity searches that provide more meaningfully relevant search results for users.

## Enabling Semantic Search

To enable semantic search in Liferay,

1. [Choose a trained model or create your own.](#choosing-a-trained-model)
1. [Enable a sentence transformer provider and configure it in Liferay.](./semantic-search/setting-up-a-text-embedding-provider.md)
1. [Re-index the text embeddings.](#re-indexing-the-text-embeddings) <!-- Unnecessary?-->
1. [Create a Search Blueprint to perform a similarity search between the vectorized search terms and documents.](./semantic-search/adding-a-search-blueprint-for-semantic-search.md)

### Choosing a Trained Model

A properly trained model is paramount: the data in your index must be appropriate for the model chosen. <!-- more accurate to say that the model must be trained on your data?--> If no appropriate pre-trained model exists for your data, you must create your own.

Working with a pre-trained model is more convenient, but you must ensure it is fine-tuned to your data before employing it in production. 

For example, if a user searches _how does a skate move?_, a model trained on marine biology will provide different results than one trained on recreation.

The [Hugging Face model hub](https://huggingface.co/models) provides a large collection of pre-trained, domain specific models.

You can use pre-trained models or train your own. Fine tuning pretrained models is probably the easiest and fastest way to best possible experience (over training from scratch) but there are good pretrained models to start with. 2.
This link should give some initial ideas for choosing a pretrained model https://www.sbert.net/docs/pretrained_models.html
In development I actually used this model: sentence-transformers/msmarco-distilbert-base-dot-prod-v3. Maybe it could be here as an option of a good generic model

<!--
### Re-Indexing the Text Embeddings

The text embeddings must be re-indexed in these cases:

1. You're upgrading from before U47.
1. You change the index settings in the Semantic Search configuration of System or Instance Settings.

To re-index the text embeddings, use the Index Actions screen and click the _Reindex_ button for just the models you are enabling in the Asset Entry Class Names setting of the Semantic Search System or Instance Settings.
-->

## Configuring Semantic Search Index Settings

Beyond [setting up a text embeddings provider](./semantic-search/setting-up-a-text-embedding-provider.md), additional configuration options are available for semantic search. Visit Control Panel &rarr; System Settings &rarr; Semantic Search, and find the Index Settings section.

The Sentence Transformer Settings are covered in [Enabling Semantic Search](#enabling-semantic-search)

The Index Settings include the following:

**Max Character Count:** 500 Set the maximum number of characters to be sent to the sentence transformer. By default up to 500 characters are sent to be transformed into their vector representations. The ideal value here depends on which [sentence transformer provider](./semantic-search/setting-up-a-text-embedding-provider.md) you're using.

**Text Truncation Strategy:** Beginning Select from which portion of the text the sample for the sentence transformer should be taken from. This setting applies only if the text is longer than the maximum character count. Choose from Beginning (the default), Middle, or End.

Select whether to extract the pre-transformation sample from the Beginning (default), Middle, or End of the text. This setting applies only if the text is longer than the maximum character count.

**Asset Entry Class Names:** Select the asset types to be transformed. By default four supported asset types are processed, including Blogs Entry, Knowledge Base Article, Web Content Article, and Wiki Page. Message Boards Message entities can be configured if desired. 

```{note}
Only Basic Web Content is currently supported.
```

**Language IDs:** Select the languages and localizations to be transformed. By default all listed languages are selected: Arabic (Saudi Arabia), Catalan (Spain), Chinese (China), Dutch (Netherlands), English (United States), Finnish (Finland), French (France), German (Germany), Hungarian (Hungary), Japanese (Japan), Portuguese (Brazil), Spanish (Spain), and Swedish (Sweden). Select multiple languages from the list using _Ctrl + Click_.

```{warning}
Enabling a language doesn't guarantee that the sentence embedding is created for the language. The language must be available in the site. If a language is enabled in System/Instance Settings, and available in the site, but there is no translation for a given piece of content, the default translation is used to create the text embeddings.
```

The Search Settings include the following:

**Cache Timeout:** Set the cache timeout in milliseconds for transformed search keywords. By default 604800 is used (about ten minutes).

## Understanding Semantic Search in Liferay

Semantic Search in Liferay can be one of two things:
1. Full semantic search, where the normal indexers are disabled in a Search blueprint, and a well-trained model is used to index and search all the content.
1. Hybrid semantic search, where a lexical search is performed first, and a more generally applicable model is employed to re-score the results based on the embeddings.

Providing a robust understanding semantic search and its intricacies is beyond the scope of this brief explanation. Instead we'll focus on how Liferay's semantic search implementation works, along the way explaining a few fundamental concepts of a semantic search.

Semantic search impacts the Liferay search at both index time and search time, introducing an additional level of content processing.

During the indexing phase, 

* Standard processing occurs:
  * [LIFERAY] Content in Liferay is sent to the search engine where it's processed according to its data type: text is analyzed appropriately and stored in the index.
* [LIFERAY] Additional semantic search processing occurs:
   * Following the configuration in System/Instance Settings, the text snippet is sent by Liferay to the sentence transformer. 
      * The Max Character Count and Text Truncation Strategy determine the snippet sent to the sentence transformer.
      * Liferay selects the title and content for Blogs Entries, Knowledge Base Articles, Wiki Pages, Basic Web Content Articles. For Message Boards Messages, the title and subject fields are processed.
  * [SENTENCE TRANSFORMER] First the snippet is processed according the configured model, which tokenizes the snippet according to its parameter. For the BERT models often used, 512 is the maximum number of tokens the models will handle. This is influenced by the number of characters set in the Semantic Search &rarr; Max Character Count setting in System/Instance Settings.
  * [SENTENCE TRANSFORMER] Text embedding occurs, and a vector representation is created based on the model used the by the transformer. 
  * [LIFERAY] The result of the text embedding process is stored in the [Liferay Company Index](../../search-administration-and-tuning/elasticsearch-indexes-reference.md) as a [dense_vector](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/dense-vector.html) field for each document[^1].
  * Following the configuration in System/Instance Settings, the text snippet is sent to the sentence transformer, text embedding occurs, and a vector representation is created based on the model used the by the transformer. The result of the text embedding process is stored in the [Liferay Company Index](../../search-administration-and-tuning/elasticsearch-indexes-reference.md) as a [dense_vector](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/dense-vector.html) field for each document[^1].

[^1]: To inspect the [mapping](../../search-administration-and-tuning/search-administration.md#field-mappings) for these transformer-produced dense vector fields, open the Control Panel &rarr; Search &rarr; Field Mappings. Copy the mappings into a file and search for *dense_vector*.

During the search phase,

* Standard Processing occurs:
  * The search phrase entered in the Search Bar widget is received by Liferay's search framework, sent through to the search engine for analysis and additional processing, matched to existing index documents in the search engine, which are scored for relevance and returned to Liferay for its additional processing (highlighting, summarizing, performing additional filtering for permissions, etc.). 
* Additional semantic search Processing occurs:
  * The search phrase is sent to the sentence transformer, text embedding occurs, and a vector representation is created. Before rendering the search results scored by lexical relevance, the results captured within the window limit setting are re-scored by comparing the vector representation of the search phrase with the dense vector fields stored in the search documents. New scores are calculated, and the newly ordered set of results are returned to the search page for consumption by the end user.


<!-- TODO: Quickly follow this documentation with a more robust example article, configuring the ootb element differently and including Petteri's more complicated custom element? -->
