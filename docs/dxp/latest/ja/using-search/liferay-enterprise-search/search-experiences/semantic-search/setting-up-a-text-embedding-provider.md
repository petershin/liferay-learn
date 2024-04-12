# テキスト埋め込みプロバイダーの設定

{bdg-secondary}`7.4 U70+`
{bdg-link-primary}`[ベータ版機能](../../../../system-administration/configuring-liferay/feature-flags.md)`

テキスト埋め込みプロバイダーには、2つの仕事があります：

1. インデックス時に、指定されたモデルを使用して、インデックスドキュメントのフィールドから抽出されたテキストサンプルのテキスト埋め込み表現を作成する。
1. 検索時には、指定されたモデルを使用して、検索バーに入力された検索フレーズのテキスト埋め込み表現を作成します。

ベクトル化されたデータは、選択したモデルによってのみ良いものになるのです。

また、選択したモデルは、検索フレーズのテキスト埋め込みと文書のテキスト埋め込みの [類似度検索](https://www.elastic.co/blog/text-similarity-search-with-vectors-in-elasticsearch) を行います。埋め込みプロバイダとしてtxtaiを使用している場合でも、モデルは [Hugging Face](https://huggingface.co/models) に収容されます。 

| テキスト埋め込みプロバイダー                                                     | 本番環境に推奨? |
|:------------------------------------------------------------------ |:-------- |
| [タクスタイ](https://neuml.github.io/txtai/)                            | &#10004; |
| [ハグ顔推論エンドポイント](https://huggingface.co/inference-endpoints)         | &#10004; |
| [Hugging Face Inference API](https://huggingface.co/inference-api) | &#10008; |

## txtaiの設定と実行

```{note} 
ここでのtxtaiの構成は、デモンストレーションを目的としています。 詳しくは、 [txtaiドキュメント](https://neuml.github.io/txtai/) をお読みください。
```

txtaiのAPIにアクセスできるように設定する。 dockerコンテナでtxtaiを実行するには、 [txtai documentation](https://neuml.github.io/txtai/cloud/) を参照するか、Linuxの場合は以下の基本ステップに従ってください：

1. `txtai` フォルダを作成し、その中に `cd` を作成します。

1. `txtai` フォルダから、Dockerfile をダウンロードします。 

   ```sh
   curl https://raw.githubusercontent.com/neuml/txtai/master/docker/api/Dockerfile -O
   ```

1. `txtai` フォルダ内に `config.yml` ファイルを作成し、以下の最小限の内容を付与します： 

   ```yaml
   path: /tmp/index

   writable: False

   embeddings:
        path: sentence-transformers/msmarco-distilbert-base-dot-prod-v3
   ```

   ```{important}
   [選んだモデル](./../semantic-search.md#choosing-a-model) がembeddingsのパスに入力されます。
   ```

1. txtaiフォルダーから、以下を実行します。 

   ```sh
   docker build -t txtai-api .
   ```

1. コンテナを起動します： 

   ```sh
   docker run -p 8000:8000 --rm -it txtai-api
   ```

モデルのサイズによっては、サービスの初期化に数分かかる場合があります。 

1. Liferay で **Global Menu**(![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Search Experiences** &rarr; **Semantic Search** を開いてください。

   - **Text Embeddings Enabled** を **true** に設定します。
   - テキスト埋め込みプロバイダとして、 **txtai** を選択します。
   - 上記のテスト設定に従った場合、txtai Host Address、Basic Auth Username、Basic Auth Passwordはデフォルト値のままにしてください。
   - Embedding Vector Dimensionsはデフォルト値(768）のままにしておきます。 

   ```{important}
   Embedding Vector Dimensionsは、設定されたモデルのものと一致する必要があります。 txtaiでは、`config.yml`ファイルを用いてモデルを指定します。 適切な寸法数を設定するために、モデルのマニュアルを参照してください。
   ```

設定を保存する前に、 **Test Configuration** をクリックして、Liferayがtxtaiサーバーと接続できること、設定が正しいことを確認します。

この設定例は、デモンストレーションを目的としたものです。 [txtaiのドキュメント](https://github.com/neuml/txtai) を参照して、お客様のニーズに合ったセットアップをお探しください(例：GPU [コンテナ](https://neuml.github.io/txtai/cloud/) を実行してパフォーマンスを向上させる場合など）。

## ハグ顔推論APIの利用

```{important}
[抱き顔推理API](https://huggingface.co/inference-api) は、テストや開発に適しています。 制作時のテキスト埋め込みプロバイダーとしてハギング・フェイスを使用するには、 [ハギング・フェイス推論エンドポイントプロバイダー](#using-the-hugging-face-inference-endpoints) を使用します。
```

Hugging Face Inference APIを使用するには、まず、 [Hugging Faceのアカウント](https://huggingface.co/join) を作成します。

アカウントを取得したら

1. Hugging Faceのアカウント設定に移動し、アクセストークンをコピーします。

1. Liferay で **Global Menu**(![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Search Experiences** &rarr; **Semantic Search** を開いてください。
   
   テキスト埋め込みプロバイダーとして「**Hugging Face Inference API**」を選択し、コピーしたアクセストークンを入力してください。

1. <https://huggingface.co/models?pipeline_tag=feature-extraction>のリストから1つのモデルを選択してください。 

1. モデルのタイトルとして、モデル名を入力します。

1. 選択したモデルに合わせて、適切な数のEmbedding Vector Dimensionsを入力してください。 

   ```{important}
   Embedding Vector Dimensionsは、設定されたモデルのものと一致する必要があります。 txtaiでは、`config.yml`ファイルを用いてモデルを指定します。 適切な寸法数を設定するために、モデルのマニュアルを参照してください。
   ```

1. その他のHugging Faceの設定はお好みで行ってください：
   
   **モデルのタイムアウト** タイムアウトするまでのモデルの読み込みを待つ時間(秒）を設定します。 Hugging Faceのモデルをメモリに固定することで、時間のかかるモデルの読み込みを繰り返さないようにすることができます。

設定を保存する前に、 **Test Configuration** ボタンをクリックし、Liferay が Hugging Face Inference API と接続できること、設定が正しいことを確認します。

## ハグ顔推論エンドポイントの使用について

[Hugging Face Inference Endpoints](https://huggingface.co/inference-endpoints) サービスは、Hugging Faceのエンタープライズグレードの有料テキスト埋め込みサービスです。 セマンティック検索ソリューションのテストや開発時には、 [Inference API](#using-the-hugging-face-inference-api) を使用することができます。

セットアップの大半は「Hugging Face」で完結します。 Inference APIを設定した後、 

1. Hugging Faceのアカウント設定に移動し、アクセストークンをコピーします。

1. Liferay で **Global Menu**(![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Search Experiences** &rarr; **Semantic Search** を開いてください。
   
   テキスト埋め込みプロバイダーとして「**Hugging Face Inference Endpoints**」を選択し、コピーしたアクセストークンを入力してください。

1. ホストアドレスを入力します。

1. 選択したモデルに合わせて、適切な数のEmbedding Vector Dimensionsを入力してください。 

   ```{important}
   Embedding Vector Dimensionsは、設定されたモデルのものと一致する必要があります。 txtaiでは、`config.yml`ファイルを用いてモデルを指定します。 適切な寸法数を設定するために、モデルのマニュアルを参照してください。
   ```

設定を保存する前に、 **Test Configuration** ボタンをクリックし、Liferay が Hugging Face Inference Endpoint と接続できること、設定が正しいことを確認します。
