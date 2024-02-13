---
toc:
  - ./picklists/creating-picklists.md
  - ./picklists/exporting-and-importing-picklists.md
  - ./picklists/managing-picklist-permissions.md
  - ./picklists/picklists-api-basics.md
---
# 候補リスト

{bdg-secondary}`liferay 7.4+`

Liferay **picklists** は、名前とキーのペアで構成され、任意の数の項目を含むことができる文字列値の定義済みリストです。 リストが [](./picklists/creating-picklists.md) に作成されると、それを使ってオブジェクト定義に単一選択フィールドまたは複数選択フィールドを追加することができます。 これらのフィールドを使用して、 [表示されたエントリーをフィルターする](./displaying-object-entries.md) 、 [カスタム・エントリー状態を定義する](./creating-and-managing-objects/fields/adding-and-managing-custom-states.md) などができます。 ピックリストを使用してステートを定義する場合、 [バリデーション](./creating-and-managing-objects/validations/adding-field-validations.md) 、 [アクション](./creating-and-managing-objects/actions/defining-object-actions.md) 、 [ワークフロープロセス](./enabling-workflows-for-objects.md) を使用して、各ステートに複雑なビジネスロジックを実装できます。

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
