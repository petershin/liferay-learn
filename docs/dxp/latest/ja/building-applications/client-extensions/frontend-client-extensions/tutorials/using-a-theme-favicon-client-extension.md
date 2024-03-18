# テーマのお気に入りアイコンクライアント拡張の使用

{bdg-secondary}`liferay 7.4+`

テーマのお気に入りアイコンクライアント拡張を使えば、選択したページでテーマのお気に入りアイコンを上書きすることができます。 [サンプル・ワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) を使用して、クライアント・エクステンションのビルドとデプロイを開始します。

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

これで、最初のテーマのお気に入りアイコンクライアント拡張をデプロイするためのツールがそろいました。

## クライアント拡張の検討

テーマのファビコンクライアント拡張はサンプルワークスペースの `client-extensions/liferay-sample-theme-favicon/` フォルダにあります。 これは `client-extension.yaml` ファイルで定義されている：

```yaml
liferay-sample-theme-favicon:
    name: Liferay Sample Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

このクライアント拡張モジュールの ID は `liferay-sample-theme-favicon` で、追加するファビコンファイルの種類など、テーマのファビコンクライアント拡張モジュールの主要な設定を含みます。 利用可能なプロパティの詳細については、 [テーマファビコンYAML設定リファレンス](../theme-favicon-yaml-configuration-reference.md) 。

また、`assemble` YAML ブロックも含まれます：

```yaml
assemble:
    - from: assets
      into: static
```

これは、`assets/` フォルダにあるすべてのものが、ビルドされたクライアントの拡張子 `.zip` ファイルに静的リソースとして含まれるように指定します。 テーマのお気に入りアイコンクライアント拡張のお気に入りアイコンファイルは、Liferayの静的リソースとして使用されます。

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

```bash
STARTED liferay-sample-theme-favicon_1.0.0
```

## ページでクライアント拡張を使用する

<!-- Should we suggest doing this to the pages of a Site Template? -->

デプロイされたクライアント拡張を使用するために、Liferayのページを設定します。

1. ページ上部の **Edit**(![編集アイコン](../../../../images/icon-edit-pencil.png))をクリックします。

1. サイドバーで、ページデザインオプションメニュー（![ページデザインオプションアイコン](../../../../images/icon-format.png)）に移動し、メニュー上部の **configuration**（![設定アイコン](../../../../images/icon-cog3.png)）をクリックします。

1. ルック＆フィール」タブの「ファビコン」セクションで、「ファビコンの変更」をクリックします。

1. **Client Extensions** をクリックし、新しくデプロイされたファビコン、 **Sample Theme Favicon** を選択します。

   ![Select the Sample Theme Favicon client extension and click Save.](./using-a-theme-favicon-client-extension/images/01.gif)

1. 下にスクロールして「保存」をクリックする。

1. ページに戻ります。 新しいお気に入りアイコンがブラウザのタブに表示されます。

![The new favicon appears on the browser tab.](./using-a-theme-favicon-client-extension/images/02.png)

## 次のステップ

Liferayでテーマのお気に入りアイコンクライアント拡張を使用できるようになりました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [CSSクライアント拡張機能を使う](./using-a-css-client-extension.md)
* [JSクライアント・エクステンションの使用](./using-a-javascript-client-extension.md)
