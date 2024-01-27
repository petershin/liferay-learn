# システムオブジェクトの拡張

{bdg-secondary}`liferay 7.4 U86+/GA86+`.

Liferay Objectを使用すると、サポートされているシステムサービスを拡張することができます。 現在、これらのサービスだけがオブジェクトズ・フレームワークと統合されている：

* アカウント
* コマース注文
* コマース製品
* コマース製品グループ
* 組織
* 住所
* ユーザー

```{note}
Postal Address オブジェクトは口座の住所を保存する。 このため、［Accounts］オブジェクトに関連するカスタムオブジェクトにのみ関連付けることができます。 詳細については、 [Using System Accounts with Custom Objects](./using-system-objects-with-custom-objects.md) を参照してください。
```

![Extend system services integrated with the Objects Framework.](./extending-system-objects/images/01.png)

システム・オブジェクトを拡張する際、 [フィールド](#adding-fields) 、 [リレーション](#adding-relationships) 、 [アクション](#adding-actions) 、 [バリデーション](#adding-validations) を追加することができる。

| 機能    | システムオブジェクト | カスタムオブジェクト |
| :---- | :--------- | :--------- |
| 項目    | &#10004;;   | &#10004;   |
| 関連    | &#10004;   | &#10004;   |
| レイアウト |            | &#10004;   |
| 操作    | &#10004;   | &#10004;   |
| 閲覧数   |            | &#10004;   |
| 検証    | &#10004;   | &#10004;   |

## フィールドの追加

システムオブジェクトにフィールドを追加することができます。 追加のデータベースカラムは、サービスの元のテーブル名に `_x` を付加した別のデータベーステーブルに追加されます（例：`AccountEntry_x`）。 システム・オブジェクトは、利用可能なすべての [フィールド・タイプをサポートしている](./fields.md) 。 システムオブジェクトはカスタムレイアウトやビューをサポートしないため、これらのカスタムフィールドにはHeadless APIを介してのみアクセスできます。 詳しくは [オブジェクトへのフィールドの追加](./fields/adding-fields-to-objects.md) を参照。

```{note}
Liferay の [Custom Fields](../../../system-administration/configuring-liferay/adding-custom-fields.md) アプリケーションは、 [Expando](../../data-frameworks/expando-framework/accessing-custom-fields-with-expando.md) フレームワークを使用して、ほとんどの Liferay システムアプリケーションにフィールドを追加するためのものです。 ObjectsはExpandoベースのカスタムフィールドをサポートしていないため、Objectsの機能（例： [リレーションシップ](#adding-relationships) 、 [アクション](#adding-actions) 、 [バリデーション](#adding-validations) ）では使用できません。
```

## リレーションシップの追加

システム・オブジェクトとカスタム・オブジェクトの間にリレーションシップを追加して、それらのエンティティをリンクすることができます。 システムオブジェクトは、1対多と多対多の両方のリレーションシップをサポートしています。 詳しくは [オブジェクト関係の定義](./relationships/defining-object-relationships.md) を参照。

```{important}
システム・オブジェクトはカスタム [レイアウト](./layouts/designing-object-layouts.md) と [ビュー](./views/designing-object-views.md) をサポートしていないため、システム・オブジェクトのUIにリレーションシップを追加することはできません。 ヘッドレスAPIを介してのみ、それらのAPIと対話することができる。 
```

### リレーションシップAPI

システムオブジェクトが多対多のリレーションシップにある場合、または1対多のリレーションシップの親側にある場合、Liferayはリレーションシップのクエリと管理のために [RESTエンドポイント](../understanding-object-integrations/using-custom-object-apis.md#relationship-rest-apis) を生成します。 これには、関連するオブジェクトのエントリーを返すためのGETエンドポイント、エントリーを関連付けるためのPUTエンドポイント、および関連するエントリーの関連付けを解除するためのDELETEエンドポイントが含まれる。

この例では、User システムオブジェクトは、カスタムオブジェクト (`timeOffRequest`) と一対多のリレーションシップ (`userRequests`) にあります。 これらのエンドポイントは [`headless-admin-user`](http://localhost:8080/o/api?endpoint=http://localhost:8080/o/headless-admin-user/v1.0/openapi.json) サービスに表示される。

![Liferay generates REST endpoints for querying and managing the relationship.](./extending-system-objects/images/02.png)

入門チュートリアルについては [Using Relationships REST API](../understanding-object-integrations/using-custom-object-apis.md#using-relationship-rest-apis) を参照。

## アクションの追加

システムオブジェクトにアクションを追加し、エントリーの追加、更新、削除などのイベントをトリガーすることができます。 下の表は、システムオブジェクトがサポートするアクションを示したものです。

| アクションの種類                                                                                  | システムオブジェクトでのサポートの有無 |
| :---------------------------------------------------------------------------------------- | :------------------ |
| [ウェブフック](./actions/defining-object-actions.md#webhook)                         | &#10004;            |
| [グルービー・スクリプト](./actions/defining-object-actions.md#groovy-script)              | &#10004;            |
| [通知](./actions/defining-object-actions.md#notification)                        | &#10004;            |
| [オブジェクト・エントリーの追加](./actions/defining-object-actions.md#add-an-object-entry)    | &#10004;            |
| [オブジェクト・エントリーの更新](./actions/defining-object-actions.md#update-an-object-entry) | &#10004;            |

詳しくは [Defining Object Actions](./actions/defining-object-actions.md) を参照してください。

## バリデーションの追加

Groovyおよびエクスプレッションビルダーの検証機能をシステムオブジェクトに追加できます。 トリガーされると、これらのバリデーションは、フィールドエントリーが有効かどうかを確認し、無効なエントリーに対してはカスタムエラーメッセージを表示します。 現在、オブジェクトはシステムオブジェクトのデフォルトフィールドに対する検証のみをサポートし、そのカスタムフィールドに対する検証はサポートしていません。 詳細は [フィールド検証の追加](./validations/adding-field-validations.md) を参照。

## 追加設定オプション

システム・オブジェクトを編集する際、_Details_ タブで以下の設定を行うこともできます。

| 項目                | 説明                                   | システムオブジェクトでのサポートの有無 |
| :---------------- | :----------------------------------- | ------------------- |
| タイトルフィールド         | オブジェクトエントリーのタイトルとして使用されるフィールドを決定する。  | &#10004;            |
| パネルリンク            | アプリケーションがUIのどこに表示されるかを決定する。          | &#10006            |
| ページビルダーのウィジェット    | オブジェクトのページ・ウィジェットがサイトで利用可能かどうかを判断する。 | &#10006            |
| オブジェクト・エントリーの分類   | オブジェクトエントリに分類ツールが使用可能かどうかを判断する。      | &#10006            |
| ページビルダーのコメント      | ユーザがオブジェクトエントリにコメントを追加できるかどうかを決定する。  | &#10006            |
| 監査フレームワークのエントリー履歴 | オブジェクトイベントが監査履歴に表示されるかどうかを決定する。      | &#10006            |

## 関連トピック

* [オブジェクトへのフィールドの追加](./fields/adding-fields-to-objects.md)
* [オブジェクトの関係の定義](./relationships/defining-object-relationships.md)
* [オブジェクト・アクションの定義](./actions/defining-object-actions.md)
