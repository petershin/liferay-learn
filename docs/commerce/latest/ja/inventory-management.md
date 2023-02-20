---
toc:
- ./inventory-management/setting-up-warehouses.md
- ./inventory-management/setting-inventory-by-warehouse.md
- ./inventory-management/low-stock-action.md
- ./inventory-management/availability-estimates.md
- ./inventory-management/managing-product-publication.md
- ./inventory-management/using-the-inventory-management-system.md
- ./inventory-management/inventory-management-reference-guide.md
- ./inventory-management/warehouse-reference-guide.md
- ./inventory-management/product-inventory-configuration-reference-guide.md
---
# 在庫管理

```{toctree}
:maxdepth: 1

inventory-management/setting-up-warehouses.md
inventory-management/setting-inventory-by-warehouse.md
inventory-management/low-stock-action.md
inventory-management/availability-estimates.md
inventory-management/managing-product-publication.md
inventory-management/using-the-inventory-management-system.md
inventory-management/inventory-management-reference-guide.md
inventory-management/warehouse-reference-guide.md
inventory-management/product-inventory-configuration-reference-guide.md
```

{bdg-secondary}`利用可能なCommerce 2.1+`

Liferayの在庫管理ツールは、1つの倉庫を持つ単一の店舗から、地理的に分散した倉庫を持つ複数の販売チャネルまで、幅広い商取引のユースケースをサポートすることができます。

ここでは、Liferayの在庫管理機能を紹介します。

* 倉庫の作成と管理
* 稼働率の目安を設定
* 在庫切れアクションの設定
* 倉庫別SKU在庫設定

在庫管理システムを使って、在庫を一元的に把握することができます。 詳しくは、 [在庫管理システムの使用](./inventory-management/using-the-inventory-management-system.md) をご覧ください。

## 倉庫

倉庫とは、商品の在庫を管理し、注文に対応するために商品を調達するための物理的な場所を指します。 一つのSKUが複数の倉庫で販売されることもあり、在庫は倉庫単位で管理されます。

在庫管理についての詳細は、[Setting Up Commerce Warehouses](./inventory-management/setting-up-warehouses.md)と[Warehouse Reference Guide](./inventory-management/warehouse-reference-guide.md)を参照してください。

店舗が注文を受けるには、関連するチャンネルに倉庫が関連付けられている必要があります。 [チャネル入門](../store-management/channels/introduction-to-channels.md) を読んで、チャネルの仕組みを理解しましょう。

## 倉庫別の在庫の設定

Liferayでは、在庫はSKU単位で管理されます。 詳しくは、 [Setting Inventory by Warehouse](./inventory-management/setting-inventory-by-warehouse.md) をお読みください。

```{important}
在庫の各商品は、少なくとも1つのSKUに関連付けられている必要があります。
```

## 在庫数低下時のアクション

在庫切れアクションは、商品の在庫が特定の閾値に達したときにアクションを実行します。 在庫が最小のしきい値に達したときに実行されるアクションの設定方法については、 [Low Stock Action](./inventory-management/low-stock-action.md) をお読みください。

独自のカスタムローストックアクションの作成に興味のある開発者は、 [カスタムローストックアクティビティの実装](../developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md)をご覧ください。

## 在庫数の見積もり

在庫切れの商品に対して、在庫状況の予測を設定することができます。 これにより、再び利用可能になったときにお客様にお知らせすることができます。 詳しくは、 [可用性推定値](./inventory-management/availability-estimates.md) をお読みください。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  倉庫の設定
:link: ./inventory-management/setting-up-warehouses.md
:::

:::{grid-item-card}  倉庫別在庫の設定
:link: ./inventory-management/setting-inventory-by-warehouse.md
:::

:::{grid-item-card}  ローストックアクション
:link: ./inventory-management/low-stock-action.md
:::

:::{grid-item-card}  可用性の見積もり
:link: ./inventory-management/availability-estimates.md
:::

:::{grid-item-card}  製品ステータスの管理
:link: ./inventory-management/managing-product-status.md
:::

:::{grid-item-card}  在庫管理システムの利用
:link: ./inventory-management/using-the-inventory-management-system.md
:::

:::{grid-item-card}  在庫管理リファレンスガイド
:link: ./inventory-management/inventory-management-reference-guide.md
:::

:::{grid-item-card}  倉庫リファレンスガイド
:link: ./inventory-management/warehouse-reference-guide.md
:::

:::{grid-item-card}  製品インベントリ構成リファレンスガイド
:link: ./inventory-management/product-inventory-configuration-reference-guide.md 
:::  
::::
