# OAuth Headless Server YAML 設定リファレンス

OAuth ヘッドレスサーバのクライアント拡張は、 `client-extension.yaml` ファイルで定義することができます。

## 使用方法詳細

この `client-extension.yaml` ファイルは、OAuth ヘッドレスサーバのクライアント拡張を定義しています：

```yaml
yoke-oauth-headless-server:
    type: oAuthApplicationHeadlessServer
```

## YAML プロパティ

これらのプロパティは、OAuthヘッドレスサーバークライアントエクステンションに特有のものです：

| 名前                        | データ型        | デフォルト値                                           | 説明                                                                                              |
|:------------------------- |:----------- |:------------------------------------------------ |:----------------------------------------------------------------------------------------------- |
| `description`             | 文字列         |                                                  | クライアントエクステンションの説明です。                                                                            |
| `homePageURL`             | 文字列（URLの一部） | `https://$[conf:ext.lxc.liferay.com.mainDomain]` | OAuth2アプリケーションプロファイルのリソースサーバーのベースアドレスです。                                                        |
| `name`                    | 文字列         | (OAuth2アプリケーションプロファイルから派生）。                      | OAuth2アプリケーションプロファイルの名前です。                                                                      |
| `privacyPolicyURL`        | URL         |                                                  | OAuth2アプリケーションプロファイルのプライバシーポリシーのURLです。                                                          |
| `scopes`                  | 文字列[]       | []                                               | OAuth2 アプリケーションプロファイルに関連づけられたスコープの配列です。                                                         |
| `userAccountEmailAddress` | 文字列         | (デフォルトの管理者ユーザーの電子メールアドレス)                        | このOAuth2アプリケーションプロファイルに関連するユーザーアカウントの電子メールアドレスです。 `userAccountScreenName` プロパティが未定義の場合のみ使用されます。 |
| `userAccountScreenName`   | 文字列         | (デフォルトの管理者ユーザーのスクリーンネーム)                         | OAuth2アプリケーションプロファイルに関連するユーザーアカウントのスクリーンネーム。 これは、 `userAccountEmailAddress`の値をオーバーライドします。       |

## 追加情報

* [マイクロサービスクライアント拡張機能](../microservice-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
* [OAuthユーザーエージェントYAML設定リファレンス](./oauth-user-agent-yaml-configuration-reference.md)
