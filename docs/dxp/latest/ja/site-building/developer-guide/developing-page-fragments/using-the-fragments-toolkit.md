# フラグメントツールキットの使用

フラグメント ツールキットは、お気に入りのツールを使用してフラグメントをローカルで作成および管理するのに役立ちます。 ここでは、ツールキットを使用して、サンプルのフラグメントを含むフラグメント プロジェクトを生成し、デプロイして、独自のフラグメント セットを追加します。

```{note}
Liferay DXP 7.4以降の場合、フラグメントコレクションはLiferay UIではフラグメントセットと呼ばれます。
```

## ツールキットの設定

ツールキットには次のソフトウェアが必要です。

* [NPM](https://www.npmjs.com/)
* [NodeJS](https://nodejs.org/)
* [Yeoman](https://yeoman.io/)
* [Yarn](https://classic.yarnpkg.com/)

NPMとYarnは、ツールキットとそれが依存するモジュールをインストールするために使うパッケージ・マネージャーだ。

1. [Node.js LTS](https://nodejs.org/en/download/) を介して NPM と Node.js をインストールすることから始めます。

1. サンプルの JavaScript プロジェクトの ZIP ファイルをダウンロードして解凍します。

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-x2y6.zip -O
    ```

    ```bash
    unzip liferay-x2y6.zip
    ```

1. `setup_tutorial.sh` スクリプトを使用して、フラグメント ツールキットとその依存関係を設定します。

    ```bash
    cd liferay-x2y6
    ```

    ```bash
    ./setup_tutorial.sh
    ```

    ```{note}
    `setup_tutorial.sh`スクリプトは、Yeoman、Yarn、ツールキットのセットアップのためのコマンドを提供します。 スクリプトは、サンプルプロジェクトのZIPファイルで利用できます。
    ```

スクリプトによって報告された満たしていない要件をすべて解決し、環境の準備が整ったと報告されるまでスクリプトを再実行してください。

## フラグメント プロジェクトを作成する

フラグメントツールキットの `yo liferay-fragments` コマンドは、フラグメント プロジェクトを生成するためのインターフェイスを起動します。

```{warning}
フラグメントプロジェクトをネストしないでください。 新しいフラグメントプロジェクトは、既存のフラグメントプロジェクトとは別の場所に作成してください。
```

`liferay-x2y6` プロジェクト フォルダにいる場合は、それを終了します (例: `cd ..`)。

フラグメント プロジェクトを生成する方法は次のとおりです。

1. `yo liferay-fragments` コマンドを実行して、プロジェクト ジェネレータを起動します。

    ```bash
    yo liferay-fragments
    ```

1. プロジェクトに名前を付けます。 この例では、Enter をクリックしてデフォルトのプロジェクト名を受け入れます。

    ```bash
    ? Project name (Sample Liferay Fragments)
    ```

1. サンプル コンテンツを追加するかどうかを示します。 この例では、 `Yes` と入力します。

    ```bash
    ? Add sample content? Yes
    Creating directory
       force .yo-rc.json
      create src/.gitkeep
      create .editorconfig
      create .gitignore
      create liferay-npm-bundler.config.js
      create package.json
      create README.md
    Adding sample content...
    Warning: some of these fragments are not compatible all
    portal versions, please check the generator documentation before using them:
    https://www.npmjs.com/package/generator-liferay-fragments#creating-new-fragments
    Running yarn...
    Done!
    You're ready to create fragments.
      create src/sample-collection/collection.json
      create src/sample-collection/sample-fragment/index.html
      create src/sample-collection/sample-fragment/main.js
      create src/sample-collection/sample-fragment/styles.css
      create src/sample-collection/sample-fragment/fragment.json
      create src/sample-collection/sample-fragment/configuration.json
      create src/sample-collection/sample-fragment-with-new-editables/index.html
      create src/sample-collection/sample-fragment-with-new-editables/main.js
      create src/sample-collection/sample-fragment-with-new-editables/styles.css
      create src/sample-collection/sample-fragment-with-new-editables/fragment.json
      create src/sample-collection/sample-fragment-with-new-editables/configuration.json
      create src/sample-collection/sample-fragment-with-react/index.html
      create src/sample-collection/sample-fragment-with-react/main.js
      create src/sample-collection/sample-fragment-with-react/styles.css
      create src/sample-collection/sample-fragment-with-react/fragment.json
      create src/sample-collection/sample-fragment-with-react/configuration.json
    ```

これでフラグメント プロジェクトが生成されました。

ジェネレータは、プロジェクト名から派生したフォルダに各プロジェクトを作成します。 この例では、プロジェクト名を `Sample Liferay Fragments` としたので、ジェネレータは `sample-liferay-fragments`というプロジェクト フォルダを作成します。

## サンプルのフラグメントセットをインポートする
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to import the sample Fragment Set to Liferay:

1. Import the Fragment Set to your Liferay instance by invoking the `yarn run import` command in the project's root folder (e.g., `sample-liferay-fragments`). Alternatively, you can [import the Fragment Set manually](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md).

    ```bash
    cd sample-liferay-fragments
    ```

    ```bash
    yarn run import
    ```

1. プロンプトに答えます。

    ```bash
    $ yo liferay-fragments:import
    ? Liferay host & port http://localhost:8080
    ? Username test@liferay.com
    ? Password [hidden]
    Checking connection...
    Connection successful

    ? Company ID liferay.com
    ? Group ID Liferay DXP
    Building project...
    Importing project...
    Project imported
        force .yo-rc.json
        force ../../.yo-rc-global.json
    Done in 21.43s.
    ```

1. フラグメントセットが利用可能であることを確認します。 **サイトメニュー**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 ［**デザイン**］ &rarr; ［**フラグメント**］ に移動します。 セットがリストに表示されます。

    ![セットが利用可能です。](./using-the-fragments-toolkit/images/01.png)

    ```{note}
    Liferay DXP 7.1および7.2では、代わりにプロダクトメニューの*サイト* → *サイトビルダー* → *ページ フラグメント*に移動して、*フラグメント*ページを表示します。
    ```

フラグメントセットを正常にデプロイしました。

## フラグメントセットのストラクチャー

各フラグメントセットは、次の構造を使用します。

* `collection.json`: フラグメントセットを説明するテキスト ファイル。

    ```json
    {
        "description": "Optional description",
        "name": "Fragment Set Name"
    }
    ```

* `language.properties` (オプション)：フラグメントセットに定義された言語キー。

* `[fragment-name]/`: フラグメントのすべてのファイルを含むフォルダ。

    * `configuration.json`(オプション): フラグメントの構成を定義する JSON ファイル。 詳細は、[フラグメントへの構成オプションの追加](./adding-configuration-options-to-fragments.md)を参照してください。

    * `fragment.json`: フラグメントを説明するJSONファイル。 詳しくは [fragment.jsonの修正](#modifying-fragmentjson) を参照。

* `resources/` (オプション): フラグメントが必要とする追加の画像またはファイルを含むフォルダ。 詳細は、[フラグメントにデフォルトのリソースを含める](./including-default-resources-with-fragments.md)を参照してください。

フラグメント・ツールキットを使えば、この構造で素早くプロジェクトを作成できる。

### fragment.jsonの修正

`fragment.json` には、フラグメントの機能と使いやすさを向上させるために変更できるフラグメントの属性が含まれています。

| キー                     | Description                                                                                                       |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `cssPath`              | .css、.scss、または .sass ファイルを指定します。                                                                                  |
| `configurationPath`    | フラグメントの設定ソースを指定します。                                                                                               |
| `htmlPath`             | フラグメントの HTML ソースを指定します。                                                                                           |
| `jsPath`               | フラグメントの JavaScript ソースを指定します。                                                                                     |
| `name`                 | フラグメントの名前。                                                                                                        |
| `type`                 | コンポーネントまたはReactフラグメントを指定します。                                                                                      |
| `icon`                 | インポートしたフラグメントに粘土のアイコンを追加する。 利用可能なアイコンについては、 [クレイアイコンリスト](https://clayui.com/docs/components/icon.html) を参照してください。 |
| `sass {loadPaths:[]}}` | 外部の依存関係を指定する。                                                                                                     |

 ```json
        {
            "cssPath": "styles.css",
            "configurationPath": "configuration.json",
            "htmlPath": "index.html",
            "jsPath": "main.js",
            "name": "Fragment name",
            "type": "[component|react]",
            "icon": "adjust"

            // This configuration is optional and can be removed
            "sass": {
                "loadPaths": [
                    "../../../node_modules"
                ]
            }
        }
```

## プロジェクトにフラグメントセットを追加する

`add-collection` コマンドを使用して、プロジェクトにフラグメントセットを追加します。

1. プロジェクトのルートフォルダに移動して、次のコマンドを実行します。

    ```bash
    yarn run add-collection
    ```

1. プロンプトが表示されたら、フラグメントセットの名前と説明を入力します。

    ```bash
    > yo liferay-fragments:collection
    ? Collection name (required) My Set
    ? Collection description (optional) This is my new Fragment Set.
    create src/my-set/collection.json
    ```

1. 新しいフラグメントセットがプロジェクトの`src`フォルダに正常に作成されたことを確認します。 `collection.json`ファイルのみが含まれているはずです。

    ```json
    {
        "description": "This is my new Fragment Set.",
        "name": "My Set"
    }
    ```

## 新規フラグメントを作成する

`add-fragment` コマンドを使用して、新しいフラグメントをセットに追加します。

1. プロジェクトのルートフォルダに移動して、次のコマンドを実行します。

    ```bash
    yarn run add-fragment
    ```

    CLI がプロセスを開始します:

    ```bash
    > yo liferay-fragments:fragment
    ```

1. フラグメントに名前を付けます。

    ```bash
    ? Fragment name (required) My Jumbotron
    ```

1. React または別の JavaScript フレームワークを使用するかどうかを選択します。 React には Liferay 7.3 以降が必要です。 このチュートリアルでは、React の使用を拒否してください。

    ```bash
    ? Use React (or other JS framework)? No
    ```

1. Liferay 7.3 以降の場合は、新しい編集可能な要素の構文を使用します。

    ```bash
    ? Use new data-lfr editable syntax? Yes
    ```

    ```{note}
    フラグメントで React の使用を受け入れた場合、ツールキットは Liferay 7.3 以降を使用していると想定し、新しい編集可能な要素の構文を構成します。
    ```

    ```{note}
    Liferayの編集可能なデータ構文については、[フラグメント固有のタグ](../reference/fragments/fragment-specific-tags-reference.md) を参照してください。
    ```

1. 先ほど作成したフラグメントセットを選択します（`My Set`）。

    ```bash
    ? Choose a collection
        My Set
        Sample Set
        + New Collection
    ```

    ```{note}
    `fragment.json` は、フラグメントのCSS、HTML、JavaScriptへのパスを定義します。 これらのファイル名のいずれかを変更した場合は、`fragment.json` 内のパスを更新してください。
    ```

フラグメントの `index.html` は次のとおりです。

```html
<div class="my-jumbotron">
    <h1 data-lfr-editable-id="title" data-lfr-editable-type="text">
        My Jumbotron
    </h1>
</div>
```

フラグメント HTML は、`data-lfr` の新しい編集可能な構文を使用します。

## フラグメントを編集する

フラグメントの任意の部分を変更します。

* HTML (`index.html`)
* CSS (`styles.css`)
* JavaScript (`main.js`)
* フラグメントの属性 (`fragment.json`)
* [構成オプション](./adding-configuration-options-to-fragments.md) (`configuration.json`)



たとえば、上記の HTML から構築し、 [Clay](https://clayui.com/) の [Bootstrap](https://getbootstrap.com/) ベースのコンポーネントを使用して、次の `index.html` に示すように、注目を集める見出しと説明を持つフラグメントを作成できます。

```html
<div class="component-my-jumbotron">
    <div class="jumbotron">
        <h1
            class="display-4"
            data-lfr-editable-id="01-title"
            data-lfr-editable-type="rich-text"
        >
            Editable Jumbotron Headline
        </h1>

        <p
            class="lead"
            data-lfr-editable-id="02-lead"
            data-lfr-editable-type="rich-text"
        >
            Edit this text to call extra attention to featured content or information.
        </p>

        <hr />

        <p
            data-lfr-editable-id="03-text"
            data-lfr-editable-type="rich-text"
        >
            Edit this text to provide more information.
        </p>

        <a
            class="btn btn-primary btn-lg"
            data-lfr-editable-id="04-label"
            data-lfr-editable-type="link"
            href="#"
        >
            Editable Link
        </a>
    </div>
</div>
```

```{note}
Liferay 7.2以下を使用している場合は、[フラグメント固有のタグ](../reference/fragments/fragment-specific-tags-reference.md) にあるように、`data-lfr-editable-[id|type]` 属性を削除してコンテンツ要素を `lfr-editable` 要素で囲んでください。
```

最初の `div` 要素の `class="component-my-jumbotron"` 属性は、ページ上のこのフラグメントを一意に識別しようとします。

```{tip}
フラグメントのHTMLファイルでは、メインラッパー要素（上記の例では `<div>` ）を使ってフラグメントを一意に識別し、ページ上の他のコンポーネントと競合しないようにします。
```

次に、 `<div class="jumbotron"/>` 要素がコンテンツをラップし、 [Bootstrap](https://getbootstrap.com/) のジャンボトロン コンポーネントを適用します。 このコンポーネントは、コンテンツを際立たせます。 コンテンツ要素は次のとおりです。

* `<h1 class="display-4" ...>Editable Jumbotron ...` は、フラグメントの見出しを作成します。 [Bootstrap](https://getbootstrap.com/) の `display-4` サイズ スタイルを使用します。 `data-lfr-editable-` 属性は、見出しテキストを[編集可能](../reference/fragments/fragment-specific-tags-reference.md)にします。 `data-lfr-editable-id="03-text"` 属性は要素を識別し、`data-lfr-editable-type="rich-text"` 属性はコンテンツ タイプを宣言します。
* `<p class="lead" ...>Edit this text ...` は、Clay の [`lead`](https://clayui.com/docs/css/content/typography.html#css-lead) スタイル コンポーネントで識別されるリード本文テキストです。 `data-lfr-editable-` 属性は、段落を編集可能にします。
* `<hr/>` 要素と次の `<p ...` 要素は、それぞれ水平方向の罫線と別の編集可能な段落を生成します。
* `<a class="btn btn-primary btn-lg" ...` は変更可能なリンクを指定します。 `btn-primary` クラスはそれをメイン ボタンとしてスタイル設定し、`btn-lg` はそれを拡大します。 `href="#"` 属性は、リンクをクリックしたときにユーザーをページの上部に移動します。 `data-lfr-editable-type="link"` 属性は、リンクを[編集可能](../reference/fragments/fragment-specific-tags-reference.md)にします。

フラグメントにリソースを含めることもできます。 詳細は、 [フラグメントにデフォルトのリソースを含める](./including-default-resources-with-fragments.md) を参照してください。

```{note}
フラグメントと設定オブジェクトは JavaScript の引数として渡され、それぞれ `fragmentElement` と `configuration`パラメーターとして利用できます。
```

## 新しいフラグメントをインポートする

元のサンプルフラグメントと同じように、新しいフラグメントをインポートできます。

1. import コマンドを実行し、資格情報を提供します。

    ```bash
    yarn run import
    ```

1. フラグメントセットが利用可能であることを確認します。 **サイトメニュー**(![Site Menu](../../../images/icon-product-menu.png)) を開き、 ［**デザイン**］ &rarr; ［**フラグメント**］ に移動します。 セットがリストに表示されます。

![セットが利用可能です。](./using-the-fragments-toolkit/images/02.png)

これで、フラグメント ツールキットを使用してフラグメントを作成および管理する方法がわかりました。 ツールキット コマンドの詳細は、 [フラグメントツールキットコマンドリファレンス](../reference/fragments/fragments-toolkit-command-reference.md) を参照してください。

## 関連情報

* [提供されたフラグメントセットの作成](./creating-a-contributed-fragment-set.md)
* [フラグメントエディターの使用](./using-the-fragments-editor.md)
* [フラグメントツールキットコマンドリファレンス](../reference/fragments/fragments-toolkit-command-reference.md)
