# JavaScriptクライアントエクステンションの使用

{bdg-secondary}`利用可能 Liferay 7.4 U45+/GA45+`

JavaScript(JS）クライアントエクステンションを使えば、Liferayのコードへの依存やテーマの開発を気にすることなく、Liferayの任意のページ上で独自のJavaScriptを実行することができます。 ここでは、JavaScriptのクライアントエクステンション( [サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-workspace)から）を使って始めます。

## 前提条件

クライアントエクステンションの開発を始めるために、

1. Java(JDK8またはJDK11）をインストールする。

   ```{note}
   対応するJDK、データベース、環境については、[互換性マトリックス](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix)を確認してください。 推奨されるJVMの設定については、[JVM Configuration](../../../installation-and-upgrades/reference/jvm-configuration.md) を参照してください。
   ```

1. サンプルワークスペースをダウンロードし、解凍してください：

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

必要なツールやJSクライアント拡張機能は、サンプルワークスペースに含まれています。

## クライアントエクステンションを調べる

JSクライアント拡張は、ワークスペースの `client-extensions/sample-global-js/` フォルダにあります。 `client-extension.yaml` ファイルに定義されています：

```yaml
sample-global-js:
    name: Sample Global JS
    type: globalJS
    url: global.js
```

クライアントエクステンションのIDは `sample-global-js` で、 `タイプ` や追加する JavaScript ファイルなど、JS クライアントエクステンションの主要な構成が含まれています。 プロパティの詳細については、 [JavaScript YAML設定リファレンス](../javascript-yaml-configuration-reference.md) を参照してください。

また、 `アセンブル` ブロックが含まれています：

```yaml
assemble:
    - from: assets
      include: "**/*"
      into: static
```

これは、 `assets/` フォルダ内のすべてを、ビルドされたクライアント拡張機能 `.zip` ファイルに静的リソースとして含めることを指定します。 JSクライアントエクステンションのJavaScriptコードは、Liferayの静的リソースとして使用されます。

`assets/global.js` ファイルには、この一行が含まれています：

```js
window.alert('Sample Global JS deployed.');
```

ページを開くと、メッセージとともにアラートボックスが表示されます。 このファイルに追加して、追加のJavaScriptを実行します。

## LiferayにClient Extensionをデプロイする。
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

```
STARTED sample-global-js_1.0.0
```

クライアントエクステンションが正常にデプロイされたら、それを使用するようにLiferayを設定します。

## ページでクライアントエクステンションを使用する

配備したクライアントエクステンションを使用するために、Liferayのページを設定します：

1. インスタンスのページで、上部にある *編集* アイコン ![Edit icon](../../../../images/icon-edit-pencil.png) をクリックします。

1. サイドバーで「ページデザイン *オプション* 」メニュー(![Page Design Options icon](../../../../images/icon-format.png)）を開き、メニュー上部の「 *設定* 」アイコン(![Configuration icon](../../../../images/icon-cog3.png)）をクリックします。

   ![ページデザインオプションメニューの歯車アイコンをクリックすると、このクライアント拡張機能の設定にアクセスできます。](./using-a-javascript-client-extension/images/01.png)

1. *Advanced* タブをクリックし、ページ下部の *JavaScript* セクションを展開すると、 *JavaScript Client Extensions* 設定セクションがあります。

1. *JavaScriptクライアント拡張の追加* をクリックして、新しいクライアント拡張をページの先頭またはページ下に追加します。

   ![JavaScriptクライアントエクステンションを追加します。 ページヘッドに追加したか、ページボトムに追加したかに応じて、リストに表示されます。](./using-a-javascript-client-extension/images/02.png)

1. *［Save］* をクリックします。

1. オプションで、編集モード以外のページでJavaScriptが実行されるように、ページを公開することもできます。

これで、クライアントエクステンションが設定され、アクティブになりました。 設定したページでは、クライアント拡張機能のメッセージが表示されたアラートウィンドウがポップアップ表示されるのが確認できます。

![この例のクライアント拡張機能は、ページが読み込まれたときに警告メッセージのポップアップを作成します。](./using-a-javascript-client-extension/images/03.png)

```{tip}
警告ウィンドウが最初に表示されない場合は、ページをハードリフレッシュしてブラウザのキャッシュをクリアします(ほとんどのブラウザで `CTRL + SHIFT + R` ）。 クライアントエクステンションを変更して再デプロイした場合、変更を確認するためにページからエクステンションを削除して再追加する必要がある場合があります。
```

## 次のステップ

LiferayでJSクライアントエクステンションを使用することに成功しました。 次に、他のクライアントエクステンションタイプのデプロイメントを試してみます。

* [CSSクライアントエクステンションの使用](./using-a-css-client-extension.md)
