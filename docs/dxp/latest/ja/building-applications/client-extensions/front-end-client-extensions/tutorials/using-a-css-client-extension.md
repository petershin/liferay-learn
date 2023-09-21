# CSSクライアント拡張の使用

{bdg-secondary}`利用可能な Liferay 7.4`

CSSクライアント拡張を使えば、テーマやLiferayのコードに依存することなく、ページスタイルをオーバーライドすることができます。 クライアント拡張（ [サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) ）から始めます。

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

これで、最初のCSSクライアント拡張をデプロイするためのツールがそろいました。

## クライアント拡張の検討と修正

CSS クライアント拡張はサンプルワークスペースの `client-extensions/liferay-sample-global-css/` フォルダにあります。 `client-extension.yaml` ファイルに定義されています。

```yaml
liferay-sample-global-css:
    name: Liferay Sample Global CSS
    type: globalCSS
    url: global.css
```

クライアントエクステンションのIDは `liferay-sample-global-css` で、 `タイプ` や追加するCSSファイルなど、CSSクライアントエクステンションの主要な設定が含まれています。 利用可能なプロパティの詳細については、[CSS YAML設定リファレンス](../css-yaml-configuration-reference.md) を参照してください。

また、`assemble`ブロックが含まれています。

```yaml
assemble:
    - from: assets
      into: static
```

これは、 `assets/` フォルダ内のすべてを、ビルドされたクライアント拡張`.zip` ファイルに静的リソースとして含めることを指定します。 CSSクライアント拡張子のCSSファイルは、Liferayの静的リソースとして使用されます。

`assets/global.css` ファイルにこのCSSが含まれています。

```css
.logo::after {
   color: #0054f0;
   content: 'Liferay Sample Global CSS';
   margin-left: 2rem;
}
```

これは、クライアントエクステンションが有効になっているときに、ホームページのLiferayロゴの色を変更します。

ボタンの背景色を変更するCSSを追加します。 `global.css`ファイルを開き、`.btn-primary`クラスの宣言を追加し、 `background-color`を指定します。

```css
.btn-primary {
    background-color: purple;
}
```

ここで、クライアント拡張をデプロイします。

## Liferayにクライアント拡張をデプロイする
```{include} /_snippets/run-liferay-portal.md
```

Once Liferay starts, run this command from the client extension's folder in the sample workspace:

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

これにより、クライアント拡張が構築され、Liferayの`deploy/`フォルダにzipをデプロイします。

```{note}
クライアント拡張をLiferay Experience Cloudにデプロイするには、Liferay Cloud [コマンドラインツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) を使って [`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment) を実行します。
```

```{tip}
ワークスペース内のすべてのクライアント拡張を同時にデプロイするには、`client-extensions/`フォルダからコマンドを実行します。
```

Liferayインスタンスのコンソールでデプロイメントを確認します。

```
STARTED sample-global-css_1.0.0
```

クライアント拡張がデプロイされたので、それを使用するためにLiferayを設定します。

## ページでクライアント拡張を使用する

デプロイされたクライアント拡張を使用するために、Liferayのページを設定します。

1. 少なくとも1つのボタンがあるページで、上部にある **編集** アイコン ![Edit icon](../../../../images/icon-edit-pencil.png) をクリックします。

1. サイドバーの［Page Design Options］メニュー（![Page Design Options icon](../../../../images/icon-format.png)）に移動し、メニュー上部にある設定アイコン（![Configuration icon](../../../../images/icon-cog3.png)）をクリックします。

   ![［Page Design Options］メニューの歯車アイコンをクリックすると、このクライアント拡張の設定にアクセスできます。](./using-a-css-client-extension/images/01.png)

1. ページ下部の ［**CSS Client Extensions**］ のセクションで、 ［**Add CSS Client Extensions**］ をクリックします。

   ![リストからCSSクライアント拡張を追加します。](./using-a-css-client-extension/images/02.png)

1. ポップアップモーダルからCSSクライアント拡張を選択し、 ［**追加**］ をクリックします。

1. ［**保存**］ をクリックします。

これで、クライアント拡張の設定は完了です。 ページエディタで、ボタンの背景色が、CSSで指定した色になりました。 編集モード以外でページにCSSが適用されるのを確認するには、ページを公開する必要があります。

![クライアント拡張のglobal.cssファイルで背景色を変更すると、ページ上のすべてのボタンが変更されました。](./using-a-css-client-extension/images/03.png)

```{tip}
ページ上のボタンがまだデフォルトの背景色で表示されている場合は、ページを更新してブラウザのキャッシュをクリアしてください（ほとんどのブラウザで `CTRL + SHIFT + R` ）。 クライアント拡張を変更して再デプロイした場合、変更を確認するには、ページから削除し、再追加する必要があるかもしれません。
```

## 次のステップ

LiferayでCSSクライアント拡張を使用することに成功しました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [JSクライアント拡張の使用](./using-a-javascript-client-extension.md)
