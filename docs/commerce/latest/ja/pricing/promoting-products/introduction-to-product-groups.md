# 商品グループについて

商品グループは、ターゲット割引や価格設定に使用できる商品の静的なグループです。 製品グループは、2つのシナリオにおいて理想的である：

1. 単一のカテゴリーに属さない商品を持ち、特定の顧客向けに異なる価格を設定したい場合。

1. 単一のカテゴリーに属さない商品があり、特定の顧客に対して異なる割引を適用したい場合。

```{note}
商品グループは、購入者のために商品がグループ化されたり表示されたりする方法を変更するものではなく、管理目的で使用されます。 
```

## 商品グループの作成

1. ![アプリケーションメニュー](../../images/icon-applications-menu.png) を開き、 **Commerce** &rarr; **Product Groups** に移動します。

1. **Add**（ [Add](../../images/icon-add.png) ）をクリックし、商品グループの名前と説明を入力します。

   ![Enter details for the product group.](./introduction-to-product-groups/images/01.png)

1. **Submit** をクリックしてください。

これにより、製品グループが作成される。

## 商品グループへの商品の追加

商品グループを作成したら、商品を追加する必要があります。 以下では、2つの商品を選択し、商品グループに追加して、ターゲット価格や割引に使用できるようにします。

1. 商品追加_検索バーを使って、追加したい商品を探してください。 入力した内容に応じて、自動的にオプションが表示されます。

   ![Search for products to be added to the product group.](./introduction-to-product-groups/images/02.png)

1. お好みの商品の横にある **選択** をクリックし、グループに追加します。

この商品グループを価格表や割引にリンクできるようになりました。

```{note}
商品グループに商品を追加する以外に、商品グループを商品にリンクすることもできます。 これを行うには、製品リストからご希望の製品を選択し、製品グループタブを選択し、作成した製品グループを検索します。 選択した商品グループの横にある*選択*をクリックすると、商品グループと商品がリンクされます。
```

## 商品グループと割引の関連付け

1. アプリケーションメニュー &rarr; **Commerce** タブをクリックし、 ***_* Pricing** &rarr; **Discounts** に進みます。

1. **Add**（ [Add](../../images/icon-add.png) ）をクリックし、以下の情報を入力する：

    __Name__: 商品グループ割引の例

    __Type__: パーセント

    __Apply To__: 製品グループ

   ![Enter details for a Discount.](./introduction-to-product-groups/images/03.png)

1. **Submit** をクリックしてください。

   これは新しい割引を作成し、商品グループに適用することができます。

   割引の［Details］ページでは、割引のタイプを変更したり、金額を追加したり、割引の有効状態やレベルを設定したりすることができます。 詳しくは、 [割引の概要](./introduction-to-discounts.md) をお読みください。 割引を作成したら、先に作成した商品グループとリンクさせる必要があります。

1. 割引の詳細ページで、［Select Product Group］セクションまでスクロールします。

   ![Search for the product group to be added to the Discount.](./introduction-to-product-groups/images/04.png)

1. 先ほど作成した商品グループの名前を入力します。 入力した内容に基づいて、自動的に結果が入力されます。

1. 商品グループの横にある「選択」をクリックします。 追加したら、 **Publish** をクリックして、商品グループの割引を有効にします。

カタログの商品をチェックして割引を表示することで検証することができます。

![The discount is applied to the product in the product group.](./introduction-to-product-groups/images/05.png)

## 商品グループと価格表の関連付け

価格リストを商品グループにリンクさせるには、まず価格リストを作成し、作成した商品グループをターゲットとする価格修飾子を作成する必要があります。

1. ![アプリケーションメニュー](../../images/icon-applications-menu.png) を開き、 &rarr; **Commerce** タブを開き、 **Pricing** &rarr; **Price Lists** に進みます。

1. **Add**(![Add](../../images/icon-add.png)) をクリックし、価格リストの名前、カタログ、通貨を入力します。

   ![Configure the price list.](./introduction-to-product-groups/images/06.png)

1. 完了したら **Submit** をクリックする。

1. 価格変更セクションの下にある **Add**（[Add]（../../images/icon-add.png））をクリックし、以下の情報を入力します。

    __Name__: ホイール修正

    __Target__: 製品グループ

    __Modifier__: 比率／入替／定額

   ![Configure the price modifier.](./introduction-to-product-groups/images/07.png)

1. 完了したら **Submit** をクリックしてください。

   ![Detailed configuration view of the price modifier.](./introduction-to-product-groups/images/08.png)

   これにより価格修飾子が作成され、それを設定するための詳細ビューが開きます。

    ```{note}
    価格修正記号に記載された金額は割引とはみなされない。 例えば、パーセント修飾子を選択し、金額を10に設定すると、商品の価格が10%上がります。 価格を下げるには、マイナスのパーセンテージを使用します。
    ```

    ```{important}
    同じ商品を対象とした価格リストが2つある場合、変更を有効にするには、優先順位の高い新しい価格リストを作成する必要があります。
    ```

   ![Search for the product group to be added to the price modifier.](./introduction-to-product-groups/images/09.png)

1. 商品グループセクションで、作成した商品グループを検索します。 入力した内容に基づいて、自動的に結果が入力されます。

1. 商品グループの横にある「選択」をクリックします。 追加したら、 **Publish** をクリックして、商品グループの価格リストを有効にします。

カタログで商品を確認すると、更新された価格が表示され、検証することができます。

![The price modifier is applied to the product in the product group.](./introduction-to-product-groups/images/10.png)

割引または価格リストが商品グループにリンクされているかどうかを表示するには、 **Applications Menu** ![アプリケーションメニュー](../../images/icon-applications-menu.png)をクリックし、 **Commerce** タブをクリックし、 **Pricing** &rarr; **Product Groups** に進みます。 価格リストと割引の下に、関連するエンティティが表示されます。

## 関連トピック

* [ディスカウント入門](./introduction-to-discounts.md)
* [プライシング入門](../introduction-to-pricing.md)
* [価格表の作成](../creating-a-price-list.md)
* [価格表への商品の追加](../adding-products-to-a-price-list.md)
