---
toc:
  - ./configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
  - ./configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
---
# 構成 クライアント拡張

{bdg-secondary}`Liferay DXP 7.4 (self-hosted)` 
{bdg-secondary}`Liferay Experience Cloud (SaaS)` 
{bdg-unsupported}`Liferay Cloud： セルフマネージド`

Liferay インスタンスコンフィギュレーションはクライアント拡張と一緒にデプロイできます。例えば、OAuth2認証プロファイルをクライアント拡張設定としてデプロイし、認証を必要とする他のクライアント拡張設定を有効にすることができます。

## インスタンス設定 クライアント拡張

{bdg-secondary}`Available Liferay DXP 7.4 (self-hosted)` {bdg-secondary}`Available Liferay Experience Cloud (SaaS)`

インスタンス設定クライアントエクステンションを使用すると、さまざまな Liferay の設定を行うことができます。各構成は PID (Persistent IDentity) によって参照されます。

インスタンス設定クライアント拡張は `client-extension.yaml` ファイルで指定します：

```yaml
type: instanceSettings
```

## OAuthヘッドレスサーバークライアント拡張

クライアントエクステンションを使用すると、`Headless Server` クライアントプロファイルをあらかじめ設定した Liferay OAuth2 アプリケーションを構成することができます。この種の認証プロファイルは、特定のユーザーによって認可されていない API 呼び出しに必要です。

`client-extension.yaml`ファイルにOAuthヘッドレスサーバークライアントの拡張子を指定します：

```yaml
type: oAuthApplicationHeadlessServer
```

### `oAuthApplicationHeadlessServer`の特別な動作

OAuthヘッドレスサーバクライアントの拡張は、Liferayが **ルート** として提供するメタデータに依存します（ [Context-Sensitive Information](working-with-client-extensions.md#context-sensitive-information) を参照してください）。 このクライアントエクステンションでデプロイされた実行可能ワークロードは、実行する前にこのルートを待たなければならない。

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

クライアントエクステンションを使用すると、`User Agent Application` クライアントプロファイルをあらかじめ設定した Liferay OAuth2 アプリケーションを構成することができます。このような認証プロファイルは、特定のユーザーによって許可されたAPIコール（例えば、他の[microservice-client-extensions](./microservice-client-extensions.md)を使ってLiferay APIにRESTコールをする場合など）に必要です。

`client-extension.yaml`ファイルにOAuthユーザーエージェントクライアント拡張子を指定します：

```yaml
type: oAuthApplicationUserAgent
```

### `oAuthApplicationUserAgent` の特別な動作

OAuth ヘッドレスユーザエージェントクライアントの拡張は、Liferay が **ルート** として提供するメタデータに依存します（ [Context-Sensitive Information](working-with-client-extensions.md#context-sensitive-information) を参照してください）。 このクライアントエクステンションでデプロイされた実行可能ワークロードは、実行する前にこのルートを待たなければならない。

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
* [`client-extension.yaml` でクライアント拡張機能を設定する。](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
