---
toc:
  - ./configuration-client-extensions/instance-settings-yaml-configuration-reference.md
  - ./configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
  - ./configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
---
# クライアント拡張の設定

{bdg-secondary}`liferay DXP 7.4 (self-hosted)`   {bdg-secondary}`Liferay Experience Cloud (SaaS)`   {bdg-unsupported}`Liferay Cloud：セルフマネージド`

Liferayのインスタンス設定は、クライアント拡張でデプロイ可能です。 例えば、OAuth2認証プロファイルを設定クライアント拡張としてデプロイし、認証を必要とする他のクライアント拡張を有効にできます。

## インスタンス設定 クライアント拡張機能

{bdg-secondary}`利用可能な Liferay DXP 7.4 (セルフホスト)`  {bdg-secondary}`利用可能な Liferay Experience Cloud (SaaS)`

インスタンス設定クライアントエクステンションを使って、Liferayの様々な設定を行うことができます。 各コンフィギュレーションはPID（Persistent IDentity）によって参照される。

`client-extension.yaml`ファイルにインスタンス設定のクライアント拡張子を指定する：

```yaml
type: instanceSettings
```

## OAuthヘッドレスサーバークライアント拡張

クライアントエクステンションを使って、`Headless Server` クライアントプロファイルで事前に設定された Liferay OAuth2 アプリケーションを設定することができます。 この種の認証プロファイルは、特定のユーザーによって認証されていないAPI呼び出しに必要です。

`client-extension.yaml`ファイルにOAuthヘッドレスサーバークライアントの拡張子を指定します：

```yaml
type: oAuthApplicationHeadlessServer
```

### `oAuthApplicationHeadlessServer`の特別な動作

OAuthヘッドレスサーバクライアントの拡張は、Liferayが_ルート_として提供するメタデータに依存します（ [Context-Sensitive Information](working-with-client-extensions.md#context-sensitive-information) を参照してください）。 このクライアントエクステンションでデプロイされた実行可能ワークロードは、実行する前にこのルートを待たなければならない。

以下は、`oAuthApplicationHeadlessServer` クライアント拡張がプロジェクトで定義されている場合に、環境変数 `LIFERAY_ROUTES_CLIENT_EXTENSION` で定義されるルートの例である：

```bash
.
# The authorization URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.authorization.uri
# The audience of the OAuth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.audience
# The client ID of the OAuth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.client.id
# The client secret of the OAuth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.client.secret
# The scopes of the OAuth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.scopes
# The introspection URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.introspection.uri
# The JWKS (JSON Web Keys Set) URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.jwks.uri
# The token URI of the DXP virtual instance (no protocol, domain or port)
└── <oAuth2ApplicationExternalReferenceCode>.oauth2.token.uri
```

`oAuthApplicationHeadlessServer` クライアント拡張を使用して Liferay DXP と通信するアプリケーションロジックは、このルートメタデータによって提供される情報を使用して、送信データを保護する必要があります。 必要なOAuth 2メタデータはすべてこの方法で提供されるので、ハードコーディングする必要はない。

## OAuthユーザーエージェントクライアント拡張

クライアントエクステンションを使用して、`User Agent Application` クライアントプロファイルで事前に設定された Liferay OAuth2 アプリケーションを設定することができます。 この種の認証プロファイルは、特定のユーザーによって認証されたAPI呼び出し（例えば、他の [マイクロサービスクライアント拡張](./microservice-client-extensions.md) を使用してLiferay APIにREST呼び出しを行うなど）に必要です。

`client-extension.yaml`ファイルにOAuthユーザーエージェントクライアント拡張子を指定します：

```yaml
type: oAuthApplicationUserAgent
```

### `oAuthApplicationUserAgent` の特別な動作

OAuth ヘッドレスユーザエージェントクライアントの拡張は、Liferay が _ルート_ として提供するメタデータに依存します（ [Context-Sensitive Information](working-with-client-extensions.md#context-sensitive-information) を参照してください）。 このクライアントエクステンションでデプロイされた実行可能ワークロードは、実行する前にこのルートを待たなければならない。

以下は、`oAuthApplicationUserAgent` クライアント拡張がプロジェクトで定義されている場合に、環境変数 `LIFERAY_ROUTES_CLIENT_EXTENSION` で定義されるルートの例である：

```bash
.
# The authorization URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.authorization.uri
# The introspection URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.introspection.uri
# The JWKS (JSON Web Keys Set) URI of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.jwks.uri
# Newline separated redirect URIs of the DXP virtual instance
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.redirect.uris
# The token URI of the DXP virtual instance
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.token.uri (no protocol, domain or port)
# The audience of the OAuth user agent application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.user.agent.audience
# The client ID of the OAuth user agent application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.user.agent.client.id
# The scopes of the OAuth user agent application
└── <oAuth2ApplicationExternalReferenceCode>.oauth2.user.agent.scopes
```

`oAuthApplicationUserAgent` クライアント拡張を使用して Liferay DXP と通信するアプリケーションロジックは、このルートメタデータが提供する情報を使用して、送信データを保護する必要があります。 必要なOAuth 2メタデータはすべてこの方法で提供されるので、ハードコーディングする必要はない。

## 関連トピック

* [クライアント拡張機能の紹介](../client-extensions.md) 
* [`client-extension.yaml`でクライアント拡張機能を設定する](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
