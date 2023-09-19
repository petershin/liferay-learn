# テーマCSSクライアント拡張機能の使用

{bdg-secondary}`利用可能な Liferay 7.4`

テーマCSSクライアント拡張機能を使えば、現在のテーマのCSSファイル（`main.css` と `clay.css`）をオーバーライドして、ページのルック＆フィールを変更することができます。 [サンプル・ワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace)にあるクライアント・エクステンションから開始します。

## 前提条件

1. Java（JDK8またはJDK11）をインストールします。

    ```{note}
    対応するJDK、データベース、環境については、[互換性マトリックス](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix)を確認してください。 推奨されるJVMの設定については、[JVM設定](../../../../installation-and-upgrades/reference/jvm-configuration.md)を参照してください。
    ```

1. サンプルワークスペースをダウンロードし、解凍します。

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

これで、最初のテーマCSSクライアント拡張機能をデプロイするためのツールが揃いました。

## テーマのスタイルがどのようにオーバーライドされるかを調べる

テーマ CSS クライアント拡張はサンプルワークスペースの `client-extensions/liferay-sample-theme-css-1/` フォルダにあります。 `client-extension.yaml` ファイルに定義されています。

```yaml
liferay-sample-theme-css-1:
    clayURL: css/clay.css
    mainURL: css/main.css
    name: Liferay Sample Theme CSS 1
    type: themeCSS
```

クライアントエクステンションのIDは `liferay-sample-theme-css-1` で、2つのCSSリソースファイルのタイプやパスなど、テーマCSSクライアントエクステンションの主要な設定が含まれています。 利用可能なプロパティの詳細については、 [Theme CSS YAML Configuration Reference](../theme-css-yaml-configuration-reference.md)。

また、以下の`assemble` YAMLブロックも含まれています。

```yaml
assemble:
    - from: build/buildTheme/img
      into: static/img
```

これは、テーマをビルドした後、 `build/buildTheme/img/` フォルダ内のすべてを、ビルドされたクライアント拡張機能 `.zip` ファイル内の静的リソースとして含めることを指定します。 テーマのCSSクライアント拡張に含まれる画像ファイルは、Liferayの静的リソースとして使用されます。

`package.json` ファイルには以下のコードが含まれている：

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

`dependencies` セクションには、 `sassy-inputs` ライブラリが含まれています。 これは例では使用しませんが、テーマのCSSクライアント拡張機能でnpmモジュールをインポートして使用する方法を示しています。 `liferayDesignPack` セクションは、スタイルに使用されるベーステーマを宣言します。 `styled` テーマを使用すると、ページ、フラグメント、ウィジェットに指定された既存のスタイルが影響を受けないようになります。 その他のフィールド `main`、 `name` 、 `version` は、必要なメタデータを提供する。

```{note}
ベーステーマは `styled` または `unstyled` に設定できる。 unstyled`テーマには基本スタイルのセットが含まれ、`styled`テーマにはunstyled`テーマのすべてのスタイルと追加スタイルが含まれます。 Liferay のすべてのテーマは `unstyled` または `styled` テーマをベースとしています。 

テーマ CSS クライアント拡張機能を別のテーマを使用しているページに適用すると、クライアント拡張機能のスタイルはテーマのスタイルを **置き換え** ます。 元のテーマにカスタムスタイルがある場合は、それらを `_custom.scss` ファイルに追加して、クライアント拡張機能を適用したときにそれらの要素が影響を受けないようにしてください。 

すでにテーマCSSクライアント拡張機能を使用しているページのテーマを変更すると、クライアント拡張機能は削除されます。 
```

`src/css/_custom.scss` ファイルにこのSCSSが含まれています：

```css
@import 'sassy-inputs/sass/main';

header {
   background-image: url(../img/header_bg.jpg); 
}
```

最初の行は、 `package.json`で追加した npm モジュールをインポートしています。 CSSは、ヘッダーの背景に画像を使うように変更する。

```{note}
あなたのコードは `_custom.scss` の中にあり、`client-extension.yaml` ファイルは `clay.css` と `main.css` を指しています。 これは、テーマ CSS クライアント拡張機能が完全な Clay CSS 構築プロセスを実行し、`_custom.scss` からコンパイルされた CSS コードも含む `clay.css` と `main.css` ファイルを生成するためです。
```

## テーマのCSSを修正する

すべての画像にホバー効果を作成するCSSを追加します。 `_custom.scss` ファイルを開き、 `img:hover`の宣言を追加する：

```css
img:hover{
   border: 2px solid red;
   border-radius: 10%;
}
```

これは、 `2px` 赤のボーダーとホバー時に丸みを帯びたエッジを持つように画像を定義します。

ここで、クライアント拡張をデプロイします。

## テーマCSSクライアントエクステンションのデプロイ
```{include} /_snippets/run-liferay-portal.md
```

Once Liferay starts, run this command from the client extension's folder in the sample workspace:

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これにより、クライアント拡張が構築され、Liferayの`deploy/`フォルダにzipをデプロイします。

```{note}
クライアント拡張をLiferay Experience Cloudにデプロイするには、Liferay Cloudの[コマンドラインツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool)を使って[`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment)を実行します。
```

```{tip}
ワークスペース内のすべてのクライアント拡張を同時にデプロイするには、`client-extensions/`フォルダからコマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```bash
STARTED liferay-sample-theme-css-1_1.0.0
```

## ページのテーマを上書きする

新しいテーマのCSSを使用するようにページを設定します：

1. ページで、上部にある _編集_ (![Edit icon](../../../../images/icon-edit-pencil.png)) をクリックします。

1. サイドバーで、 _Page Design Options_ メニュー (![Page Design Options icon](../../../../images/icon-format.png)) に移動し、メニュー上部の _Configuration_ (![Configuration icon](../../../../images/icon-cog3.png)) をクリックします。

1. Look and FeelタブのTheme CSS Client Extensionセクションで、 _Add_ (![Add](../../../../images/icon-duplicate.png)) をクリックします。

1. _Liferay Sample Theme CSS 1_を選択します。

   ![Sample Theme CSS client extensionを選択し、Saveをクリックします。](./using-a-theme-css-client-extension/images/01.png)

1. 下にスクロールして、_［保存］_をクリックします。

ページエディターでは、ヘッダーの背景が画像になり、カーソルを置くとすべてのリンクの背景とテキストの色が変わる。 編集モード以外でページに変更を反映させるには、ページを公開する必要があります。

![選択したページに新しいテーマが表示される。](./using-a-theme-css-client-extension/images/02.gif)

## 次のステップ

LiferayでテーマCSSクライアント拡張を使用することに成功しました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [CSSクライアント拡張の使用](./using-a-css-client-extension.md)
* [JSクライアント拡張の使用](./using-a-javascript-client-extension.md)
* [テーマのお気に入りアイコンクライアント拡張の使用](./using-a-theme-favicon-client-extension.md)
* [テーマスプライトマップクライアント拡張機能の使用](./using-a-theme-spritemap-client-extension.md)
