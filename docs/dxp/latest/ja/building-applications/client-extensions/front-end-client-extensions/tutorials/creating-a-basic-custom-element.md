# 基本的なカスタム要素の作成

{bdg-secondary}`Liferay 7.4以降で利用可能`

カスタムエレメントクライアント拡張は、Liferayのフロントエンド基盤を利用して、外部のリモートアプリケーションをLiferayプラットフォームに登録し、ウィジェットとしてレンダリングします。

```{warning}
カスタムエレメントやIFrameを他のタイプのクライアントエクステンションのように展開することは、Liferay 7.4の**ベータ機能**です。 このチュートリアルでは、カスタム要素のリモートアプリケーションを異なる方法で展開しますが、将来のアップデートまでは、この方法が推奨されます。
```

ここでは、Liferay の [`create_custom_element.sh`](https://raw.githubusercontent.com/liferay/liferay-portal/master/tools/create_custom_element.sh) スクリプトを使用して、基本的なリモートアプリケーションを作成することにします。 アプリケーションが生成されたら、そのコードをコンパイルし、`.js`と`.css`ファイルをホストします。 ホストされたら、各ファイルのURLをコピーし、それを使用してカスタム要素を作成します。 最後に、アプリケーションをウィジェットとしてサイトページにデプロイします。

![create_custom_element.shスクリプトを使用して、簡単なReactアプリケーションを作成します。](./creating-a-basic-custom-element/images/01.png)

```{note}
カスタムエレメントクライアントの拡張は、構築、パッケージ化、ホスティングの方法に関係なく、あらゆるテクノロジーを使用できます。 このチュートリアルでは、Reactを使用したカスタム要素アプリケーションのサンプルのみを提供しています。
```

`create_custom_element.sh` を実行するには、 [Node.JS](https://nodejs.org/) , [NPM](https://www.npmjs.com/) , [YARN](https://classic.yarnpkg.com/) の最新版が必要です。 先に進む前に、これらのツールがインストールされていることを確認してください。

## `create_custom_element.sh` スクリプトを実行します。

`create_custom_element.sh`を呼び出す際には、有効なHTML要素名を指定し、目的のJavaScriptフレームワーク(ReactやVueなど）を指定する必要があります。

このコマンドを実行すると、Reactアプリケーションのコードが生成されます。

```bash
curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_custom_element.sh | bash -s h5v7-custom-element react
```

これは、カスタムHTML要素名(`h5v7-custom-element`）と目的のJavaScriptフレームワーク(`react`）の2つの引数でスクリプトを呼び出します。

実行が終了すると、スクリプトは自動的にこれらの要素を持つ新しいReactアプリケーションを `h5v7-custom-element`というフォルダーに作成します：

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

生成された `index.js` ファイルには、アプリケーションを Liferay カスタム要素リモートアプリケーションとして使用するために必要な 2 つのカスタマイズが含まれています。

* `WebComponent`: 21行目で、アプリケーションは `WebComponent` と宣言され、Liferayのフレームワークに接続できるようになっています。
* `ELEMENT_ID`: 30行目で `ELEMENT_ID` が、従来の `<div id="root" />`ではなく、 `h5v7-custom-element`に設定されています。 これは、リモートアプリケーションのHTML要素名がアプリケーションの`ELEMENT_ID`と一致しなければならず、`<div id="root" />`ではこの目的では機能しないためです。

### Reactルーティングを理解する

生成されたコードには、 `hello-world` (デフォルト)、 `hello-foo`、 `hello-bar`の3つのルートが含まれています。 ルーティングは、アプリケーションを実行する際に使用できる代替コードのセットです。 基本的な例については、 [カスタム要素でルーティングを使用する](./using-routes-with-custom-elements.md) を参照してください。

## Reactアプリケーションの構築

`create_custom_element.sh`を実行した後、新しい `h5v7-custom-element` フォルダーに移動し、アプリケーションを構築します：

```bash
cd h5v7-custom-element
```

```bash
yarn build
```

このコマンドは、アプリケーションの実行に必要な `.js` と `.css` ファイルを含む、最適化された実運用ビルドを作成します。

先に進む前に、コードが正常にコンパイルされたことを確認し、アプリケーションの `.js` と `.css` ファイルを確認してください。

```
Creating an optimized production build...
Compiled successfully.

File sizes after gzip:

  43.51 kB  build/static/js/main.114dde4a.js
  121 B     build/static/css/main.9877909d.css
```

これらのファイルは、Liferayにアクセス可能な場所に [ホスト](#hosting-the-application-files) されている必要があります。 これらは、リモートサーバーや、静的リソースの提供に最適化されたデータストレージシステムでホストすることができます。 デモの目的で、この例ではLiferayのドキュメントライブラリにアップロードし、WebDAV URLを使ってホストしています。

```{tip}
ビルドごとに一意のファイル名が生成されます。 カスタムアプリケーションをテストするときは、ビルド後に `.js` と `.css` ファイルを更新するのを忘れないようにしてください。
```

## アプリケーションファイルのホスティング

デモのために、このチュートリアルでは、Liferayドキュメントライブラリでアプリケーションの静的リソースをホストします。 本番環境では、静的リソースをホストするために最適化されたサーバーでアプリケーションのファイルをホストする必要があります。

`{include} /_snippets/run-liferay-dxp.md`

次に、以下の手順に従います。

1. **サイトメニュー**(![Site Menu](../../../../images/icon-product-menu.png)) を開き、 ［**コンテンツ & データ**］ を展開して、 ［**ドキュメントとメディア**］ へ移動してください。

1. **追加**(![Add Button](../../../../images/icon-add.png)) をクリックし、 **複数ファイルのアップロード** を選択します。

1. `.js` と `.css` のファイルをアップロードエリアにドラッグ＆ドロップしてください。

   または、 ［**Select Files**］ を使用してアップロードしてください。

   ![.js と .css ファイルを Liferayドキュメントライブラリにアップロードします。](./creating-a-basic-custom-element/images/02.png)

1. ［**Publish**］ をクリックします。

これにより、ファイルがドキュメントライブラリに追加され、リモートアプリケーションを作成するために使用する固有のURLが割り当てられます。

各ファイルのURLを表示するには、 **Info** アイコン (![Info Icon](../../../../images/icon-information.png)) をクリックし、ファイルを選択してください。 各ファイルの **WebDAV URL** をコピーし、次のステップで使用するために保存してください。

![各ファイルのWebDAV URLをコピーします。](./creating-a-basic-custom-element/images/03.png)

例えば、

* `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
* `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## Liferayにアプリケーションを登録する

1. **グローバルメニュー**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 ［**アプリケーション**］ タブをクリックし、 ［**リモートアプリケーション**］ へ移動します。

1. **追加**(![Add Button](../../../../images/icon-add.png)） をクリックします。

1. 次の値を入力します。

   | 項目            | 値                     |
   |:------------- |:--------------------- |
   | 名称            | H5V7-カスタムエレメント        |
   | タイプ           | カスタム要素                |
   | HTML要素名       | `h5v7-custom-element` |
   | URL           | `.js`ファイルのWebDAV URL  |
   | CSSのURL       | `.css`ファイルのWebDAV URL |
   | ポートレットのカテゴリー名 | リモートアプリケーション          |

1. ［**保存**］ をクリックします。

保存すると、LiferayはH5V7-Custom-Elementという名前のウィジェットを作成し、他のページウィジェットのようにサイトページに配置することができます。 選択したポートレットカテゴリー名の下に表示されるウィジェットです。

![H5V7-Custom-Elementウィジェットをサイトページに配置する。](./creating-a-basic-custom-element/images/04.png)

## 関連トピック

* [フロントエンドクライアント拡張機能](../../front-end-client-extensions.md)
* [カスタム要素とIFrameクライアント拡張機能を理解する](../understanding-custom-element-and-iframe-client-extensions.md)
* [カスタム要素でルーティングを使用する](./using-routes-with-custom-elements.md)
* [リモートアプリケーションUIリファレンス](../client-extensions-ui-reference.md)
