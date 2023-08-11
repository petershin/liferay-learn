# IFrameクライアント拡張機能の使用

{bdg-secondary}`7.4+`

IFrameクライアント拡張は、Liferayのフロントエンドインフラストラクチャを使用して、外部アプリケーションを `<iframe>` HTML要素として登録します。 これらはウィジェットとしてLiferayのページに追加されます。 他のフロントエンドクライアント拡張とは異なり、IFrameは静的リソースを提供しない。

```{warning}
IFrameクライアント拡張は開発中であり、現在Liferay 7.4ではサポートされていません。
```

[サンプル・ワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) にあるクライアント・エクステンションから開始します。

## 前提条件

クライアント拡張の開発を開始するには、

1. Java（JDK8またはJDK11）をインストールします。

   ```{note}
   対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) を確認してください。 推奨されるJVMの設定については、[JVM設定](../../../../installation-and-upgrades/reference/jvm-configuration.md)を参照してください。
   ```

1. サンプルワークスペースをダウンロードし、解凍します。

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

これで、IFrameクライアント拡張機能を展開するためのツールが揃いました。

## ロードするIFrameクライアント拡張機能のURLを指定する

`client-extensions/liferay-sample-iframe-1/client-extension.yaml` ファイルは、サンプルワークスペースの IFrame クライアント拡張プロジェクトを定義します：

```yaml
liferay-sample-iframe-1-counter-app:
    name: Counter App
    type: iframe
    url: https://arnab-datta.github.io/counter-app
```

このクライアント拡張機能には、 `liferay-sample-iframe-1` という ID があり、 `name`、 `type` 、IFrame として取り込むアプリの URL など、IFrame クライアント拡張機能の主要な設定が含まれています。 [カウンターアプリ](https://github.com/arnab-datta/counter-app) は、例の `url` で実行されている、ショッピングカートに商品を追加することをシミュレートする基本的なReactアプリです。 クライアントエクステンションをデプロイしたら、他のウィジェットと同じようにLiferayのページにアプリを追加できます。

利用可能なプロパティの詳細については、 [IFrame YAML設定リファレンス](../iframe-yaml-configuration-reference.md) を参照してください。

## IFrameクライアント拡張機能の展開

```{note}
クライアント拡張をLiferay Experience Cloudにデプロイするには、Liferay Cloudの [コマンドラインツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) を使って [`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment) を実行します。
```
```{include} /_snippets/run-liferay-portal.md
```

次に、サンプル ワークスペース内のクライアント拡張機能のフォルダーに移動し、次を実行します。

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これでクライアントエクステンションがビルドされ、Liferay の `/deploy` フォルダに zip がデプロイされます。

```{tip}
ワークスペースのすべてのクライアントエクステンションを同時にデプロイするには、`/client-extensions` フォルダからコマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```
STARTED liferay-sample-iframe-1_1.0.0 [1592]
```

クライアント拡張がデプロイされたので、それを使用するためにLiferayを設定します。

## IFrameクライアント拡張機能をウィジェットとして追加する

IFrameはウィジェットとしてページに追加される。

1. 任意のページの上部にある **Edit**(![Edit](../../../../images/icon-edit-pencil.png)) をクリックします。

1. ウィジェットをページに追加する。 フラグメントとウィジェットのサイドバー（![Fragments and Widgets](../../../../images/icon-plus.png)）で、 **ウィジェット** をクリックします。

1. Client Extensions &rarr; Counter Appウィジェットを見つけ、ページにドラッグします。 ［**Publish**］ をクリックします。

   ![カウンターアプリをページにドラッグします。](./using-an-iframe-client-extension/images/01.png)

アイテムを追加して、カウンターアプリが動作していることを確認します。

## 関連トピック

* [フロントエンドのクライアント拡張](../../front-end-client-extensions.md)
* [カスタム要素とIFrameクライアント拡張機能を理解する](../understanding-custom-element-and-iframe-client-extensions.md)
* [クライアント拡張機能UIリファレンス](../remote-applications-ui-reference.md)
