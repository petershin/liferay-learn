# ワークフローアクションYAML設定リファレンス

`client-extension.yaml` ファイルを使用して、ワークフローアクションのクライアント拡張を定義することができます。

## 使用方法詳細

この `client-extension.yaml` ファイルは、ワークフローアクションと OAuth ユーザーエージェントを定義しています：

```yaml
easy-workflow-action-1:
    name: Easy Workflow Action 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /easy-workflow/action/1
    type: workflowAction

easy-oauth-application-user-agent:
    scopes:
        - Liferay.Headless.Admin.Workflow.everything
    type: oAuthApplicationUserAgent
```

必須の `resourcePath` プロパティは、ワークフローアクションハンドラの場所を定義する。 外部アプリケーション(例えば、Java Spring Bootアプリケーション）としてアクセス可能なワークフローアクションハンドラの実装を指す。 この値は、OAuth2アプリケーションプロファイルの `homePageURL` の値と組み合わされて、完全なURLを形成する。

ワークフローアクションクライアント拡張は、Liferayのワークフローアクションによってトリガーされるリクエストを保護するためにOAuth2アプリケーションプロファイルを必要とします。 上記の例では、このプロファイルに対して、追加の [OAuth ユーザーエージェントクライアント拡張](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md) を定義しており、 `oAuth2ApplicationExternalReferenceCode` プロパティは、そのクライアント拡張の `キー` 値を参照しています。

[サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc) では、ワークフローアクションクライアント拡張の追加を説明しています。

## YAML プロパティ

これらのプロパティは、ワークフローアクションクライアントエクステンションに固有のものです：

| 名前                                       | データ型        | 説明                                                                                            |
|:---------------------------------------- |:----------- |:--------------------------------------------------------------------------------------------- |
| `resourcePath`                           | 文字列(URLの一部） | (必須) ワークフローアクションハンドラへのパスです。 この値は、OAauth2アプリケーションプロファイルの `homePageURL` の値と組み合わされて、完全なURLとなります。 |
| `oAuth2ApplicationExternalReferenceCode` | 文字列         | (必須) リクエストを保護するために必要な、OAuth2アプリケーションプロファイルの外部参照コードです。                                         |

## 追加情報

* [マイクロサービスクライアント拡張機能](../microservice-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
* [オブジェクトアクションYAML設定リファレンス](./object-action-yaml-configuration-reference.md)
