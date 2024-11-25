---
toc:
  - ./microservice-client-extensions/using-a-microservice-client-extension.md
  - ./microservice-client-extensions/object-action-yaml-configuration-reference.md
  - ./microservice-client-extensions/object-validation-rule-yaml-configuration-reference.md
  - ./microservice-client-extensions/workflow-action-yaml-configuration-reference.md
  - ./microservice-client-extensions/notification-type-yaml-configuration-reference.md
---
# マイクロサービスのクライアント拡張

{bdg-secondary}`liferay DXP 7.4 (self-hosted)`   {bdg-secondary}`Liferay Experience Cloud (SaaS)`   {bdg-unsupported}`Liferay Cloud：セルフマネージド`

マイクロサービスクライアント拡張を定義し、Liferayインスタンスのイベントに応答して独自のコードを実行します。 どのようにコードを実装するかはあなた次第です。好みのパターンやテクノロジーを使ってください。 マイクロサービスのクライアント拡張はLiferayの外部でホストされ、Liferay自体からの合図でトリガーされます。

マイクロサービスのクライアント拡張には、リクエストを適切に処理し、保護されたLiferay APIを呼び出すために、事前に設定された認証プロファイルが必要です。 認証プロファイルを追加するには、同じプロジェクト内にクライアント拡張として含めます（例： [OAuthユーザーエージェントクライアント拡張](./configuration-client-extensions.md#oauth-user-agent-client-extensions) ）。

マイクロサービスのクライアント拡張は、Liferay Experience Cloud内にデプロイされると自動的にホストされます。 Liferayインスタンスをセルフホストする場合、これらのクライアント拡張が使用するマイクロサービスを個別にホストする必要があります。

## オブジェクトアクションのクライアント拡張

オブジェクトアクションのクライアント拡張は、 [オブジェクト定義の](../objects.md) アクションイベントにバインドする外部アクションハンドラーを定義します。 マイクロサービスのハンドラーコードは、オブジェクトのアクションが発生したときに実行されます。

オブジェクトアクションクライアントの拡張子を指定するには、`client-extension.yaml` ファイルの `type` 値を使用する：

```yaml
type: objectAction
```

## オブジェクト検証ルール・クライアント拡張

Object Validation Rule クライアント拡張は、オブジェクト定義に追加できるカスタム [バリデーション](../objects/creating-and-managing-objects/validations.md) を定義します。 これは、オブジェクトのエントリ送信イベントにバインドし、ユーザがエントリを作成または更新するときに実行される外部イベントハンドラを定義することによって動作します。 これらのクライアント拡張機能を作成するとき、有効なフィールド入力を決定するためにいくつでも条件を使うことができますが、それぞれの条件は `validationCriteriaMet` キーを `true` または `false` のどちらかに設定して返さなければなりません。 基本的な例は [`ObjectValidationRule1RestController`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot/src/main/java/com/liferay/sample/ObjectValidationRule1RestController.java) を参照。

このタイプのクライアント拡張機能を使用するには、`client-extension.yaml` ファイルに `objectValidationRule` タイプを追加します：

```yaml
type: objectValidationRule
```

デプロイされると、これらのクライアント拡張は、オブジェクト定義にバリデーションを追加するときのオプションとして表示されます。 詳細は [フィールド検証の追加](../objects/creating-and-managing-objects/validations/adding-field-validations.md) を参照のこと。

![These client extensions appear as options when adding validations to an object definition.](./microservice-client-extensions/images/01.png)

## ワークフローアクションのクライアント拡張

ワークフローアクションクライアント拡張は、 [Liferay ワークフロー](../../process-automation/workflow/introduction-to-workflow.md) からのアクションイベントにバインドする外部ワークフローアクションハンドラを定義します。 マイクロサービスのハンドラーコードは、ワークフローアクションが発生したときに実行されます。

ワークフローアクションのクライアント拡張子を指定するには、`client-extension.yaml` ファイルの `type` 値を使用する：

```yaml
type: workflowAction
```

## 通知タイプのクライアント拡張

通知タイプクライアント拡張は、Liferay の [通知イベント](../../process-automation/notifications.md) にバインドする外部通知ハンドラを定義します。 マイクロサービスのハンドラーコードは、通知イベントが発生したときに実行されます。

通知タイプのクライアント拡張子を指定するには、`client-extension.yaml`ファイルの`type`値を使用します：

```yaml
type: notificationType
```

## 関連トピック

* [クライアント拡張機能の紹介](../client-extensions.md)
* [`client-extension.yaml`でクライアント拡張機能を設定する](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
