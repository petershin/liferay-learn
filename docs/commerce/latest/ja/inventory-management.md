---
toc:
  - ./inventory-management/setting-up-warehouses.md
  - ./inventory-management/setting-inventory-by-warehouse.md
  - ./inventory-management/low-stock-action.md
  - ./inventory-management/availability-estimates.md
  - ./inventory-management/managing-product-status.md
  - ./inventory-management/using-the-inventory-management-system.md
  - ./inventory-management/inventory-management-reference-guide.md
  - ./inventory-management/warehouse-reference-guide.md
  - ./inventory-management/product-inventory-configuration-reference-guide.md
  - ./inventory-management/developer-guide.md
---
# 在庫管理

{bdg-secondary}`コマース 2.1+`

Liferayの在庫管理ツールは、1つの倉庫を持つ単一の店舗から、地理的に分散した倉庫を持つ複数の販売チャネルまで、幅広いコマースのユースケースをサポートすることができます。

ここでは、Liferayの在庫管理機能を紹介します。

* 倉庫の作成と管理
* 在庫数の見積もりの設定
* 在庫数低下時のアクションの設定
* 倉庫別のSKU在庫の設定
* [単位で在庫を設定](./product-management/creating-and-managing-products/products/units-of-measure.md) {bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+`

在庫管理システムを使って、在庫を一元的に把握することができます。 詳しくは [在庫管理システムの使用](./inventory-management/using-the-inventory-management-system.md) を参照。

## 倉庫

倉庫とは、商品在庫が管理され、注文処理のために商品を調達するための物理的な場所を指します。 1つのSKUまたは単位が複数の倉庫で入手可能な場合があり、在庫は倉庫ごとに管理される。

倉庫の管理については、 [「Setting Up Commerce Warehouses」](./inventory-management/setting-up-warehouses.md) および [「Warehouse Reference Guide」](./inventory-management/warehouse-reference-guide.md) を参照してください。

ストアが商品の注文を受け付けるには、関連するチャネルに関連付けられた倉庫が必要です。 [チャンネル入門](./store-management/channels/introduction-to-channels.md) を読んで、チャンネルがどのように機能するかを理解しよう。

## 倉庫別の在庫の設定

{bdg-secondary}`liferay DXP 2023.Q4+/Portal 7.4 GA98+`

SKUに単位が設定されている場合、在庫はそのSKUの単位で管理されます。

{bdg-secondary}`liferay DXP 2023.Q3/Portal 7.4 GA97以下`

在庫はSKUレベルで追跡されます。

```{important}
在庫の各製品は、少なくとも1つのSKUに関連付けられている必要があります。
```

詳しくは [倉庫別在庫設定](./inventory-management/setting-inventory-by-warehouse.md) をお読みください。

## 在庫数低下時のアクション

在庫数低下時のアクションは、商品の在庫が特定のしきい値に達したときにアクションを実行します。 [在庫数低下時のアクション](./inventory-management/low-stock-action.md) を読んで、在庫が最低閾値に達したときに実行されるアクションの設定方法を学びましょう。

独自のカスタム・ローストック・アクションの作成に興味のある開発者は、 [カスタム・ローストック・アクティビティの実装](./developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md) をお読みください。

## 在庫数の見積もり

在庫なしの商品に対して、在庫数の見積もりを設定することができます。 これにより、再び利用可能になったときにお客様に通知されます。 詳しくは [在庫数の見積もり](./inventory-management/availability-estimates.md) 。

