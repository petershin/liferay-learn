# コマース製品を関連するアセットとして利用可能に

コマース製品は、 [関連するアセット](https://help.liferay.com/hc/articles/360028820532-Defining-Content-Relationships) の関係を使用して、Liferay Commerceの他のアセットに接続できます。

```{note}
コンテンツの編集時に、関連するアセットのオプションとしてコマース製品を表示するには、検索のインデックスの再構築が必要な場合があります。
```

## データベースの検索のためにアセットブラウザーを設定する

1. ``[Liferay Home]\osgi\marketplace\` へ移動します。 ``Liferay Home`フォルダーについての詳細は、 [Liferay Home](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/liferay-home.html) を参照してください。
1. `Liferay Web Experience - Liferay Asset - Impl.lpkg`を検索し、アーカイブマネージャーで開きます。
1. アーカイブマネージャーウインドウで、`com.liferay.asset.browser.web.jar`を開きます。
1. テキストエディターを使用して、`portlet.properties`ファイルを開きます。
1. `search.with.database=true`を設定し、jarを更新します。
1. アプリケーションサーバーを再起動します。

## インデックスの再構築

インデックスの再構築を行い、関連するアセットがフィルターに入力されていることを確認します。

1. ［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**検索機能**］ へ移動します。
1. ［すべての検索インデックスを再構築］の横にある ［**実行**］ をクリックします。

## コマース製品の在庫状況の確認

コマース製品はグローバルに保管されるため（つまり、すべてのLiferay DXPサイトで利用可能）、ユーザーはフィルターを **グローバル** に変更する必要があります。

1. ［**サイト管理**］ &rarr; ［**コンテンツ**］ &rarr; ［**Webコンテンツ**］ をクリックします。
1. （![Add icon](../../images/icon-add.png)）アイコンをクリックし、次に ［**基本Webコンテンツ**］ をクリックします。
1. **関連するアセット** のセクションまでスクロールします。
1. **選択** をクリックします。
1. ［**Commerce Product**］ をクリックします。

     ![［関連するアセット］セクションでコマース製品を選択します。](./enabling-commerce-products-as-related-assets/images/01.png)

1. ［**Filter and Order**］ そして ［**Globa**］ をクリックします。

     ![グローバルフィルターを選択すると、コマース製品が表示されます。](./enabling-commerce-products-as-related-assets/images/02.png)

1. 商品をクリックします。

これで、コマース製品を関連するアセットとして利用できるようになります。

## 追加情報

* [コンテンツ関連の定義](https://help.liferay.com/hc/articles/360028820532-Defining-Content-Relationships)
* [基本的なWebコンテンツの記事の追加](https://learn.liferay.com/dxp/latest/ja/content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.html)
