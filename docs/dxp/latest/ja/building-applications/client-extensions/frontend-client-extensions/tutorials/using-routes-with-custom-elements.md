# カスタム要素でルーティングを使用する

{bdg-secondary}`liferay 7.4+`

カスタム要素クライアント拡張は、Liferayのフロントエンドのインフラストラクチャーを使用して、外部のアプリケーションをLiferayプラットフォームに登録し、ウィジェットとしてレンダリングします。 複数のルーティングを含むアプリケーション（例： [React Router](https://reactrouter.com/) ）では、実行時にウィジェットに使用するルーティングを決定するために、リモートアプリケーションのプロパティを定義することができます。 これらのプロパティは、Liferayのリモートアプリケーションメニュー、またはデプロイ後のウィジェットの設定オプションからアプリケーションに設定することができます。

!!! warning
   カスタム要素やIFrameを他のタイプのクライアント拡張のようにデプロイすることは、Liferay 7.4の**ベータ機能**です。 このチュートリアルでは、カスタム要素のリモートアプリケーションを異なる方法でデプロイしますが、将来のアップデートまでは、この方法が推奨されます。

このチュートリアルでは、Liferay の `create_custom_element.sh` スクリプトを使って基本的な React アプリケーションを作成します：`hello-world`、`hello-foo`、`hello-bar`です。 アプリケーションをコンパイルして`.js`と`.css` ファイルをホストした後、アプリケーションを Liferay に登録し、ページウィジェットとしてデプロイします。 最後に、それぞれの代替ルーティングを使用するように設定します。

![Create a basic custom element remote appliaction with alternate routes and use the route property to configure which is rendered.](./using-routes-with-custom-elements/images/01.png)

!!! note
   カスタム要素クライアントの拡張は、構築、パッケージ化、ホスティングの方法に関係なく、あらゆるテクノロジーを使用できます。 このチュートリアルでは、基本ルーティングを使用したカスタム要素アプリケーションのサンプルのみを提供しています。

`create_custom_element.sh` を実行するには、 [Node.JS](https://nodejs.org/) 、 [NPM](https://www.npmjs.com/) 、 [YARN](https://classic.yarnpkg.com/) の最新バージョンが必要です。 先に進む前に、これらのツールがインストールされていることを確認してください。

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

   スクリプトは、これらの要素を持つ `j1v3-custom-element` という新しいReactアプリケーションを作成する：

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

1. 新しい `j1v3-custom-element` フォルダに移動し、アプリケーションをビルドする。

   ```bash
   cd j1v3-custom-element
   ```

   ```bash
   yarn build
   ```

1. ビルドが成功したことを確認し、アプリケーションの `.js` と `.css` ファイルに注目してください。

   ```bash
   最適化された量産ビルドの作成...
   正常にコンパイルされました。

   gzip 後のファイルサイズ:

   43.51 kB build/static/js/main.114dde4a.js
   121 B build/static/css/main.9877909d.css
   ```

1. メールアドレス **test@liferay.com** とパスワード **test** を使って、`<http://localhost:8080>` から Liferay にサインインしてください。 プロンプトが表示されたら、パスワードを **learn** に変更する。

1. ![サイトメニュー](../../../../../images/icon-product-menu.png))を開き、 **コンテンツとデータ** を展開し、 **ドキュメントとメディア** に進みます。

1. **追加**(![追加ボタン](../../../../images/icon-add.png))をクリックし、 **複数ファイルのアップロード** を選択します。

1. `.js`ファイルと`.css`ファイルをアップロードエリアにドラッグ＆ドロップします。

   ![Upload the .js and .css files to the Liferay Document Library.](./using-routes-with-custom-elements/images/02.png)

1. ［**公開**］ をクリックします。

これは Liferayドキュメントライブラリにファイルを追加し、固有の WebDAV URL を割り当て、リモートアプリケーションを作成するために使用します。

!!! tip
   このチュートリアルでは、アプリケーションの静的リソースをデモ用にLiferayのドキュメントライブラリにホスティングします。 本番環境では、静的リソースをホストするために最適化されたサーバーでアプリケーションのファイルをホストする必要があります。

各ファイルのURLを表示するには、 **情報** アイコン(![情報アイコン](../../../../images/icon-information.png))をクリックし、一度に1つのファイルを選択します。 各ファイルの **WebDAV URL** をコピーし、次のステップで使用するために保存する。

![Copy each file's WebDAV URL.](./using-routes-with-custom-elements/images/03.png)

例えば、

- `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
- `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## アプリケーションの登録とデプロイ

1. グローバルメニュー(![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、 **アプリケーション** タブをクリックし、 **リモートアプリケーション** に進みます。

1. **追加**(![追加ボタン](../../../../images/icon-add.png))をクリックします。

1. 次の値を入力します。

   | 項目           | 値                     |
   | :----------- | :-------------------- |
   | 名前           | J1V3-Custom-Element   |
   | 種類           | カスタム要素                |
   | HTML 要素名     | `j1v3-custom-element` |
   | URL          | `.js`ファイルのWebDAV URL  |
   | CSS の URL    | `.css`ファイルのWebDAV URL |
   | インスタンス化可能    | &#10004              |
   | ポートレットのカテゴリ名 | リモートアプリケーション          |

1. ［**保存**］をクリックします。

保存すると、LiferayはJ1V3-Custom-Elementという名前のウィジェットを作成し、他のページウィジェットと同様にサイトページにデプロイすることができます。 選択したポートレットカテゴリ名の下に表示されます。

J1V3-Custom-Elementはインスタンス化可能なので、1つのページに多数追加し、それぞれを独立した構成にすることが可能です。 この例では、1つのページに2回ウィジェットを追加します．

![Deploy two instances of the J1V3-Custom-Element widget.](./using-routes-with-custom-elements/images/04.png)

## ルート`プロパティを使う

自動生成されたアプリには3つのルートが含まれている：`hello-world`、`hello-foo`、`hello-bar`。 デフォルトでは、アプリケーションは `hello-world` ルートを使用する。 ただし、リモートアプリケーションのプロパティを使用して、別のルートを使用するように設定することができます。 これらのプロパティは、 [リモートアプリメニュー](#defining-a-route-property-via-the-remote-apps-menu) または [ウィジェットの設定オプション](#defining-a-route-property-via-widget-configuration) から設定できます。

### リモートアプリケーションでルートプロパティを定義する

1. グローバルメニュー(![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、 **アプリケーション** タブをクリックし、 **リモートアプリケーション** に進みます。

1. **J1V3-Custom-Element** を選択する。

   ![Select J1V3-Custom-Element.](./using-routes-with-custom-elements/images/05.png)

1. Propertiesフィールドに`route=hello-foo`と入力する。

   ![Enter route=hello-foo into the Properties field.](./using-routes-with-custom-elements/images/06.png)

1. ［**公開**］ をクリックします。

1. デプロイされた両方のウィジェットが `HelloFoo` ルートを使用していることを確認してください。

   ![Verify both widgets use the HelloFoo route.](./using-routes-with-custom-elements/images/07.png)

### ポートレット設定でルートプロパティを定義する

1. J1V3-Custom-Elementウィジェットを含むページを編集します。

1. ウィジェットの **オプション** ボタン( [オプションボタン](../../../../images/icon-actions.png) )をクリックし、 **設定** を選択します。

   ![Click the Options button and select Configuration.](./using-routes-with-custom-elements/images/08.png)

1. Propertiesフィールドに`route=hello-bar`と入力する。

   ![Enter route=hello-bar into the Properties field.](./using-routes-with-custom-elements/images/09.png)

1. ［**保存**］をクリックします。

1. 設定されたウィジェットが `hello-bar` ルートを使用し、もう一方のウィジェットが `hello-foo` ルートを使用することを確認してください。

   ![Verify the configured widget uses the HelloBar route.](./using-routes-with-custom-elements/images/10.png)

## ルートコードの分析

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/index.js
    :language: js
    :lines: 1-63
```

この `index.js` ファイルは `HTMLElement` インターフェースを継承した `WebComponent` クラスを作成する。 このクラスはインターフェースの [`connectedCallback()`](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements#using_the_lifecycle_callbacks) 関数を実装している。この関数は [`ReactDOM.render`](https://reactjs.org/docs/react-dom.html#render) を `App` をパラメータとして呼び出す。 `App` が呼ばれると、`"route"`属性が定義されているかどうかをチェックし、その値を利用可能なルートと比較します。 もし`hello-foo`または`hello-bar`のどちらかにマッチすれば、対応するルートを返してレンダリングする。 そうでなければ、`hello-world`をレンダリングする。

それぞれのルートは `routes` フォルダから `index.js` ファイルにインポートされます：

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
    :lines: 8-14
```

### HelloFoo.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-foo/pages/HelloFoo.js
    :language: js
    :lines: 8-12
```

### HelloBar.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-bar/pages/HelloBar.js
    :language: js
    :lines: 8-12
```

## 関連トピック

- [フロントエンド・クライアント拡張](../../frontend-client-extensions.md)
- [カスタム要素とIFrameクライアント拡張機能を理解する](../understanding-custom-element-and-iframe-client-extensions.md)
- [基本的なカスタム要素の作成](./creating-a-basic-custom-element.md)
- [リモートアプリケーションUIリファレンス](../client-extensions-ui-reference.md)