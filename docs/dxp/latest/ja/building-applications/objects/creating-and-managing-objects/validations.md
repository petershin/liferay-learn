---
toc:
  - ./validations/adding-field-validations.md
  - ./validations/expression-builder-validations-reference.md
---
# 検証

{bdg-secondary}`liferay 7.4+`

オブジェクトのバリデーションは、有効なフィールド入力を決定するためのルールを設定し、 [Groovyスクリプト](./validations/adding-field-validations.md#using-groovy-validations) または [Liferay式](./validations/adding-field-validations.md#using-expression-builder-validations) を使用して定義されます。 バリデーションがトリガーされると、定義された条件に従ってフィールド入力が有効かどうかをチェックし、無効な入力に対してはエラーメッセージを表示します。

![Add field validations to object definitions.](./validations/images/01.png)

すぐに使えるバリデーションがニーズに合わない場合は、`objectValidationRule` クライアントエクステンションを使ってカスタムバリデーションを作成することができます。 詳細は [マイクロサービスのクライアント拡張](../../client-extensions/microservice-client-extensions.md) を参照。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} フィールド検証の追加
:link: ./validations/adding-field-validations.md
:::

:::{grid-item-card} 式ビルダー検証リファレンス
:link: ./validations/expression-builder-validations-reference.md
:::
::::