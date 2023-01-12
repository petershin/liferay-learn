# カスタム要素でルートを使用する

{bdg-secondary}`利用可能なLiferay 7.4+`

カスタム要素は、Liferayのフロントエンドのインフラストラクチャを使用して、外部アプリケーションをLiferayプラットフォームに登録し、ウィジェットとしてレンダリングするクライアント拡張機能の一種です。 複数のルートを含むアプリケーション（例： [React Router](https://reactrouter.com/)）では、実行時にウィジェットに使用するルートを決定するために、リモートアプリケーションのプロパティを定義することができます。 これらのプロパティは、LiferayのRemote Appsメニュー、またはデプロイ後のウィジェットの設定オプションからアプリケーションに設定することができます。

```{warning}
カスタム要素やIFrameを他のタイプのクライアント拡張と同じようにデプロイすることは、Liferay 7.4の**ベータ版機能**です。 このチュートリアルでは、カスタム要素のリモートアプリケーションを展開するための別の方法を使用していますが、将来のアップデートまでは、この方法が推奨されます。
```

このチュートリアルでは、Liferay の `create_remote_app.sh` スクリプトを使って、基本的な React アプリケーションを作成します。このスクリプトは、3つのルートを持つサンプルアプリを生成します： `hello-world`, `hello-foo`, `hello-bar`. アプリケーションをコンパイルし、その `.js` と `.css` ファイルをホストした後、アプリケーションを Liferay に登録し、ページウィジェットとしてデプロイすることになります。 最後に、それぞれの代替経路を使用するように設定します。

![代替ルートを持つ基本的なカスタム要素リモートアプリを作成し、ルートプロパティを使用して、どちらがレンダリングされるかを設定することができます。](./using-routes-with-custom-elements/images/01.png)

```{note}
カスタム要素クライアント拡張は、アプリケーションがどのように構築され、パッケージ化され、ホストされているかには関係ありません。 このチュートリアルでは、基本的なルーティングを持つサンプルカスタム要素アプリケーションを作成する便利な方法のみを提供します。
```

`create_remote_app.sh` を実行するには、最新版の [Node.JS](https://nodejs.org/)、 [NPM](https://www.npmjs.com/)、および [YARN](https://classic.yarnpkg.com/)が必要です。 先に進む前に、これらのツールがインストールされていることを確認してください。

## Reactアプリケーションの作成、ビルド、ホスティング

1. Liferay DXP 7.4+ のコンテナを新規に起動します。 コンテナが起動する間、次のステップに進むことができます。

   ```docker
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
   ```

1. 別の端末でこのコマンドを実行し、Reactアプリケーションを生成します。

   ```bash
   curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_remote_app.sh | bash -s j1v3-remote-app react
   ```

1. アプリケーションが正常に作成されたことを確認します。

   このスクリプトでは、以下の要素を含む `j1v3-remote-app` という新しい React アプリケーションが作成されるはずです。

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

1. 新しい `j1v3-remote-app` フォルダに移動し、アプリケーションをビルドします。

   ```bash
   cd j1v3-remote-app
   ```

   ```bash
   yarn build
   ```

1. ビルドが成功したことを確認し、アプリケーションの `.js` と `.css` ファイルをメモしておきます。

   ```bash
   Creating an optimized production build...
   Compiled successfully.

   File sizes after gzip:

   43.51 kB  build/static/js/main.114dde4a.js
   121 B     build/static/css/main.9877909d.css
   ```

1. メールアドレス *test@liferay.com* とパスワード *test*を使って `<http://localhost:8080>` で Liferay にサインインしてください。 プロンプトが表示されたら、パスワードを *learn*に変更します。

1. *サイトメニュー* (![Site Menu](../../../../images/icon-product-menu.png)) を開き、 *コンテンツ & データ*を展開し、 *ドキュメントとメディア*に進みます。

1. *追加* ボタン (![Add Button](../../../../images/icon-add.png)) をクリックし、 *複数ファイルのアップロード*を選択します。

1. `.js` と `.css` のファイルをアップロードエリアにドラッグ＆ドロップしてください。

   ![.js と .css ファイルを Liferay Document Library にアップロードします。](./using-routes-with-custom-elements/images/02.png)

1. *Publish*をクリックします。

これは Liferay Document Library にファイルを追加し、固有の WebDAV URL を割り当てます。この URL はリモートアプリケーションの作成に使用します。

```{tip}
このチュートリアルでは、アプリケーションの静的リソースをデモ用にLiferayのドキュメントライブラリにホスティングします。 本番環境では、静的リソースのホスティングに最適化されたサーバーに、アプリケーションのファイルをホスティングする必要があります。
```

各ファイルのURLを表示するには、*情報*アイコン (![Info Icon](../../../../images/icon-information.png))をクリックし、ファイルを選択します。次の手順で使用するため、各ファイルの*WebDAV URL*をコピーし、保存してください。

![各ファイルのWebDAV URLをコピーします。](./using-routes-with-custom-elements/images/03.png)

例えば、こんな感じです。

* `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
* `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## アプリケーションの登録とデプロイ

1. *グローバルメニュー* (![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 *アプリケーション* タブをクリックし、 *リモートアプリ*に進みます。

1. *追加* ボタン (![Add Button](../../../../images/icon-add.png)) をクリックします。

1. これらの値を入力します。

   | フィールド       | 価値                      |
   |:----------- |:----------------------- |
   | 名称          | J1V3-Remote-App         |
   | タイプ         | カスタム要素                  |
   | HTML要素名     | `j1v3-remote-app`       |
   | URL         | `.js` ファイルの WebDAV URL  |
   | CSSのURL     | `.css` ファイルの WebDAV URL |
   | インスタンス化可能   | &#10004;                |
   | ポートレットカテゴリ名 | リモートアプリ                 |

1. *保存*をクリックします。

保存すると、LiferayはJ1V3-Remote-Appという名前のウィジェットを作成し、他のページウィジェットのようにサイトページにデプロイすることができるようになります。 選択したポートレットカテゴリ名の下に表示されます。

J1V3-Remote-Appはインスタンス化可能なので、1つのページに多数追加して、それぞれ独立した設定にすることができます。 このチュートリアルでは，1つのページに2回ウィジェットを追加します．

![J1V3-Remote-Appウィジェットのインスタンスを2つデプロイします。](./using-routes-with-custom-elements/images/04.png)

## `ルート` プロパティを使用する

自動生成されたアプリには、 `hello-world`, `hello-foo`, `hello-bar`の3つのルートが含まれています。 デフォルトでは、アプリケーションは `hello-world` のルートを使用します。 ただし、リモートアプリケーションのプロパティを使用して、別のルートを使用するように設定することは可能です。 これらのプロパティは、 [Remote Apps メニュー](#defining-a-route-property-via-the-remote-apps-menu) または [ウィジェットの設定オプション](#defining-a-route-property-via-widget-configuration)で設定することができます。

### リモートアプリのメニューから経路のプロパティを定義する

1. *グローバルメニュー* (![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 *アプリケーション* タブをクリックし、 *リモートアプリ*に進みます。

1. 選択 *J1V3-Remote-App*.

   ![J1V3-Remote-Appを選択します。](./using-routes-with-custom-elements/images/05.png)

1. プロパティの欄に、 `route=hello-foo` と入力します。

   ![Propertiesの欄にroute=hello-fooと入力します。](./using-routes-with-custom-elements/images/06.png)

1. *Publish*をクリックします。

1. 配置された両方のウィジェットが `HelloFoo` のルートを使用していることを確認します。

   ![両方のウィジェットがHelloFooルートを使用することを確認します。](./using-routes-with-custom-elements/images/07.png)

### ウィジェット構成でルートプロパティを定義する

1. J1V3-Remote-Appウィジェットが含まれるページを編集します。

1. ウィジェットの1つの *オプション* ボタン(![Options Button](../../../../images/icon-actions.png))をクリックし、 *設定*を選択します。

   ![オプションボタンをクリックし、コンフィギュレーションを選択します。](./using-routes-with-custom-elements/images/08.png)

1. Properties欄に「 `route=hello-bar` 」と入力します。

   ![Properties欄にroute=hello-barと入力します。](./using-routes-with-custom-elements/images/09.png)

1. *保存*をクリックします。

1. 設定されたウィジェットが `hello-bar` ルートを使用し、もう一方のウィジェットが `hello-foo` ルートをまだ使用していることを確認してください。

   ![設定されたウィジェットがHelloBarルートを使用していることを確認します。](./using-routes-with-custom-elements/images/10.png)

## ルートコードの解析

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-remote-app/src/index.js
    :language: js
    :lines: 1-34
```

この `index.js` ファイルは `WebComponent` クラスを作成し、 `HTMLElement` インターフェイスを継承しています。 このクラスは、インターフェースの [`connectedCallback()`](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements#using_the_lifecycle_callbacks) 関数を実装しており、 [`ReactDOM.render`](https://reactjs.org/docs/react-dom.html#render) を `App` をパラメータとして呼び出します。 `App` が呼び出されると、定義された `"route"` 属性があるかどうかを確認し、その値と利用可能な経路を比較します。 `hello-foo` または `hello-bar`のいずれかにマッチする場合、対応するルートを返してレンダリングする。 そうでない場合は、 `hello-world`をレンダリングします。

各ルートは、 `routes` フォルダから `index.js` ファイルにインポートされます。

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

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-remote-app/src/routes/hello-world/pages/HelloWorld.js
    :language: js
    :lines: 1-9
```

### HelloFoo.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-remote-app/src/routes/hello-foo/pages/HelloFoo.js
    :language: js
    :lines: 1-9
```

### HelloBar.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-remote-app/src/routes/hello-bar/pages/HelloBar.js
    :language: js
    :lines: 1-9
```

## 追加情報

* [ブラウザベースのクライアント拡張機能](../../browser-based-client-extensions.md)
* [カスタムエレメントとIFrameクライアント拡張機能を理解する](../understanding-custom-element-and-iframe-client-extensions.md)
* [基本的なカスタム要素を作成する](./creating-a-basic-custom-element.md)
* [リモートアプリケーションのUIリファレンス](../remote-applications-ui-reference.md)
