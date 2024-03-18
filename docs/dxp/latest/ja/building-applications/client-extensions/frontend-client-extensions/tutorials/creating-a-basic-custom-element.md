# 基本的なカスタム要素の作成

{bdg-secondary}`liferay 7.4+`

カスタム要素クライアント拡張は、Liferayのフロントエンドのインフラストラクチャーを使用して、外部のリモートアプリケーションをLiferayプラットフォームに登録し、ウィジェットとしてレンダリングします。

```{warning}
カスタム要素やIFrameを他のタイプのクライアント拡張のようにデプロイすることは、Liferay 7.4の**ベータ機能**です。 このチュートリアルでは、カスタム要素のリモートアプリケーションを異なる方法でデプロイしますが、将来のアップデートまでは、この方法が推奨されます。
```

ここでは Liferay の [`create_custom_element.sh`](https://raw.githubusercontent.com/liferay/liferay-portal/master/tools/create_custom_element.sh) スクリプトを使って基本的なリモートアプリケーションを作成します。 アプリケーションが生成されたら、コードをコンパイルして `.js` と `.css` ファイルをホストします。 ホストされたら、各ファイルのURLをコピーし、それを使用してカスタム要素を作成します。 最後に、アプリケーションをウィジェットとしてサイトページにデプロイします。

![Use the create_custom_element.sh script to create a simple React application.](./creating-a-basic-custom-element/images/01.png)

```{note}
カスタム要素クライアントの拡張は、構築、パッケージ化、ホスティングの方法に関係なく、あらゆるテクノロジーを使用できます。 このチュートリアルでは、Reactを使用したカスタム要素アプリケーションのサンプルのみを提供しています。
```
`create_custom_element.sh` を実行するには、 [Node.JS](https://nodejs.org/) 、 [NPM](https://www.npmjs.com/) 、 [YARN](https://classic.yarnpkg.com/) の最新バージョンが必要です。 先に進む前に、これらのツールがインストールされていることを確認してください。

## `create_custom_element.sh`スクリプトを実行する。

`create_custom_element.sh`を呼び出す際には、有効なHTML要素名を指定し、必要なJavaScriptフレームワーク（ReactやVueなど）を指定する必要がある。

このコマンドを実行すると、Reactアプリケーションのコードが生成されます。

```bash
curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_custom_element.sh | bash -s h5v7-custom-element react
```

これは2つの引数でスクリプトを呼び出します: カスタムHTML要素名(`h5v7-custom-element`)と希望のJavaScriptフレームワーク(`react`)です。

実行が完了すると、スクリプトは自動的にこれらの要素を持つ新しいReactアプリケーションを`h5v7-custom-element`という名前のフォルダに作成します：

```bash
h5v7-custom-element
├── node_modules
├── README.md
├── package.json
├── public
│   └── index.html
├── src
│   ├── common
│   │   ├── services
│   │   │   └── liferay
│   │   │       ├── api.js
│   │   │       └── liferay.js
│   │   └── styles
│   │       ├── hello-world.scss
│   │       ├── index.scss
│   │       └── variables.scss
│   ├── index.js
│   └── routes
│       ├── hello-bar
│       │   ├── components
│       │   └── pages
│       │       └── HelloBar.js
│       ├── hello-foo
│       │   ├── components
│       │   └── pages
│       │       └── HelloFoo.js
│       └── hello-world
│           ├── components
│           └── pages
│               └── HelloWorld.js
└── yarn.lock
```

### `index.js`ファイルを理解する

```{literalinclude} ./creating-a-basic-custom-element/resources/liferay-h5v7.zip/h5v7-custom-element/src/index.js
    :language: js
```

生成された `index.js` ファイルには、Liferayカスタム要素リモートアプリケーションとしてアプリケーションを使用するために必要な2つのカスタマイズが含まれています。

- `WebComponent`です：21行目でアプリケーションは`WebComponent` として宣言され、Liferay のフレームワークに接続できるようになっています。
- `ELEMENT_ID`： 30 行目では、`ELEMENT_ID` に従来の `<div id="root" />` ではなく `h5v7-custom-element` が設定されています。これは、リモートアプリケーションの HTML 要素名がアプリケーションの `ELEMENT_ID` と一致する必要があるためで、`<div id="root" />` はこの目的のためには機能しません。

### Reactルーティングを理解する

生成されたコードには3つのルートが含まれている：`hello-world`（デフォルト）、`hello-foo`、`hello-bar`である。 ルーティングは、アプリケーションを実行する際に使用できる代替コードのセットです。 基本的な例については [カスタム要素でルーティングを使用する](./using-routes-with-custom-elements.md) を参照してください。

## Reactアプリケーションの構築

`create_custom_element.sh`を実行したら、新しい`h5v7-custom-element`フォルダに移動し、アプリケーションをビルドします：

```bash
cd h5v7-custom-element
```

```bash
yarn build
```

このコマンドは、アプリケーションの実行に必要な `.js` ファイルと `.css` ファイルを含む、最適化されたプロダクションビルドを作成します。

先に進む前に、コードが正常にコンパイルされたことを確認し、アプリケーションの `.js` ファイルと `.css` ファイルに注目してください。

```
最適化された量産ビルドの作成...
正常にコンパイルされました。

gzip 後のファイルサイズ:

  43.51 kB build/static/js/main.114dde4a.js
  121 B build/static/css/main.9877909d.css
```

これらのファイルはLiferayがアクセスできる場所に [hosted](#hosting-the-application-files) 。 これらは、リモートサーバーや、静的リソースの提供に最適化されたデータストレージシステムでホストすることができます。 デモの目的で、この例ではLiferayのドキュメントライブラリにアップロードし、WebDAV URLを使ってホストしています。

```{tip}
ビルドごとに一意のファイル名が生成されます。 カスタムアプリケーションをテストするときは、ビルド後に `.js` と `.css` ファイルを更新するのを忘れないようにしてください。
```

## アプリケーションファイルのホスティング

デモのために、このチュートリアルでは、Liferayドキュメントライブラリでアプリケーションの静的リソースをホストします。 本番環境では、静的リソースをホストするために最適化されたサーバーでアプリケーションのファイルをホストする必要があります。

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. サイトメニュー(![サイトメニュー](../../../../images/icon-product-menu.png))を開き、 **コンテンツとデータ** を展開し、 **ドキュメントとメディア** に進みます。

1. **追加** (![追加ボタン](../../../../images/icon-add.png))をクリックし、**複数ファイルのアップロード** を選択します。

1. `.js`ファイルと`.css`ファイルをアップロードエリアにドラッグ＆ドロップします。

   または、 **Select Files** を使ってアップロードしてください。

   ![Upload the .js and .css files to the Liferay Document Library.](./creating-a-basic-custom-element/images/02.png)

1. ［**公開**］ をクリックします。

これにより、ファイルがドキュメントライブラリに追加され、リモートアプリケーションを作成するために使用する固有のURLが割り当てられます。

各ファイルのURLを表示するには、 **情報** アイコン(![情報アイコン](../../../../images/icon-information.png))をクリックし、ファイルを選択します。 各ファイルの **WebDAV URL** をコピーし、次のステップで使用するために保存する。

![Copy each file's WebDAV URL.](./creating-a-basic-custom-element/images/03.png)

例えば、

- `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
- `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## Liferayにアプリケーションを登録する

1. グローバルメニュー( ![グローバルメニュー](../../../../images/icon-applications-menu.png) )を開き、アプリケーション(_Applications_)タブをクリックし、リモートアプリケーション(**Remote Apps**)に進みます。

1. **追加**(![追加ボタン](../../../../images/icon-add.png))をクリックします。

1. 次の値を入力します。

   | 項目           | 値                     |
   | :----------- | :-------------------- |
   | 名前           | H5V7-Custom-Element   |
   | 種類           | カスタム要素                |
   | HTML 要素名     | `h5v7-custom-element` |
   | URL          | `.js`ファイルのWebDAV URL  |
   | CSS の URL    | `.css`ファイルのWebDAV URL |
   | ポートレットのカテゴリ名 | リモートアプリケーション          |

1. ［**保存**］をクリックします。

保存すると、LiferayはH5V7-Custom-Elementという名前のウィジェットを作成し、他のページウィジェットのようにサイトページにデプロイできるようになります。 選択したポートレットカテゴリー名の下に表示されるウィジェットです。

![Deploy the H5V7-Custom-Element widget to site pages.](./creating-a-basic-custom-element/images/04.png)

## 関連トピック

* [フロントエンド・クライアント拡張](../../frontend-client-extensions.md)
* [カスタム要素とIFrameクライアント拡張機能を理解する](../understanding-custom-element-and-iframe-client-extensions.md) 
* [カスタム・エレメントでルートを使う](./using-routes-with-custom-elements.md)
* [リモートアプリケーションUIリファレンス](../client-extensions-ui-reference.md)
