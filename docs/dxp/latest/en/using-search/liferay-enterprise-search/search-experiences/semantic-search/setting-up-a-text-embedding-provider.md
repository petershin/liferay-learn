----
uuid: a46cc468-a441-4a77-9628-b618b79d823b
----
# Setting Up a Text Embedding Provider

A text embedding provider has two jobs:

1. At index time, use the specified model to create a text embedding representation of a text sample extracted from the index document's fields. 
1. At search time, use the specified model to create a text embedding representation of the search phrase typed into the search bar.

The model you use is paramount: your vectorized data is only good as the model you choose.

In addition, you need a model to perform a [similarity search](https://www.elastic.co/blog/text-similarity-search-with-vectors-in-elasticsearch) of the search phrase embeddings and the document embeddings. Models are housed in Hugging Face even if you use txtai as the embeddings provider.

Choose a text embedding provider to work with Liferay's search index documents: [txtai](https://neuml.github.io/txtai/) and [Hugging Face](https://huggingface.co/).

## Configure and Run txtai

```{note} 
The txtai configuration here is intended for demonstration. Please read the [txtai documentation](https://neuml.github.io/txtai/) to learn more.
```

Set up txtai to access its APIs. To run txtai in a docker container, see the [txtai documentation](https://neuml.github.io/txtai/cloud/) or follow these basic steps for Linux:

1. Create a `txtai` directory and `cd` into it.

1. From the `txtai` folder, download the Dockerfile with

   ```sh
   curl https://raw.githubusercontent.com/neuml/txtai/master/docker/api/Dockerfile -O
   ```

1. Create a `config.yml` file in the `txtai` folder, and give it these minimal contents:

   ```yaml
   path: /tmp/index

   writable: False

   embeddings:
        path: sentence-transformers/msmarco-distilbert-base-dot-prod-v3
   ```

   ```{important}
   [The model you chose](./../semantic-search.md#choosing-a-model) is entered in the embeddings path.
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

1. Once the txtai server is running, go to Liferay's Control Panel &rarr; Search Experiences &rarr; Semantic Search and configure it:

   - Set Text Embeddings Enabled to true.
   - Select _txtai_ as the Text Embedding Provider.
   - If you followed the above test setup, leave the default values in txtai Host Address, Username, and Password.
   - Leave the default value (768) in Embedding Vector Dimensions.

   ```{important}
   The Embedding Vector Dimensions must match that of the configured model. The model is specified in txtai using the `config.yml` file. See the model's documentation to configure the proper number of dimensions.
   ```

Before saving the configuration, click the Test Configuration button to ensure that Liferay can connect with the txtai server and that the configured settings using are in harmony.

This example setup is intended for demonstration. See the [txtai documentation](https://github.com/neuml/txtai) to find the setup that meets your need (e.g., running a GPU [container](https://neuml.github.io/txtai/cloud/) for increased performance).

## Using the Hugging Face Inference API

<!--Note that it's for dev/testing, use the inference endpoints for prod -->

To use the Hugging Face Infewrence API as the text embeddings provider, create a [Hugging Face account](https://huggingface.co/join).

Once you have an account,

1. Go to your account settings and find _Access Tokens_. Copy your token.
1. Go to Liferay's Control Panel &rarr; Search Experiences &rarr; Semantic Search and configure its Text Embedding Provider, selecting Hugging Face and entering the access token you copied.
1. Choose one of the models from the list at <https://huggingface.co/models?pipeline_tag=feature-extraction>. 
1. Enter the model name as the title of the model.
1. Enter the proper number of Embedding Vector Dimensions to match the model you chose.

   ```{important}
   The Embedding Vector Dimensions must match that of the configured model. The model is specified in txtai using the `config.yml` file. See the model's documentation to configure the proper number of dimensions.
   ```
1. Configure the other Hugging Face settings as desired:

   **Model Timeout:** Set the time (in seconds) to wait for the model to be loaded before timing out. Hugging Face allows you to pin models in memory to avoid repeated time-consuming loading of models.
   **Enable GPU:** Enable GPU for the text embedding provider. This speeds up the transformation but requires a paid plan with Hugging Face. Check the Hugging Face documentation for more information.

Before saving the configuration, click the _Test Configuration_ button to ensure that Liferay can connect with the Hugging Face Inference API and that the settings it's using are in harmony.

## Using the Hugging Face Inference Endpoints

TODO

