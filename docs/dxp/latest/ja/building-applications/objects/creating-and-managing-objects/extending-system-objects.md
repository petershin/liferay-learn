# システムオブジェクトの拡張

{bdg-secondary}`利用可能 Liferay 7.4 U72+/GA72+`

Liferay Objectを使用すると、サポートされているシステムサービスを拡張することができます。 現在、オブジェクトフレームワークと統合されているのは、次のサービスのみです：［Account］、［Commerce Order］、［Commerce Product］、［Commerce Product Group］、［Postal Address］、［User］。

```{note}
［Postal Address］オブジェクトは、アカウントアドレスを格納するためにのみ使用されます。 このため、［Accounts］オブジェクトに関連するカスタムオブジェクトにのみ関連付けることができます。 詳しくは、[カスタムオブジェクトでシステムアカウントを使う](./using-system-objects-with-custom-objects.md)を参照してください。
```

![オブジェクトフレームワークと統合されたシステムサービスを拡張します。](./extending-system-objects/images/01.png)

システムオブジェクトを拡張する場合、 [フィールド](#adding-fields) 、 [リレーション](#adding-relationships) 、 [操作](#adding-actions) 、 [バリデーション](#adding-validations) を追加できます。

| 機能    | システムオブジェクト | カスタムオブジェクト |
|:----- |:---------- |:---------- |
| 項目    | &#10004;   | &#10004;   |
| 関連    | &#10004;   | &#10004;   |
| レイアウト |            | &#10004;   |
| 操作    | &#10004;   | &#10004;   |
| 閲覧数   |            | &#10004;   |
| 検証    | &#10004;   | &#10004;   |

## フィールドの追加

システムオブジェクトにフィールドを追加することができます。 追加のデータベースカラムは、サービスの元のテーブル名に`_x`を付加したものを使用する別のデータベーステーブルに追加されます（例: `AccountEntry_x`）。 システムオブジェクトは、利用可能なすべてのフィールドタイプ（ [）をサポートしています](./fields.md)。 システムオブジェクトはカスタムレイアウトやビューをサポートしないため、これらのカスタムフィールドにはHeadless APIを介してのみアクセスできます。 詳細については、[オブジェクトへのフィールドの追加](./fields/adding-fields-to-objects.md)を参照してください。

```{note}
Liferayの[カスタムフィールド](../../system-administration/configuring-liferay/adding-custom-fields.md)アプリケーションは、[Expando](../../data-frameworks/expando-framework/accessing-custom-fields-with-expando.md)フレームワークを使ったほとんどのLiferayシステムアプリケーションへのフィールドを追加するためのものです。 オブジェクトはExpandoベースのカスタムフィールドに対応していないため、オブジェクト機能（ [relationships](#adding-relationships) 、 [actions](#adding-actions) および [validations](#adding-validations) など）で使用することはできません。
```

## リレーションシップの追加

システムオブジェクトとカスタムオブジェクトの間にリレーションシップを追加して、その実体をリンクさせることができます。 システムオブジェクトは、1対多と多対多の両方のリレーションシップをサポートしています。 詳細については、[オブジェクトリレーションシップの定義](./relationships/defining-object-relationships.md)を参照してください。

```{important}
システムオブジェクトはカスタム [layouts](./layouts/designing-object-layouts.md) 、 [views](./views/designing-object-views.md) をサポートしていないため、システムオブジェクトのUIにリレーションを追加することはできない。 ヘッドレスAPIを経由してのみ対話が可能です。 
```

### リレーションシップAPI

システムオブジェクトが多対多の関係にある場合、または1対多の関係の親側にある場合、Liferayは関係の問い合わせと管理のために [RESTエンドポイント](../understanding-object-integrations/using-custom-object-apis.md#relationship-rest-apis) を生成します。 これには、関連するオブジェクトのエントリーを返すためのGETエンドポイント、エントリーを関連付けるためのPUTエンドポイント、関連するエントリーの関連付けを解除するためのDELETEエンドポイントが含まれます。

この例では、Userシステムオブジェクトは、カスタムオブジェクト（`timeOffRequest`）と1対多の関係（`userRequests`）になっています。 これらのエンドポイントは、 [`headless-admin-user`](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-user/v1.0/openapi.json) サービスに表示されます。

![Liferayは、リレーションシップを照会・管理するためのRESTエンドポイントを生成します。](./extending-system-objects/images/02.png)

[Relationships REST APIs の使用](../objects-tutorials/using-apis/using-relationship-rest-apis.md) を参照してください。

## アクションの追加

システムオブジェクトにアクションを追加し、エントリーの追加、更新、削除などのイベントをトリガーにすることができます。 下の表は、システムオブジェクトがサポートするアクションを示したものです。

| アクションの種類                                                                      | システムオブジェクトでのサポートの有無 |
|:----------------------------------------------------------------------------- |:------------------- |
| [Webhook](./actions/defining-object-actions.md#webhook)                       | &#10004;            |
| [Groovy スクリプト](./actions/defining-object-actions.md#groovy-script)            | &#10004;            |
| [通知](./actions/defining-object-actions.md#notification)                       | &#10004;            |
| [オブジェクトエントリーを追加](./actions/defining-object-actions.md#add-an-object-entry)    | &#10004;            |
| [オブジェクトエントリーを更新](./actions/defining-object-actions.md#update-an-object-entry) | &#10004;            |

詳しくは、 [オブジェクトアクションの定義](./actions/defining-object-actions.md) をご覧ください。

## バリデーションの追加

Groovyおよびエクスプレッションビルダーの検証機能をシステムオブジェクトに追加できます。 トリガーされると、これらのバリデーションは、フィールドエントリーが有効かどうかを確認し、無効なエントリーに対してはカスタムエラーメッセージを表示します。 現在、オブジェクトはシステムオブジェクトのデフォルトフィールドに対する検証のみをサポートし、そのカスタムフィールドに対する検証はサポートしていません。 詳細は、[カスタムバリデーションの追加](./validations/adding-custom-validations.md)を参照してください。

<!--TASK: Uncomment once supported.
## Additional Configuration Options

When editing a system object, you can also configure the following settings in the *Details* tab.

| Field | Description |
| :--- | :--- |
| Title Field | Determine the field used as the title for object entries. |
| Widget | Determine whether the object's Page widget is available in sites.| -->

## 関連トピック

* [オブジェクトへのフィールドの追加](./fields/adding-fields-to-objects.md)
* [オブジェクトリレーションシップの定義](./relationships/defining-object-relationships.md)
* [オブジェクトアクションの定義](./actions/defining-object-actions.md)
