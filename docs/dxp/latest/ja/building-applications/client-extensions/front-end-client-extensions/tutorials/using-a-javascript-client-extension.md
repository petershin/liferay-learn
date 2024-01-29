# JavaScriptクライアント拡張の使用

{bdg-secondary}`liferay 7.4+`

JavaScript（JS）クライアント拡張を使い、Liferayのコードへの依存やテーマの開発を気にすることなく、Liferayの任意のページ上で独自のJavaScriptを実行できます。 ここでは、JavaScriptクライアント・エクステンション（ [サンプル・ワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) ）から始めます。

## 前提条件

クライアント拡張の開発を開始するには、

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

必要なツールやJSクライアント拡張は、サンプルワークスペースに含まれています。

## クライアント拡張の検討

JS クライアント拡張はワークスペースの `client-extensions/liferay-sample-global-js/` フォルダにあります。 これは `client-extension.yaml` ファイルで定義されている：

```yaml
liferay-sample-global-js:
    name: Liferay Sample Global JS
    type: globalJS
    url: global.js
```

クライアントエクステンションは `liferay-sample-global-js` という ID を持ち、`type` や追加する JavaScript ファイルなど、JS クライアントエクステンションの主要な設定を含んでいます。 プロパティの詳細については、 [JavaScript YAML設定リファレンス](../javascript-yaml-configuration-reference.md) を参照してください。

`assemble`ブロックも含まれている：

```yaml
assemble:
    - from: assets
      into: static
```

これは、`assets/` フォルダにあるすべてのものが、ビルドされたクライアントの拡張子 `.zip` ファイルに静的リソースとして含まれるように指定します。 JSクライアント拡張のJavaScriptコードは、Liferayの静的リソースとして使用されます。

`assets/global.js`ファイルには次のようなコードがある：

```js
window.alert('Sample Global JS deployed.');
```

ページを開くと、メッセージとともにアラートボックスが表示されます。 このファイルに追加して、追加のJavaScriptを実行します。

## Liferayにクライアント拡張をデプロイする

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

```
STARTED sample-global-js_1.0.0
```

クライアント拡張が正常にデプロイされたら、それを使用するようにLiferayを設定します。

## ページでクライアント拡張を使用する

デプロイされたクライアント拡張を使用するために、Liferayのページを設定します。

1. インスタンス内のページで、上部の **編集** アイコン![編集アイコン](../../../../images/icon-edit-pencil.png)をクリックします。

1. サイドバーで、ページデザイン **オプション** メニュー（![ページデザインオプションアイコン](../../../../images/icon-format.png)）に移動し、メニュー上部の **設定** アイコン（![設定アイコン](../../../../images/icon-cog3.png)）をクリックします。

   ![Click the cog wheel icon in the Page Design Options menu to access this client extension's configurations.](./using-a-javascript-client-extension/images/01.png)

1. **Advanced** タブをクリックし、ページ下部の **JavaScript** セクションを展開して、 **JavaScript Client Extensions** 設定セクションを見つけます。

1. **JavaScriptクライアント拡張機能の追加** をクリックして、新しいクライアント拡張機能をページ先頭またはページ下に追加します。

   ![JavaScriptクライアント拡張機能を追加する。 ページヘッドに追加したか、ページボトムに追加したかに応じて、リストに表示されます](./using-a-javascript-client-extension/images/02.png)

1. ［**保存**］をクリックします。

1. オプションで、編集モード以外のページでJavaScriptが実行されるように、ページを公開することもできます。

これで、クライアント拡張が設定され、有効になりました。 設定したページでは、クライアント拡張のメッセージを含むアラートウィンドウがポップアップ表示されます。

![This example client extension creates an alert message pop-up when the page is loaded.](./using-a-javascript-client-extension/images/03.png)

```{tip}
アラートウィンドウが表示されない場合は、ページを更新してブラウザのキャッシュをクリアしてください（ほとんどのブラウザでは、`CTRL + SHIFT + R` ）。 クライアント拡張を変更して再デプロイした場合、変更を確認するには、ページから削除し、再追加する必要があるかもしれません。
```
## 次のステップ

LiferayでJSクライアント拡張を使用できるようになりました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [CSSクライアント拡張機能を使う](./using-a-css-client-extension.md)
