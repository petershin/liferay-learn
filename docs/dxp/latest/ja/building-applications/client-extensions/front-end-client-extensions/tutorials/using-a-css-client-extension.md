# CSSクライアントエクステンションの使用

{bdg-secondary}`利用可能 Liferay 7.4 U45+/GA45+`

CSSクライアントエクステンションを使えば、テーマやLiferayのコードに依存することなく、ページスタイルをオーバーライドすることができます。 クライアントエクステンション( [サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-workspace) のもの）から始めます。

## 前提条件

クライアントエクステンションの開発を始めるために、

1. Java(JDK8またはJDK11）をインストールする。

   ```{note}
   対応するJDK、データベース、環境については、 [互換性マトリックス](https://help.liferay.com/hc/ja/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) を確認してください。 推奨されるJVMの設定については、[JVM Configuration](../../../installation-and-upgrades/reference/jvm-configuration.md) を参照してください。
   ```

1. サンプルワークスペースをダウンロードし、解凍してください：

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

これで、最初のCSSクライアントエクステンションをデプロイするためのツールを手に入れたことになります。

## クライアントエクステンションの検討と修正

CSSクライアント拡張は、サンプルワークスペースの `client-extensions/sample-global-css/` フォルダにあります。 `client-extension.yaml` ファイルに定義されています：

```yaml
sample-global-css:
    name: Sample Global CSS
    type: globalCSS
    url: global.css
```

クライアントエクステンションのIDは `sample-global-css` で、 `タイプ` や追加するCSSファイルなど、CSSクライアントエクステンションの主要な設定項目が含まれています。 利用可能なプロパティの詳細については、 [CSS YAML設定リファレンス](../css-yaml-configuration-reference.md) を参照してください。

また、 `アセンブル` ブロックが含まれています：

```yaml
assemble:
    - from: assets
      include: "**/*"
      into: static
```

これは、 `assets/` フォルダ内のすべてを、ビルドされたクライアント拡張機能 `.zip` ファイルに静的リソースとして含めることを指定します。 CSSクライアント拡張子のCSSファイルは、Liferayの静的リソースとして使用されます。

`assets/global.css` ファイルにこのCSSが含まれています：

```css
body {
    color: #0054f0;
}
```

クライアントエクステンションが有効な場合の、ページの `ボディ` の色を変更します。

ボタンの背景色を変更するCSSを追加する。 `global.css` ファイルを開き、 `.btn-primary` クラスの宣言を追加し、 `background-color`を指定します：

```css
.btn-primary {
    background-color: purple;
}
```

ここで、クライアントエクステンションをデプロイします。

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
STARTED sample-global-css_1.0.0
```

クライアントエクステンションがデプロイされたので、それを使用するようにLiferayを設定します。

## ページでクライアントエクステンションを使用する

配備したクライアントエクステンションを使用するために、Liferayのページを設定します：

1. 少なくとも1つのボタンがあるページで、上部にある **編集** アイコン ![Edit icon](../../../../images/icon-edit-pencil.png) をクリックします。

1. サイドバーで「ページデザインオプション」メニュー(![Page Design Options icon](../../../../images/icon-format.png))に移動し、メニュー上部の設定アイコン(![Configuration icon](../../../../images/icon-cog3.png))をクリックします。

   ![ページデザインオプションメニューの歯車アイコンをクリックすると、このクライアント拡張機能の設定にアクセスできます。](./using-a-css-client-extension/images/01.png)

1. ページ下部の **CSS Client Extensions** のセクションで、 **Add CSS Client Extensions** をクリックします。

   ![リストからCSSクライアント拡張を追加します。](./using-a-css-client-extension/images/02.png)

1. ポップアップモーダルからCSSクライアント拡張を選択し、 **Add** をクリックします。

1. ［**保存**］ をクリックします。

これで、クライアントエクステンションの設定は完了です。 ページエディターで、ボタンの背景色が、CSSで指定した色になりました。 編集モード以外でページにCSSが適用されるのを確認するには、ページを公開する必要があります。

![クライアント拡張のglobal.cssファイルで背景色を変更すると、ページ上のすべてのボタンが変更されました。](./using-a-css-client-extension/images/03.png)

```{tip}
ページ上のボタンがまだデフォルトの背景色を表示している場合は、ページをハードリフレッシュしてブラウザのキャッシュをクリアしてください(ほとんどのブラウザで `CTRL + SHIFT + R` ）。 クライアントエクステンションを変更して再デプロイした場合、変更を確認するためにページからエクステンションを削除して再追加する必要がある場合があります。
```

## 次のステップ

LiferayでCSSクライアントエクステンションを使用することに成功しました。 次に、他のクライアントエクステンションタイプのデプロイメントを試してみます。

* [JSクライアントエクステンションの使用](./using-a-javascript-client-extension.md)
