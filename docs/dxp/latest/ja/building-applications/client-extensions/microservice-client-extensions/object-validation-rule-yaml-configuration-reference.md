# オブジェクト検証ルール YAML 設定リファレンス

Object Validation Rule クライアント拡張を定義するには、`objectValidationRule` タイプを `client-extension.yaml` ファイルに追加します。

## 使用法の詳細

この `client-extension.yaml` の例では、検証ルールと OAuth ユーザーエージェントを定義している：

```yaml
easy-object-validation-rule-1:
    name: Easy Object Validation Rule 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /object/validation/rule/1
    type: objectValidationRule

easy-oauth-application-user-agent:
    type: oAuthApplicationUserAgent
```

必須の `resourcePath` プロパティはオブジェクト検証ルールハンドラの場所を定義する。 外部アプリケーション（例えばJava Spring Bootアプリケーション）としてアクセス可能な、オブジェクト検証ルールハンドラの実装を指定します。 この値は、関連する OAuth2 アプリケーションプロファイルの `homePageURL` の値と組み合わされ、完全な URL となる。

Object Validation Ruleクライアント拡張は、Liferayでトリガーするリクエストを保護するためにOAuth2アプリケーションプロファイルを必要とします。 `client-extension.yaml` はこのプロファイルのための追加の [OAuth ユーザーエージェントクライアント拡張](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md) を定義し、`oAuth2ApplicationExternalReferenceCode` プロパティはそのクライアント拡張の `key` 値を参照する。

[サンプルワークスペース](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) は、Spring BootアプリケーションでObject Validation Ruleクライアント拡張を使用する方法を示しています。

## クライアント拡張の範囲の制限

デフォルトでは、オブジェクト検証ルールのクライアント拡張は、すべてのLiferayインスタンスのすべてのオブジェクト定義で利用可能です。

オブジェクト定義によってアクセスを制限するには、`allowedObjectDefinitionNames` プロパティを、バリデーションを使用できるオブジェクトのリストとともに追加します：

```yaml
easy-object-validation-rule-1:
    allowedObjectDefinitionNames:
        - C_EasyObject
        - User
```

この例では、`easy-object-validation-rule-1` は、 [`C_EasyObject` と `User` オブジェクトに対して](../../objects/creating-and-managing-objects/validations.md) バリデーションを定義するときにのみ、オプションとして表示されます。

インスタンスごとにアクセスを制限するには、`dxp.lxc.liferay.com.virtualInstanceId` プロパティに必要な仮想インスタンスの ID を追加します：

```yaml
easy-object-validation-rule-1:
    allowedObjectDefinitionNames:
        - C_EasyObject
        - User
    dxp.lxc.liferay.com.virtualInstanceId: easy-virtual-host-1.com
```

この例では、`easy-object-validation-rule-1` は `easy-virtual-host-1.com` インスタンスの `C_EasyObject` と `User` オブジェクトのオプションとしてのみ表示されます。

## YAML プロパティ

これらのプロパティは、オブジェクト検証ルールのクライアント拡張に固有のものです：

| 名前                                       | データ型        | 説明                                                                                                                     |
| :--------------------------------------- | :---------- | :--------------------------------------------------------------------------------------------------------------------- |
| `allowedObjectDefinitionNames`           | リスト         | 指定したオブジェクト定義 (`C_EasyObject` や `User` など) にクライアント拡張をスコープする。                                         |
| `dxp.lxc.liferay.com.virtualInstanceId`  | 文字列         | クライアントエクステンションを、その ID を使って指定した仮想インスタンスにスコープします（例 `easy-virtual-host-1.com`）。                                           |
| `resourcePath`                           | 文字列（URLの一部） | (必須） Object Validation Rule ハンドラへのパス。 この値はOAauth2アプリケーションプロファイルの `homePageURL` の値と組み合わされ、完全なURLとなる。 |
| `oAuth2ApplicationExternalReferenceCode` | 文字列         | (必須) リクエストを保護するために必要な、OAuth2アプリケーションプロファイルの外部参照コード。                                                 |

## 関連トピック

* [マイクロサービス・クライアント拡張](../microservice-client-extensions.md)
* [クライアント・エクステンションの操作](../working-with-client-extensions.md)
* [バリデーション](./workflow-action-yaml-configuration-reference.md)
