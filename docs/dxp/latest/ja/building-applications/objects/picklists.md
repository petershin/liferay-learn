---
toc:
  - ./picklists/creating-picklists.md
  - ./picklists/exporting-and-importing-picklists.md
  - ./picklists/managing-picklist-permissions.md
  - ./picklists/picklists-api-basics.md
---
# 候補リスト

```{toctree}
:maxdepth: 3

picklists/creating-picklists.md
picklists/exporting-and-importing-picklists.md
picklists/managing-picklist-permissions.md
picklists/picklists-api-basics.md
```

{bdg-secondary}`Liferay 7.4+`

Liferay の **picklists** はあらかじめ定義された文字列のリストで、名前とキーのペアで構成され、任意の数の項目を含むことができます。リストが[作成](./picklists/creating-picklists.md)されると、それを使ってオブジェクト定義に単一選択フィールドや複数選択フィールドを追加することができます。これらのフィールドは、[表示されるエントリーをフィルタリングする](./displaying-object-entries.md)、[カスタムエントリー状態を定義する](./creating-and-managing-objects/fields/adding-and-managing-custom-states.md)などに使用できます。ピックリストを使用して状態を定義する場合、[validation](./creating-and-managing-objects/validations/adding-field-validations.md)、[actions](./creating-and-managing-objects/actions/defining-object-actions.md)、[workflow processes](./enabling-workflow-for-objects.md)を使用して、各状態に対して複雑なビジネスロジックを実装できます。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} ピックリストの作成
:link: ./picklists/creating-picklists.md
:::

:::{grid-item-card} 候補リストのエクスポートとインポート
:link: ./picklists/exporting-and-importing-picklists.md
:::

:::{grid-item-card} 候補リスト権限の管理
:link: ./picklists/managing-picklist-permissions.md
:::

:::{grid-item-card} 候補リストAPIの基本
:link: ./picklists/picklists-api-basics.md
:::
::::
