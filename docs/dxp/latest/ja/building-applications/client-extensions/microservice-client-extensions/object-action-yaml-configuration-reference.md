# オブジェクトアクションYAML設定リファレンス

`client-extension.yaml` ファイルでオブジェクトアクションクライアント拡張を定義することができます。

## 使用法の詳細

この `client-extension.yaml` は、オブジェクトアクションと OAuth ユーザーエージェントを定義しています：

```yaml
easy-object-action-1:
    name: Easy Object Action 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /easy-object/action/1
    type: objectAction

easy-oauth-application-user-agent:
    type: oAuthApplicationUserAgent
```

必須の `resourcePath` プロパティは、オブジェクトアクションハンドラーの場所を定義します。 外部アプリケーション（Java Spring Bootアプリケーションなど）としてアクセス可能なオブジェクトアクションハンドラーの実装を指します。 この値は、関連する OAuth2 アプリケーションプロファイルの `homePageURL` 値と組み合わされて、完全な URL を形成します。

オブジェクトアクションクライアント拡張は、Liferayのオブジェクトアクションによって引き起こされるリクエストを保護するためにOAuth2アプリケーションプロファイルを必要とします。 `client-extension.yaml`は、このプロファイルのための追加の[OAuth ユーザーエージェントクライアント拡張](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md)を定義し、`oAuth2ApplicationExternalReferenceCode`プロパティは、そのクライアント拡張の `key`値を参照します。

[サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) では、オブジェクトアクションクライアント拡張の追加を示しています。

## YAML プロパティ

これらのプロパティは、オブジェクトアクションクライアントエクステンションに固有のものです。

| 名前                                       | データ型        | 説明                                                                                          |
|:---------------------------------------- |:----------- |:------------------------------------------------------------------------------------------- |
| `resourcePath`                           | 文字列（URLの一部） | (必須) オブジェクトアクションハンドラーへのパス この値は、OAauth2アプリケーションプロファイルの `homePageURL` の値と組み合わされて、完全なURLとなります。 |
| `oAuth2ApplicationExternalReferenceCode` | 文字列         | (必須) リクエストを保護するために必要な、OAuth2アプリケーションプロファイルの外部参照コード。                                         |

## 関連トピック

* [マイクロサービスのクライアント拡張](../microservice-client-extensions.md)
* [クライアント拡張との連携](../working-with-client-extensions.md)
* [ワークフローアクションYAML設定リファレンス](./workflow-action-yaml-configuration-reference.md)
