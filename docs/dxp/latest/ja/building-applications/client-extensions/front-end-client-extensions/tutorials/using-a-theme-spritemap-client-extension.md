# テーマスプライトマップクライアント拡張機能の使用

{bdg-secondary}`利用可能な Liferay 7.4`

テーマスプライトマップクライアント拡張機能を使えば、ページ上のアイコンに使われるデフォルトの [Clay](https://clayui.com/docs/components/icon.html) スプライトマップを上書きすることができます。 [サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace)から、クライアント拡張を構築し、デプロイします。

```{note}
SVGスプライトマップは、いくつかのアイコンがグループ化された画像であり、それぞれ固有のIDを持つ。 SVGを読み込み、IDで個々のアイコンを参照することができる。 これにより、スプライト・マップを一度ダウンロードしてキャッシュすれば、すべてのサイト・アイコンを表示できるため、パフォーマンスが若干向上する。
```

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

これで、最初のテーマスプライトマップクライアント拡張機能をデプロイするためのツールが揃いました。

## テーマ・スプライト・マップ・プロジェクトを検証する

テーマのスプライトマップクライアント拡張はサンプルワークスペースの `client-extensions/liferay-sample-theme-spritemap-1/` フォルダにあります。 `client-extension.yaml` ファイルに定義されています。

```yaml
liferay-sample-theme-spritemap-1:
    name: Liferay Sample Theme Spritemap 1
    type: themeSpritemap
    url: spritemap.svg
```

クライアント拡張機能のIDは `liferay-sample-theme-spritemap-1` で、追加するスプライトマップファイルの種類など、テーマのスプライトマップクライアント拡張機能の主な設定が含まれています。 利用可能なプロパティの詳細については、 [Theme Sprite Map YAML Configuration Reference](../theme-sprite-map-yaml-configuration-reference.md)。

また、以下の`assemble` YAMLブロックも含まれています。

```yaml
assemble:
    - from: assets
      into: static
```

これは、 `assets/` フォルダ内のすべてを、ビルドされたクライアント拡張`.zip` ファイルに静的リソースとして含めることを指定します。 テーマのスプライトマップクライアント拡張のSVGスプライトマップは、Liferayの静的リソースとして使用されます。

```{important}
サンプルプロジェクトの `assets/spritemap.svg` は Liferay で使われている [Clay icons](https://clayui.com/docs/components/icon.html) スプライトマップのコピーです。 Liferayで使われているすべてのアイコンはサンプルのスプライトマップに存在するので、UIに変更はありません。 

スプライトマップクライアント拡張は、選択されたページのスプライトマップ全体を置き換えるので、アイコンの欠落を避けるために、必要なすべてのアイコンと対応するIDを用意してください。 
```

## スプライトマップの修正

特定のアイコンを変更するには、そのアイコンのIDを見つけなければならない。 これを見つけるには、HTML要素を検査すればよい。

![ナビバーには9つのアイコンがある。](./using-a-theme-spritemap-client-extension/images/01.png)

以下は、トップ・ナビバーで使用されているアイコンのIDです。

| 数字 | アイコン                                                                  | ID                  |
|:-- |:--------------------------------------------------------------------- |:------------------- |
| 1  | ![編集アイコン](../../../../images/icon-edit-pencil.png)                    | 鉛筆                  |
| 2  | ![歯車のアイコン](../../../../images/icon-cog.png)                           | 枘                   |
| 3  | ![シミュレーションアイコン](../../../../images/icon-simulation.png)               | シミュレーション・メニュー・クローズド |
| 4  | ![分析アイコン](../../../../images/icon-analytics.png)                      | Analytics           |
| 5  | ![ABテストのアイコン](../../../../images/icon-ab-testing.png)                 | 試験                  |
| 6  | ![情報アイコン](./using-a-theme-spritemap-client-extension/images/02.png)   | インフォサークル            |
| 7  | ![グローバルメニューアイコン](../../../../images/icon-applications-menu.png)       | グリッド                |
| 8  | ![検索アイコン](./using-a-theme-spritemap-client-extension/images/03.png)   | 検索                  |
| 9  | ![ユーザーアイコン](./using-a-theme-spritemap-client-extension/images/04.png) | ユーザー                |

鉛筆のアイコンを魚に交換する、

1. `assets/spritemap.svg`内の `pencil` の ID に対応する `<symbol>` タグを探します。 これを表示するには、SVGファイルをテキストエディタで開く必要がある。

   ```html
   <symbol id="pencil" viewBox="0 0 512 512">
      <path class="lexicon-icon-body" d="M490.9,363.4l-2.8-5.1C468.3,322.4,359.9,304,358.9,304l-2.4-0.1l-10.8,1.5c-16.9,3.9-31,15.7-50.5,33.8c-25.2-14.7-52.4-37.6-68.7-54.3c-16.7-17.1-39.9-47.7-52.4-71.6c22-21.6,37.4-38.7,38.4-61.7c0-1-13.8-110.1-48.9-131.7l0,0l-5.1-3.1c-9.6-5.7-27.5-16.4-49.3-16.4c-5.4,0-10.8,0.7-17,2.3c-6.9,2-13.3,4.8-20,9.1C55.9,23,26.2,46.7,11.7,78c-13.5,30.8-4.4,187.9,113.4,311c111.6,116.8,241.2,122.7,266.1,122.7c6.4,0,15.1-0.3,22.4-1.6l2.8-0.1l6.7-2.5c32.2-13.2,56.9-41.7,68.4-57.2C518.4,415.5,497.8,376.6,490.9,363.4L490.9,363.4z" fill="none"></path>
      <path class="lexicon-icon-outline" d="M490.9,363.4l-2.8-5.1C468.3,322.4,359.9,304,358.9,304l-2.4-0.1l-10.8,1.5c-16.9,3.9-31,15.7-50.5,33.8c-25.2-14.7-52.4-37.6-68.7-54.3c-16.7-17.1-39.9-47.7-52.4-71.6c22-21.6,37.4-38.7,38.4-61.7c0-1-13.8-110.1-48.9-131.7l0,0l-5.1-3.1c-9.6-5.7-27.5-16.4-49.3-16.4c-5.4,0-10.8,0.7-17,2.3c-6.9,2-13.3,4.8-20,9.1C55.9,23,26.2,46.7,11.7,78c-13.5,30.8-4.4,187.9,113.4,311c111.6,116.8,241.2,122.7,266.1,122.7c6.4,0,15.1-0.3,22.4-1.6l2.8-0.1l6.7-2.5c32.2-13.2,56.9-41.7,68.4-57.2C518.4,415.5,497.8,376.6,490.9,363.4L490.9,363.4z M445.4,415.1c-10.5,14-27.3,31.3-42.6,38c-1.5,0.2-5.4,0.6-11.6,0.6c-20.7,0-128.8-5.1-224.1-104.8C67,244.3,62.6,119,65.5,100c6.6-12.7,21.2-27.7,38.7-39.8c0.5-0.3,1.9-1.1,3.4-1.6c5.5-1.4,15.6,4.6,21,7.8l2.4,1.5c8.1,13.5,20.6,63.6,23.3,81.2c-3.8,6.4-19.2,21.4-27.7,29.8l-1,1.1c-11.9,12.8-15.5,31.2-8.9,47.3c14.2,32.9,45.9,75.3,68.4,98.3c22.1,22.8,59.4,53.4,93.2,70.6c16.3,8.1,36.3,4.8,49.1-7.5c10.1-9.4,25-23.4,30.6-26.3c17.6,3.4,67.7,18.2,80.8,26.7l1.1,2C446.9,404.3,448.5,411,445.4,415.1L445.4,415.1z"></path>
   </symbol>
   ```

2. これをカスタムアイコンに置き換え、同じID（`pencil`）を与える。 魚のアイコンには、以下の `シンボル` を使用してください。

   ```html
   <symbol id="pencil" viewBox="0 26 100 48">
      <path d="M98.5,47.5C96.5,45.5,81,35,62,35c-2.1,0-4.2,0.1-6.2,0.3L39,26c0,4.5,1.3,9,2.4,12.1C31.7,40.7,23.3,44,16,44L0,34
      c0,8,4,16,4,16s-4,8-4,16l16-10c7.3,0,15.7,3.3,25.4,5.9C40.3,65,39,69.5,39,74l16.8-9.3c2,0.2,4.1,0.3,6.2,0.3
      c19,0,34.5-10.5,36.5-12.5S100.5,49.5,98.5,47.5z M85.5,50c-1.4,0-2.5-1.1-2.5-2.5s1.1-2.5,2.5-2.5s2.5,1.1,2.5,2.5
      C88,48.9,86.9,50,85.5,50z"/>
   </symbol>
   ```

## スプライトマップクライアント拡張のデプロイ
```{include} /_snippets/run-liferay-portal.md
```

Next, run this command from the client extension project's folder in the sample workspace:

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

```bash
STARTED liferay-sample-theme-spritemap-1_1.0.0
```

## 新しいスプライトマップをページで使用する

```{note}
テーマスプライトマップクライアント拡張は現在 [release feature flag](../../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) の後ろにあります。 機能フラグを使用する前に、有効にする必要があります。
```

配置したクライアント拡張機能を使用するようにページを設定します：

1. ページに移動し、上部にある _Edit_ (![Edit icon](../../../../images/icon-edit-pencil.png)) をクリックします。

1. サイドバーの「ページデザインオプション」メニュー（![Page Design Options icon](../../../../images/icon-format.png)）に移動し、メニュー上部の「 _設定」_ （![Configuration icon](../../../../images/icon-cog3.png)）をクリックします。

1. Theme Sprite Map Client Extensionセクションで、 _Add_ (![Add](../../../../images/icon-duplicate.png)) をクリックします。

1. _Liferay Sample Theme Spritemap 1_.

   ![Liferay Sample Theme Spritemap 1 client extensionを選択し、Saveをクリックします。](./using-a-theme-spritemap-client-extension/images/05.gif)

1. 下にスクロールして、_［保存］_をクリックします。

1. ページに戻ります。 ナビバーでは、編集機能の鉛筆 (![Edit icon](../../../../images/icon-edit-pencil.png)) の代わりに魚のアイコンが追加されました。

![スプライトマップの新しいアイコンがナビバーに表示されます。](./using-a-theme-spritemap-client-extension/images/06.png)

## 次のステップ

あなたはテーマスプライトマップクライアント拡張機能を使うことに成功しました。 次は他のクライアント拡張タイプのデプロイメントを試してみましょう。

* [CSSクライアント拡張の使用](./using-a-css-client-extension.md)
* [JSクライアント拡張の使用](./using-a-javascript-client-extension.md)
* [テーマのお気に入りアイコンクライアント拡張の使用](./using-a-theme-favicon-client-extension.md)
