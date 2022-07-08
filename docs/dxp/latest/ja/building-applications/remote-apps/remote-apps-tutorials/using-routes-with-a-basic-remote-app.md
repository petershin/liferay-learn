# 基本のリモートアプリケーションによるルーティングの使用

リモートアプリケーションは、Liferayのフロントエンド基盤を利用して、外部アプリケーションをLiferayプラットフォームに登録し、ウィジェットとして描画します。 複数のルーティングを含むアプリケーション（例： [React Router](https://reactrouter.com/)）では、実行時にウィジェットに使用するルーティングを決定するために、リモートアプリケーションのプロパティを定義することができます。 これらのプロパティは、リモートアプリケーションまたはデプロイされたのウィジェットの設定オプションを使用して、アプリケーションに設定することができます。

このチュートリアルでは、Liferayの`create_remote_app.sh`スクリプトを使用して基本のReactアプリケーションを作成し、`hello-world`、`hello-foo`、`hello-bar`の3つのルーティングを持つサンプルのアプリを生成します。 アプリケーションをコンパイルし、`.js`と`.css`ファイルをホストしたら、アプリケーションをリモートアプリケーションに登録して、ページウィジェットとしてデプロイします。 最後に、それぞれの代替ルーティングを使用するように設定します。

![代替ルートを持つ単純なリモートアプリケーションを作成し、ルートプロパティを使用して、どちらが描画されるかを設定します。](./using-routes-with-a-basic-remote-app/images/01.png)

```{note}
Liferayリモートアプリケーションは、アプリケーションの構築、パッケージ化、ホスティングの方法にとらわれません。 このチュートリアルでは、リモートアプリケーションのサンプルを作成するための便利な方法のみを紹介します。
```

`create_remote_app.sh` を実行するには、最新版の [Node.JS](https://nodejs.org/)、 [NPM](https://www.npmjs.com/)、および [YARN](https://classic.yarnpkg.com/)が必要です。 先に進む前に、これらのツールがインストールされていることを確認してください。

## Reactアプリケーションの作成、構築、ホスティング

1. 新しいLiferay DXP 7.4以降のコンテナを起動します。 コンテナが起動する間、次のステップに進むことができます。

   ```docker
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
   ```

1. 別のターミナルでこのコマンドを実行し、Reactアプリケーションを生成します。

   ```bash
   curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_remote_app.sh | bash -s j1v3-remote-app react
   ```

1. アプリケーションが正常に作成されたことを確認します。

   スクリプトは、以下の要素を含む`j1v3-remote-app`という新しいReactアプリケーションを作成する必要があります。

   ```bash
   j1v3-remote-app
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
   │       │   └── pages
   │       │       └── HelloBar.js
   │       ├── hello-foo
   │       │   └── pages
   │       │       └── HelloFoo.js
   │       └── hello-world
   │           └── pages
   │               └── HelloWorld.js
   └── yarn.lock
   ```

1. 新しい`j1v3-remote-app`フォルダに移動し、アプリケーションをビルドします。

   ```bash
   cd j1v3-remote-app
   ```

   ```bash
   yarn build
   ```

1. ビルドが成功したことを確認し、アプリケーションの`.js`と`.css`ファイルをメモしておきます。

   ```bash
   Creating an optimized production build...
   Compiled successfully.

   File sizes after gzip:

   43.51 kB  build/static/js/main.114dde4a.js
   121 B     build/static/css/main.9877909d.css
   ```

1. メールアドレス（*test@liferay.com*）とパスワード（*test*）を使って、`<http://localhost:8080>`でLiferayにサインインします。 プロンプトが表示されたら、パスワードを *learn*に変更します。

1. *サイトメニュー* (![Site Menu](../../../images/icon-product-menu.png)) を開き、 *［コンテンツ & データ］*を展開して、 *［ドキュメントとメディア］*へ移動してください。

1. *追加*ボタン（![Add Button](../../../images/icon-add.png)）をクリックし、*［複数ファイルのアップロード］*を選択します。

1. `.js</0と<code>.css`ファイルをアップロードエリアにドラッグ＆ドロップしてください。

   ![.js と .css ファイルを Liferayドキュメントライブラリにアップロードします。](./using-routes-with-a-basic-remote-app/images/02.png)

1. *［Publish］*をクリックします。

これは Liferayドキュメントライブラリにファイルを追加し、固有の WebDAV URL を割り当て、リモートアプリケーションを作成するために使用します。

```{tip}
このチュートリアルでは、アプリケーションの静的リソースをデモ用にLiferayのドキュメントライブラリにホスティングします。 本番環境では、静的リソースをホストするために最適化されたサーバーでアプリケーションのファイルをホストする必要があります。
```

各ファイルのURLを表示するには、*Info* icon (![Info Icon](../../../images/icon-information.png))をクリックし、ファイルを一つずつ選択してください。 各ファイルの*WebDAV URL*をコピーし、次のステップで使用するために保存してください。

![各ファイルのWebDAV URLをコピーします。](./using-routes-with-a-basic-remote-app/images/03.png)

例:

* `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
* `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## リモートアプリケーションの登録とデプロイ

1. *グローバルメニュー* (![Global Menu](../../../images/icon-applications-menu.png)) を開き、*［アプリケーション］*タブをクリックし、*［リモートアプリケーション］*へ移動します。

1. *追加*ボタン（![Add Button](../../../images/icon-add.png)）をクリックします。

1. 次の値を入力します。

   | 項目                    | 値                     |
   |:--------------------- |:--------------------- |
   | 名前                    | J1V3-Remote-App       |
   | Type (Automatic Copy) | カスタム要素                |
   | HTML 要素名              | `j1v3-remote-app`     |
   | URL                   | `.js`ファイルのWebDAV URL  |
   | CSS の URL             | `.css`ファイルのWebDAV URL |
   | インスタンス化可能             | &#10004;              |
   | ポートレットのカテゴリ名          | リモートアプリケーション          |

1. *［保存］* をクリックします。

保存すると、LiferayはJ1V3-Remote-Appという名前のウィジェットを作成し、他のページウィジェットのようにサイトページにデプロイすることができるようになります。 選択したポートレットカテゴリ名の下に表示されます。

J1V3-Remote-Appはインスタンス化可能なので、1つのページに多数追加して、それぞれ独立した設定にすることができます。 このチュートリアルでは，1つのページに2回ウィジェットを追加します．

![J1V3-Remote-Appウィジェットの2つのインスタンスをデプロイします。](./using-routes-with-a-basic-remote-app/images/04.png)

## `ルート`プロパティを使用する場合

自動生成されたアプリには、3つのルートが含まれています。 `hello-world`、`hello-foo`、`hello-bar`です。 デフォルトでは、アプリケーションは`hello-world`ルートを使用します。 ただし、リモートアプリケーションのプロパティを使用して、別のルートを使用するように設定することができます。 これらのプロパティは、[リモートアプリケーション](#defining-a-route-property-via-remote-apps)または [ウィジェットの設定オプション](#defining-a-route-property-via-widget-configuration)で設定することが可能です。

### リモートアプリケーションでルートプロパティを定義する

1. *グローバルメニュー* (![Global Menu](../../../images/icon-applications-menu.png)) を開き、*［アプリケーション］*タブをクリックし、*［リモートアプリケーション］*へ移動します。

1. *J1V3-Remote-App*を選択します。

   ![J1V3-Remote-Appを選択します。](./using-routes-with-a-basic-remote-app/images/05.png)

1. プロパティフィールドに`route=hello-foo`と入力します。

   ![プロパティフィールドにroute=hello-fooと入力します。](./using-routes-with-a-basic-remote-app/images/06.png)

1. *［公開］*をクリックします。

1. デプロイされた両方のウィジェットが`HelloFoo`ルートを使用することを確認します。

   ![両方のウィジェットがHelloFooルートを使用することを確認します。](./using-routes-with-a-basic-remote-app/images/07.png)

### ポートレット設定でルートプロパティを定義する

1. J1V3-Remote-Appウィジェットが含まれるページを編集します。

1. ウィジェットの1つの*オプション* ボタン (![Options Button](../../../images/icon-actions.png)) をクリックし、*［設定］*を選択します。

   ![オプションボタンをクリックし、［設定］を選択します。](./using-routes-with-a-basic-remote-app/images/08.png)

1. プロパティフィールドに`route=hello-bar`と入力します。

   ![プロパティフィールドにroute=hello-barと入力します。](./using-routes-with-a-basic-remote-app/images/09.png)

1. *［保存］* をクリックします。

1. 設定されたウィジェットが`hello-bar`ルートを使用し、もう一方のウィジェットが`hello-foo`ルートを使用したままであることを確認します。

   ![設定されたウィジェットがHelloBarルートを使用していることを確認します。](./using-routes-with-a-basic-remote-app/images/10.png)

## ルートコードの分析

```{literalinclude} ./using-routes-with-a-basic-remote-app/resources/liferay-j1v3.zip/j1v3-remote-app/src/index.js
    :language: js
    :lines: 1-34
```

この`index.js`ファイルは`WebComponent`クラスを作成し、`HTMLElement`インターフェイスを拡張します。 このクラスは、インターフェースの[`connectedCallback()`](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements#using_the_lifecycle_callbacks)関数を実装し、`App`をパラメータとして[`ReactDOM.render`](https://reactjs.org/docs/react-dom.html#render)に呼び出します。 `App`が呼び出されると、定義された`"route"`属性がないか調べ、その値と利用可能なルートを比較します。 `hello-foo`または`hello-bar`のいずれかにマッチすれば、該当するルートを返して描画します。 そうでない場合は、`hello-world`を返して描画します。

各ルートは、`index.js`ファイルに`routes`フォルダーからインポートされます。

```bash
routes
├── hello-bar
│   └── pages
│       └── HelloBar.js
├── hello-foo
│   └── pages
│       └── HelloFoo.js
└── hello-world
    └── pages
        └── HelloWorld.js
```

### HelloWorld.js

```{literalinclude} ./using-routes-with-a-basic-remote-app/resources/liferay-j1v3.zip/j1v3-remote-app/src/routes/hello-world/pages/HelloWorld.js
    :language: js
    :lines: 1-9
```

### HelloFoo.js

```{literalinclude} ./using-routes-with-a-basic-remote-app/resources/liferay-j1v3.zip/j1v3-remote-app/src/routes/hello-foo/pages/HelloFoo.js
    :language: js
    :lines: 1-9
```

### HelloBar.js

```{literalinclude} ./using-routes-with-a-basic-remote-app/resources/liferay-j1v3.zip/j1v3-remote-app/src/routes/hello-bar/pages/HelloBar.js
    :language: js
    :lines: 1-9
```

## 追加情報

* [リモートアプリケーションの概要](../../remote-apps.md)
* [リモートアプリケーションの種類について](../understanding-remote-app-types.md)
* [基本のリモートアプリケーションの作成](./creating-a-basic-remote-app.md)
* [リモートアプリケーションUIリファレンス](../remote-apps-ui-reference.md)
