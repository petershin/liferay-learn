# IFrameクライアントエクステンションを使う

{bdg-secondary}`7.4+`

IFrameクライアント拡張は、Liferayのフロントエンドインフラを利用して、外部アプリケーションを `<iframe>` HTML要素として登録します。 Liferayのページにはウィジェットとして追加されます。 他のフロントエンドクライアント拡張機能とは異なり、IFrameは静的なリソースを提供するものではありません。

```{warning}
IFrameクライアント拡張は開発中であり、現在Liferay 7.4では未サポートです。
```

[サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-workspace) のクライアントエクステンションから始めます。


## 前提条件

クライアントエクステンションの開発を始めるために、

1. Java（JDK8またはJDK11）をインストールします。

   ```{note}
   対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) を確認してください。 推奨されるJVMの設定については、[JVM設定](../../../installation-and-upgrades/reference/jvm-configuration.md) を参照してください。
   ```

1. サンプルワークスペースをダウンロードし、解凍してください：

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

これで、IFrameクライアント拡張を展開するためのツールが揃いました。

## IFrame Client Extensionを読み込むためのURLを指定する。

`client-extensions/liferay-sample-iframe-1/client-extension.yaml` ファイルは、サンプルワークスペースの IFrame クライアント拡張プロジェクトを定義しています：

```yaml
liferay-sample-iframe-1-counter-app:
    name: Counter App
    type: iframe
    url: https://arnab-datta.github.io/counter-app
```

このクライアント拡張は、 `liferay-sample-iframe-1` という ID を持ち、 `name`, `type` および IFrame として取り込むアプリの URL を含む IFrame クライアント拡張のキーコンフィギュレーションを含みます。 [例の `url` で動作するカウンターアプリ](https://github.com/arnab-datta/counter-app) は、ショッピングカートに商品を追加することをシミュレートする基本的な React アプリである。 クライアントエクステンションをデプロイした後、他のウィジェットと同じようにLiferayのページにアプリを追加することができます。

利用可能なプロパティの詳細については、 [IFrame YAML設定リファレンス](../iframe-yaml-configuration-reference.md) を参照してください。

## IFrame Client Extensionを導入する

```{note}
クライアント拡張を Liferay Experience Cloud にデプロイするには、Liferay Cloud [Command-Line Tool](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) を使って [`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment) を実行します。
```
```{include} /_snippets/run-liferay-portal.md
```

Next, go to the client extension's folder in the sample workspace and run

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これはクライアント拡張をビルドし、Liferay の `/deploy` フォルダに zip をデプロイします。

```{tip}
ワークスペースにあるすべてのクライアント拡張機能を同時に配置するには、`/client-extensions`フォルダからコマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```
STARTED liferay-sample-iframe-1_1.0.0 [1592]
```

クライアントエクステンションがデプロイされたので、それを使用するようにLiferayを設定します。

## IFrame Client ExtensionをWidgetとして追加する。

IFrameは、ウィジェットとしてページに追加されます。

1. 任意のページの上部にある **編集**(![Edit](../../../../images/icon-edit-pencil.png)) をクリックします。

1. ウィジェットをページに追加します。 フラグメントとウィジェット」サイドバー（![Fragments and Widgets](../../../../images/icon-plus.png)）で、「**ウィジェット**」 をクリックします。

1. Client Extensions &rarr; Counter App ウィジェットを探し、ページ上にドラッグします。 ［**Publish**］ をクリックします。

   ![Counter Appをページ上にドラッグします。](./using-an-iframe-client-extension/images/01.png)

アイテムを追加して、カウンターアプリが動作することを確認します。

## 関連トピック

* [フロントエンドクライアント拡張機能](../../front-end-client-extensions.md)
* [カスタム要素とIFrameクライアント拡張機能を理解する](../understanding-custom-element-and-iframe-client-extensions.md)
* [クライアントエクステンションUIリファレンス](../remote-applications-ui-reference.md)
