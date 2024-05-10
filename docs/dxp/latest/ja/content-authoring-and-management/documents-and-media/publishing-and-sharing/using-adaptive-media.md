---
toc:
  - ./using-adaptive-media/adding-image-resolutions.md
  - ./using-adaptive-media/managing-image-resolutions.md
  - ./using-adaptive-media/using-adapted-images-in-site-content.md
  - ./using-adaptive-media/migrating-documents-and-media-thumbnails.md
  - ./using-adaptive-media/adaptive-media-configuration-reference.md
---
# アダプティブ・メディアの使用

{bdg-secondary}`liferay 7.4+`

Liferay Adaptive Mediaは、ドキュメントライブラリに保存されている画像を処理し、異なる解像度のコピーを作成します。 一度生成されると、 [、ドキュメントとメディア、ブログ、ウェブコンテンツ、およびコンテンツページで、適応された画像](./using-adaptive-media/using-adapted-images-in-site-content.md) 、エンドユーザーのデバイスに最適な画像解像度を提供するために使用することができます。 これにより、ページサイズが小さくなり、ロード時間が短縮され、帯域幅が節約される。

デフォルトでは、Adaptive Mediaにはプレビュー（1000px auto）とサムネイル（300px/300px）の解像度が含まれていますが、 [追加の解像度を定義することができます](./using-adaptive-media/adding-image-resolutions.md) 。 次にアダプティブ・メディアは、ユーザーが [対応メディアタイプをアップロードするのをリッスンし、](./using-adaptive-media/adaptive-media-configuration-reference.md#images) 、代替画像サイズを生成するための並列非同期処理を開始する。 新しい画像は元の画像にリンクされ、同じアスペクト比を維持しながら、設定した解像度に合うように拡大縮小されます。

```{note}
Adaptive Mediaは以下のコマースウィジェットをサポートしています： [検索](https://learn.liferay.com/w/commerce/creating-store-content/commerce-storefront-pages/search) 、 [商品詳細](https://learn.liferay.com/w/commerce/creating-store-content/commerce-storefront-pages/product-details) 、 [ミニカートウィジェットの使用](https://learn.liferay.com/w/commerce/creating-store-content/liferay-commerce-widgets/using-the-mini-cart-widget) とコンポーネント、 [チェックアウト](https://learn.liferay.com/w/commerce/creating-store-content/commerce-storefront-pages/checkout) 。
```

アダプティブメディアをサポートしていないレガシーバージョンから最新のDXPバージョンにアップグレードした場合、既存のドキュメントとメディアのサムネイルを新しいアダプティブメディア定義の画像解像度に移行することができます。 [ドキュメントとメディアのサムネイルの移行](./using-adaptive-media/migrating-documents-and-media-thumbnails.md) を参照してください。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 画像解像度の追加
:link: ./using-adaptive-media/adding-image-resolutions.md
:::

:::{grid-item-card} 画像解像度の管理
:link: ./using-adaptive-media/managing-image-resolutions.md
:::

:::{grid-item-card} サイトコンテンツでの適用された画像の使用
:link: ./using-adaptive-media/using-adaptted-images-in-site-content.md
:::

:::{grid-item-card} ドキュメントとメディアサムネイルの移行
:link: ./using-adaptive-media/migrating-documents-and-media-thumbnails.md
:::

:::{grid-item-card} アダプティブメディア設定リファレンス
:link: ./using-adaptive-media/adaptive-media-configuration-reference.md
:::
::::
