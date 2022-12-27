---
toc:
- ./relationships/defining-object-relationships.md
- ./relationships/removing-relationships.md
---
# 関連

```{toctree}
:maxdepth: 3

relationships/defining-object-relationships.md
relationships/removing-relationships.md
```

{bdg-secondary}`For Liferay 7.4 U47+/GA47+`

リレーションシップは、オブジェクト定義にフィールドとテーブルを追加し、そのエントリーを相互に関連付けるものです。 これにより、異なるアプリケーションのコンテキストでエントリデータにアクセスすることができます。 このデータをさまざまな方法で利用することができます。 [たとえば、複数のビジネスアカウントを持つシナリオでは、Account システムオブジェクトとのリレーションシップを使用して、カスタムオブジェクトデータへのアクセスをアカウントごとに制限することができます](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md)。 あるいは、 [集計フィールド](../creating-and-managing-objects/fields/aggregation-fields.md) をリレーションシップとともに使用して、基本的な計算を行うことができます。

![オブジェクトにリレーションシップを追加する。](./relationships/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトリレーションシップの定義
:link: ./relationships/defining-object-relationships.md
:::

:::{grid-item-card} 関係の削除
:link: ./relationships/removing-relationships.md
:::
::::
