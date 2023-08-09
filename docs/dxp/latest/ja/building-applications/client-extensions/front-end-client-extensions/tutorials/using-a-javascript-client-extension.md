# JavaScriptクライアント拡張の使用

{bdg-secondary}`Liferay 7.4 U45+/GA45+で利用可能`

JavaScript（JS）クライアント拡張を使い、Liferayのコードへの依存やテーマの開発を気にすることなく、Liferayの任意のページ上で独自のJavaScriptを実行できます。 ここでは、JavaScriptのクライアント拡張（[サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace)）から始めます。

## 前提条件

クライアント拡張の開発を開始するには、

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

必要なツールやJSクライアント拡張は、サンプルワークスペースに含まれています。

## クライアント拡張の検討

JSクライアント拡張は、ワークスペースの`client-extensions/sample-global-js/`フォルダにあります。 `client-extension.yaml` ファイルに定義されています。

```yaml
sample-global-js:
    name: Sample Global JS
    type: globalJS
    url: global.js
```

クライアント拡張のIDは `sample-global-js` で、`type`や追加する JavaScript ファイルなど、JSクライアント拡張の主要な設定項目が含まれています。 プロパティの詳細については、 [JavaScript YAML設定リファレンス](../javascript-yaml-configuration-reference.md) を参照してください。

また、`assemble`ブロックが含まれています。

```yaml
assemble:
    - from: assets
      include: "**/*"
      into: static
```

これは、 `assets/` フォルダ内のすべてを、ビルドされたクライアント拡張`.zip` ファイルに静的リソースとして含めることを指定します。 JSクライアント拡張のJavaScriptコードは、Liferayの静的リソースとして使用されます。

`assets/global.js`ファイルには、下記のコードが含まれています：

```js
window.alert('Sample Global JS deployed.');
```

ページを開くと、メッセージとともにアラートボックスが表示されます。 このファイルに追加して、追加のJavaScriptを実行します。

## Liferayにクライアント拡張をデプロイする
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

```
STARTED sample-global-js_1.0.0
```

クライアント拡張が正常にデプロイされたら、それを使用するようにLiferayを設定します。

## ページでクライアント拡張を使用する

デプロイされたクライアント拡張を使用するために、Liferayのページを設定します。

1. インスタンスのページで、上部にある*編集*アイコン![Edit icon](../../../../images/icon-edit-pencil.png)をクリックします。

1. サイドバーで［Page Design *Options*］メニュー（![Page Design Options icon](../../../../images/icon-format.png)）を開き、メニュー上部の*設定*アイコン（![Configuration icon](../../../../images/icon-cog3.png)）をクリックします。

   ![［Page Design Options］メニューの歯車アイコンをクリックすると、このクライアント拡張の設定にアクセスできます。](./using-a-javascript-client-extension/images/01.png)

1. *［詳細設定］*タブをクリックし、ページ下部の *JavaScript* セクションを展開すると、 *［JavaScript Client Extensions］* 設定セクションがあります。

1. *［Add JavaScript Client Extensions］*をクリックして、新しいクライアント拡張をページの先頭またはページ下に追加します。

   ![JavaScriptクライアント拡張を追加します。 ページ先頭への追加もしくはページ下部への追加に応じて、リストに表示されます。](./using-a-javascript-client-extension/images/02.png)

1. *［Save］* をクリックします。

1. オプションで、編集モード以外のページでJavaScriptが実行されるように、ページを公開することもできます。

これで、クライアント拡張が設定され、有効になりました。 設定したページでは、クライアント拡張のメッセージを含むアラートウィンドウがポップアップ表示されます。

![この例のクライアント拡張は、ページが読み込まれたときに警告メッセージのポップアップを作成します。](./using-a-javascript-client-extension/images/03.png)

```{tip}
アラートウィンドウが表示されない場合は、ページを更新してブラウザのキャッシュをクリアしてください（ほとんどのブラウザでは、`CTRL + SHIFT + R` ）。 クライアント拡張を変更して再デプロイした場合、変更を確認するには、ページから削除し、再追加する必要があるかもしれません。
```

## 次のステップ

LiferayでJSクライアント拡張を使用できるようになりました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [CSSクライアント拡張の使用](./using-a-css-client-extension.md)
