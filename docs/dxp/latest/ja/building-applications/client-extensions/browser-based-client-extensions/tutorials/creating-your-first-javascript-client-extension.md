# 初めてのJavaScriptクライアントエクステンションの作成

{bdg-secondary}`利用可能 Liferay 7.4 U45+/GA45+`

基本的なJavaScriptのクライアントエクステンションは、独自のクライアントエクステンションの開発から始めるには最適な場所です。 JSクライアントエクステンションを使えば、Liferayのコードへの依存やテーマの開発を気にすることなく、Liferayの任意のページで独自のJavaScriptを実行することができます。 [Blade CLI](../../../tooling/blade-cli.md) を使用して、クライアント拡張機能を生成、ビルド、およびデプロイすることになります。

## 前提条件

クライアント・エクステンションを使い始めるには、開発環境にこれらの要件を準備しておく必要があります。

1. Java（JDK8またはJDK11）をインストールする。

   ```{note}
   対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) を参照してください。 推奨されるJVMの設定については、[JVM Configuration](../../../installation-and-upgrades/reference/jvm-configuration.md) を参照してください。
   ```

1. インストール [Blade CLI](../../../tooling/blade-cli/installing-and-updating-blade-cli.md).

1. 開発環境としてLiferay Workspaceを用意する。 [Blade CLI](../../../tooling/liferay-workspace/creating-a-liferay-workspace.md#creating-a-liferay-workspace-with-blade-cli) を使って、ご希望のバージョンの Liferay に素早く設定することができます。

1. また、クライアント拡張をテストするために、Liferayのインスタンスが動作している必要があります。 テスト用のLiferayインスタンスを素早く立ち上げるには、 [Docker Imageで始める](../../../../getting-started/starting-with-a-docker-image.md).

これで、最初のJSクライアントエクステンションをデプロイするのに必要なツールがすべて揃いました。

## Blade CLIでクライアント・エクステンションを作成する

Blade CLIは、JS拡張を含む多くの種類のクライアント拡張のためのスケルトンを生成します。

1. Liferay Workspace でコマンドラインを開き、 `client-extensions/` フォルダに移動します。

    ```bash
    cd client-extensions
    ```

1. このコマンドを実行してBlade CLIを起動し、生成する新しいフォルダの希望する名前を記入します。

   ```bash
   blade create -t client-extension [new-folder-name]
   ```

   ツールには、クライアントの拡張タイプのリストが表示されます。

1. 矢印キーを使用して、クライアント拡張タイプのリストから `globalJS` をハイライトし、Enter を押します。

    ![提供されたクライアント拡張タイプのリストから、globalJSを選択します。](./creating-your-first-javascript-client-extension/images/01.png)

1. プロンプトで、クライアントエクステンションの希望する名称を入力します。

Blade CLIツールは、 `client-extensions/`の中に、選択した名前のサブフォルダを作成します。 これらのファイルはその中に入っています。

* `client-extension.yaml`: `タイプ` (`globalJS`)、選択した名前、生成されたURLなど、クライアント拡張の基本的な定義を含むYAMLファイルです。 クライアントエクステンションのためにこの情報のいずれかを変更したい場合は、このファイルを編集してください。 **なお、一緒にビルドしてデプロイしたい場合は、このYAMLファイルにさらにクライアント拡張定義を追加することができます。**

* `src/global.js`: ページがこのクライアント拡張機能を使用するように設定されている場合に自動的に実行されるJSファイルです。 これは、デフォルトでJSクライアント拡張の唯一のソースファイルです。

これで、基本的なクライアントエクステンションが完成しました。 次に、このクライアントエクステンションの動作と、その動作の調整方法を説明します。

## クライアントエクステンションの検討と展開

デフォルトでは、 `src/global.js` ファイルに、この行が含まれています。

```js
window.alert('Global JavaScript deployed.');
```

これにより、ページを開いたときに、与えられたメッセージとともにアラートボックスが表示されるようになります。 このファイルに、実行したいJavaScriptを追加してください。

次に、クライアント拡張をLiferayのテストインスタンスにデプロイします。 DockerコンテナからLiferayを実行している場合は、クライアント拡張機能のルートフォルダからこのコマンドを実行します。

```bash
blade gw deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これは、Dockerコンテナ内のLiferayの `deploy/` フォルダにクライアント拡張をビルドしてデプロイするものです。

```{note}
クライアント拡張を Liferay Experience Cloud 環境にデプロイしたい場合は、代わりに Liferay Cloud [Command-Line Tool](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line-tool.html#) を使用し、 [`lcp deploy`](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line-tool.html#deploying-to-your-dxp-cloud-environment) コマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```
STARTED my-global-js-client-extension_1.0.0
```

クライアントエクステンションが正常にデプロイされたので、それを使用するためにLiferayインスタンスを構成する必要があります。

## ページでクライアントエクステンションを使用する

デプロイしたクライアントエクステンションを使用するために、Liferayインスタンスのページを構成する必要があります。 以下の手順で、使用中のJSを確認することができます。

1. 稼働中のLiferayインスタンスにログインします。

1. 任意のページで、上部にある **編集** のアイコン ![Edit icon](../../../../images/icon-edit-pencil.png) をクリックします。

1. サイドバーで「ページデザイン **オプション**」メニュー（![Page Design Options icon](../../../../images/icon-format.png)）に移動し、メニュー上部の「**設定**」アイコン（![Configuration icon](../../../../images/icon-cog3.png)）をクリックします。

   ![ページデザインオプションメニューの歯車アイコンをクリックすると、このタイプのクライアントエクステンションの設定にアクセスできます。](./creating-your-first-javascript-client-extension/images/02.png)

1. **Advanced** タブをクリックし、ページ下部の **JavaScript** セクションを展開すると、 **JavaScript Client Extensions** 設定セクションがあります。

1. **JavaScriptクライアント拡張の追加** ボタンをクリックし、新しいクライアント拡張を追加します（ページ先頭またはページ下部に）。

   ![このメニューにJavaScriptクライアント拡張機能を追加します。 ページヘッドに追加したか、ページボトムに追加したかに応じて、リストに表示されます。](./creating-your-first-javascript-client-extension/images/03.png)

1. ［**保存**］ をクリックします。

1. オプションで、編集モード以外のページでJavaScriptが実行されるようにページを公開します。

これでクライアントエクステンションが設定され、実際に動作している様子を見ることができます。 設定したページに戻ってナビゲートすると、アラートウィンドウがポップアップし、クライアント拡張機能からのメッセージが表示されるのがわかります。 編集モード以外でページを表示したときにもJavaScriptを実行させたい場合は、ページを公開する必要があります。

![この例のクライアント拡張機能は、ページが読み込まれたときに警告メッセージのポップアップを作成します。](./creating-your-first-javascript-client-extension/images/04.png)

```{tip}
警告ウィンドウが表示されない場合は、ページを更新してブラウザのキャッシュをクリアしてください（ほとんどのブラウザで `CTRL + SHIFT + R` ）。 クライアントエクステンションを変更して再デプロイした場合、ページの再構成から削除し、変更を確認するために再追加する必要がある場合があります。
```

## 次のステップ

　 Liferayで最初のJSクライアント拡張を作成し、使用することに成功しました。 次に、他のクライアントエクステンションタイプのデプロイメントを試してみます。

* [初めてのCSSクライアントエクステンションを作成する](./creating-your-first-css-client-extension.md)
