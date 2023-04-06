# 初めてのCSSクライアントエクステンションを作成する

{bdg-secondary}`利用可能 Liferay 7.4 U45+/GA45+`

基本的なCSSクライアントエクステンションは、独自のクライアントエクステンションの開発から始めるには最適な場所です。 CSSクライアントエクステンションを使用すると、テーマを開発したり、Liferayのコードに依存することなく、Liferayの任意のページでスタイルを上書きすることができます。 [Blade CLI](../../../tooling/blade-cli.md) を使用して、クライアントエクステンションを生成、ビルド、デプロイするまでの過程を説明します。

## 前提条件

クライアント・エクステンションを使い始めるには、開発環境にこれらの要件を準備しておく必要があります。

1. Java（JDK8またはJDK11）をインストールする。

    ```{note}
    対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) を参照してください。 推奨されるJVMの設定については、[JVM Configuration](../../../installation-and-upgrades/reference/jvm-configuration.md) を参照してください。
    ```

1. [Blade CLI](../../../tooling/blade-cli/installing-and-updating-blade-cli.md)をインストールします。

1. 開発環境としてLiferay Workspaceを用意する。 [Blade CLI](../../../tooling/liferay-workspace/creating-a-liferay-workspace.md#creating-a-liferay-workspace-with-blade-cli) を使って、ご希望のバージョンの Liferay に素早く設定することができます。

1. また、クライアント拡張をテストするために、Liferayのインスタンスが動作している必要があります。 テスト用のLiferayインスタンスを素早く立ち上げるには、 [Docker Imageで始める](../../../../getting-started/starting-with-a-docker-image.md).

これで、最初のCSSクライアント拡張を展開するのに必要なツールはすべて揃いました。

## Blade CLIでクライアント・エクステンションを作成する

Blade CLIは、CSS拡張を含む多くの種類のクライアント拡張のスケルトンを生成することができます。 以下の手順でスタートします。

1. Liferay Workspace でコマンドラインを開き、 `client-extensions/` フォルダに移動します。

    ```bash
    cd client-extensions
    ```

1. このコマンドを実行してBlade CLIを起動し、新しいフォルダの名前を入力します。

   ```bash
   blade create -t client-extension [new-folder-name]
   ```

   このツールでは、クライアントの拡張タイプの一覧が表示され、そこから選択することができます。

1. 矢印キーを使用して、クライアント拡張タイプのリストから `globalCSS` をハイライトし、Enter を押します。 <!--TASK: Confirm Naming-->

   ![提供されたクライアント拡張タイプのリストから、globalCSSを選択します。](./creating-your-first-css-client-extension/images/01.png)

1. プロンプトで、クライアントエクステンションの希望する名称を入力します。

Blade CLIツールは、 `client-extensions/`の中に、選択した名前のサブフォルダを作成します。 これらのファイルはその中に入っています。

* `client-extension.yaml`: `タイプ` (`globalCSS`)、選択した名前、生成されたURLなど、クライアント拡張の基本的な定義を含むYAMLファイルです。 クライアントエクステンションのためにこの情報のいずれかを変更したい場合は、このファイルを編集してください。 **なお、一緒にビルドしてデプロイしたい場合は、このYAMLファイルにさらにクライアント拡張定義を追加することができます。**

* `src/global.css`: このクライアント拡張機能を使用するように設定されている場合に、ページ上の他のCSSを上書きするCSSファイルです。 デフォルトでCSSクライアントエクステンションに含まれる唯一のソースファイルです。

これで、基本的なクライアントエクステンションが完成しました。 次に、このクライアントエクステンションが何をするのか、その動作を調整する方法について説明します。

## クライアントエクステンションの修正と展開

デフォルトでは、 `src/global.css` ファイルにこのコードが含まれています。

```css
body {
    font-family: cursive;
}
```

これにより、クライアントエクステンションを使用した場合、ページ上のすべてのテキストが筆記体フォントで表示されるようになります。

まず、ボタンの背景色に変更を加えます。 `global.css` ファイルを開き、新しいCSSのブロックを追加します。 `.btn-primary` クラスの宣言ブロックと `background-color`の宣言を追加します。

```css
.btn-primary {
    background-color: purple;
}
```

ここで、Liferayのテストインスタンスにクライアントエクステンションをデプロイします。 Dockerコンテナを使用している場合は、クライアントエクステンションのルートフォルダからこのコマンドを実行してください。

```bash
blade gw deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これは、Dockerコンテナ内のLiferayの `deploy/` フォルダにクライアント拡張機能をビルドしてデプロイするものです。

```{note}
クライアント拡張を Liferay Experience Cloud 環境にデプロイしたい場合は、代わりに Liferay Cloud [Command-Line Tool](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line-tool.html#) を使用し、 [`lcp deploy`](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line-tool.html#deploying-to-your-dxp-cloud-environment) コマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```
STARTED my-global-css-client-extension_1.0.0
```

クライアントエクステンションがデプロイされたので、それを使用するためにLiferayインスタンスを設定する必要があります。

## ページでクライアントエクステンションを使用する

Liferayインスタンスで、デプロイされたクライアントエクステンションを使用するようにページを設定します。

1. 稼働中のLiferayインスタンスにログインします。

1. 少なくとも1つのボタンがあるページで、上部にある **編集** アイコン ![Edit icon](../../../../images/icon-edit-pencil.png) をクリックします。

1. サイドバーの「ページデザインオプション」メニュー（![Page Design Options icon](../../../../images/icon-format.png)）に移動し、メニュー上部にある設定アイコン（![Configuration icon](../../../../images/icon-cog3.png)）をクリックします。

   ![ページデザインオプションメニューの歯車アイコンをクリックすると、このタイプのクライアントエクステンションの設定にアクセスできます。](./creating-your-first-css-client-extension/images/02.png)

1. ページ下部の **CSS Client Extensions** のセクションで、 **Add CSS Client Extensions** をクリックします。

   ![このメニューからCSSクライアントエクステンションを追加します。 展開されているCSSクライアントエクステンションのリストに表示されます。](./creating-your-first-css-client-extension/images/03.png)

1. ポップアップモーダル内のリストからCSSクライアント拡張を選択し、 **Add** をクリックします。

1. ［**保存**］ をクリックします。

これで、クライアントエクステンションの設定は完了です。 設定したページの編集に戻り、ページ上のあらゆるボタンの背景色を確認します。 ボタンの背景色が、選択した色で表示されるようになりました。 編集モード以外のページでもCSSの適用を確認したい場合は、ページを公開する必要があります。

![クライアント拡張機能のglobal.cssファイルでボタンの背景色を変更した場合、ページ上のすべてのボタンがその色で表示されるようになりました。](./creating-your-first-css-client-extension/images/04.png)

```{tip}
ページ上のボタンがまだデフォルトの背景色で表示されている場合は、ブラウザのキャッシュをクリアするために、ページのハードリフレッシュ（ほとんどのブラウザで `CTRL + SHIFT + R` ）を行ってみてください。 クライアントエクステンションを変更して再デプロイした場合、ページの構成から削除して、変更を確認するために再追加する必要がある場合があります。
```

## 次のステップ

　 Liferayで初めてCSSクライアント拡張を作成し、使用することに成功しました。 次に、他のクライアントエクステンションタイプのデプロイメントを試してみます。

* [初めてのJSクライアントエクステンションを作成する](./creating-your-first-javascript-client-extension.md)
