# OAuthユーザーエージェントYAML設定リファレンス

OAuth ユーザーエージェントクライアント拡張は、 `client-extension.yaml` ファイルで定義することができます。

## 使用方法詳細

この `client-extension.yaml` ファイルは、OAuth ユーザーエージェントクライアント拡張を定義しています：

```yaml
xray-oauth-user-agent:
    type: oAuthApplicationUserAgent
```

[ワークスペースの例](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc) には、OAuth ユーザーエージェントクライアント拡張を持つプロジェクトが含まれています。

## YAML プロパティ

これらのプロパティは、OAuthユーザーエージェントクライアントエクステンションに固有のものです：

| 名前            | データ型        | デフォルト値                                           | 説明                                                                                             |
|:------------- |:----------- |:------------------------------------------------ |:---------------------------------------------------------------------------------------------- |
| `description` | 文字列         |                                                  | クライアントエクステンションの説明です。                                                                           |
| `homePageURL` | 文字列(URLの一部） | `https://$[conf:ext.lxc.liferay.com.mainDomain]` | OAuth2アプリケーションプロファイルのリソースサーバーのベースアドレスです。                                                       |
| `name`        | 文字列         | (OAuth2アプリケーションプロファイルから派生）。                      | OAuth2アプリケーションプロファイルの名前です。 | `privacyPolicyURL` | URL | OAuth2アプリケーションプロファイルのプライバシーポリシーのURLです。 |
| `scopes`      | 文字列[]       | []                                               | OAuth2 アプリケーションプロファイルに関連づけられたスコープの配列です。                                                        |

## 追加情報

* [マイクロサービスクライアント拡張機能](../microservice-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
* [OAuth Headless Server YAML 設定リファレンス](./oauth-headless-server-yaml-configuration-reference.md)
