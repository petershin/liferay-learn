# OAuth ユーザーエージェント YAML 設定リファレンス

OAuth ユーザーエージェントクライアント拡張は、 `client-extension.yaml` ファイルで定義できます。

## 使用法の詳細

この `client-extension.yaml` ファイルは、OAuth ユーザーエージェントクライアント拡張を定義します：

```yaml
xray-oauth-user-agent:
    type: oAuthApplicationUserAgent
```

[サンプル・ワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) には、OAuth ユーザー・エージェント・クライアント拡張を持つプロジェクトが含まれています。

## YAML プロパティ

これらのプロパティはOAuthユーザーエージェントクライアント拡張に固有のものです：

| 名前                 | データ型        | デフォルト値                                           | 説明                                      |
|:------------------ |:----------- |:------------------------------------------------ |:--------------------------------------- |
| `description`      | 文字列         |                                                  | クライアント拡張の説明                             |
| `homePageURL`      | 文字列（URLの一部） | `https://$[conf:ext.lxc.liferay.com.mainDomain]` | OAuth2 アプリケーションプロファイルのリソースサーバーのベースアドレス。 |
| `name`             | 文字列         | (OAuth2アプリケーション・プロファイルから派生）。                     | OAuth2 アプリケーションプロファイルの名前。               |
| `privacyPolicyURL` | URL         |                                                  | OAuth2 アプリケーションプロファイルのプライバシーポリシーの URL。  |
| `scopes`           | 文字列[]       | []                                               | OAuth2 アプリケーションプロファイルに関連付けられたスコープの配列。   |

## 関連トピック

* [マイクロサービスのクライアント拡張](../microservice-client-extensions.md)
* [クライアント拡張との連携](../working-with-client-extensions.md)
* [OAuth ヘッドレスサーバー YAML 設定リファレンス](./oauth-headless-server-yaml-configuration-reference.md)
