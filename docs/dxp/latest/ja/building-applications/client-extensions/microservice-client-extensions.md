---
toc:
- ./microservice-client-extensions/object-action-yaml-configuration-reference.md
- ./microservice-client-extensions/workflow-action-yaml-configuration-reference.md
- ./microservice-client-extensions/notification-type-yaml-configuration-reference.md
---
# マイクロサービスクライアント拡張機能

```{toctree}
:maxdepth: 3

microservice-client-extensions/object-action-yaml-configuration-reference.md
microservice-client-extensions/workflow-action-yaml-configuration-reference.md
microservice-client-extensions/notification-type-yaml-configuration-reference.md
```

{bdg-secondary}`7.4 U45+/GA45+`

マイクロサービスクライアント拡張を定義し、Liferayインスタンスのイベントに応答して独自のコードを実行します。 どのようにコードを実装するかはあなた次第です。あなたが好きなパターンやテクノロジーを使ってください。 マイクロサービスのクライアント拡張はLiferayの外でホストされ、Liferay自体からの合図でトリガーされます。

マイクロサービスクライアント拡張は、リクエストを適切に処理し、保護されたLiferay APIを呼び出すために、事前に設定された認証プロファイルを必要とします。 認証プロファイルは、同じプロジェクト内にクライアント拡張として含めることで追加できます(例： [OAuthユーザーエージェントクライアント拡張](./configuration-client-extensions.md#oauth-user-agent-client-extensions)）。

マイクロサービスのクライアント拡張は、Liferay Experience Cloud内にデプロイされると自動的にホストされます。 Liferayインスタンスをセルフホストする場合、これらのクライアントエクステンションが使用するマイクロサービスを個別にホストする必要があります。

## オブジェクトアクションクライアント拡張機能

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

オブジェクトアクションクライアント拡張は、 [オブジェクト定義の](../objects.md) アクションイベントにバインドする外部アクションハンドラを定義します。 マイクロサービスのハンドラーコードは、オブジェクトのアクションが発生したときに実行されます。

`client-extension.yaml` ファイルで `type` value を使用して、オブジェクトアクションクライアント拡張を指定します：

```yaml
type: objectAction
```

## ワークフローアクションクライアント拡張機能

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

Workflow action client extensions は、 [Liferay workflow](../../process-automation/workflow/introduction-to-workflow.md)からのアクションイベントにバインドする外部ワークフローアクションハンドラーを定義します。 ワークフローのアクションが発生すると、マイクロサービスのハンドラーコードが実行されます。

`client-extension.yaml` ファイルで `type` value を使用して、ワークフロー アクションのクライアント拡張を指定します：

```yaml
type: workflowAction
```

## 通知型クライアント拡張機能

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

Notification type client extensions は、Liferay の [通知イベント](../../process-automation/notifications.md) にバインドする外部通知ハンドラを定義します。 通知イベントが発生すると、マイクロサービスのハンドラーコードが実行されます。

`client-extension.yaml` ファイルで `type` value を使用して、通知タイプのクライアント拡張を指定します：

```yaml
type: notificationType
```

## 追加情報

* [クライアントエクステンションの紹介](../client-extensions.md)
* [`client-extension.yaml`でクライアント拡張機能を設定する。](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
