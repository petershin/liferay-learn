# 割引について

割引とは、顧客にインセンティブを提供するために商品や注文に適用できる値下げを意味します。 割引を作成する際には、設定価格をパーセンテージでの割引か、一律の割引かを決め、割引の範囲を設定します。

| 割引の範囲  | 説明                                                                                                                                                     |
| :----- | :----------------------------------------------------------------------------------------------------------------------------------------------------- |
| カテゴリー  | [カテゴリ](../../product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md) 内のすべての商品に適用されます。 |
| プロダクト  | 選択した商品に適用されます。                                                                                                                                         |
| 製品グループ | 同じグループ内のすべての商品に適用されます。                                                                                                                                 |
| 出荷     | 送料に適用されます。                                                                                                                                             |
| SKU    | 指定されたSKUに適用されます。                                                                                                                                       |
| 小計     | 通常、税金やその他の手数料を適用する前に注文の小計に適用されます。                                                                                                                      |
| 合計     | 注文の合計に適用されます。                                                                                                                                          |

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+` もしSKUに [単位](../../product-management/creating-and-managing-products/products/units-of-measure.md) を設定していれば、各単位に特化した割引を行うことができます。

一度作成すると、割引を受けるための対象となるチャネル、アカウント、および注文タイプを決定し、資格を得るための要件を定義することができます。 デフォルトでは、Liferayは自動的に割引を適用しますが、クーポンコードとして顧客が利用できるようにすることもできます。 また、割引を設定する際に、割引の開始日と終了日を設定することができます。

[Creating Discount](./creating-a-discount.md) で始めるか、 [価格の概要](../introduction-to-pricing.md) で割引が Liferay の価格設定エンジンにどのように貢献するかをご覧ください。

## クーポンコード

割引種類にかかわらず、割引を受けるためにクーポンコードの入力をユーザーに求めることができます。 クーポンコードを有効にすると、メール、ニュースレター、広告を通じてクーポンコードを共有することができます。

![Activate the coupon code feature and enter a coupon code for this discount type.](./introduction-to-discounts/images/01.png)

クーポンコードを受け付けるには、ストアの [チェックアウト](../../creating-store-content/commerce-storefront-pages/checkout.md) ページに **クーポンコード入力** ウィジェットを追加する必要があります。 チェックアウトページは、 [Miniumサイト](../../starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.md) ですぐに利用できます。

![Place the Coupon Code Entry widget on the Checkout page.](./introduction-to-discounts/images/02.png)

クーポンコードを適用すると、注文概要セクションで更新された価格を確認できます。

![You can view the updated prices in the order summary section.](./introduction-to-discounts/images/03.png)

## 有効期限

プロモーション活動に合わせて割引の有効期限を設定することができます。

![Configure the expiration date for a discount to coincide with a promotion.](./introduction-to-discounts/images/04.png)

## 割引ルール

割引の対象となる要件を指定するルールを定義できます。 下記3つのルールが標準で設定されています。

| ルール            | 説明                                                    |
| :------------- | :---------------------------------------------------- |
| カートの合計金額       | カートの小計は、割引を受けるための最小しきい値を満たしている必要があります。                |
| これらの製品をすべて所有   | 割引を受けるには、注文に特定のすべての商品が含まれている必要があります。                  |
| これらの製品のいずれかを所有 | 注文には、割引を受けるために、指定された商品のリストから少なくとも1つの商品が含まれている必要があります。 |

**ルール** セクションで割引ルールを追加できます。 また、開発者は可能 [新しい割引ルール実装](../../developer-guide/promotions/adding-a-new-discount-rule-type.md) することも可能です。

これらの製品をすべて持っている **または** これらの製品の1つを持っている **ルール** を使用する場合は、カタログ内のどの製品が割引の対象となるかを選択します。

![The available discount rule types.](./introduction-to-discounts/images/05.png)

## 割引レベル

商品と注文に複数の割引を適用するための割引レベルを作成することができます。 コマースでは、これらの割引を連続して適用します。 詳しくは、 [割引レベルの使用](./using-discount-levels.md) をご覧ください。

## 割引を上書き

価格エントリーを編集する際に、割引アプリケーションで設定された割引を上書きする代替割引を設定することができます。 これらの割引はパーセンテージタイプを使用しています。 ただし、ルールや参加資格の制限には対応していません。 制限を維持したい場合は、割引の上書きを使用しないでください。

## 関連トピック

* [プライシング入門](../introduction-to-pricing.md)
* [割引の作成](./creating-a-discount.md)
* [割引レベルの使用](./using-discount-levels.md)
