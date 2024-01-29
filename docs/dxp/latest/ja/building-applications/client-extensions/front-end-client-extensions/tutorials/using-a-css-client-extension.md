# CSSクライアント拡張の使用

{bdg-secondary}`liferay 7.4+`

CSSクライアント拡張は、ページに新しいCSSスタイリングを導入します。 ページ上に配置されたCSSクライアント・エクステンションは、テーマやスタイルブックの設定を含む、ページの既存のスタイルに追加されます。 クライアント・エクステンション（ [サンプル・ワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) ）から始めます。

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

これで、最初のCSSクライアント拡張をデプロイするためのツールがそろいました。

## クライアント拡張の検討と修正

CSS クライアント拡張はサンプルワークスペースの `client-extensions/liferay-sample-global-css/` フォルダにあります。 これは `client-extension.yaml` ファイルで定義されている：

```yaml
liferay-sample-global-css:
    name: Liferay Sample Global CSS
    type: globalCSS
    url: global.css
```

クライアントエクステンションは `liferay-sample-global-css` という ID を持ち、`type` や追加する CSS ファイルなど、CSS クライアントエクステンションの主要な設定を含んでいます。 利用可能なプロパティの詳細については、 [CSS YAMLコンフィギュレーションリファレンス](../css-yaml-configuration-reference.md) 。

`assemble`ブロックも含まれている：

```yaml
assemble:
    - from: assets
      into: static
```

これは、`assets/` フォルダにあるすべてのものが、ビルドされたクライアントの拡張子 `.zip` ファイルに静的リソースとして含まれるように指定します。 CSSクライアント拡張子のCSSファイルは、Liferayの静的リソースとして使用されます。

`assets/global.css`ファイルにはこのCSSが含まれている：

```css
.logo::after {
   color: #0054f0;
   content: 'Liferay Sample Global CSS';
   margin-left: 2rem;
}
```

これは、クライアントエクステンションが有効になっているときに、ホームページのLiferayロゴの色を変更します。

ボタンの背景色を変更するCSSを追加します。 `global.css`ファイルを開き、`.btn-primary`クラスの宣言を追加し、`background-color`を指定する：

```css
.btn-primary {
    background-color: purple;
}
```

ここで、クライアント拡張をデプロイします。

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

```
STARTED sample-global-css_1.0.0
```

クライアント拡張がデプロイされたので、それを使用するためにLiferayを設定します。

## ページでクライアント拡張を使用する

デプロイされたクライアント拡張を使用するために、Liferayのページを設定します。

1. 少なくとも1つのボタンがあるページで、上部の **編集**( ![編集アイコン](../../../../images/icon-edit-pencil.png))をクリックします。

1. サイドバーで、ページデザインオプションメニュー（![ページデザインオプションアイコン](../../../../images/icon-format.png)）に移動し、メニューの一番上にある **設定** アイコン（![設定アイコン](../../../../../images/icon-cog3.png)）をクリックします。

   ![Click the configuration icon in the Page Design Options menu to access this client extension's configurations.](./using-a-css-client-extension/images/01.png)

1. ページ下部のCSS Client Extensionsセクションで、 **Add CSS Client Extensions** をクリックします。

   ![Add the CSS client extension from the list.](./using-a-css-client-extension/images/02.png)

1. ポップアップモーダルからCSSクライアント拡張機能を選択し、 **追加** をクリックします。

1. **保存** をクリックします。

これで、クライアント拡張の設定は完了です。 ページエディタで、ボタンの背景色が、CSSで指定した色になりました。 編集モード以外でページにCSSが適用されるのを確認するには、ページを公開する必要があります。

![If you changed the background color in your client extension's global.css file, all buttons on the page were changed.](./using-a-css-client-extension/images/03.png)

```{tip}
ページ上のボタンがまだデフォルトの背景色で表示されている場合は、ページを更新してブラウザのキャッシュをクリアしてください（ほとんどのブラウザで `CTRL + SHIFT + R` ）。 クライアント拡張を変更して再デプロイした場合、変更を確認するには、ページから削除し、再追加する必要があるかもしれません。
```

## 次のステップ

LiferayでCSSクライアント拡張を使用することに成功しました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [JSクライアント・エクステンションの使用](./using-a-javascript-client-extension.md)
