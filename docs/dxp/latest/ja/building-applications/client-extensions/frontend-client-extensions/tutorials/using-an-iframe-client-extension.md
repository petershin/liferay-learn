# IFrameクライアント拡張機能の使用

{bdg-secondary}`liferay 7.4+`

IFrameクライアント拡張はLiferayのフロントエンドインフラストラクチャを使い、外部アプリケーションを`<iframe>` HTML要素として登録します。 これらはウィジェットとしてLiferayのページに追加されます。 他のフロントエンドクライアント拡張とは異なり、IFrameは静的リソースを提供しない。

```{warning}
IFrameクライアント拡張は開発中であり、現在Liferay 7.4ではサポートされていません。
```

[サンプル・ワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) にあるクライアント・エクステンションから開始します。

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

これで、IFrameクライアント拡張機能を展開するためのツールが揃いました。

## ロードするIFrameクライアント拡張機能のURLを指定する

`client-extensions/liferay-sample-iframe-1/client-extension.yaml`ファイルは、サンプルワークスペースのIFrameクライアント拡張プロジェクトを定義します：

```yaml
liferay-sample-iframe-1-counter-app:
    name: Counter App
    type: iframe
    url: https://arnab-datta.github.io/counter-app
```

このクライアント拡張は `liferay-sample-iframe-1` という ID を持っており、`name`, `type`, IFrame として取り込むアプリの URL など、IFrame クライアント拡張の主要な設定を含んでいます。 サンプルの `url` で実行されている [Counter App](https://github.com/arnab-datta/counter-app) は、ショッピングカートに商品を追加することをシミュレートする基本的な React アプリです。 クライアントエクステンションをデプロイしたら、他のウィジェットと同じようにLiferayのページにアプリを追加できます。

利用可能なプロパティの詳細については、 [IFrame YAML設定リファレンス](../iframe-yaml-configuration-reference.md) を参照してください。

## IFrameクライアント拡張機能の展開

```{note}
クライアント拡張を Liferay Experience Cloud にデプロイするには、Liferay Cloud [コマンドラインツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) を使用して [コマンドラインツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment) を実行します。
```

```{include} /_snippets/run-liferay-portal.md
```

次に、サンプル・ワークスペースのクライアント・エクステンションのフォルダに移動し、以下を実行する。

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これでクライアントの拡張機能がビルドされ、Liferay の `/deploy` フォルダに zip がデプロイされます。

```{tip}
ワークスペース内のすべてのクライアントエクステンションを同時にデプロイするには、`/client-extensions`フォルダからコマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```
STARTED liferay-sample-iframe-1_1.0.0 [1592]
```

クライアント拡張がデプロイされたので、それを使用するためにLiferayを設定します。

## IFrameクライアント拡張機能をウィジェットとして追加する

IFrameはウィジェットとしてページに追加される。

1. ページ上部の **Edit**(![Edit](../../../../images/icon-edit-pencil.png))をクリックします。

1. ウィジェットをページに追加する。 フラグメントとウィジェットのサイドバー（![フラグメントとウィジェット](../../../../images/icon-plus.png)）で、 **Widgets** をクリックします。

1. Client Extensions &rarr; Counter Appウィジェットを見つけ、ページにドラッグします。 Publish_をクリックする。

   ![Drag the Counter App onto a page.](./using-an-iframe-client-extension/images/01.png)

アイテムを追加して、カウンターアプリが動作していることを確認します。

## 関連トピック

* [フロントエンド・クライアント拡張](../../frontend-client-extensions.md)
* [カスタム要素とIFrameクライアント拡張機能を理解する](../understanding-custom-element-and-iframe-client-extensions.md)
* [クライアント拡張 UI リファレンス](../client-extensions-ui-reference.md)
