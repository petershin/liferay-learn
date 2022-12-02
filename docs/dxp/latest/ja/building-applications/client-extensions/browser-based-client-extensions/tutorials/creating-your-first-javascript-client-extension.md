# 最初のJavaScriptクライアント拡張を作成する

{bdg-secondary}`利用可能な Liferay 7.4 U45+/GA45+`

基本的なJavaScriptのクライアント拡張機能は、独自のクライアント拡張機能の開発を始めるには最適な場所です。 JSクライアント拡張を使えば、Liferayのコードへの依存やテーマの開発を気にすることなく、Liferayの任意のページで独自のJavaScriptを実行することができます。 [Blade CLI](../../../tooling/blade-cli.md) を使用して、クライアント拡張機能を生成、ビルド、およびデプロイします。

## 前提条件

クライアントエクステンションの作業を開始するには、開発環境にこれらの要件が用意されている必要があります。

1. Java（JDK8またはJDK11）をインストールします。

   ```{note}
   対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) をご覧ください。 推奨されるJVMの設定については、[JVM Configuration](../../../installation-and-upgrades/references/jvm-configuration.md) を参照してください。
   ```

1. インストール [Blade CLI](../../../tooling/blade-cli/installing-and-updating-blade-cli.md).

1. 開発環境として、Liferay Workspaceを用意します。 [Blade CLI](../../../tooling/liferay-workspace/creating-a-liferay-workspace.md#creating-a-liferay-workspace-with-blade-cli) を使って、希望のバージョンの Liferay 用に素早くセットアップすることができます。

1. また、クライアント拡張をテストするために、Liferayのインスタンスが動作している必要があります。 [Docker イメージで始める](../../../../getting-started/starting-with-a-docker-image.md)で、テスト用の Liferay インスタンスを素早く立ち上げることができます。

これで、最初の JS クライアント拡張をデプロイするのに必要なツールはすべて揃いました。

## Blade CLIでClient Extensionを作成する

Blade CLIは、JS拡張を含む多くの種類のクライアント拡張のためのスケルトンを生成します。

1. Liferay Workspaceでコマンドラインを開き、 `client-extensions/` フォルダに移動します。

    ```bash
    cd client-extensions
    ```

1. このコマンドを実行してBlade CLIを起動し、生成する新しいフォルダーの希望する名前を記入します。

   ```bash
   blade create -t client-extension [new-folder-name]
   ```

   このツールは、クライアントの拡張機能の種類を一覧で表示します。

1. 矢印キーを使用して、クライアント拡張タイプのリストから `globalJS` をハイライトし、Enterキーを押します。

    ![提供されたクライアント拡張タイプのリストから、globalJSを選択します。](./creating-your-first-javascript-client-extension/images/01.png)

1. プロンプトでクライアント拡張機能の希望する名前を入力します。

Blade CLIツールは、 `client-extensions/`内に、選択した名前のサブフォルダを作成します。 これらのファイルはその中に入っています。

* `client-extension.yaml`: クライアント拡張機能の基本的な定義を含むYAMLファイル。 `タイプ` (`globalJS`)、選択した名前、生成されたURLを含みます。 クライアント拡張機能の情報を変更したい場合は、このファイルを編集してください。 **一緒にビルドしてデプロイしたい場合は、この YAML ファイルにさらにクライアント拡張の定義を追加できることに注意してください。**

* `src/global.js`: このクライアント拡張機能を使用するようにページが設定されたときに自動的に実行されるJSファイルです。 これは、デフォルトでは、JSクライアント拡張機能の唯一のソースファイルです。

これで、基本的なクライアントエクステンションができました。 次に、このクライアント拡張機能が何をするのか、その動作をどのように調整するのかを説明します。

## クライアントエクステンションの検討と導入

デフォルトでは、 `src/global.js` ファイルにこの行のコードが含まれています。

```js
window.alert('Global JavaScript deployed.');
```

これにより、ページを開いたときに、指定されたメッセージとともにアラートボックスが表示されるようになります。 このファイルに、さらに実行したいJavaScriptを追加してください。

それから、クライアント拡張をLiferayのテスト用インスタンスにデプロイします。 LiferayをDockerコンテナから実行している場合は、クライアント拡張のルートフォルダからこのコマンドを実行します。

```bash
blade gw deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これはクライアント拡張をビルドして、Docker コンテナ内の Liferay の `deploy/` フォルダにデプロイします。

```{note}
クライアント拡張を Liferay Experience Cloud 環境にデプロイする場合は、代わりに Liferay Cloud [コマンドラインツール](https://learn.liferay.com/dxp-cloud/latest/ja/reference/command-line-tool.html#) を使用し、 [`lcp deploy`](https://learn.liferay.com/dxp-cloud/latest/ja/reference/command-line-tool.html#deploying-to-your-dxp-cloud-environment) コマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```
STARTED my-global-js-client-extension_1.0.0
```

クライアント拡張が正常にデプロイされたので、それを使用するために Liferay インスタンスを設定する必要があります。

## ページでクライアントエクステンションを使用する

デプロイしたクライアント拡張を使用するために、Liferayインスタンスでページを構成する必要があります。 以下の手順で、使用中のJSを確認することができます。

1. 実行中の Liferay インスタンスにログインします。

1. 任意のページで、上部にある **編集** のアイコン ![Edit icon](../../../../images/icon-edit-pencil.png) をクリックします。

1. **サイドバーで「ページデザイン**」「オプション」**メニュー(![Page Design Options icon](../../../../images/icon-format.png))を開き、メニュー上部の「設定**」 アイコン(![Configuration icon](../../../../images/icon-cog3.png))をクリックします。

   ![ページデザインオプションメニューの歯車アイコンをクリックすると、このタイプのクライアントエクステンションの設定にアクセスできます。](./creating-your-first-javascript-client-extension/images/02.png)

1. **Advanced** タブをクリックし、ページ下部の **JavaScript** セクションを展開すると、 **JavaScript Client Extensions** configuration セクションが表示されます。

1. **JavaScriptクライアント拡張機能の追加** ボタンをクリックして、新しいクライアント拡張機能を追加します（ページ先頭またはページ下部に）。

   ![このメニューに、JavaScriptクライアント拡張機能を追加します。 ページヘッドに追加したか、ページボトムに追加したかによって、リストに表示されます。](./creating-your-first-javascript-client-extension/images/03.png)

1. ［**保存**］ をクリックします。

1. オプションで、編集モード以外のページでJavaScriptを実行するために、ページを公開します。

これで、クライアント拡張機能が設定され、実際に動作するのを確認することができます。 設定したページに戻ると、クライアント拡張機能からのメッセージとともにアラートウィンドウがポップアップ表示されるのがわかります。 編集モード以外でページを表示したときにもJavaScriptを実行させたい場合は、ページを公開する必要があります。

![このクライアント拡張機能の例では、ページが読み込まれたときに警告メッセージのポップアップを作成します。](./creating-your-first-javascript-client-extension/images/04.png)

```{tip}
最初に警告ウィンドウが表示されない場合は、ページを更新してブラウザのキャッシュをクリアしてください（ほとんどのブラウザで `CTRL + SHIFT + R` ）。 クライアント拡張機能を変更して再デプロイした場合、ページの再構成からそれを削除し、変更を確認するために再追加する必要がある場合があります。
```

## 次のステップ

　 あなたは、Liferay で最初の JS クライアント拡張を作成し、使用することに成功しました。 次に、他のクライアントエクステンションタイプのデプロイメントを試してみます。

* [最初のCSSクライアントエクステンションを作成する](./creating-your-first-css-client-extension.md)
