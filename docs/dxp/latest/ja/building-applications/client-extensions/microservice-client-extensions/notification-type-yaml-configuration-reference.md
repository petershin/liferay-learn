# 通知タイプ YAML 設定リファレンス

`client-extension.yaml` ファイルで通知タイプクライアント拡張を定義できます。

## 使用法の詳細

この `client-extension.yaml` ファイルは、通知タイプとOAuthユーザーエージェントを定義する：

```yaml
zebra-notification-type:
    oAuth2ApplicationExternalReferenceCode: zebra-oauth-user-agent
    resourcePath: /zebra/notification
    type: notificationType

zebra-oauth-user-agent:
    type: oAuthApplicationUserAgent
```

必須の `resourcePath` プロパティは、通知ハンドラの場所を定義します。 外部アプリケーションとしてアクセス可能な通知ハンドラ実装を指す。 この値は、OAuth2 アプリケーションプロファイルの `homePageURL` 値と組み合わされて、完全な URL を形成します。

通知タイプのクライアント拡張は、Liferayの通知によって引き起こされるリクエストを保護するためにOAuth2アプリケーションプロファイルを必要とします。 上記の例では、このプロファイルに対して、追加の [OAuth ユーザーエージェントクライアント拡張](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md) を定義しており、 `oAuth2ApplicationExternalReferenceCode` プロパティは、その `キー` 値を参照しています。

[サンプル・ワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) は、通知タイプ・クライアント拡張の追加を示しています。

## YAML プロパティ

これらのプロパティは、通知タイプのクライアント拡張に固有のものです：

| 名前                                       | データ型        | 説明                                                                                 |
|:---------------------------------------- |:----------- |:---------------------------------------------------------------------------------- |
| `resourcePath`                           | 文字列（URLの一部） | (必須) 通知ハンドラへのパス。 この値は、OAauth2アプリケーションプロファイルの `homePageURL` の値と組み合わされて、完全なURLとなります。 |
| `oAuth2ApplicationExternalReferenceCode` | 文字列         | (必須) リクエストを保護するために必要な、OAuth2アプリケーションプロファイルの外部参照コード。                                |

## 関連トピック

* [マイクロサービスのクライアント拡張](../microservice-client-extensions.md)
* [クライアント拡張との連携](../working-with-client-extensions.md)
