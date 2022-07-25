# アダプティブメディアの仕組み
<!--TASK: Use as section intro, Adaptive Media. -->
メディアプロバイダーは、コンテンツを配信するときにデバイス（電話、ラップトップ、タブレットなど）間の違いを考慮する必要があります。画面サイズだけでなく、帯域幅と処理能力の違いも考慮しなければなりません。 アダプティブメディアは、画質をコントロールすることができ、アップロードされたメディアを使用する画面に最適になるように動的に調整します。

アダプティブメディアは、ドキュメントとメディア、ブログ、Webコンテンツ、およびコンテンツページ（Liferay DXP 7.4以降）と統合されます。 様々な画面で使用する画像セットを生成します。 コンテンツにアクセスすると、アダプティブメディアは画面の種類と解像度をチェックし、適切な画像を選択します。 アダプティブメディアは、DXPに事前インストールされています。

```{note}
アダプティブメディアは下記のCommerceウィジェットに対し、標準機能として利用可能です。[検索結果](https://learn.liferay.com/commerce/latest/en/creating-store-content/commerce-storefront-pages/search.html), [製品詳細、製品パブリッシャー](https://learn.liferay.com/commerce/latest/en/creating-store-content/commerce-storefront-pages/product-details.html), [ミニカートウィジェット](https://learn.liferay.com/commerce/latest/en/creating-store-content/liferay-commerce-widgets/using-the-mini-cart-widget.html) and component, [Checkout](https://learn.liferay.com/commerce/latest/en/creating-store-content/commerce-storefront-pages/checkout.html)
```

ここでは、アダプティブメディアについてと、画像を処理するための準備方法について学習します。 <!--Q: What about other assets? -->

アダプティブメディアを使用するには、最初にユーザーのデバイスに配信される画像の解像度を定義する必要があります。 次に、アダプティブメディアは、元のアスペクト比を維持しながら、これらの解像度に合うようにスケーリングされた新しい画像を生成します。 新しい画像解像度の作成の詳細は、[画像解像度の追加](./adding-image-resolutions.md)を参照してください。

上記のように、さまざまなタイプのコンテンツで適用された画像を使用できます（[Using Adapted Images in Site Content](./using-adapted-images-in-site-content.md)を参照）。

アダプティブメディアの画像解像度を管理するには、[画像解像度の管理](./managing-image-resolutions.md)を参照してください。

最新のDXPバージョンにアップグレードし、アダプティブメディアをサポートしていないレガシーバージョンを使用していた場合は、既存のドキュメントとメディアのサムネイルを新しいアダプティブメディアで定義された画像解像度に移行できます。[Migrating Documents and Media Thumbnails](./migrating-documents-and-media-thumbnails.md)を参照してください。

## 追加情報

* [アダプティブメディア設定リファレンス](./adaptive-media-configuration-reference.md)
* [アダプティブメディアモジュールリファレンス](../../developer-guide/adaptive-media-modules-reference.md)
