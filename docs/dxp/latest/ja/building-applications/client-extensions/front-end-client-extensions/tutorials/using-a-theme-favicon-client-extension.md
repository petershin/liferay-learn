# テーマのお気に入りアイコンクライアント拡張の使用

{bdg-secondary}`利用可能な Liferay 7.4`

テーマのお気に入りアイコンクライアント拡張を使えば、選択したページでテーマのお気に入りアイコンを上書きすることができます。 [サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace)から、クライアント拡張を構築し、デプロイします。

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

これで、最初のテーマのお気に入りアイコンクライアント拡張をデプロイするためのツールがそろいました。

## クライアント拡張の検討

テーマのお気に入りアイコンクライアント拡張は、サンプルワークスペースの `client-extensions/sample-global-css/` フォルダにあります。 `client-extension.yaml` ファイルに定義されています。

```yaml
liferay-sample-theme-favicon:
    name: Liferay Sample Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

このクライアント拡張は、IDが `liferay-sample-theme-favicon`で、タイプや追加するお気に入りアイコンファイルなど、テーマのお気に入りアイコンクライアント拡張の主要な設定項目が含まれています。 利用可能なプロパティの詳細については、[テーマのお気に入りアイコンYAML設定リファレンス](../theme-favicon-yaml-configuration-reference.md)を参照してください。

また、以下の`assemble` YAMLブロックも含まれています。

```yaml
assemble:
    - from: assets
      into: static
```

これは、 `assets/` フォルダ内のすべてを、ビルドされたクライアント拡張`.zip` ファイルに静的リソースとして含めることを指定します。 テーマのお気に入りアイコンクライアント拡張のお気に入りアイコンファイルは、Liferayの静的リソースとして使用されます。

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

```bash
STARTED liferay-sample-theme-favicon_1.0.0
```

## ページでクライアント拡張を使用する

<!-- Should we suggest doing this to the pages of a Site Template? -->
デプロイされたクライアント拡張を使用するために、Liferayのページを設定します。

1. ページで、上部にある _編集_ (![Edit icon](../../../../images/icon-edit-pencil.png)) をクリックします。

1. サイドバーの［ページデザインオプション］メニュー（![Page Design Options icon](../../../../images/icon-format.png)）に移動し、メニュー上部の _設定_ (![Configuration icon](../../../../images/icon-cog3.png)) をクリックします。

1. _［ルック&フィール］_ タブの _お気に入りアイコン_ セクションで、_［お気に入りアイコンの変更］_をクリックします。

1. _［クライアント拡張］_をクリックし、新しくデプロイしたお気に入りアイコン、_［サンプルテーマのお気に入りアイコン］_を選択します。

   ![［サンプルテーマのお気に入りアイコン］クライアント拡張を選択し、［保存］をクリックします。](./using-a-theme-favicon-client-extension/images/01.gif)

1. 下にスクロールして、_［保存］_をクリックします。

1. ページに戻ります。 新しいお気に入りアイコンがブラウザのタブに表示されます。

![新しいお気に入りアイコンがブラウザのタブに表示されます。](./using-a-theme-favicon-client-extension/images/02.png)

## 次のステップ

Liferayでテーマのお気に入りアイコンクライアント拡張を使用できるようになりました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [CSSクライアント拡張の使用](./using-a-css-client-extension.md)
* [JSクライアント拡張の使用](./using-a-javascript-client-extension.md)
