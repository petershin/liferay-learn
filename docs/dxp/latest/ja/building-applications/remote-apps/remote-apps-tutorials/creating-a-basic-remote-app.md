# 基本のリモートアプリケーションの作成

> Liferay DXP 7.4以降で利用可能

リモートアプリケーションは、Liferayのフロントエンド基盤を利用して、外部アプリケーションをLiferayプラットフォームに登録し、ウィジェットとして描画します。

このチュートリアルでは、Liferayの[`create_remote_app.sh`](https://raw.githubusercontent.com/liferay/liferay-portal/master/tools/create_remote_app.sh)スクリプトを使って、基本のアプリケーションを作成します。 アプリケーションが生成されたら、そのコードをコンパイルし、`.js`と`.css`ファイルをホストします。 ホストされたら、各ファイルのURLをコピーして、それを使ってLiferayリモートアプリケーションを作成します。 最後に、アプリケーションをウィジェットとしてサイトページにデプロイします。

![create_remote_app.shスクリプトを使用して、簡単なReactアプリケーションを作成します。](./creating-a-basic-remote-app/images/01.png)

```{note}
Liferayリモートアプリケーションは、アプリケーションの構築、パッケージ化、ホスティングの方法にとらわれません。 このチュートリアルでは、リモートアプリケーションのサンプルを作成するための便利な方法のみを紹介します。
```

`create_remote_app.sh` を実行するには、最新版の [Node.JS](https://nodejs.org/)、 [NPM](https://www.npmjs.com/)、および [YARN](https://classic.yarnpkg.com/)が必要です。 先に進む前に、これらのツールがインストールされていることを確認してください。

## `create_remote_app.sh`スクリプトを実行します。

`create_remote_app.sh`を呼び出す場合、有効なHTML要素名を指定し、目的のJavaScriptフレームワーク（例：ReactもしくはVue）を指定する必要があります。

このコマンドを実行すると、Reactアプリケーションのコードが生成されます。

```bash
curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_remote_app.sh | bash -s h5v7-remote-app react
```

これは、カスタムHTML要素名（`h5v7-remote-app`）と目的のJavaScriptフレームワーク（`react`）の2つの引数を使用してスクリプトを呼び出します。

実行が終了すると、スクリプトは自動的に新しいReactアプリケーションを `h5v7-remote-app`というフォルダに作成し、これらの要素を含めます。

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

### `index.js`ファイルを理解する

   ```{literalinclude} ./creating-a-basic-remote-app/resources/liferay-h5v7.zip/h5v7-remote-app/src/index.js
       :language: js
   ```

生成された`index.js`ファイルには、Liferayリモートアプリケーションとしてアプリケーションを使用するために必要な2つのカスタマイゼーションが含まれています。

* WebComponent：21行目で、アプリケーションは`WebComponent`と宣言され、リモートアプリケーションに接続できるようになっています。
* ELEMENT_ID：30行目で、`ELEMENT_ID`に、従来の`<div id="root" />`ではなく、 `h5v7-remote-app`がセットされました。 これは、リモートアプリケーションのHTML要素名がアプリケーションの `ELEMENT_ID`と一致しなければならず、`<div id="root" />`ではこの目的では機能しないためです。

### Reactルーティングを理解する

生成されたコードには、`hello-world`（デフォルト）、`hello-foo`、 `hello-bar`の3つのルーティングが含まれています。 ルーティングは、アプリケーションを実行する際に使用できる代替コードのセットです。 基本的な例については、 [基本のリモートアプリケーションによるルーティングの使用](./using-routes-with-a-basic-remote-app.md) を参照してください。

## Reactアプリケーションの構築

`create_remote_app.sh`を実行後、新しい`h5v7-remote-app`フォルダに移動し、アプリケーションをビルドします。

```bash
cd h5v7-remote-app
```

```bash
yarn build
```

このコマンドは、アプリケーションの実行に必要な`.js`と`.css`ファイルを含む最適化された本番環境用ビルドを作成します。

先に進む前に、コードが正常にコンパイルされたことを確認し、アプリケーションの`.js`と`.css`ファイルを記録してください。

```
最適化された本番環境ビルドを作成します...
コンパイルに成功しました。

gzip後のファイルサイズ：

  43.51 kB  build/static/js/main.114dde4a.js
  121 B     build/static/css/main.9877909d.css
```

これらのファイルは、Liferayリモートアプリケーションにアクセス可能な場所に[ホスト](#hosting-the-application-files)されている必要があります。 これらは、リモートサーバーや、静的リソースの提供に最適化されたデータストレージシステムでホストすることができます。 デモの目的で、この例ではLiferayのドキュメントライブラリにアップロードし、WebDAV URLを使ってホストしています。

```{tip}
ビルドごとに一意のファイル名が生成されます。 カスタムアプリケーションをテストするときは、ビルド後に `.js` と `.css` ファイルを更新するのを忘れないようにしてください。
```

## アプリケーションファイルのホスティング

デモのために、このチュートリアルでは、Liferayドキュメントライブラリでアプリケーションの静的リソースをホストします。 本番環境では、静的リソースをホストするために最適化されたサーバーでアプリケーションのファイルをホストする必要があります。
`{include} /_snippets/run-liferay-dxp.md`

次に、以下の手順に従います。

1. *サイトメニュー* (![Site Menu](../../../images/icon-product-menu.png)) を開き、 *［コンテンツ & データ］*と展開して、 *［ドキュメントとメディア］*へ移動してください。

1. *追加*ボタン（![Add Button](../../../images/icon-add.png)）をクリックし、*［複数ファイルのアップロード］*を選択します。

1. `.js</0と<code>.css`ファイルをアップロードエリアにドラッグ＆ドロップしてください。

   または、*［Select Files］*を使用してアップロードしてください。

   ![.js と .css ファイルを Liferayドキュメントライブラリにアップロードします。](./creating-a-basic-remote-app/images/02.png)

1. *［Publish］*をクリックします。

これにより、ファイルがドキュメントライブラリに追加され、リモートアプリケーションを作成するために使用する固有のURLが割り当てられます。

各ファイルのURLを表示するには、*Info*アイコン (![Info Icon](../../../images/icon-information.png)) をクリックし、ファイルを選択してください。 各ファイルの*WebDAV URL*をコピーし、次のステップで使用するために保存してください。

![各ファイルのWebDAV URLをコピーします。](./creating-a-basic-remote-app/images/03.png)

例:

* `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
* `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## リモートアプリケーションにアプリケーションを登録する

1. *グローバルメニュー* (![Global Menu](../../../images/icon-applications-menu.png)) を開き、*［アプリケーション］*タブをクリックし、*［Remote Apps］*へ移動します。

1. *追加*ボタン（![Add Button](../../../images/icon-add.png)）をクリックします。

1. 次の値を入力します。

   | 項目           | 値                     |
   |:------------ |:--------------------- |
   | 名前           | H5V7-Remote-App       |
   | 種類           | カスタム要素                |
   | HTML 要素名     | `h5v7-remote-app`     |
   | URL          | `.js`ファイルのWebDAV URL  |
   | CSS の URL    | `.css`ファイルのWebDAV URL |
   | ポートレットのカテゴリ名 | リモートアプリケーション          |

1. *［保存］* をクリックします。

保存すると、LiferayはH5V7-Remote-Appという名前のウィジェットを作成し、他のページウィジェットのようにサイトページにデプロイすることができるようになります。 選択したポートレットカテゴリ名の下に表示されるウィジェットです。

![サイトページにH5V7-Remote-Appウィジェットをデプロイします。](./creating-a-basic-remote-app/images/04.png)

## 追加情報

* [リモートアプリケーションの概要](../../remote-apps.md)
* [リモートアプリケーションの種類について](../understanding-remote-app-types.md)
* [基本のリモートアプリケーションによるルーティングの使用](./using-routes-with-a-basic-remote-app.md)
* [リモートアプリケーションUIリファレンス](../remote-apps-ui-reference.md)
