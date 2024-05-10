# コマース製品を関連するアセットとして利用可能に

コマース製品は、 [関連するアセット](https://help.liferay.com/hc/articles/360028820532-Defining-Content-Relationships) の関係を使用して、Liferay Commerceの他のアセットに接続できます。

```{note}
Liferay DXP 7.4+は、関連資産としてのコマース製品をサポートしていません。
```

## データベースの検索のためにアセットブラウザーを設定する

1. [Liferay Home]に移動します。 `Liferay Home` フォルダの詳細については、 [Liferay Home](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/liferay-home.html) を参照してください。
1. `Liferay Web Experience - Liferay Asset - Impl.lpkg` を探し、アーカイブマネージャで開きます。
1. アーカイブマネージャーウィンドウで、`com.liferay.asset.browser.web.jar`を開きます。
1. テキストエディタを使って、`portlet.properties`ファイルを開きます。
1. `search.with.database=true`を設定し、jarを更新する。
1. アプリケーションサーバーを再起動します。

```{note}
コンテンツ編集時にコマース製品を関連資産オプションとして表示するには、検索の再インデックスが必要な場合があります。
```

## インデックスの再構築

インデックスの再構築を行い、関連するアセットがフィルターに入力されていることを確認します。

1. **コントロールパネル** &rarr; **設定** &rarr; **検索** に移動します。
1. All Search Indexesの隣にある **Reindex** をクリックする。

## コマース製品の在庫状況の確認

コマース製品はデフォルトではすべてのLiferay DXPサイトで利用可能なので、フィルタを **Global** に変更する必要があります。

1. サイト管理 **&rarr;** コンテンツ **&rarr;** ウェブコンテンツ_をクリックしてください。

1. (![アイコンの追加](../../images/icon-add.png))アイコンをクリックし、次に **基本ウェブコンテンツ** をクリックします。

1. 「関連資産」セクションまでスクロールダウンしてください。

1. 「選択」をクリックする。

1. コマース商品_をクリックします。

   ![Select Commerce Product in the Related Assets section.](./enabling-commerce-products-as-related-assets/images/01.png)

1. フィルタとオーダー」をクリックし、次に「グローバル」をクリックする。

   ![Select the Global filter to view Commerce products.](./enabling-commerce-products-as-related-assets/images/02.png)

1. 商品をクリックします。

これで、コマース製品を関連するアセットとして利用できるようになります。

## 関連トピック

* [コンテンツの関係の定義](https://help.liferay.com/hc/articles/360028820532-Defining-Content-Relationships)
* [基本Webコンテンツ記事の追加](https://learn.liferay.com/w/dxp/content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article)
