---
toc:
  - ./validations/adding-field-validations.md
  - ./validations/expression-builder-validations-reference.md
---
# 検証

```{toctree}
:maxdepth: 3

validations/adding-field-validations.md
validations/expression-builder-validations-reference.md
```

{bdg-secondary}`Liferay 7.4+`

オブジェクトのバリデーションは有効なフィールド入力を決定するルールを設定し、[Groovy scripts](./validations/adding-field-validations.md#using-groovy-validations) または [Liferay expressions](./validations/adding-field-validations.md#using-expression-builder-validations) を使用して定義します。バリデーションがトリガーされると、定義された条件に従ってフィールドの入力が有効かどうかをチェックし、無効な入力に対してはエラーメッセージを表示します。

![オブジェクト定義にフィールドバリデーションを追加する](./validations/images/01.png)

すぐに使えるバリデーションがニーズに合わない場合は、`objectValidationRule` クライアント拡張機能を使ってカスタムバリデーションを作成できます。詳しくは [マイクロサービスのクライアント拡張](../../client-extensions/microservice-client-extensions.md) を参照してください。

![オブジェクト定義にフィールド検証を追加します。](./validations/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} カスタムバリデーションの追加
:link: ./validations/adding-field-validations.md
:::

:::{grid-item-card} 式ビルダー検証リファレンス
:link: ./validations/expression-builder-validations-reference.md
:::
::::
