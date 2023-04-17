---
toc:
- ./picklists/using-picklists.md
- ./picklists/exporting-and-importing-picklists.md
- ./picklists/managing-picklist-permissions.md
- ./picklists/picklists-api-basics.md
---
# 選択リスト

```{toctree}
:maxdepth: 3

picklists/using-picklists.md
picklists/exporting-and-importing-picklists.md
picklists/managing-picklist-permissions.md
picklists/picklists-api-basics.md
```

Liferay Picklistsは、名前とキーのペアからなる文字列値の定義済みリストで、任意の数のアイテムを含めることができます。リストを[作成](./picklists/using-picklists.md#creating-a-picklist)したら、[Picklist field type](./picklists/using-picklists.md#adding-picklist-fields-to-objects) を使ってオブジェクト定義に追加することができます。このフィールドを使用して、[表示エントリーのフィルタリング](./displaying-object-entries.md)や[カスタムエントリー状態の定義](./creating and-managing-objects/fields/adding and-managing-custom-states.md) を行うことが可能です。また、状態の定義に使用する場合、[validation](./creating-and-managing-objects/validations/adding-custom-validations.md)と [actions](./creating-and-managing-objects/actions/defining-object-actions.md) により各状態にカスタムビジネスロジックを関連付けることができます。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} ピックリストの使用
:link: ./picklists/using-picklists.md
:::  

:::{grid-item-card} ピックリストのエクスポートとインポート
:link: ./picklists/exporting-and-importing-picklists.md
::: 

:::{grid-item-card} ピックリストのパーミッションの管理
:link: ./picklists/managing-picklist-permissions.md
:::

:::{grid-item-card} Picklists API Basics
:link: ./picklists/picklists-api-basics.md
:::
::::
