# 最初のCSSクライアントエクステンションを作成する

{bdg-secondary}`利用可能な Liferay 7.4 U45+/GA45+`

基本的なCSSクライアントエクステンションは、独自のクライアントエクステンションの開発から始めるには最適な場所です。 CSSクライアント拡張を使えば、テーマを開発したりLiferayのコードに依存することなく、Liferayのあらゆるページでスタイルを上書きすることができます。 [Blade CLI](../../../tooling/blade-cli.md) を使用して、クライアント拡張機能を生成、ビルド、およびデプロイする方法を説明します。

## 前提条件

クライアントエクステンションの作業を開始するには、開発環境にこれらの要件が用意されている必要があります。

1. Java（JDK8またはJDK11）をインストールします。

    ```{note}
    対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) をご覧ください。 推奨されるJVMの設定については、[JVM Configuration](../../../installation-and-upgrades/references/jvm-configuration.md) を参照してください。
    ```

1. [Blade CLI](../../../tooling/blade-cli/installing-and-updating-blade-cli.md)をインストールします。

1. 開発環境として、Liferay Workspaceを用意します。 [Blade CLI](../../../tooling/liferay-workspace/creating-a-liferay-workspace.md#creating-a-liferay-workspace-with-blade-cli) を使って、希望のバージョンの Liferay 用に素早くセットアップすることができます。

1. また、クライアント拡張をテストするために、Liferayのインスタンスが動作している必要があります。 テスト用の Liferay インスタンスを素早く立ち上げるには、 [Docker イメージで起動する](../../../../getting-started/starting-with-a-docker-image.md).

これで、最初の CSS クライアント拡張をデプロイするのに必要なツールはすべて揃いました。

## Blade CLIでClient Extensionを作成する

Blade CLIは、CSS拡張を含む多くの種類のクライアント拡張のためのスケルトンを生成することができます。 以下の手順で進めてください。

1. Liferay Workspaceでコマンドラインを開き、 `client-extensions/` フォルダに移動します。

    ```bash
    cd client-extensions
    ```

1. このコマンドを実行してBlade CLIを起動し、新しいフォルダの名前を入力します。

   ```bash
   blade create -t client-extension [new-folder-name]
   ```

   このツールは、クライアントの拡張機能の種類を選択するためのリストを表示します。

1. 矢印キーを使用して、クライアント拡張タイプのリストから `globalCSS` をハイライトし、Enterキーを押します。 <!--TASK: Confirm Naming-->

   ![提供されたクライアント拡張タイプのリストからglobalCSSを選択します。](./creating-your-first-css-client-extension/images/01.png)

1. プロンプトでクライアント拡張機能の希望する名前を入力します。

Blade CLIツールは、 `client-extensions/`内に、選択した名前のサブフォルダを作成します。 これらのファイルはその中に入っています。

* `client-extension.yaml`: `タイプ` (`globalCSS`)、選択した名前、生成されたURLなど、クライアント拡張機能の基本的な定義を含むYAMLファイルです。 クライアント拡張機能の情報を変更したい場合は、このファイルを編集してください。 **一緒にビルドしてデプロイしたい場合は、この YAML ファイルにさらにクライアント拡張の定義を追加できることに注意してください。**

* `src/global.css`: このクライアント拡張機能を使用するように設定されている場合に、ページ上の他のCSSを上書きするCSSファイルです。 これは、デフォルトでCSSクライアントエクステンションの唯一のソースファイルです。

これで、基本的なクライアントエクステンションができました。 次に、このクライアント拡張機能が何をするのか、そしてその動作をどのように調整するのかを見てみましょう。

## Client Extensionの修正とデプロイ

デフォルトでは、 `src/global.css` ファイルにこのコードが含まれています。

```css
body {
    font-family: cursive;
}
```

これにより、クライアント拡張機能を使用した場合、ページ上のすべてのテキストが筆記体フォントで表示されるようになります。

まず、ボタンの背景色に変更を加えます。 `global.css` ファイルを開き、新しいCSSのブロックを追加します。 `.btn-primary` クラスの宣言ブロックと `background-color`の宣言を追加する。

```css
.btn-primary {
    background-color: purple;
}
```

さて、あなたのクライアント拡張を Liferay testing インスタンスにデプロイしましょう。 Dockerコンテナを使用している場合、クライアント拡張機能のルートフォルダからこのコマンドを実行します。

```bash
blade gw deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これは、Dockerコンテナ内のクライアント拡張Liferayの `deploy/` フォルダをビルドしてデプロイするものです。

```{note}
クライアント拡張を Liferay Experience Cloud 環境にデプロイする場合は、代わりに Liferay Cloud [コマンドラインツール](https://learn.liferay.com/dxp-cloud/latest/ja/reference/command-line-tool.html#) を使用し、 [`lcp deploy`](https://learn.liferay.com/dxp-cloud/latest/ja/reference/command-line-tool.html#deploying-to-your-dxp-cloud-environment) コマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```
STARTED my-global-css-client-extension_1.0.0
```

クライアント拡張がデプロイされたので、それを使うために Liferay インスタンスを設定する必要があります。

## ページでクライアントエクステンションを使用する

Liferayインスタンスで、デプロイされたクライアント拡張を使用するようにページを設定します。

1. 実行中の Liferay インスタンスにログインします。

1. 少なくとも1つのボタンがあるページで、上部にある **Edit** アイコン ![Edit icon](../../../../images/icon-edit-pencil.png) をクリックします。

1. サイドバーの「ページデザインオプション」メニュー(![Page Design Options icon](../../../../images/icon-format.png))に移動し、メニュー上部にある設定アイコン(![Configuration icon](../../../../images/icon-cog3.png))をクリックします。

   ![ページデザインオプションメニューの歯車アイコンをクリックすると、このタイプのクライアントエクステンションの設定にアクセスできます。](./creating-your-first-css-client-extension/images/02.png)

1. ページ下部の **CSS Client Extensions** セクションで、 **Add CSS Client Extensions** をクリックします。

   ![このメニューからCSSクライアント拡張機能を追加します。 配備されているCSSクライアント拡張機能のリストに表示されます。](./creating-your-first-css-client-extension/images/03.png)

1. ポップアップモーダル内のリストからCSSクライアント拡張機能を選択し、 **Add** をクリックします。

1. ［**保存**］ をクリックします。

これで、クライアントエクステンションの設定は完了です。 設定したページの編集に戻り、ページ上のボタンの背景色を見てください。 ボタンの背景色が、選択した色で表示されるようになりました。 編集モード以外でもCSSの適用を確認したい場合は、ページを公開する必要があります。

![クライアント拡張機能のglobal.cssファイルでボタンの背景色を変更した場合、ページ上のすべてのボタンがその色で表示されるようになります。](./creating-your-first-css-client-extension/images/04.png)

```{tip}
ページ上のボタンがまだデフォルトの背景色を表示している場合は、ブラウザのキャッシュをクリアするために、ページのハードリフレッシュ（ほとんどのブラウザでは `CTRL + SHIFT + R` ）をしてみてください。 クライアント拡張機能を変更して再デプロイした場合、ページの設定からそれを削除し、変更を確認するために再追加する必要があるかもしれません。
```

## 次のステップ

　 あなたは、Liferay で最初の CSS クライアント拡張を作成し、使用することに成功しました。 次に、他のクライアントエクステンションタイプのデプロイメントを試してみます。

* [初めてのJSクライアントエクステンションの作成](./creating-your-first-javascript-client-extension.md)
