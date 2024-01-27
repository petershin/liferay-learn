# オブジェクトアクションYAML設定リファレンス

オブジェクトアクションクライアント拡張は `client-extension.yaml` ファイルで定義できる。

## 使用法の詳細

この `client-extension.yaml` はオブジェクトアクションと OAuth ユーザーエージェントを定義する：

```yaml
easy-object-action-1:
    name: Easy Object Action 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /easy-object/action/1
    type: objectAction

easy-oauth-application-user-agent:
    type: oAuthApplicationUserAgent
```

必須の `resourcePath` プロパティはオブジェクトアクションハンドラの場所を定義する。 外部アプリケーション（Java Spring Bootアプリケーションなど）としてアクセス可能なオブジェクトアクションハンドラーの実装を指します。 この値は、関連する OAuth2 アプリケーションプロファイルの `homePageURL` の値と組み合わされ、完全な URL となる。

オブジェクトアクションクライアント拡張は、Liferayのオブジェクトアクションによって引き起こされるリクエストを保護するためにOAuth2アプリケーションプロファイルを必要とします。 `client-extension.yaml` はこのプロファイルのための追加の [OAuth ユーザーエージェントクライアント拡張](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md) を定義し、`oAuth2ApplicationExternalReferenceCode` プロパティはそのクライアント拡張の `key` 値を参照する。

[サンプル・ワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) は、オブジェクト・アクション・クライアント拡張の追加を示します。

## クライアント拡張の範囲の制限

デフォルトでは、オブジェクトアクションクライアント拡張は、すべてのLiferayインスタンスのすべてのオブジェクト定義で利用可能です。

オブジェクト定義でアクセスを制限するには、アクションを使用できるオブジェクトのリストとともに `allowedObjectDefinitionNames` プロパティを追加します：

```yaml
easy-object-action-1:
    allowedObjectDefinitionNames:
        - C_EasyObject
        - User
```

この例では、`easy-object-action-1` は、 [`C_EasyObject` と `User` オブジェクトに対して](../../objects/creating-and-managing-objects/actions.md) アクションを定義するときにのみ、オプションとして表示されます。

インスタンスごとにアクセスを制限するには、`dxp.lxc.liferay.com.virtualInstanceId` プロパティに必要な仮想インスタンスの ID を追加します：

```yaml
easy-object-action-1:
    allowedObjectDefinitionNames:
        - C_EasyObject
        - User
    dxp.lxc.liferay.com.virtualInstanceId: easy-virtual-host-1.com
```

この例では、`easy-object-action-1` は `easy-virtual-host-1.com` インスタンスの `C_EasyObject` と `User` オブジェクトのオプションとしてのみ表示されます。

## YAML プロパティ

これらのプロパティは、オブジェクトアクションクライアントエクステンションに固有のものです。

| 名前                                       | データ型        | 説明                                                                                                         |
| :--------------------------------------- | :---------- | :--------------------------------------------------------------------------------------------------------- |
| `allowedObjectDefinitionNames`           | リスト         | 指定したオブジェクト定義 (`C_EasyObject` や `User` など) にクライアント拡張をスコープする。                             |
| `dxp.lxc.liferay.com.virtualInstanceId`  | 文字列         | クライアントエクステンションを、その ID を使って指定した仮想インスタンスにスコープします（例 `easy-virtual-host-1.com`）。                               |
| `resourcePath`                           | 文字列（URLの一部） | (必須) オブジェクトアクションハンドラーへのパス この値はOAauth2アプリケーションプロファイルの `homePageURL` の値と組み合わされ、完全なURLとなる。 |
| `oAuth2ApplicationExternalReferenceCode` | 文字列         | (必須) リクエストを保護するために必要な、OAuth2アプリケーションプロファイルの外部参照コード。                                     |

## 関連トピック

* [マイクロサービス・クライアント拡張](../microservice-client-extensions.md)
* [クライアント・エクステンションの操作](../working-with-client-extensions.md)
* [ワークフロー・アクション YAML 構成リファレンス](./workflow-action-yaml-configuration-reference.md)
