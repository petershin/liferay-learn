# テーマコントリビューターを介した独立したUIリソースのバンドル

テーマコントリビューターは、CSSおよびJavaScriptリソースを含み、それらを各ページに適用するモジュールです。 これらは特定のテーマから独立しており、テーマの特定のスタイルをオーバーライドしたり、互いにオーバーライドするように設定できます ページに個別のUIリソースを含め、それらを特定のテーマに含める場合は、代わりに[テーマレット](./bundling-and-installing-resources-into-your-theme-via-themelets.md)を使用してください。

Liferay Portal/DXPの多くのメニューは、 [サイトメニュー](../../../../../getting-started/navigating-dxp.md#site-menu) などのテーマコントリビューターとしてパッケージ化されています。

![サイトメニューは、テーマコントリビューターモジュールとして実装されています。](./bundling-independent-ui-resources-via-theme-contributors/images/01.png)

サイトメニューなどの標準のUIコンポーネントを編集またはスタイル設定する場合は、テーマコントリビューターで変更をデプロイする必要があります。 テーマコントリビューターを使用して、新しいUIコンポーネントまたはスタイルを追加することもできます。

## シンプルなテーマコントリビューターをデプロイする

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従って、サンプルのテーマ投稿者をデプロイしてください：

1. サンプルをダウンロードし、解凍します。

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/site-building/site-appearance/themes/theme-development/bundling-resources/liferay-w9m6.zip -O
    ```

    ```bash
    unzip liferay-w9m6.zip
    ```

1. サンプルをビルドしてデプロイします。

    ```bash
    cd liferay-w9m6
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    このコマンドは、モジュールJARをDockerコンテナの`/opt/liferay/osgi/modules`にコピーするのと同じです。
    ```

1. Dockerコンテナコンソールでデプロイを確認します。

    ```
    STARTED com.acme.w9m6.web_1.0.0
    ```

1. テーマコントリビューターがサイトの背景色を変更したことを確認します。 ブラウザを開いて`https://localhost:8080`にアクセスし、Liferayホームページの背景が青色になっていることを確認します。

![サンプルのテーマコントリビューターでは、ページの背景が青に変わります。](./bundling-independent-ui-resources-via-theme-contributors/images/02.png)

新しいテーマコントリビューターの構築とデプロイが完了しました。

次に、カスタムCSSの変更でテーマコントリビューターがどのように見えるかを学習します。

## サンプルのテーマコントリビューターを調べる

テーマコントリビューターはOSGiモジュールであり、その`bnd.bnd`ファイルにプロパティが必要です。 次に、カスタマイズが `resources`フォルダに追加されます。 サンプルのテーマコントリビューターは、`custom.css`ファイルを使用して各ページの背景色を変更します。

### テーマコントリビューターのプロパティを調べる

テーマコントリビューターのプロジェクトには、それを構成するために必要なプロパティが`bnd.bnd`ファイルに追加されています。

```{literalinclude} ./bundling-independent-ui-resources-via-theme-contributors/resources/liferay-w9m6.zip/w9m6-web/bnd.bnd
```

テーマ投稿者の `bnd.bnd` ファイルが機能するためには、以下のプロパティが必要です：

`Web-ContextPath`: テーマ投稿者のリソースのコンテキストを設定します。サンプルモジュールでは、コンテキストパスは `w9m6-web` です。

`Liferay-Theme-Contributor-Type`: あなたのモジュールがテーマ投稿者を追加することを示します。このプロパティには任意の値を指定できます。サンプルモジュールでは `CSS` という値を使用しています。

`Liferay-Theme-Contributor-Weight`: テーマ投稿者のスタイルと他の投稿者のスタイルの比重を設定します。値が小さいほど、他のコントリビューターのスタイルを上書きする優先順位が高くなります。サンプルのモジュールでは、スタイルがどのテーマ投稿者よりも高い優先度を持つことを保証するために `1` の重みを使用しています。

`bnd.bnd`ファイルに必要なプロパティがあれば、モジュールは必要なカスタマイズをするだけです。

### スタイルのカスタマイズを調べる

必要なCSSファイルやJavaScriptファイルは、モジュール内のサブフォルダに追加する必要があります。CSSファイルは `src/main/resources/META-INF/resources/css/` サブフォルダに属し、JavaScriptファイルは `src/main/resources/META-INF/resources/js/` サブフォルダに属します。

テーマ投稿者の例では、各ページの背景を青くするために簡単なCSSスタイル変更を使っています。これは`src/main/resources/META-INF/resources/`にある [`custom.css`](./bundling-independent-ui-resources-via-theme-contributors/resources/liferay-w9m6.zip/w9m6-web/src/main/resources/META-INF/resources/custom.css) ファイルで行います：

```css
body, #wrapper {
    background: blue;
}
```

必要なCSSまたはJavaScriptファイルをすべて正しいサブフォルダに追加した後、モジュールをデプロイすると、それらが各ページに適用されます。

## 背景色を変更する

次に、テーマコントリビューターがページにどのように影響するかを確認するために、背景色を変更してみましょう。

1. プロジェクトで`src/main/resources/META-INF/resources/css/custom.css`を開きます。

1. `background`の色プロパティを`orange`などの別の色に変更します。

    ```css
    body, #wrapper {
        background: orange;
    }
    ```

1. サンプルをビルドして、実行中のDockerコンテナに再度デプロイします。

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. Dockerコンテナコンソールでデプロイを確認します。

    ```
    STARTED com.acme.w9m6.web_1.0.0
    ```

1. テーマコントリビューターがサイトの背景を新しい色に変更したことを確認します。 ブラウザで`https://localhost:8080`を開き、変更を確認します。

![CSSファイルの背景色を変更すると、デプロイ時にすべてのページに影響します。](./bundling-independent-ui-resources-via-theme-contributors/images/03.png)

## まとめ

　 CSSスタイルを変更したテーマコントリビューターを作成しました。 [スタイルブック](../../../style-books/using-a-style-book-to-standardize-site-appearance.md)を使用して、サイトのページに特定のスタイル変更を適用することもできます。

## 関連トピック

* [テーマレットを介したリソースのバンドルとテーマへのインストール](./bundling-and-installing-resources-into-your-theme-via-themelets.md)
* [テーマの概要](../../introduction-to-themes.md)
* [スタイルブックを使用してサイトの外観を標準化する](../../../style-books/using-a-style-book-to-standardize-site-appearance.md)
