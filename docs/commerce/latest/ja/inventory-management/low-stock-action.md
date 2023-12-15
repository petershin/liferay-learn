# 在庫数低下時のアクション

SKUの在庫が特定のしきい値を下回ると、在庫数低下時のアクションがトリガーされます。 デフォルトでは、Liferayは **Set as Unpublished** low stockアクションを含み、在庫が閾値を下回ると商品をストアから削除します。 また、カスタムの在庫数低下時のアクションを作成することも可能です。 詳しくは、 [カスタムの在庫数低下アクティビティの実装](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md) を参照してください。

商品の在庫数低下時のアクションを設定するには、

1. **グローバルメニュー**(![グローバルメニュー](../images/icon-applications-menu.png))を開き、 **Commerce** &rarr; **Products** に移動します。

1. 製品を選択し、 **設定** タブに移動します。

1. 在庫セクションで、ドロップダウンメニューから **在庫切れアクション** を選択します。

1. **低在庫しきい値** を入力し、アクションのトリガーとなる数量を決定します。

   ![Select a low stock action and set the quantity that triggers the action.](./low-stock-action/images/01.png)

1. ［**公開**］ をクリックします。

設定後、商品の在庫が設定したしきい値を下回ると、在庫数低下時のアクションが実行されます。

## Commerce 2.1以前

在庫数低下時のアクションを設定するには：

1. **コントロールパネル** &rarr; **Commerce** &rarr; **Products** に移動します。

1. 製品をクリックし、 **設定** タブを選択します。

1. 在庫セクションで、ドロップダウンメニューから **在庫切れアクション** を選択します。

1. アクションのトリガー数量を決定するために、 **低在庫しきい値** を入力します。

1. ［**公開**］ をクリックします。

一度設定されると、商品の在庫が設定されたしきい値を下回るたびに、選択された在庫数低下時のアクションがトリガーされます。

## 関連トピック

* [製品在庫構成リファレンス](./product-inventory-configuration-reference-guide.md)
* [カスタム・ローストック・アクションの実装](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md)
