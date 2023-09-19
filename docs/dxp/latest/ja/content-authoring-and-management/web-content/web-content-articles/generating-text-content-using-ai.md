# AIを使ったテキストコンテンツの生成

{bdg-secondary}`7.4 U86+ および GA86+`

ウェブコンテンツは、AI Creatorツールを使ってOpenAIのChatGPTエンジンとの統合を提供します。 インスタンスまたはサイトにOpenAI APIキーを設定すると、WebコンテンツエディタでAI Creator機能を使用できます。 一度設定すれば、数クリックで作業用のコンテンツを生成し始めることができる。

## AIクリエイターの実現

```{important}
ChatGPTのウェブコンテンツへの統合は現在リリースフラグが立っています。 詳しくは [Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md) を読んでください。
```

はじめに、ChatGPTへのアクセスを認証するためにAPIキーを追加する必要があります。 [ *Instance Settings* を通して Liferay インスタンス](#adding-an-api-key-to-a-liferay-instance) に追加したり、 [特定のサイト](#adding-an-api-key-to-a-specific-site)に追加することができます。

### Liferay インスタンスに API キーを追加する

1. *Global Menu*( ![Global Menu](../../../images/icon-applications-menu.png) ) を開き、 *Control Panel* tab &rarr; *Instance Settings* (Under Configuration) に移動します。

1. *Content and Data*の下にある *AI Creator* をクリックする。

1. *API Key* フィールドに OpenAI API キーを貼り付けます。

1. *［Save］* をクリックします。

### 特定のサイトにAPIキーを追加する

特定のサイトのスコープにAPIキーを追加することで、サイトごとに異なるキーを使用したり、特定のサイトでキーを無効にしたりすることができる。

1. *Product Menu* ( ![Product Menu icon](../../../images/icon-product-menu.png) ) を開き、 *Configuration* &rarr; *Site Settings*を選択します。

1. *Content and Data*の下にある *AI Creator* をクリックする。

1. *API Key* フィールドに OpenAI API キーを貼り付けます。

1. *［Save］* をクリックします。

```{note}
Enable OpenAI to Create Contentチェックボックスを切り替えることで、AI Creatorボタンを有効または無効にできます。 この機能を無効にすると、ボタンはウェブコンテンツエディタに表示されません。
```

## AIクリエイターの活用

[機能フラグを有効にし、API Key](#enabling-ai-creator)を設定すると、AI Creator がウェブコンテンツエディタで利用できるようになります。 コンテンツの生成を始めるには、以下のステップに従う：

1. *グローバルメニュー*( ![Global Menu icon](../../../images/icon-applications-menu.png) ) を開き、右側のサイトを選択します。

1. *Product Menu* ( ![Product Menu Icon](../../../images/icon-product-menu.png) ) を開き、Content & Data の下にある *Web Content* app を選択します。

1. *Add* ( ![Add icon](../../../images/icon-add.png) ) をクリックして、基本ウェブコンテンツ記事を作成します。

1. *AI Creator*をクリックする。

    ![機能フラグを有効にすると、ウェブコンテンツエディタにAI Creatorボタンが表示されます。](./generating-text-content-using-ai/images/01.png)

1. AI Creatorのモーダルウィンドウで、以下の3つのフィールドに入力します：

    * **Description**: 希望する内容（例：「猫の睡眠習慣についてのブログ記事」）。
    * **Tone**: テキストのトーン。 選択肢は5つ：ニュートラル、カジュアル、フレンドリー、フォーマル、アカデミック。
    * **単語数**: あなたのテキストのおおよその単語数です。

1. ［作成］をクリックします。

1. (オプション）AIが生成したコンテンツが気に入らない場合は、 *Try Again* をクリックしてコンテンツを再生成することができます。

    ![コンテンツの内容、トーン、おおよその文字数を選ぶことができる。 気に入らなければ、AIクリエーターにコンテンツの再生を依頼することもできる。](./generating-text-content-using-ai/images/02.png)

    ```{important}
    コンテンツを生成する各リクエストは、[OpenAI APIトークン](https://help.openai.com/en/articles/4936856-what-are-tokens-and-how-to-count-them)を消費します。 上限に達すると、一般的なエラーメッセージが表示されます。
    ```

1. *Add* をクリックして、ウェブコンテンツ記事にコンテンツを挿入します。

これで、生成されたコンテンツを使い始めることができる。
