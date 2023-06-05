# 通知タイプ YAML 設定リファレンス

`client-extension.yaml` ファイルで通知型クライアント拡張を定義することができます。

## 使用方法詳細

この `client-extension.yaml` ファイルは、通知タイプおよび OAuth ユーザーエージェントを定義しています：

```yaml
zebra-notification-type:
    oAuth2ApplicationExternalReferenceCode: zebra-oauth-user-agent
    resourcePath: /zebra/notification
    type: notificationType

zebra-oauth-user-agent:
    type: oAuthApplicationUserAgent
```

必須の `resourcePath` プロパティは、通知ハンドラの場所を定義する。 外部アプリケーションとしてアクセス可能な通知ハンドラ実装を指す。 この値は、OAuth2アプリケーションプロファイルの `homePageURL` の値と組み合わされて、完全なURLを形成する。

通知型クライアント拡張は、Liferayの通知によって引き起こされるリクエストを保護するためにOAuth2アプリケーションプロファイルを必要とします。 上記の例では、このプロファイルに対して、追加の [OAuth ユーザーエージェントクライアント拡張](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md) を定義しており、 `oAuth2ApplicationExternalReferenceCode` プロパティはその `キー` 値を参照する。

[サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc) では、通知型クライアント拡張の追加を実演しています。

## YAML プロパティ

これらのプロパティは、通知型クライアント拡張に特有のものです：

| 名前                                       | データ型        | 説明                                                                                   |
|:---------------------------------------- |:----------- |:------------------------------------------------------------------------------------ |
| `resourcePath`                           | 文字列（URLの一部） | (必須) 通知ハンドラへのパスです。 この値は、OAauth2アプリケーションプロファイルの `homePageURL` の値と組み合わされて、完全なURLとなります。 |
| `oAuth2ApplicationExternalReferenceCode` | 文字列         | (必須) リクエストを保護するために必要な、OAuth2アプリケーションプロファイルの外部参照コードです。                                |

## 関連トピック

* [マイクロサービスクライアント拡張機能](../microservice-client-extensions.md)
* [クライアントエクステンションの操作](../working-with-client-extensions.md)
