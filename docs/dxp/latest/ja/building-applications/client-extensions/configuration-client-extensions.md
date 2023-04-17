---
toc:
- ./configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
- ./configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
---
# コンフィギュレーション・クライアント拡張機能

```{toctree}
:maxdepth: 3

configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
```

{bdg-secondary}`7.4 U45+/GA45+`

Liferayのインスタンス構成は、クライアントエクステンションでデプロイ可能です。 例えば、OAuth2認証プロファイルをクライアント拡張設定として導入し、認証を必要とする他のクライアント拡張を有効にすることができます。

## OAuthヘッドレスサーバ・クライアント拡張機能

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

クライアントエクステンションを使用すると、 `Headless Server` クライアントプロファイルで事前に構成された Liferay OAuth2 アプリケーションを構成することができます。 この種の認証プロファイルは、特定のユーザーによって許可されていないAPI呼び出しに必要です。

`client-extension.yaml` ファイルに OAuth headless server client extension を指定します：

```yaml
type: oAuthApplicationHeadlessServer
```

## OAuthユーザーエージェントクライアント拡張機能

{bdg-secondary}`Liferay Experience Cloud、Liferay DXP 7.4+ (オンプレミス）`

クライアントエクステンションを使用すると、 `User Agent Application` クライアントプロファイルで事前に設定された Liferay OAuth2 アプリケーションを構成することができます。 この種の認証プロファイルは、特定のユーザーによって許可されたAPIコール(例えば、他の [マイクロサービスクライアント拡張](./microservice-client-extensions.md)を使用してLiferay APIにRESTコールを行うなど）に必要です。

`client-extension.yaml` ファイルに OAuth ユーザーエージェントクライアント拡張を指定します：

```yaml
type: oAuthApplicationUserAgent
```

## 追加情報

* [クライアントエクステンションの紹介](../client-extensions.md)
* [`client-extension.yaml`でクライアント拡張機能を設定する。](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
