# 個別製品カタログの別ページの作成

ストアフロントには、複数のカタログの商品を掲載することができます。 Liferay はカタログに製品を保存し、 **カタログページ** を使ってストアフロントに表示します。 詳しくは、 [カタログページの作成](./creating-a-catalog-page.md) をご覧ください。 カタログごとに異なる種類の商品を掲載することができるため、複数のカタログページを使って差別化することができます。

これを行うには、まず2つ以上のカタログと、少なくとも1つのカタログ・ページが必要です。 次に、既存のカタログページを複製し、両方のページに [カスタムフィルターの例](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/search-results/custom-filter-examples) ウィジェットを追加して、カタログIDで製品をフィルタリングします。

## 既存のカタログページをコピーする

Liferay DXP 7.4 U22+ と GA22+ では、Minium サイトの Catalog ページをコピーするには、まず [ページについて](https://learn.liferay.com/w/dxp/site-building/creating-pages/understanding-pages/understanding-pages#enabling-private-pages) を有効にする必要があります。 それ以前のバージョンをお使いの場合は、この手順は必要ありません。

1. プライベートページがアクティブになったら、 **サイトメニュー**(![Site Menu](../images/icon-product-menu.png)) を開き、 **サイトビルダー** &rarr; **ページ** にアクセスしてください。

1. **プライベートページ** をクリックします。

1. カタログページの横にある **3点アイコン**(![3-dot icon](../images/icon-actions.png)) をクリックし、 **ページをコピー** を選択します。

1. 新しいカタログページの名前を入力し、 **Add** をクリックします。

新しいページがストアフロントに表示され、既存のカタログページと同じ内容が表示されます。

## カスタムフィルタの追加

カスタムフィルタを追加する前に、まずフィルタリングしたいカタログのIDを取得する必要があります。 そのためには、 **Global Menu**(![Applications Menu icon](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Catalogs** に進みます。 カタログをクリックし、名前の横にあるIDをコピーしてください。

![カタログIDをコピーして、カタログページで商品を絞り込むことができます。](./creating-separate-catalog-pages-for-individual-product-catalogs/images/01.png)

カタログページに戻る

1. トップメニューから「**Add**」ボタンをクリックします。

1. **ウィジェット** セクションで、 **カスタムフィルタ** ウィジェットを検索してください。

   ```{important}
   コンテンツページを使用している場合、ウィジェットを追加する方法は2つあります。
   1. 上部メニューの*編集*ボタン（！ [編集ボタン](../images/icon-edit-pencil.png) ）をクリックし、右側の*追加*（！ [追加アイコン](../images/icon-add.png) ）をクリックします。 残りの手順は上記と同じです。

   2. サイトメニュー*（！ [サイトメニュー](../images/icon-product-menu.png) ）を開き、*サイトビルダー* &rarr; *ページ*を選択します。 目的のページに移動し、*3ドットアイコン*（！ [3ドットアイコン](../images/icon-actions.png) ）をクリックします。 &rarr; *編集*を行います。 残りの手順は上記と同じです。
   ```

1. ウィジェットをストアフロントの目的のエリアにドラッグアンドドロップします。

1. ウィジェットにカーソルを合わせて、 **3点アイコン**(![3-dot icon](../images/icon-actions.png)) をクリックし、 **構成** を選択します。

1. 以下の情報を入力し、 **保存** をクリックします。

   **Filter Field:** `commerceCatalogId`

   **フィルターの値** `43445` (コピーしたカタログIDを入力)

   **フィルターの種類** マッチ

   **発生：** Filter

   ![カスタムフィルタウィジェットを設定します。](./creating-separate-catalog-pages-for-individual-product-catalogs/images/02.png)

1. カスタムフィルターの **Apply** をクリックし、変更を適用します。

ページには、1つのカタログの商品だけが表示されるはずです。 もう一方のカタログページで、別のカタログを使用して上記の手順を繰り返します。

```{note}
また、*Configuration*メニュー内のチェックボックスを使用して、カスタムフィルターを無効化し、不変で不可視にすることができます。 カスタムフィルターは、さまざまなユースケースで利用できます。 詳しくは、 [カスタムフィルターの例](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/search-results/custom-filter-examples) をご覧ください。
```

## 関連トピック

* [カタログページの作成](./creating-a-catalog-page.md)
* [カスタムフィルターの例](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/search-results/custom-filter-examples)
