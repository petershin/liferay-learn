# 基本的なカスタム要素を作成する

{bdg-secondary}`利用可能なLiferay 7.4+`

カスタム要素は、Liferayのフロントエンドのインフラストラクチャを使用して、外部のリモートアプリケーションをLiferayプラットフォームに登録し、ウィジェットとしてレンダリングするクライアント拡張機能の一種です。

```{warning}
カスタム要素やIFrameを他のタイプのクライアント拡張と同じようにデプロイすることは、Liferay 7.4の**ベータ版機能**です。 このチュートリアルでは、カスタム要素のリモートアプリケーションを展開するための別の方法を使用していますが、将来のアップデートまでは、この方法が推奨されます。
```

ここでは、Liferay の [`create_custom_element.sh`](https://raw.githubusercontent.com/liferay/liferay-portal/master/tools/create_custom_element.sh) スクリプトを使用して、基本的なリモートアプリケーションを作成します。 アプリケーションが生成されたら、そのコードをコンパイルして、 `.js` と `.css` ファイルをホストします。 ホストされたら、各ファイルのURLをコピーして、カスタム要素を作成するために使用します。 最後に、アプリケーションをウィジェットとしてサイトのページに配置することができます。

![create_custom_element.shスクリプトを使用して、簡単なReactアプリケーションを作成します。](./creating-a-basic-custom-element/images/01.png)

```{note}
カスタム要素クライアント拡張は、アプリケーションがどのように構築され、パッケージ化され、ホストされているかには関係ありません。 このチュートリアルは、カスタム要素アプリケーションのサンプルを作成する便利な方法のみを提供します。
```

`create_custom_element.sh` を実行するには、最新版の [Node.JS](https://nodejs.org/) 、 [NPM](https://www.npmjs.com/) 、および [YARN](https://classic.yarnpkg.com/) が必要です。 先に進む前に、これらのツールがインストールされていることを確認してください。

## `create_custom_element.sh` スクリプトを実行します。

`create_custom_element.sh`を呼び出す際には、有効な HTML 要素名を指定し、目的の JavaScript フレームワーク（React や Vue など）を指定する必要があります。

このコマンドを実行すると、Reactアプリケーションのコードが生成されます。

```bash
curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_custom_element.sh | bash -s h5v7-remote-app react
```

これは、カスタムHTML要素名(`h5v7-remote-app`)と目的のJavaScriptフレームワーク(`react`)の2つの引数でスクリプトを呼び出すものです。

実行が終了すると、これらの要素を含む新しいReactアプリケーションが、 `h5v7-remote-app`という名前のフォルダーに自動的に作成されます。

```bash
h5v7-remote-app
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

### `index.js` ファイルを理解する。

   ```{literalinclude} ./creating-a-basic-custom-element/resources/liferay-h5v7.zip/h5v7-remote-app/src/index.js
       :language: js
   ```

生成された `index.js` ファイルには、アプリケーションを Liferay カスタム要素リモートアプリケーションとして使用するために必要な 2 つのカスタマイズが含まれています。

* `WebComponent`: 21行目で、アプリケーションは `WebComponent` と宣言され、Liferayのフレームワークに接続できるようになっています。
* `ELEMENT_ID`: 30行目、 `ELEMENT_ID` に、従来の `<div id="root" />`ではなく、 `h5v7-remote-app`が設定されています。 これは、リモートアプリケーションのHTML Element Nameは、アプリケーションの `ELEMENT_ID`と一致しなければならず、 `<div id="root" />` はこの目的には使えないからです。

### Reactルーチンを理解する

生成されたコードには、 `hello-world` (デフォルト)、 `hello-foo`、 `hello-bar`の3つのルートが含まれています。 ルートは、アプリケーションを実行する際に使用できる代替コードのセットです。 基本的な例として、 [カスタム要素でルートを使用する](./using-routes-with-custom-elements.md) を参照してください。

## Reactアプリケーションの構築

`create_custom_element.sh`を実行した後、新しい `h5v7-remote-app` フォルダに移動し、アプリケーションを構築します。

```bash
cd h5v7-remote-app
```

```bash
yarn build
```

このコマンドは、アプリケーションの実行に必要な `.js` と `.css` ファイルを含む、最適化された実運用ビルドを作成します。

先に進む前に、コードが正常にコンパイルされたことを確認し、アプリケーションの `.js` と `.css` ファイルをメモしておきます。

```
Creating an optimized production build...
Compiled successfully.

File sizes after gzip:

  43.51 kB  build/static/js/main.114dde4a.js
  121 B     build/static/css/main.9877909d.css
```

これらのファイルは、Liferayからアクセス可能な場所に [ホストされている](#hosting-the-application-files) 必要があります。これらは、リモートサーバーや、静的リソースの提供に最適化されたデータストレージシステムでホストすることができます。デモの目的で、この例ではLiferayのドキュメントライブラリにアップロードし、WebDAV URLを使ってホストしています。

```{tip}
ビルドごとに一意のファイル名が生成されます。 カスタムアプリケーションをテストする場合、ビルド後に `.js` と `.css` ファイルを更新することを忘れないでください。
```

## アプリケーションファイルのホスティング

デモのために、このチュートリアルではアプリケーションの静的リソースをLiferayのドキュメントライブラリにホスティングします。 本番環境では、静的リソースのホスティングに最適化されたサーバーに、アプリケーションのファイルをホスティングする必要があります。

`{include} /_snippets/run-liferay-dxp.md`

次に、以下の手順を実行します。

1. **サイトメニュー**(![Site Menu](../../../../images/icon-product-menu.png)) を開き、 **コンテンツ & データ** を展開し、 **ドキュメントとメディア** に進みます。

1. **追加** ボタン (![Add Button](../../../../images/icon-add.png)) をクリックし、 **複数ファイルのアップロード** を選択します。

1. `.js` と `.css` のファイルをアップロードエリアにドラッグ＆ドロップしてください。
   
   または、 **Select Files** を使ってアップロードすることもできます。
   
   ![.js と .css ファイルを Liferay Document Library にアップロードします。](./creating-a-basic-custom-element/images/02.png)

1. **Publish** をクリックします。

これにより、ファイルがドキュメントライブラリに追加され、リモートアプリケーションを作成するために使用する一意のURLが割り当てられます。

各ファイルのURLを表示するには、 **情報** アイコン (![Info Icon](../../../../images/icon-information.png))をクリックし、ファイルを選択します。次の手順で使用するため、各ファイルの **WebDAV URL** をコピーし、保存してください。

![各ファイルのWebDAV URLをコピーします。](./creating-a-basic-custom-element/images/03.png)

例えば、こんな感じです。

* `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
* `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## Liferayにアプリケーションを登録する

1. **グローバルメニュー**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 **アプリケーション** タブをクリックし、 **リモートアプリ** に進みます。

1. **追加** ボタン (![Add Button](../../../../images/icon-add.png)) をクリックします。

1. これらの値を入力します。


   | フィールド       | 価値                      |
   |:----------- |:----------------------- |
   | 名称          | H5V7-Remote-App         |
   | タイプ         | カスタム要素                  |
   | HTML要素名     | `h5v7-remote-app`       |
   | URL         | `.js` ファイルの WebDAV URL  |
   | CSSのURL     | `.css` ファイルの WebDAV URL |
   | ポートレットカテゴリ名 | リモートアプリ                 |

   
   1. **保存** をクリックします。

保存すると、LiferayはH5V7-Remote-Appという名前のウィジェットを作成し、他のページウィジェットのようにサイトのページに配置することができるようになります。 選択したポートレットカテゴリ名の下に表示されるウィジェットです。

![H5V7-Remote-Appウィジェットをサイトページに配置する。](./creating-a-basic-custom-element/images/04.png)

## 追加情報

* [ブラウザベースのクライアント拡張機能](../../browser-based-client-extensions.md)
* [カスタムエレメントとIFrameクライアント拡張機能を理解する](../understanding-custom-element-and-iframe-client-extensions.md)
* [カスタム要素でルートを使用する](./using-routes-with-custom-elements.md)
* [リモートアプリケーションのUIリファレンス](../remote-applications-ui-reference.md)
