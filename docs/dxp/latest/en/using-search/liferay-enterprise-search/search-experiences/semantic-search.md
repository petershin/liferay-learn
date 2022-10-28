# Semantic Search
{bdg-primary}`Subscription`
{bdg-secondary}`7.4 U50+`

Defines both semantic and lexical search https://en.wikipedia.org/wiki/Semantic_search

Ideally, searching for "tech news" returns a document with a field containing the text "During economic downturns Linux distros gain on traditionally dominant operating system vendors." No amount of processing in a traditional search can provide this result. For this you need semantic search.

The best search knows not only the words you type into the search bar, but also the intent behind the words. Even sophisticated lexical searches like Liferay's (as powered by Elasticsearch) cannot do this, although it fakes it pretty well by applying inventive techniques like 
- analysis to tokenize the keywords and document fields.
- fuzziness and slop to enable imprecise matching.
- stemming to break words down into their roots to allow synonym matching.
- stop words to ignore insignificant words.
Adding these techniques to process the tokenized keywords and document fields can be enough for many search needs. If you add  Liferay DXP's Synonym Sets to this capability you can even make sure that the search returns results matching synonymous terms that wouldn't be caught by stemming: for example, set _doctor_ as synonymous with _medical_. All these techniques are designed to make a search better answer the question "what did you mean by that?", but they're orthogonal to the question at best. Semantic search greatly closes the gap between what a lexical search can accomplish and what the user really wants from the search: processing not just the words of the search, but the intent behind it.

<!-- If we get specific we better be able to deliver this result. -->

With this initial release, Administrators can enable an additional content processing pipeline: when this feature is enabled, the platform is producing a vector representation of the input text (for supported content types*) called sentence embedding and it gets stored in the index document in Elasticsearch. At search time, the search keywords entered by users go through the same process so it becomes possible to perform similarity searches to provide better, semantically more relevant search results for users.

## Enabling Semantic Search

To enable semantic search in Liferay,

1. Set up a sentence transformer provider and configure it in Liferay.
1. Create a search blueprint to perform a similarity search between the text embeddings representation of the search terms versus the text embeddings representation of the document text. query account for the dense vector field containing the text embedding that is the natural language representation of the words.
1. Create a search blueprint using the necessary Search Experiences elements.



```{important} 
You must re-index if ...
```

### Setting up a Sentence Transformer Provider

A Sentence Transformer has two jobs:
1. create a text embedding representation of the index document's fields (which are stored in the index).
1. at search time, create a text embedding representation of the search phrase typed into the search bar.

On top of that, you need a model to perform a similarity search of the search phrase embeddings and the document embeddings. These are housed in Hugging Face (even if you use txtai as the transformer).

You need a running sentence transformer provider. Choose from Hugging Face or txtai:

txtai
For setting up the textai, follow the docs to setup a txtai docker container at https://neuml.github.io/txtai/cloud/ See section "API". In Linux

Create a directory for txtai and go there
wget https://raw.githubusercontent.com/neuml/txtai/master/docker/api/Dockerfile
Create a minimal config.yml:
path: /tmp/index

writable: False

embeddings:
     path: sentence-transformers/nli-mpnet-base-v2
docker build -t txtai-api
docker run -p 8000:8000 --rm -it txtai-api
 
Depending on the size of the models. It will take a few moment for the service to initialize. 

After that, go to Control Panel / Search Experiences / Sentence Transformer and select txtai as service provider

Hugging Face
To be able to use Hugging Face as sentence transformer, registration to Hugging Face is required in https://huggingface.co/join

Create a Hugging Face account
Go to your account settings and find "Access Tokens"
As with txtai, go to Sentence Transformer settings, select Hugging Face and enter the access token
As a model, use one of the models on the list https://huggingface.co/models?pipeline_tag=feature-extraction . Model name is the title of the model.
1. 


Liferay DXP supports txtai (self-hosted / self-managed) and Hugging Face's Inference API as sentence transformer providers. Administrators can enable and configure these services through the System/ Instance Settings.
<!-- there's nothing in the sys setting but a note that This Feature is not Available, 11/01 -->

### Search Experiences Elements for Semantic Search

To build a semantic search experience leveraging sentence embeddings, Liferay DXP ships with a new out-of-the-box element called Rescore by Text Embedding that can be used in Search Blueprints. Thanks to this element and the visual query builder, users can configure the different aspects of the search query and test how it performs easily to build the right solution.

There's an ootb element rescore by text embedding, ping petteri: it rescores x results using a special function which uses the vector field. produce initial results by keyword, rescore them using the vector representations. the function can be chosen, dotProduct or cosin

depending on data set and the model, can improve the results, but...

there's another element Search with Sentence Embedding taht may be in producst or may just doc it (really complicated, more on the true semantic side instead of a rescore

see the blueprint on the ticket, may or may not be included in the product
### Specify a Pre-Trained Model

Semantic Search: User story has steps on using the ingester module to index from Liferay Learn and HC to get data, how to set up text AI using docker. See the confluence page (tibor linked in DM) for links to other articles to familiarize myself. Sys Settings > Semantic Search setting

enable the ff for the epic

set the transformer txtai or HF (need account and access token)

needs the model pre-trained by someone else (this is also hugging face; need an account), sending them a sentence and getting back vectors. the model used in our config must support feature extraction

for HF enter the model (there will be a selector)

the number of dimensions setting is needed for txtai or HF: to figure out how many dimensions they produce there's a test to perform in HF; test columns is the number of dimensions. it's important to get it right.

There will be a "test connection" button in system setting

Only certain asset types are supported as per the config (no custom structures, commerce stuff, objects)

Search time cache timeout so the provider is not hit for multiple repeated searches over and over. No index time caching.

send a sentence get back a vector/ 500 max char count by default, beginning of the content by default


Use txtai for testing
