---
toc:
  - ./configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
  - ./configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
---
# クライアント拡張の設定

```{toctree}
:maxdepth: 3

configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
```

{bdg-secondary}`利用可能な Liferay 7.4`

Liferayのインスタンス設定は、クライアント拡張でデプロイ可能です。 例えば、OAuth2認証プロファイルを設定クライアント拡張としてデプロイし、認証を必要とする他のクライアント拡張を有効にできます。

## OAuthヘッドレスサーバークライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

クライアント拡張を使用すると、`Headless Server`クライアントプロファイルで事前に構成されたLiferay OAuth2 アプリケーションを構成することができます。 この種の認証プロファイルは、特定のユーザーによって認証されていないAPI呼び出しに必要です。

`client-extension.yaml`ファイルにOAuthヘッドレスサーバークライアント拡張を指定します。

```yaml
type: oAuthApplicationHeadlessServer
```

## OAuthユーザーエージェントクライアント拡張

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ （オンプレミス）`

クライアント拡張を使用すると、`User Agent Application`クライアントプロファイルで事前に設定された Liferay OAuth2 アプリケーションを構成することができます。 この種の認証プロファイルは、特定のユーザーによって認証されたAPI呼び出し（例えば、他の [マイクロサービスクライアント拡張](./microservice-client-extensions.md)を使用してLiferay APIにREST呼び出しを行うなど）に必要です。

`client-extension.yaml`ファイルにOAuth ユーザーエージェントクライアント拡張を指定します。

```yaml
type: oAuthApplicationUserAgent
```

## 関連トピック

* [クライアント拡張の概要](../client-extensions.md)
* [`client-extension.yaml`でのクライアント拡張の設定](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
