# テーマCSSクライアントエクステンションの使用

{bdg-secondary}`Liferay 7.4 U45+/GA45+で利用可能`

テーマCSSクライアント拡張機能を使用すると、現在のテーマのCSSファイル（`main.css` および `clay.css`）を上書きして、ページの外観を変更することができます。 [サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) のクライアントエクステンションから始めます。

## 前提条件

1. Java（JDK8またはJDK11）をインストールします。

    ```{note}
    対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) を確認してください。 推奨されるJVMの設定については、[JVM設定](../../../installation-and-upgrades/reference/jvm-configuration.md) を参照してください。
    ```

1. サンプルワークスペースをダウンロードし、解凍してください：

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

これで、最初のテーマCSSクライアント拡張を展開するためのツールを手に入れたことになります。

## テーマのスタイルがどのようにオーバーライドされるかを検証する

テーマCSSクライアント拡張は、サンプルワークスペースの `client-extensions/liferay-sample-theme-css-1/` フォルダにあります。 `client-extension.yaml` ファイルで定義されています：

```yaml
liferay-sample-theme-css-1:
    clayURL: css/clay.css
    mainURL: css/main.css
    name: Liferay Sample Theme CSS 1
    type: themeCSS
```

このクライアントエクステンションのIDは `liferay-sample-theme-css-1` で、2つのCSSリソースファイルの種類やパスなど、テーマCSSクライアントエクステンションの主要な構成が含まれています。 利用可能なプロパティの詳細については、「 [Theme CSS YAML Configuration Reference」](../theme-css-yaml-configuration-reference.md) を参照してください。

また、 `assemble` YAMLブロックも含まれています：

```yaml
assemble:
    - from: build/buildTheme/img
      into: static/img
```

これは、テーマ構築後、 `build/buildTheme/img/` フォルダ内のすべてを、構築したクライアント拡張機能 `.zip` ファイルに静的リソースとして含めるように指定します。 テーマCSSクライアント拡張に含まれる画像ファイルは、Liferayの静的リソースとして使用されます。

`package.json` ファイルには、以下のコードが含まれています：

```json
{
   "dependencies": {
      "sassy-inputs": "1.0.6"
   },
   "liferayDesignPack": {
      "baseTheme": "styled"
   },
   "main": "package.json",
   "name": "@liferay/liferay-sample-theme-css-1",
   "version": "1.0.0"
}
```

`dependencies` セクションには、 `sassy-inputs` ライブラリが含まれています。 これは例では使用しませんが、テーマCSSクライアント拡張でnpmモジュールをインポートして使用する方法を示しています。 `liferayDesignPack` セクションでは、スタイルに使用するベーステーマを宣言しています。 `styled` テーマを使用することで、ページ、フラグメント、ウィジェットに指定された既存のスタイルに影響を与えないようにしています。 その他のフィールド `main`, `name` and `version` は、必要なメタデータを提供します。

```{note}
ベーステーマを `styled` または `unstyled` に設定することができます。 unstyled`テーマは基本的なスタイルのセットを含み、`styled`テーマはunstyled`テーマのすべてのスタイルと追加のスタイリングを含む。 Liferay のすべてのテーマは `unstyled` または `styled` テーマをベースとしています。 

テーマCSSクライアント拡張を別のテーマを使用しているページに適用すると、クライアント拡張のスタイリングは、テーマのスタイリングを**置き換える**。 元のテーマでカスタムスタイルを使用している場合は、それらの要素を `_custom.scss` ファイルに追加して、クライアント拡張機能を適用したときにそれらの要素が影響を受けないようにします。 

すでにテーマCSSクライアントエクステンションを使用しているページのテーマを変更した場合、クライアントエクステンションは削除されます。 
```

`src/css/_custom.scss` ファイルにこのSCSSが含まれています：

```css
@import 'sassy-inputs/sass/main';

header {
   background-image: url(../img/header_bg.jpg); 
}
```

1行目は `package.json`で追加した npm モジュールをインポートしています。 CSSでは、ヘッダーの背景に画像を使用するように変更します。

```{note}
あなたのコードは `_custom.scss` の中にあり、`client-extension.yaml` ファイルは `clay.css` と `main.css` を指しています。 これは、テーマCSSクライアント拡張機能が完全なClay CSSビルドプロセスを実行し、コンパイルされた `clay.css` と `main.css` ファイルに `_custom.scss` からコンパイルされたCSSコードも含まれるからです。
```

## テーマのCSSを修正する

すべての画像にホバー効果を持たせるためのCSSを追加する。 `_custom.scss` ファイルを開き、 `img:hover の宣言を追加する`：

```css
img:hover{
   border: 2px solid red;
   border-radius: 10%;
}
```

これは、画像を `2px` 赤のボーダーとホバー時の丸みを帯びたエッジを持つものとして定義します。

ここで、クライアントエクステンションをデプロイします。

## テーマCSSクライアントエクステンションのデプロイメント
```{include} /_snippets/run-liferay-portal.md
```

Once Liferay starts, run this command from the client extension's folder in the sample workspace:

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これはクライアント拡張をビルドし、Liferayの `deploy/` フォルダにzipをデプロイします。

```{note}
クライアント拡張を Liferay Experience Cloud にデプロイするには、Liferay Cloud [Command-Line Tool](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) を使って [`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment) を実行します。
```

```{tip}
ワークスペース内のすべてのクライアント拡張機能を同時に配置するには、`client-extensions/`フォルダからコマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```bash
STARTED liferay-sample-theme-css-1_1.0.0
```

## ページのテーマをオーバーライドする

新しいテーマのCSSを使用するようにページを設定します：

1. ページで、上部にある **編集**(![Edit icon](../../../../images/icon-edit-pencil.png)) をクリックします。

1. サイドバーで、 **ページデザインオプション** メニュー (![Page Design Options icon](../../../../images/icon-format.png)) に移動し、メニュー上部の **設定**(![Configuration icon](../../../../images/icon-cog3.png)) をクリックします。

1. Look and Feel」タブの「Theme CSS Client Extension」セクションで、「**Add**(![Add](../../../../images/icon-duplicate.png))」をクリックします。

1. 新しくデプロイされたクライアントエクステンションを選択します。 **Liferay Sample Theme CSS 1** .

   ![サンプルテーマCSSクライアント拡張機能を選択し、［保存］をクリックします。](./using-a-theme-css-client-extension/images/01.png)

1. 下にスクロールして、 **保存** をクリックします。

ページエディターでは、ヘッダーの背景が画像になり、ホバーオーバーしたリンクごとに背景色と文字色が変わっています。 編集モード以外のページで変更を反映させるには、ページを公開する必要があります。

![選択したページに新しいテーマが表示されます。](./using-a-theme-css-client-extension/images/02.gif)

## 次のステップ

LiferayでテーマCSSクライアントエクステンションを使用することに成功しました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [CSSクライアントエクステンションの使用](./using-a-css-client-extension.md)
* [JSクライアントエクステンションの使用](./using-a-javascript-client-extension.md)
* [テーマファビコンクライアントエクステンションの使用](./using-a-theme-favicon-client-extension.md)
* [Theme Sprite Map Client Extensionを使用する](./using-a-theme-spritemap-client-extension.md)
