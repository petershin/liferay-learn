# システムオブジェクトの拡張

{bdg-secondary}`利用可能な Liferay 7.4 U46+/GA46+`

Liferay Objectを使用すると、サポートされているシステムサービスを拡張することができます。 現在、Objects フレームワークと統合されているのは、以下のサービスのみです。Account、Commerce Order、Commerce Product、Commerce Product Group、Postal Address、Userです。

```{note}
Postal Address オブジェクトは、アカウントアドレスを格納するためにのみ使用される。 このため、Accountsオブジェクトに関連するカスタムオブジェクトにのみ関連付けることができます。 詳しくは、[カスタムオブジェクトを使用したアカウントの使用](./using-accounts-with-custom-objects.md)を参照してください。
```

![オブジェクトフレームワークと統合されたシステムサービスを拡張します。](./extending-system-objects/images/01.png)

システムオブジェクトを拡張する場合、 [フィールド](#adding-fields) 、 [リレーション](#adding-relationships) 、 [アクション](#adding-actions) 、 [バリデーション](#adding-validations) を追加することができます。

| 機能        | システムオブジェクト | カスタムオブジェクト |
|:--------- |:---------- |:---------- |
| 項目        | &#10004;   | &#10004;   |
| リレーションシップ | &#10004;   | &#10004;   |
| レイアウト     |            | &#10004;   |
| 操作        | &#10004;   | &#10004;   |
| 閲覧数       |            | &#10004;   |
| 入力値の検証    | &#10004;   | &#10004;   |

## フィールドの追加

システムオブジェクトにフィールドを追加することができます。 追加のデータベースカラムは、サービスの元のテーブル名に `_x` を付加したものを使用する別のデータベーステーブルに追加されます（例: `AccountEntry_x`）。 システムオブジェクトは、利用可能なすべてのフィールドタイプ [をサポートしています](./fields.md)。 システムオブジェクトはカスタムレイアウトやビューをサポートしないため、これらのカスタムフィールドにはヘッドレスAPIを介してのみアクセスできます。 詳細については、[オブジェクトへのフィールドの追加](./fields/adding-fields-to-objects.md)を参照してください。

```{note}
Liferay の [Custom Fields](../../system-administration/configuring-liferay/adding-custom-fields.md) アプリケーションは [Expando](../../data-frameworks/expando-framework/accessing-custom-fields-with-expando.md) フレームワークを使ったほとんどの Liferay システムアプリケーションへのフィールド追加用のものです。 Objects は Expando ベースのカスタム フィールドをサポートしていないため、Objects 機能 ( [relationships](#adding-relationships) , [actions](#adding-actions) , および [validations](#adding-validations) など) で使用することはでき ません。
```

## リレーションシップの追加

システムオブジェクトとカスタムオブジェクトの間にリレーションシップを作成し、それらのエンティティをリンクさせることができます。 システムオブジェクトは、1対多と多対多の両方の関係をサポートしています。 詳細については、[オブジェクトリレーションシップの定義](./relationships/defining-object-relationships.md)を参照してください。

```{important}
システムオブジェクトは[カスタムレイアウト](./layouts/designing-object-layouts.md)をサポートしていないので、多対多の関係や1対多の関係の親側を表示するための [レイアウトタブ](./layouts/designing-object-layouts.md#adding-layout-tabs) はオブジェクトには付加できない。
```

## アクションの追加

システムオブジェクトにカスタムアクションを追加して、エントリーが追加、更新、削除されたときにトリガーされるようにすることができます。 システムオブジェクトは、 [Webhook](./actions/defining-object-actions.md#webhook-actions) , [Groovy Script](./actions/defining-object-actions.md#groovy-script-actions) , および [Notification](./actions/defining-object-actions.md#notification-actions) アクションをサポートしています。 [オブジェクトエントリーの追加](./actions/defining-object-actions.md#add-an-object-entry-actions) システムオブジェクトでは、アクションはサポートされていません。 詳しくは、 [オブジェクトアクションの定義](./actions/defining-object-actions.md) をご覧ください。

## バリデーションの追加

システムオブジェクトにGroovyおよびExpression Builderの検証機能を追加することができます。 これらのバリデーションは、トリガーされると、フィールドの入力が有効かどうかをチェックし、無効な入力に対してはカスタムエラーメッセージを表示します。 現在、Objects はシステムオブジェクトのデフォルトフィールドに対する検証のみをサポートし、そのカスタムフィールドに対する検証はサポートしていません。 詳細は、[カスタムバリデーションの追加](./validations/adding-custom-validations.md)を参照してください。

<!--TASK: Uncomment once supported.
## Additional Configuration Options

When editing a system object, you can also configure the following settings in the *Details* tab.

| Field | Description |
| :--- | :--- |
| Title Field | Determine the field used as the title for object entries. |
| Widget | Determine whether the object's Page widget is available in sites.| -->

## 追加情報

* [オブジェクトへのフィールドの追加](./fields/adding-fields-to-objects.md)
* [オブジェクトリレーションシップの定義](./relationships/defining-object-relationships.md)
* [オブジェクトアクションの定義](./actions/defining-object-actions.md)
