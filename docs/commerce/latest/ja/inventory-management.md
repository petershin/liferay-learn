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
- ./inventory-management/developer-guide.md
uuid: 0af96bfe-53b9-4ae1-bd1f-a372afb783a2
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
inventory-management/developer-guide.md
```

{bdg-secondary}`Commerce 2.1以降で利用可能`

Liferayの在庫管理ツールは、1つの倉庫を持つ単一の店舗から、地理的に分散した倉庫を持つ複数の販売チャネルまで、幅広いコマースのユースケースをサポートすることができます。

ここでは、Liferayの在庫管理機能を紹介します。

* 倉庫の作成と管理
* 在庫数の見積もりの設定
* 在庫数低下時のアクションの設定
* 倉庫別のSKU在庫の設定

在庫管理システムを使って、在庫を一元的に把握することができます。 詳しくは、 [在庫管理システムの活用](./inventory-management/using-the-inventory-management-system.md) をご覧ください。

## 倉庫

倉庫とは、商品在庫が管理され、注文処理のために商品を調達するための物理的な場所を指します。 1つのSKUが複数の倉庫で利用できる場合があるため、在庫は倉庫単位で管理されます。

在庫管理についての詳細は、[Commerce倉庫のセットアップ](./inventory-management/setting-up-warehouses.md)と[Warehouse Reference Guide倉庫リファレンスガイド](./inventory-management/warehouse-reference-guide.md)を参照してください。

ストアが商品の注文を受け付けるには、関連するチャネルに関連付けられた倉庫が必要です。 チャンネルの仕組みについては、[チャネルについて](./store-management/channels/introduction-to-channels.md)を参照してください。

## 倉庫別の在庫の設定

Liferayでは、在庫はSKU単位で管理されます。 詳しくは、 [倉庫ごとの在庫設定](./inventory-management/setting-inventory-by-warehouse.md) をお読みください。

```{important}
在庫の各商品は、少なくとも1つのSKUに関連付けられている必要があります。
```

## 在庫数低下時のアクション

在庫数低下時のアクションは、商品の在庫が特定のしきい値に達したときにアクションを実行します。 在庫が最小のしきい値に達したときに実行されるアクションの設定方法については、 [在庫数低下時のアクション](./inventory-management/low-stock-action.md)をお読みください。

独自のカスタムの在庫数低下時のアクションの作成に興味のある開発者は、[カスタムの在庫数低下アクティビティの実装](./developer-guide/managing-inventory/implementing-a-custom-low-stock-activity.md)を参照してください。

## 在庫数の見積もり

在庫なしの商品に対して、在庫数の見積もりを設定することができます。 これにより、再び利用可能になったときにお客様に通知されます。 詳しくは、[在庫数の見積もり](./inventory-management/availability-estimates.md)をお読みください。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  倉庫の設定
:link: ./inventory-management/setting-up-warehouses.md
:::

:::{grid-item-card}  倉庫別の在庫の設定
:link: ./inventory-management/setting-inventory-by-warehouse.md
:::

:::{grid-item-card}  在庫数低下時のアクション
:link: ./inventory-management/low-stock-action.md
:::

:::{grid-item-card}  在庫数の見積もり
:link: ./inventory-management/availability-estimates.md
:::

:::{grid-item-card}  製品ステータスの管理
:link: ./inventory-management/managing-product-status.md
:::

:::{grid-item-card}  在庫管理システムの活用
:link: ./inventory-management/using-the-inventory-management-system.md
:::

:::{grid-item-card}  在庫管理リファレンスガイド
:link: ./inventory-management/inventory-management-reference-guide.md
:::

:::{grid-item-card}  倉庫リファレンスガイド
:link: ./inventory-management/warehouse-reference-guide.md
:::

:::{grid-item-card}  商品在庫構成リファレンスガイド
:link: ./inventory-management/product-inventory-configuration-reference-guide.md
:::

:::{grid-item-card}  デベロッパーガイド
:link: ./inventory-management/developer-guide.md
:::
::::
