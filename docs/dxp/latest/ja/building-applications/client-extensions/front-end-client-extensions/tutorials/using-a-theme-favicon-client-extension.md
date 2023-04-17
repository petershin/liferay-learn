# テーマファビコンクライアントエクステンションの使用

{bdg-secondary}`利用可能 Liferay 7.4 U45+/GA45+`

テーマファビコンクライアント拡張機能を使えば、選択したページでテーマのファビコンを上書きすることができます。 [サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) を使って、クライアントエクステンションのビルドとデプロイを開始します。

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

これで、最初のテーマのファビコンクライアント拡張を展開するためのツールが揃いました。

## クライアントエクステンションを調べる

テーマファビコンのクライアント拡張は、サンプルワークスペースの `client-extensions/liferay-sample-theme-favicon/` フォルダにあります。 `client-extension.yaml` ファイルで定義されています：

```yaml
liferay-sample-theme-favicon:
    name: Liferay Sample Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

このクライアント拡張機能は、IDが `liferay-sample-theme-favicon` で、タイプや追加するファビコンファイルなど、テーマファビコンのクライアント拡張機能の主要な構成が含まれています。 利用可能なプロパティの詳細については、「 [Theme Favicon YAML Configuration Reference」](../theme-favicon-yaml-configuration-reference.md) を参照してください。

また、 `assemble` YAMLブロックも含まれています：

```yaml
assemble:
    - from: assets
      into: static
```

これは、 `assets/` フォルダ内のすべてを、構築されたクライアント拡張機能 `.zip` ファイルに静的リソースとして含めることを指定します。 テーマのファビコンクライアント拡張子のファビコンファイルは、Liferayの静的リソースとして使用されます。

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

```bash
STARTED liferay-sample-theme-favicon_1.0.0
```

## ページでクライアントエクステンションを使用する

<!-- Should we suggest doing this to the pages of a Site Template? -->
配備したクライアントエクステンションを使用するために、Liferayのページを設定します：

1. ページで、上部にある _編集_ (![Edit icon](../../../../images/icon-edit-pencil.png)) をクリックします。

1. サイドバーの「ページデザインオプション」メニュー(![Page Design Options icon](../../../../images/icon-format.png)）に移動し、メニュー上部の _構成_ (![Configuration icon](../../../../images/icon-cog3.png)) をクリックします。

1. _Look and Feel_ タブの _Favicon_ セクションで、 _Change Favicon_をクリックします。

1. _Client Extensions_ をクリックし、新しく配置したファビコン _Sample Theme Favicon_を選択します。

   ![Sample Theme Favicon」クライアント拡張機能を選択し、「保存」をクリックします。](./using-a-theme-favicon-client-extension/images/01.gif)

1. 下にスクロールして、 _保存_をクリックします。

1. ページに戻ってください。 新しいファビコンがブラウザのタブに表示されます。

![新しいファビコンがブラウザのタブに表示されます。](./using-a-theme-favicon-client-extension/images/02.png)

## 次のステップ

Liferayでテーマのファビコンクライアント拡張を使用することに成功しました。 次に、他のクライアントエクステンションタイプのデプロイメントを試してみます。

* [CSSクライアントエクステンションの使用](./using-a-css-client-extension.md)
* [JSクライアントエクステンションの使用](./using-a-javascript-client-extension.md)
