# 在庫数の見積もり

商品の在庫がなくなった場合、再入荷の見込みをお客様に提示することができます。 MiniumやSpeedwellのようなアクセラレータを使用している場合、3つの在庫数の見積もりが自動的に作成されます。 それ以外の場合は、自分で作成することができます。

## 在庫数の見積もりの作成

1. [グローバルメニュー](../images/icon-applications-menu.png)を開き、_Commerce_ &rarr; _Availability Estimates_に移動します。

1. *追加* (![追加ボタン](../images/icon-add.png))をクリックします。

   ![Click the Add button to create a new availability estimate.](./availability-estimates/images/01.png)

1. *タイトル*を入力してください。 これには、商品が再入荷するまでの推定時間（例：3-5日、3-4週間、2-3ヶ月）を記載する必要があります。

1. 見積もりの表示順を決定するために_優先順位_を入力してください。

1. ［_保存_］をクリックします。

一度作成すると、_Display Availability_を有効にした商品に追加することができます。 製品の_Configuration_タブに移動し、ドロップダウンから必要な_Availability Estimate_を選択し、_Publish_をクリックします。

![Select the desired availability estimate.](./availability-estimates/images/02.png)

選択した在庫数の見積もりは、商品の在庫がなくなったときにいつでも表示することができます。

![The selected estimate appears on the product page whenever the product runs out of stock](./availability-estimates/images/03.png)

## Commerce 2.1以前

新規に在庫数の見積もりを作成するには：

1. *コントロールパネル* &rarr; _Commerce_ &rarr; _Settings_に移動します。

1. *稼働率見積もり*タブをクリックします。

1. *追加* (![追加ボタン](../images/icon-add.png))をクリックし、以下の情報を入力します：

   * **タイトル：** 15-21日
   * **優先度：** 4.0

1. ［_保存_］をクリックします。

これにより、新規の在庫数の見積もりが作成されます。 優先度値が4.0であれば、ドロップダウンメニューにおいて、新しい見積りが既存の在庫数の見積もりの下に表示されます。 その下に表示できるのは、優先度5.0以上の見積もりだけです。

![Creating a new availability estimate.](./availability-estimates/images/04.png)

これを使用するには、製品の_Configuration_タブに移動し、_Display Availability_オプションを有効にし、ドロップダウンから必要な_Availability Estimate_を選択し、_Publish_をクリックします。

![Activate the Display Availability toggle and select an availability estimate from the drop-down.](./availability-estimates/images/05.png)

## 関連トピック

* [在庫管理](../inventory-management.md)
* [製品在庫構成リファレンス](./product-inventory-configuration-reference-guide.md)
