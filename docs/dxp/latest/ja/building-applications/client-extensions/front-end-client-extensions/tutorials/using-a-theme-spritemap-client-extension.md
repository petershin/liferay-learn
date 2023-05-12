# Theme Sprite Map Client Extensionを使用する

{bdg-secondary}`Liferay 7.4 U45+/GA45+で利用可能`

テーマスプライトマップクライアント拡張機能を使用すると、ページのアイコンに使用されるデフォルトの [Clay](https://clayui.com/docs/components/icon.html) スプライトマップをオーバーライドすることができます。 [サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) を使って、クライアントエクステンションのビルドとデプロイを開始します。

```{note}
SVGスプライトマップは、複数のアイコンをグループ化した画像で、それぞれ固有のIDを持っています。 SVGを読み込んで、IDで個々のアイコンを参照することができます。 これにより、スプライトマップを一度ダウンロードしてキャッシュすることで、すべてのサイトアイコンを表示できるため、若干のパフォーマンス向上が期待できます。
```

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

これで、最初のテーマ・スプライト・マップ・クライアント拡張を展開するためのツールを手に入れたことになります。

## テーマスプライトマッププロジェクトを検証する

テーマスプライトマップクライアント拡張は、サンプルワークスペースの `client-extensions/liferay-sample-theme-spritemap-1/` フォルダにあります。 `client-extension.yaml` ファイルに定義されています：

```yaml
liferay-sample-theme-spritemap-1:
    name: Liferay Sample Theme Spritemap 1
    type: themeSpritemap
    url: spritemap.svg
```

このクライアント拡張は、IDが `liferay-sample-theme-spritemap-1` で、タイプや追加するスプライトマップファイルなど、テーマのスプライトマップクライアント拡張の主要な設定を含んでいます。 利用可能なプロパティの詳細については、 [テーマスプライトマップYAML設定リファレンス](../theme-sprite-map-yaml-configuration-reference.md) を参照してください。

また、 `assemble` YAMLブロックも含まれています：

```yaml
assemble:
    - from: assets
      into: static
```

これは、 `assets/` フォルダ内のすべてを、ビルドされたクライアント拡張機能 `.zip` ファイルに静的リソースとして含めることを指定します。 テーマスプライトマップクライアント拡張のSVGスプライトマップは、Liferayの静的リソースとして使用されます。

```{important}
サンプルプロジェクトの `assets/spritemap.svg` は、Liferay で使用されている [Clay icons](https://clayui.com/docs/components/icon.html) のスプライトマップをコピーしています。 Liferayで使用されているすべてのアイコンがサンプルのスプライトマップに存在するので、UIの変更に気づくことはないでしょう。 

スプライトマップクライアント拡張は、選択したページのスプライトマップ全体を置き換えるので、アイコンの欠落を防ぐために、必要なアイコンをすべて対応するIDとともに用意してください。 
```

## スプライトマップの修正

特定のアイコンを変更するためには、そのアイコンのIDを探す必要があります。 HTML要素を検査することで見つけることができます。

![ナビバーには9つのアイコンが入っています。](./using-a-theme-spritemap-client-extension/images/01.png)

トップナビバーで使用されているアイコンのIDは以下の通りです。

| 数字 | アイコン                                                                  | ID                |
|:-- |:--------------------------------------------------------------------- |:----------------- |
| 1  | ![編集アイコン](../../../../images/icon-edit-pencil.png)                    | ペンシル              |
| 2  | ![コグアイコン](../../../../images/icon-cog.png)                            | ほぞ穴               |
| 3  | ![シミュレーションアイコン](../../../../images/icon-simulation.png)               | シミュレーションメニュークローズド |
| 4  | ![アナリティクスアイコン](../../../../images/icon-analytics.png)                 | Analytics         |
| 5  | ![ABテストアイコン](../../../../images/icon-ab-testing.png)                  | 試験                |
| 6  | ![情報アイコン](./using-a-theme-spritemap-client-extension/images/02.png)   | インフォサークル          |
| 7  | ![グローバルメニューアイコン](../../../../images/icon-applications-menu.png)       | グリッド              |
| 8  | ![検索アイコン](./using-a-theme-spritemap-client-extension/images/03.png)   | 検索                |
| 9  | ![ユーザーアイコン](./using-a-theme-spritemap-client-extension/images/04.png) | ユーザー              |

鉛筆のアイコンを魚に入れ替えるには、

1. `pencil` inside `assets/spritemap.svg`のIDに対応する `<symbol>` タグを検索してください。 これを表示するには、SVGファイルをテキストエディタで開く必要があります。

   ```html
   <symbol id="pencil" viewBox="0 0 512 512">
      <path class="lexicon-icon-body" d="M490.9,363.4l-2.8-5.1C468.3,322.4,359.9,304,358.9,304l-2.4-0.1l-10.8,1.5c-16.9,3.9-31,15.7-50.5,33.8c-25.2-14.7-52.4-37.6-68.7-54.3c-16.7-17.1-39.9-47.7-52.4-71.6c22-21.6,37.4-38.7,38.4-61.7c0-1-13.8-110.1-48.9-131.7l0,0l-5.1-3.1c-9.6-5.7-27.5-16.4-49.3-16.4c-5.4,0-10.8,0.7-17,2.3c-6.9,2-13.3,4.8-20,9.1C55.9,23,26.2,46.7,11.7,78c-13.5,30.8-4.4,187.9,113.4,311c111.6,116.8,241.2,122.7,266.1,122.7c6.4,0,15.1-0.3,22.4-1.6l2.8-0.1l6.7-2.5c32.2-13.2,56.9-41.7,68.4-57.2C518.4,415.5,497.8,376.6,490.9,363.4L490.9,363.4z" fill="none"></path>
      <path class="lexicon-icon-outline" d="M490.9,363.4l-2.8-5.1C468.3,322.4,359.9,304,358.9,304l-2.4-0.1l-10.8,1.5c-16.9,3.9-31,15.7-50.5,33.8c-25.2-14.7-52.4-37.6-68.7-54.3c-16.7-17.1-39.9-47.7-52.4-71.6c22-21.6,37.4-38.7,38.4-61.7c0-1-13.8-110.1-48.9-131.7l0,0l-5.1-3.1c-9.6-5.7-27.5-16.4-49.3-16.4c-5.4,0-10.8,0.7-17,2.3c-6.9,2-13.3,4.8-20,9.1C55.9,23,26.2,46.7,11.7,78c-13.5,30.8-4.4,187.9,113.4,311c111.6,116.8,241.2,122.7,266.1,122.7c6.4,0,15.1-0.3,22.4-1.6l2.8-0.1l6.7-2.5c32.2-13.2,56.9-41.7,68.4-57.2C518.4,415.5,497.8,376.6,490.9,363.4L490.9,363.4z M445.4,415.1c-10.5,14-27.3,31.3-42.6,38c-1.5,0.2-5.4,0.6-11.6,0.6c-20.7,0-128.8-5.1-224.1-104.8C67,244.3,62.6,119,65.5,100c6.6-12.7,21.2-27.7,38.7-39.8c0.5-0.3,1.9-1.1,3.4-1.6c5.5-1.4,15.6,4.6,21,7.8l2.4,1.5c8.1,13.5,20.6,63.6,23.3,81.2c-3.8,6.4-19.2,21.4-27.7,29.8l-1,1.1c-11.9,12.8-15.5,31.2-8.9,47.3c14.2,32.9,45.9,75.3,68.4,98.3c22.1,22.8,59.4,53.4,93.2,70.6c16.3,8.1,36.3,4.8,49.1-7.5c10.1-9.4,25-23.4,30.6-26.3c17.6,3.4,67.7,18.2,80.8,26.7l1.1,2C446.9,404.3,448.5,411,445.4,415.1L445.4,415.1z"></path>
   </symbol>
   ```

2. これをカスタムアイコンに置き換え、同じID（`pencil`）を付与します。 魚のアイコンには、以下の `シンボル` をご使用ください。

   ```html
   <symbol id="pencil" viewBox="0 26 100 48">
      <path d="M98.5,47.5C96.5,45.5,81,35,62,35c-2.1,0-4.2,0.1-6.2,0.3L39,26c0,4.5,1.3,9,2.4,12.1C31.7,40.7,23.3,44,16,44L0,34
      c0,8,4,16,4,16s-4,8-4,16l16-10c7.3,0,15.7,3.3,25.4,5.9C40.3,65,39,69.5,39,74l16.8-9.3c2,0.2,4.1,0.3,6.2,0.3
      c19,0,34.5-10.5,36.5-12.5S100.5,49.5,98.5,47.5z M85.5,50c-1.4,0-2.5-1.1-2.5-2.5s1.1-2.5,2.5-2.5s2.5,1.1,2.5,2.5
      C88,48.9,86.9,50,85.5,50z"/>
   </symbol>
   ```

## スプライトマップクライアントエクステンションのデプロイ
```{include} /_snippets/run-liferay-portal.md
```

Next, run this command from the client extension project's folder in the sample workspace:

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
STARTED liferay-sample-theme-spritemap-1_1.0.0
```

## 新しいスプライトマップをページで使う

```{warning}
テーマスプライトマップクライアント拡張は現在 [dev feature flag](../../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) (`LPS-166479`) の後ろにあります． このクライアントエクステンションは、本番では使用しないでください。 テスト用としてのみご使用ください。 
```

配置したクライアント拡張機能を使用するためのページを設定します：

1. ページに移動し、上部の **編集**(![Edit icon](../../../../images/icon-edit-pencil.png)) をクリックします。

1. サイドバーの「ページデザインオプション」メニュー（![Page Design Options icon](../../../../images/icon-format.png)）に移動し、メニュー上部の「**構成**(![Configuration icon](../../../../images/icon-cog3.png)) 」をクリックします。

1. Theme Sprite Map Client Extension」セクションで、「**Add**(![Add](../../../../images/icon-duplicate.png)) 」をクリックします。

1. 新しく配置されたスプライトマップを選択します。 **Liferay Sample Theme Spritemap 1** .

   ![Liferay Sample Theme Spritemap 1 クライアントエクステンションを選択し、Save をクリックします。](./using-a-theme-spritemap-client-extension/images/05.gif)

1. 下にスクロールして、 **保存** をクリックします。

1. ページに戻ってください。 ナビバーでは、編集機能の鉛筆（![Edit icon](../../../../images/icon-edit-pencil.png)）に代わり、魚のアイコンが表示されるようになりました。

![スプライトマップから新しいアイコンがナビバーに表示されます。](./using-a-theme-spritemap-client-extension/images/06.png)

## 次のステップ

テーマスプライトマップクライアントエクステンションを使用することに成功しました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [CSSクライアントエクステンションの使用](./using-a-css-client-extension.md)
* [JSクライアントエクステンションの使用](./using-a-javascript-client-extension.md)
* [テーマファビコンクライアントエクステンションの使用](./using-a-theme-favicon-client-extension.md)
