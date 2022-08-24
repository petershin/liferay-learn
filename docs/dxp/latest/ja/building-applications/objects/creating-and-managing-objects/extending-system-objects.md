# システムオブジェクトの拡張

{bdg-secondary}`Liferay 7.4 U35以降およびGA35以降で利用可能`

Liferay Objectを使用すると、サポートされているシステムサービスを拡張することができます。 現在、オブジェクトフレームワークと統合されているのは、次のサービスのみです：アカウント、コマース製品、コマース製品グループ、ユーザー。 Liferayは、住所情報を保存し、他のオブジェクトと関連付けるための住所システムオブジェクトも提供します。

![オブジェクトフレームワークと統合されたシステムサービスを拡張します。](./extending-system-objects/images/01.png)

システムオブジェクトを拡張する場合、[リレーションシップ](#adding-relationships)と[アクション](#adding-actions)を追加することができます。 <!--TASK: You can also access limited \[configuration options\](#additional-configuration-options).--> | 機能        | システムオブジェクト                                                | カスタムオブジェクト |
|:--------- |:--------------------------------------------------------- |:---------- |
| 項目        | <!--TASK: Uncomment once supported: &#10004;--> | &#10004;   |
| リレーションシップ | &#10004;                                                  | &#10004;   |
| レイアウト     |                                                           | &#10004;   |
| 操作        | &#10004;                                                  | &#10004;   |
| 閲覧数       |                                                           | &#10004;   |
| 入力値の検証    |                                                           | &#10004;   |

<!--TASK: Uncomment once supported.
## Adding Fields

You can add custom fields to system Objects to define additional database columns. These fields are added to a separate database table that uses the service's original table name with `_x` appended to it (e.g., `AccountEntry_x`). System Objects support all available [field types](./adding-fields-to-objects.md#field-types-ui-reference). See [Adding Fields to Objects](./adding-fields-to-objects.md) for more information. -->

<!-- When you uncomment the above text, please be sure to discuss the reasons why you'd do it this way rather than add custom fields the way you've been able to add them for many releases (i.e., as Expandos). --Rich -->

## リレーションシップの追加

システムオブジェクトとカスタムオブジェクトの間にリレーションシップを作成し、それらのエンティティをリンクさせることができます。 システムオブジェクトは、 **1対多** と **多対多** の両方のリレーションシップをサポートしています。 詳細については、[オブジェクトリレーションシップの定義](./defining-object-relationships.md)を参照してください。

```{important}
システムオブジェクトは[カスタムレイアウト](./designing-object-layouts.md)をサポートしていないため、多対多のリレーションシップ、もしくは一対多のリレーションシップの親側を表示するために [レイアウトタブ](./designing-object-layouts.md#adding-layout-tabs) をオブジェクトに追加することができません。
```

## アクションの追加

システムオブジェクトにカスタムアクションを追加して、エントリが追加、更新、削除されたときにトリガーされるようにすることができます。 これにはWebhookとGroovyスクリプト両方のアクションが含まれます。 詳しくは、 [オブジェクトアクションの定義](./defining-object-actions.md) をご覧ください。

<!--TASK: Uncomment once supported.
## Additional Configuration Options

When editing a system Object, you can also configure the following settings in the **Details** tab.

| Field | Description |
| :--- | :--- |
| Title Field | Determine the field used as the title for Object entries. |
| Widget | Determine whether the Object's Page widget is available in Sites.| -->

## 追加情報

* [オブジェクトへのフィールドの追加](./adding-fields-to-objects.md)
* [オブジェクトリレーションシップの定義](./defining-object-relationships.md)
* [オブジェクトアクションの定義](./defining-object-actions.md)
