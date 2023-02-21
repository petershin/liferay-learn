# 在庫数低下時のアクション

SKUの在庫が特定のしきい値を下回ると、低在庫アクションが発生します。 デフォルトでは、LiferayはSet as Unpublished low stockアクションを含んでおり、これは在庫が閾値を下回ると商品をストアから削除するものです。 また、カスタムのローストックアクションを作成することも可能です。 詳しくは、 [カスタム低在庫アクティビティの実装](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md) を参照してください。

商品の在庫が少ない場合のアクションを設定する。

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Products** に移動します。

1. 製品を選択し、 **構成** タブに移動します。

1. 在庫の項目で、ドロップダウンメニューから、 **Low Stock Action** を選択します。

1. **Low Stock Threshold** を入力し、アクションのトリガーとなる数量を決定します。

   ![低在庫アクションを選択し、アクションのトリガーとなる数量を設定します。](./low-stock-action/images/01.png)

1. ［**公開**］ をクリックします。

一度設定すると、商品の在庫が設定した閾値を下回ると、低在庫アクションが実行されます。

## Commerce 2.1以前

ローストックアクションを設定するには

1. ［**コントロールパネル**］ → ［**コマース**］ → ［**商品**］ に移動します。

1. 製品をクリックし、 **Configuration** タブを選択します。

1. 在庫の項目で、ドロップダウンメニューから、 **Low Stock Action** を選択します。

1. **Low Stock Threshold** を入力し、アクションのトリガーとなる数量を決定します。

1. ［**Publish**］ をクリックします。

一度設定されると、商品の在庫が設定された閾値を下回ると、選択された低在庫アクションがトリガーされます。

## 追加情報

* [商品の在庫設定のリファレンス](./product-inventory-configuration-reference-guide.md)
* [在庫数低下時のアクションの実装](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md)
