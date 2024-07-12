---
taxonomy-category-names:
- Search
- Liferay Enterprise Search
- Search Experiences and Blueprints
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: a46cc468-a441-4a77-9628-b618b79d823b
---
# Setting Up a Text Embedding Provider

{bdg-secondary}`7.4 U70+`
{bdg-link-primary}`[Beta Feature](../../../../system-administration/configuring-liferay/feature-flags.md)`

A text embedding provider has two jobs:

1. At index time, use the specified model to create a text embedding representation of a text sample extracted from the index document's fields. 
1. At search time, use the specified model to create a text embedding representation of the search phrase typed into the search bar.

The model you use is paramount: your vectorized data is only as good as the model you choose.

The model you choose also performs the [similarity search](https://www.elastic.co/blog/text-similarity-search-with-vectors-in-elasticsearch) of the search phrase's text embeddings and the document's text embeddings. Models are housed in [Hugging Face](https://huggingface.co/models) even if you use txtai as the embeddings provider.

| Text Embedding Provider          | Recommended for Production? |
| :------------------------------- | :-------------------------- |
| [txtai](https://neuml.github.io/txtai/)                            | &#10004;                    |
| [Hugging Face Inference Endpoints](https://huggingface.co/inference-endpoints) | &#10004;                    |
| [Hugging Face Inference API](https://huggingface.co/inference-api)       | &#10008;                    |

## Configure and Run txtai

```{note} 
The txtai configuration here is intended for demonstration. Please read the [txtai documentation](https://neuml.github.io/txtai/) to learn more.
```

Set up txtai to access its APIs. To run txtai in a docker container, see the [txtai documentation](https://neuml.github.io/txtai/cloud/) or follow these basic steps for Linux:

1. Create a `txtai` folder and `cd` into it.

1. From the `txtai` folder, download the Dockerfile with

   ```sh
   curl https://raw.githubusercontent.com/neuml/txtai/master/docker/api/Dockerfile -O
   ```

1. Create a `config.yml` file in the `txtai` folder and give it these minimal contents:

   ```yaml
   path: /tmp/index

   writable: False

   embeddings:
        path: sentence-transformers/msmarco-distilbert-base-dot-prod-v3
   ```

   ```{important}
   [The model you chose](../semantic-search.md#choosing-a-model) is entered in the embeddings path.
   ```

1. From the txtai folder, run

   ```sh
   docker build -t txtai-api .
   ```

1. Start the container:

   ```sh
   docker run -p 8000:8000 --rm -it txtai-api
   ```
 
   Depending on the size of the models, it can take several minutes for the service to initialize. 

1. In Liferay, open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Search Experiences* &rarr; *Semantic Search*.

   - Set _Text Embeddings Enabled_ to _true_.
   - Select _txtai_ as the Text Embedding Provider.
   - If you followed the above test setup, leave the default values in txtai Host Address, Basic Auth Username, and Basic Auth Password.
   - Leave the default value (768) in Embedding Vector Dimensions.

   ```{important}
   The Embedding Vector Dimensions must match that of the configured model. The model is specified in txtai using the `config.yml` file. See the model's documentation to configure the proper number of dimensions.
   ```

Before saving the configuration, click _Test Configuration_ to ensure that Liferay can connect with the txtai server and that the settings are correct.

This example setup is intended for demonstration. See the [txtai documentation](https://github.com/neuml/txtai) to find the setup that meets your need (e.g., running a GPU [container](https://neuml.github.io/txtai/cloud/) for increased performance).

## Using the Hugging Face Inference API

```{important}
The [Hugging Face Inference API](https://huggingface.co/inference-api) is suitable for testing and development. To use Hugging Face as the text embedding provider for production, use the [Hugging Face Inference Endpoints provider](#using-the-hugging-face-inference-endpoints).
```

To use the Hugging Face Inference API, first create a [Hugging Face account](https://huggingface.co/join).

Once you have an account,

1. Go to your Hugging Face account settings and copy your access token.

1. In Liferay, open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Search Experiences* &rarr; *Semantic Search*.

   Select _Hugging Face Inference API_ as the text embedding provider and enter the access token you copied.

1. Choose one of the models from the list at <https://huggingface.co/models?pipeline_tag=feature-extraction>. 

1. Enter the model name as the title of the model.

1. Enter the proper number of Embedding Vector Dimensions to match the model you chose.

   ```{important}
   The Embedding Vector Dimensions must match that of the configured model. The model is specified in txtai using the `config.yml` file. See the model's documentation to configure the proper number of dimensions.
   ```

1. Configure the other Hugging Face settings as desired:

   **Model Timeout:** Set the time (in seconds) to wait for the model to be loaded before timing out. You can pin Hugging Face models in memory to avoid repeated time-consuming loading of models.

Before saving the configuration, click the _Test Configuration_ button to ensure that Liferay can connect with the Hugging Face Inference API and that the settings are correct.

## Using the Hugging Face Inference Endpoints

The [Hugging Face Inference Endpoints](https://huggingface.co/inference-endpoints) service is an enterprise-grade, paid text embedding service from Hugging Face. When testing and developing your semantic search solution, you can use the [Inference API](#using-the-hugging-face-inference-api).

Most of the setup is completed in Hugging Face. After setting up the Inference API, 

1. Go to your Hugging Face account settings and copy your access token.

1. In Liferay, open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Search Experiences* &rarr; *Semantic Search*.

   Select _Hugging Face Inference Endpoints_ as the text embedding provider and enter the access token you copied.

1. Enter the host address.

1. Enter the proper number of Embedding Vector Dimensions to match the model you chose.

   ```{important}
   The Embedding Vector Dimensions must match that of the configured model. The model is specified in txtai using the `config.yml` file. See the model's documentation to configure the proper number of dimensions.
   ```

Before saving the configuration, click the _Test Configuration_ button to ensure that Liferay can connect with the Hugging Face Inference Endpoint and that the settings are correct.
