---
toc:
  - ./microservice-client-extensions/using-a-microservice-client-extension.md
  - ./microservice-client-extensions/object-action-yaml-configuration-reference.md
  - ./microservice-client-extensions/workflow-action-yaml-configuration-reference.md
  - ./microservice-client-extensions/notification-type-yaml-configuration-reference.md
---
# マイクロサービスのクライアント拡張

{bdg-secondary}`7.4 U45+/GA45+`

マイクロサービスクライアント拡張を定義し、Liferayインスタンスのイベントに応答して独自のコードを実行します。 どのようにコードを実装するかはあなた次第です。好みのパターンやテクノロジーを使ってください。 マイクロサービスのクライアント拡張はLiferayの外部でホストされ、Liferay自体からの合図でトリガーされます。

マイクロサービスのクライアント拡張には、リクエストを適切に処理し、保護されたLiferay APIを呼び出すために、事前に設定された認証プロファイルが必要です。 認証プロファイルは、同じプロジェクト内にクライアント拡張として含めることで追加できます（例： [OAuthユーザーエージェントクライアント拡張](./configuration-client-extensions.md#oauth-user-agent-client-extensions) ）。

マイクロサービスのクライアント拡張は、Liferay Experience Cloud内にデプロイされると自動的にホストされます。 Liferayインスタンスをセルフホストする場合、これらのクライアント拡張が使用するマイクロサービスを個別にホストする必要があります。

## オブジェクトアクションのクライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

オブジェクトアクションのクライアント拡張は、[オブジェクト定義の](../objects.md) アクションイベントにバインドする外部アクションハンドラーを定義します。 マイクロサービスのハンドラーコードは、オブジェクトのアクションが発生したときに実行されます。

`client-extension.yaml`ファイルで `type`値を使用して、オブジェクトアクションのクライアント拡張を指定します。

```yaml
type: objectAction
```

## ワークフローアクションのクライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

ワークフローアクションのクライアント拡張は、[Liferayワークフロー](../../process-automation/workflow/introduction-to-workflow.md)からのアクションイベントにバインドする外部ワークフローアクションハンドラーを定義します。 マイクロサービスのハンドラーコードは、ワークフローアクションが発生したときに実行されます。

`client-extension.yaml`ファイルで `type`値を使用して、ワークフローアクションのクライアント拡張を指定します。

```yaml
type: workflowAction
```

## 通知タイプのクライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

通知タイプクライアント拡張は、Liferayの[通知イベント](../../process-automation/notifications.md)にバインドする外部通知ハンドラーを定義します。 マイクロサービスのハンドラーコードは、通知イベントが発生したときに実行されます。

`client-extension.yaml`ファイルで `type`値を使用して、通知タイプのクライアント拡張を指定します。

```yaml
type: notificationType
```

## 関連トピック

* [クライアント拡張の概要](../client-extensions.md)
* [`client-extension.yaml`でのクライアント拡張の設定](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
