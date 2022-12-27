---
toc:
- ./validations/adding-custom-validations.md
- ./validations/expression-builder-validations-reference.md
---
# 検証

```{toctree}
:maxdepth: 3

validations/adding-custom-validations.md
validations/expression-builder-validations-reference.md
```

{bdg-secondary}`Liferay 7.4以降で利用可能`

オブジェクトバリデーションは、有効なフィールドエントリを決定するためのルールを設定し、 [Groovyスクリプト](./validations/adding-custom-validations.md#using-groovy-validations) または [Liferay式](./validations/adding-custom-validations.md#using-expression-builder-validations) のいずれかを使用して定義されるものです。 バリデーションが開始されると、定義された条件に従ってフィールドの入力が有効かどうかをチェックし、無効な入力に対してはエラーメッセージを表示します。

![オブジェクト定義にフィールドバリデーションを追加する。](./validations/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} カスタムバリデーションの追加
:link: ./validations/adding-custom-validations.md
:::

:::{grid-item-card} エクスプレッションビルダー検証リファレンス
:link: ./validations/expression-builder-validations-reference.md
:::
::::
