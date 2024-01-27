# フラグメントとリソースのインポート

まず、デザイナーが作成したフラグメントや画像をインポートし、ページ作りに役立てます。 これらにより、サイト制作者は、クラリティのデザインとブランディングの要件を満たしながらサイトを制作するために必要なリソースを得ることができます。 この演習では、サイト管理者ユーザーであるPreston Palmerとしてログインしてください。

## 画像のダウンロード

1. 画像をダウンロードして解凍する：

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/web-site-manager/creating-pages/importing-fragments-and-resources/liferay-q9c4.zip -O
   ```

   ```bash
   unzip liferay-q9c4.zip
   ```

## 画像のインポート

1. ![サイトメニュー](../../images/icon-product-menu.png))を開き、[コンテンツとデータ]を展開し、[ドキュメントとメディア]をクリックします。

1. Add_をクリックし、(![Add](./../../images/icon-add.png))、次に*Multiple Files*をクリックします。

1. `liferay-q9c4.zip/images`内のファイルをすべて選択し、_Publish_をクリックする。

これらの画像は「ドキュメントとメディア」に表示されます：

- `clarity_banner.jpg`
- `clarity_logo.png`
- `clarity-testimonials.jpg`

## フラグメントセットのダウンロード

1. フラグメントセットのダウンロード

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/web-site-manager/creating-pages/importing-fragments-and-resources/liferay-j2b6.zip -O
   ```

## フラグメントセットのインポート

1. Liferay で Site メニュー (![Site Menu](../../images/icon-product-menu.png)) を開き、_Design_ を展開し、_Fragments_ をクリックします。

1. フラグメントセット（![Actions Button](../../images/icon-actions.png)）の横にある_Actions_をクリックし、_Import_を選択します。

1. `liferay-j2b6.zip`を選択し、_Import_をクリックする。

   終了すると、これらのフラグメントはフラグメントセットに表示される：

   - `banner-composition`
   - `footer-composition`
   - `header-composition`
   - `home-page-slider-composition`
   - `home-page-slider-fragment`
   - `sign-in-fragment`
   - `user-nav-fragment`

   このフォルダには、フラグメント・コンポジションとカスタム・フラグメントがある。 また、フラグメント・リソースとして`sign-in-image.png`が含まれていた。 フラグメントセットのResourcesタブで確認してください。

   - カスタムフラグメントは、 [アウトオブボックスフラグメント](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference) の中にあなたのニーズに合うものがない場合に、あなたが開発するものです。 [多くの場合、独自のフラグメントを作成するために必要なHTML、CSS、JavaScriptの一部を含む既存のフラグメント](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/duplicating-fragments) をコピーすることから始めることができます。
   - [フラグメントコンポジション](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/saving-fragment-compositions) は、コンテンツページエディターに追加し、繰り返し使用するために保存した、再利用可能なフラグメントグループです。

次： [これらのフラグメントを使ってホームページ](./adding-the-home-page.md) を追加する。

## 関連コンセプト

* [デフォルト・フラグメント リファレンス](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference)
* [フラグメントの管理](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments)
* [フラグメントでデフォルトのリソースを含める](https://learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/including-default-resources-with-fragments.html)
