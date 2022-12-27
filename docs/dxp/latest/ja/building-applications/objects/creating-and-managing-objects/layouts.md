---
toc:
- ./layouts/designing-object-layouts.md
- ./layouts/adding-categorization-to-fields-tabs.md
---
# レイアウト

```{toctree}
:maxdepth: 3

layouts/designing-object-layouts.md
layouts/adding-categorization-to-fields-tabs.md
```

{bdg-secondary}`Liferay 7.4以降で利用可能`

オブジェクトレイアウトは、エントリーを作成・編集する際に、フィールドやリレーションシップがどのように表示されるかを定義します。 すべての発行済みオブジェクトには、オブジェクトのフィールドをアルファベット順に並べた1つのタブを持つレイアウトが自動生成されます。 [カスタムオブジェクト用に独自のレイアウト](./layouts/designing-object-layouts.md) を設計し、そのフィールドやリレーションシップをどのように表示するかを決定することができます。 7.4 U31+とGA31+では、 [カテゴリ分類ツール](./layouts/adding-categorization-to-fields-tabs.md) をタブに追加し、エンドユーザーがオブジェクトエントリにタグとカテゴリを適用できるようにすることもできます。

```{important}
自動生成されたレイアウトには、オブジェクトのリレーションシップが表示されません。 リレーションシップを表示するには、カスタムレイアウトを作成する必要があります。
```

![カスタムオブジェクトにレイアウトを追加し、エントリ作成時のフィールドやリレーションシップの表示方法を定義することができます。](./layouts/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトレイアウトの設計
:link: ./layouts/designing-object-layouts.md
:::

:::{grid-item-card} フィールドタブへのカテゴライズ追加
:link: ./layouts/adding-categorization-to-fields-tabs.md
:::
::::
