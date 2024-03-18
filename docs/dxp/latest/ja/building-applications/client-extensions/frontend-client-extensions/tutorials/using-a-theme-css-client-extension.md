# テーマCSSクライアント拡張機能の使用

{bdg-secondary}`liferay 7.4+`

テーマCSSクライアント拡張機能を使うと、現在のテーマのCSSファイル（`main.css`と`clay.css`）を上書きして、ページのルック＆フィールを変更することができます。 [サンプル・ワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) にあるクライアント・エクステンションから開始します。

## 前提条件

1. Java（JDK8またはJDK11）をインストールします。

    ```{note}
    サポートされているJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) を確認してください。 推奨されるJVM設定については、 [JVM設定](../../../../installation-and-upgrades/reference/jvm-configuration.md) を参照のこと。
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

テーマの CSS クライアント拡張はサンプルワークスペースの `client-extensions/liferay-sample-theme-css-1/` フォルダにあります。 これは `client-extension.yaml` ファイルで定義されている：

```yaml
liferay-sample-theme-css-1:
    clayURL: css/clay.css
    mainURL: css/main.css
    name: Liferay Sample Theme CSS 1
    type: themeCSS
```

クライアント拡張モジュールの ID は `liferay-sample-theme-css-1` で、2 つの CSS リソースファイルの型とパスを含む、テーマ CSS クライアント拡張モジュールの主要な設定を含んでいます。 利用可能なプロパティの詳細については、 [テーマのCSS YAML設定リファレンス](../theme-css-yaml-configuration-reference.md) 。

また、`assemble` YAML ブロックも含まれます：

```yaml
assemble:
    - from: build/buildTheme/img
      into: static/img
```

これは、テーマをビルドした後、`build/buildTheme/img/` フォルダ内のすべてを、ビルドされたクライアント拡張ファイル `.zip` に静的リソースとして含めることを指定します。 テーマのCSSクライアント拡張に含まれる画像ファイルは、Liferayの静的リソースとして使用されます。

`package.json`ファイルには以下のコードが含まれている：

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

`dependencies`セクションには`sassy-inputs` ライブラリが含まれている。 これは例では使用しませんが、テーマのCSSクライアント拡張機能でnpmモジュールをインポートして使用する方法を示しています。 `liferayDesignPack`セクションはスタイルに使用するベーステーマを宣言します。 テーマ `styled` を使用することで、ページ、フラグメント、ウィジェットに指定された既存のスタイルが影響を受けないようにします。 その他のフィールド `main`、`name`、`version` は必要なメタデータである。

```{note}
ベーステーマは `styled` または `unstyled` に設定できる。 unstyled`テーマには基本スタイルのセットが含まれ、`styled`テーマにはunstyled`テーマのすべてのスタイルと追加スタイルが含まれます。 Liferay のすべてのテーマは `unstyled` または `styled` テーマをベースとしています。 

テーマ CSS クライアント拡張機能を別のテーマを使用しているページに適用すると、クライアント拡張機能のスタイルはテーマのスタイルを **置き換え** ます。 元のテーマにカスタムスタイルがある場合は、それらを `_custom.scss` ファイルに追加して、クライアント拡張機能を適用したときにそれらの要素が影響を受けないようにしてください。

すでにテーマCSSクライアント拡張機能を使用しているページのテーマを変更すると、クライアント拡張機能は削除されます。
```
`src/css/_custom.scss`ファイルにはこのSCSSが含まれています：

```css
@import 'sassy-inputs/sass/main';

header {
   background-image: url(../img/header_bg.jpg); 
}
```

最初の行は、`package.json`で追加したnpmモジュールをインポートする。 CSSはヘッダーの背景に画像を使うように変更する。

```{note}
あなたのコードは `_custom.scss` の中にあり、`client-extension.yaml` ファイルは `clay.css` と `main.css` を指しています。 これは、テーマ CSS クライアント拡張機能が完全な Clay CSS ビルドプロセスを実行し、`_custom.scss` からコンパイルされた CSS コードも含む `clay.css` と `main.css` ファイルを生成するためです。
```

## テーマのCSSを修正する

CSSを追加して、すべての画像のホバー効果を作成します。 `_custom.scss`ファイルを開き、`img:hover`の宣言を追加する：

```css
img:hover{
   border: 2px solid red;
   border-radius: 10%;
}
```

これは画像に `2px` の赤いボーダーをつけ、ホバー時にエッジを丸くするように定義します。

ここで、クライアント拡張をデプロイします。

## テーマCSSクライアント拡張機能を展開する

```{include} /_snippets/run-liferay-portal.md
```

Liferayが起動したら、サンプルのワークスペースにあるクライアントエクステンションのフォルダからこのコマンドを実行します：

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これでクライアント拡張機能がビルドされ、Liferay の `deploy/` フォルダに zip がデプロイされます。

```{note}
クライアント拡張を Liferay Experience Cloud にデプロイするには、Liferay Cloud [コマンドラインツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) を使用して [コマンドラインツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment) を実行します。
```

```{tip}
ワークスペース内のすべてのクライアントエクステンションを同時にデプロイするには、`client-extensions/` フォルダからコマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```bash
STARTED liferay-sample-theme-css-1_1.0.0
```

## ページのテーマを上書きする

新しいテーマのCSSを使用するようにページを設定します：

1. ページ上部の **Edit**(![編集アイコン](../../../../images/icon-edit-pencil.png))をクリックします。

1. サイドバーで **ページデザインオプション** メニュー（ [ページデザインオプションアイコン](../../../../images/icon-format.png) ）に移動し、メニュー上部の **コンフィギュレーション**（ [コンフィギュレーションアイコン](../../../../../images/icon-cog3.png) ）をクリックします。

1. Look and FeelタブのTheme CSS Client Extensionセクションで、 **Add**(![Add](../../../../images/icon-duplicate.png))をクリックします。

1. 新しくデプロイしたクライアントエクステンション **Liferay Sample Theme CSS 1** を選択します。

   ![Select the Sample Theme CSS client extension and click Save.](./using-a-theme-css-client-extension/images/01.png)

1. 下にスクロールして「保存」をクリックする。

ページエディターでは、ヘッダーの背景が画像になり、カーソルを置くとすべてのリンクの背景とテキストの色が変わる。 編集モード以外でページに変更を反映させるには、ページを公開する必要があります。

![The new theme appears on the selected page.](./using-a-theme-css-client-extension/images/02.gif)

## 次のステップ

LiferayでテーマCSSクライアント拡張を使用することに成功しました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [CSSクライアント拡張機能を使う](./using-a-css-client-extension.md)
* [JSクライアント・エクステンションの使用](./using-a-javascript-client-extension.md)
* [テーマファビコンクライアント拡張機能を使う](./using-a-theme-favicon-client-extension.md)
* [テーマスプライトマップクライアント拡張機能を使う](./using-a-theme-spritemap-client-extension.md)
