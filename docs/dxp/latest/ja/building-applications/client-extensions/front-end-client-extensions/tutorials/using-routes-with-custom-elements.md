# カスタム要素でルーティングを使用する

{bdg-secondary}`Liferay 7.4以降で利用可能`

カスタムエレメントクライアント拡張は、Liferayのフロントエンド基盤を利用して、外部アプリケーションをLiferayプラットフォームに登録し、ウィジェットとしてレンダリングします。 複数のルーティングを含むアプリケーション(例： [React Router](https://reactrouter.com/) ）では、実行時にウィジェットに使用するルーティングを決定するために、リモートアプリケーションのプロパティを定義することができます。 これらのプロパティは、Liferayのリモートアプリケーションメニュー、またはデプロイ後のウィジェットの設定オプションからアプリケーションに設定することができます。

```{warning}
カスタムエレメントやIFrameを他のタイプのクライアントエクステンションのように展開することは、Liferay 7.4の**ベータ機能**です。 このチュートリアルでは、カスタム要素のリモートアプリケーションを異なる方法で展開しますが、将来のアップデートまでは、この方法が推奨されます。
```

このチュートリアルでは、Liferay の `create_custom_element.sh` スクリプトを使って基本的な React アプリケーションを作成します。 `hello-world`, `hello-foo`, `hello-bar`という 3 つのルートを持つサンプルアプリを生成します。 アプリケーションをコンパイルし、`.js`と`.css`ファイルをホストしたら、アプリケーションをLiferayに登録して、ページウィジェットとしてデプロイします。 最後に、それぞれの代替ルーティングを使用するように設定します。

![代替ルートを持つ基本的なカスタム要素リモートアプリケーションを作成し、ルートプロパティを使用して、どちらがレンダリングされるかを設定することができます。](./using-routes-with-custom-elements/images/01.png)

```{note}
カスタムエレメントクライアントの拡張は、構築、パッケージ化、ホスティングの方法に関係なく、あらゆるテクノロジーを使用できます。 このチュートリアルでは、基本的なルーティングを行うカスタムエレメントアプリケーションのサンプルのみを提供しています。
```

`create_custom_element.sh` を実行するには、 [Node.JS](https://nodejs.org/) , [NPM](https://www.npmjs.com/) , [YARN](https://classic.yarnpkg.com/) の最新版が必要です。 先に進む前に、これらのツールがインストールされていることを確認してください。

## Reactアプリケーションの作成、ビルド、ホスティング

1. 新しいLiferay DXP 7.4以降のコンテナを起動します。 コンテナが起動する間、次のステップに進むことができます。

   ```docker
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
   ```

1. 別の端末でこのコマンドを実行し、Reactアプリケーションを生成します。

   ```bash
   curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_custom_element.sh | bash -s j1v3-custom-element react
   ```

1. アプリケーションが正常に作成されたことを確認します。

   スクリプトは、これらの要素で `j1v3-custom-element` という新しい React アプリケーションを作成します：

   ```bash
   j1v3-custom-element
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

1. 新しい `j1v3-custom-element` フォルダに移動し、アプリケーションをビルドします。

   ```bash
   cd j1v3-custom-element
   ```

   ```bash
   yarn build
   ```

1. ビルドが成功したことを確認し、アプリケーションの `.js` と `.css` ファイルを確認します。

   ```bash
   Creating an optimized production build...
   Compiled successfully.

   File sizes after gzip:

   43.51 kB  build/static/js/main.114dde4a.js
   121 B     build/static/css/main.9877909d.css
   ```

1. メールアドレス(**test@liferay.com**）とパスワード(**test**）を使って、`<http://localhost:8080>`でLiferayにサインインします。 プロンプトが表示されたら、パスワードを **learn** に変更します。

1. **サイトメニュー**(![Site Menu](../../../../images/icon-product-menu.png)) を開き、 ［**コンテンツ & データ**］ を展開して、 ［**ドキュメントとメディア**］ へ移動してください。

1. **追加**(![Add Button](../../../../images/icon-add.png)) をクリックし、 **複数ファイルのアップロード** を選択します。

1. `.js` と `.css` のファイルをアップロードエリアにドラッグ＆ドロップしてください。

   ![.js と .css ファイルを Liferayドキュメントライブラリにアップロードします。](./using-routes-with-custom-elements/images/02.png)

1. ［**Publish**］ をクリックします。

これは Liferayドキュメントライブラリにファイルを追加し、固有の WebDAV URL を割り当て、リモートアプリケーションを作成するために使用します。

```{tip}
このチュートリアルでは、アプリケーションの静的リソースをデモ用にLiferayのドキュメントライブラリにホスティングします。 本番環境では、静的リソースをホストするために最適化されたサーバーでアプリケーションのファイルをホストする必要があります。
```

各ファイルのURLを表示するには、 **Info** icon (![Info Icon](../../../../images/icon-information.png))をクリックし、ファイルを一つずつ選択してください。 各ファイルの **WebDAV URL** をコピーし、次のステップで使用するために保存してください。

![各ファイルのWebDAV URLをコピーします。](./using-routes-with-custom-elements/images/03.png)

例：

* `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
* `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## アプリケーションの登録とデプロイ

1. **グローバルメニュー**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 ［**アプリケーション**］ タブをクリックし、 ［**リモートアプリケーション**］ へ移動します。

1. **追加**(![Add Button](../../../../images/icon-add.png)） をクリックします。

1. 次の値を入力します。

   | 項目           | 値                     |
   |:------------ |:--------------------- |
   | 名称           | J1V3-カスタムエレメント        |
   | タイプ          | カスタム要素                |
   | HTML要素名      | `j1v3-custom-element` |
   | URL          | `.js`ファイルのWebDAV URL  |
   | CSSのURL      | `.css`ファイルのWebDAV URL |
   | インスタンス化可能    | &#10004;              |
   | ポートレットのカテゴリ名 | リモートアプリケーション          |

1. ［**保存**］ をクリックします。

保存すると、LiferayはJ1V3-Custom-Elementという名前のウィジェットを作成し、他のページウィジェットと同様にサイトページに配置することができます。 選択したポートレットカテゴリ名の下に表示されます。

J1V3-Custom-Elementはインスタンス化可能なので、1つのページに多数追加し、それぞれを独立した構成にすることが可能です。 この例では、ウィジェットを2回ページに追加します。

![J1V3-Custom-Elementウィジェットのインスタンスを2つデプロイしてください。](./using-routes-with-custom-elements/images/04.png)

## `route`プロパティを使用する場合

自動生成されたアプリには、3つのルートが含まれています。 `hello-world`、`hello-foo`、`hello-bar`です。 デフォルトでは、アプリケーションは `hello-world` のルートを使用します。 ただし、リモートアプリケーションのプロパティを使用して、別のルートを使用するように設定することができます。 これらのプロパティは、 [リモートアプリケーション](#defining-a-route-property-via-the-remote-apps-menu) または [ウィジェットの設定オプション](#defining-a-route-property-via-widget-configuration) で設定することが可能です。

### リモートアプリケーションでルートプロパティを定義する

1. **グローバルメニュー**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 ［**アプリケーション**］ タブをクリックし、 ［**リモートアプリケーション**］ へ移動します。

1. 選択 **J1V3-Custom-Element** .

   ![J1V3-Custom-Elementを選択します。](./using-routes-with-custom-elements/images/05.png)

1. プロパティフィールドに`route=hello-foo`と入力します。

   ![プロパティフィールドにroute=hello-fooと入力します。](./using-routes-with-custom-elements/images/06.png)

1. ［**Publish**］ をクリックします。

1. デプロイされた両方のウィジェットが`HelloFoo`ルートを使用することを確認します。

   ![両方のウィジェットがHelloFooルートを使用することを確認します。](./using-routes-with-custom-elements/images/07.png)

### ポートレット設定でルートプロパティを定義する

1. J1V3-Custom-Elementウィジェットを含むページを編集します。

1. ウィジェットの1つの **オプション** ボタン (![Options Button](../../../../images/icon-actions.png)) をクリックし、 ［**設定**］ を選択します。

   ![オプションボタンをクリックし、［設定］を選択します。](./using-routes-with-custom-elements/images/08.png)

1. プロパティフィールドに`route=hello-bar`と入力します。

   ![プロパティフィールドにroute=hello-barと入力します。](./using-routes-with-custom-elements/images/09.png)

1. ［**Save**］ をクリックします。

1. 設定されたウィジェットが`hello-bar`ルートを使用し、もう一方のウィジェットが`hello-foo`ルートを使用したままであることを確認します。

   ![設定されたウィジェットがHelloBarルートを使用していることを確認します。](./using-routes-with-custom-elements/images/10.png)

## ルートコードの分析

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/index.js
    :language: js
    :lines: 1-34
```

この`index.js`ファイルは`WebComponent`クラスを作成し、`HTMLElement`インターフェイスを拡張します。 このクラスは、インターフェースの [`connectedCallback()`](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements#using_the_lifecycle_callbacks) 関数を実装し、`App`をパラメータとして [`ReactDOM.render`](https://reactjs.org/docs/react-dom.html#render) に呼び出します。 `App`が呼び出されると、定義された`"route"`属性がないか調べ、その値と利用可能なルートを比較します。 `hello-foo` または `hello-bar`のいずれかにマッチする場合、対応するルートを返し、レンダリングします。 そうでない場合は、`hello-world`を返して描画します。

各ルートは、`routes`フォルダーから`index.js`ファイルにインポートされます。

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

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-world/pages/HelloWorld.js
    :language: js
    :lines: 1-9
```

### HelloFoo.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-foo/pages/HelloFoo.js
    :language: js
    :lines: 1-9
```

### HelloBar.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-bar/pages/HelloBar.js
    :language: js
    :lines: 1-9
```

## 関連トピック

* [フロントエンドクライアント拡張機能](../../front-end-client-extensions.md)
* [カスタム要素とIFrameクライアント拡張機能を理解する](../understanding-custom-element-and-iframe-client-extensions.md)
* [基本的なカスタム要素の作成](./creating-a-basic-custom-element.md)
* [リモートアプリケーションUIリファレンス](../remote-applications-ui-reference.md)
