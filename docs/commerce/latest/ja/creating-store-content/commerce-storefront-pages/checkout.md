# チェックアウト

チェックアウトページは、 **チェックアウト** ウィジェットが含まれています。 買い手が **チェックアウト** をクリックして注文を送信すると、アクティブになります。 また、拡張ポイントを使用して、カスタムチェックアウトステップを実装することも可能です。 詳しくは、[カスタムチェックアウトステップの実装](../../developer-guide/sales/implementing-a-custom-checkout-step.md)を参照してください。

![有効な注文がない場合、チェックアウトウィジェットは空になります。](./checkout/images/01.png)

チェックアウトのプロセスでは、購入者の配送先住所と請求先住所を入力し、配送方法を選択し、注文を確認して確定する手順があります。

## 配送先住所の入力

![注文の配送先住所を入力します。](./checkout/images/02.png)

購入者が ［**請求先住所に配送先住所を使用**］ をオンにすると、請求先住所ページがスキップされます。

## 配送方法の選択

![注文に適した配送方法を選択してください。](./checkout/images/03.png)

購入者が利用できる配送方法は、 ［**サイト管理**］ の中の ［**配送方法**］ から →［**Commerce**］→ ［**設定**］ -> ［**配送方法**］ を変更することにより設定されます。 詳細は、[一律料金配送方法の使用](../../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md)を参照してください。

## 請求先住所の入力

上記のように、このページは、購入者の請求先住所が配送先住所と異なる場合にのみ表示されます。

![注文の請求先住所を入力します。](./checkout/images/04.png)

## 注文概要の表示

![注文を確定する前に、注文の詳細を確認することができます。](./checkout/images/05.png)

## 注文の確定

![注文を確定し、注文の詳細ページに進むと、発注した内容が表示されます。](./checkout/images/06.png)

注文が確定されると、販売者は注文を処理できる状態になります。 詳細は、[注文ライフサイクル](../../order-management/orders/order-life-cycle.md)を参照してください。

```{note}
*チェックアウト*ウィジェットは、Liferayのアダプティブメディアをすぐにサポートします。 詳しくは、 [配信デバイスと画面最適化メディア](https://learn.liferay.com/w/dxp/content-authoring-and-management/documents-and-media/publishing-and-sharing/serving-device-and-screen-optimized-media) を参照してください。
```

## 関連トピック

* [ウィジェットリファレンス](../liferay-commerce-widgets/widget-reference.md)
* [ページの作成](https://help.liferay.com/hc/ja/articles/360018171291-Creating-Pages)
* [カスタム清算ステップの実装](../../developer-guide/sales/implementing-a-custom-checkout-step.md)
* [定額配送方法の使用](../../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md)
