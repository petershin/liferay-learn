---
toc:
  - ./configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
  - ./configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
uuid: 654223de-17be-4786-a90d-775f986c0911
---
# Configuration Client Extensions

```{toctree}
:maxdepth: 3

configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md
configuration-client-extensions/oauth-headless-server-yaml-configuration-reference.md
```

{bdg-secondary}`Available Liferay 7.4`

Liferay instance configurations are deployable with client extensions. For example, you can deploy OAuth2 authentication profiles as configuration client extensions, enabling your other client extensions that require authentication.

## OAuth Headless Server Client Extensions

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)`

You can use a client extension to configure a Liferay OAuth2 application pre-configured with a `Headless Server` client profile. This kind of authentication profile is required for API calls that are not authorized by a specific user.

Specify an OAuth headless server client extension in your `client-extension.yaml` file:

```yaml
type: oAuthApplicationHeadlessServer
```

### The Special Behavior of `oAuthApplicationHeadlessServer`

The `oAuthApplicationHeadlessServer` client extension causes a special behavior for the host project when it becomes a workload. An additional dependency is defined on metadata which is emitted by DXP as a route (see [Context Sensitive Information](working-with-client-extensions.md#context-sensitive-information)). Any executable workload deployed with this client extension must wait for this route to be available before it runs.

The following is an example of the route defined by the environment variable `LIFERAY_ROUTES_CLIENT_EXTENSION` when a `oAuthApplicationHeadlessServer` client extension is defined in the project:

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

Application logic which performs secure communication with DXP using a `oAuthApplicationHeadlessServer` client extension must use the information provided by this route metadata to secure said communication. All necessary OAuth 2 metadata to will be provided this way rather than being hard coded in configuration or source code.

## OAuth User Agent Client Extensions

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)`

You can use a client extension to configure a Liferay OAuth2 application pre-configured with a `User Agent Application` client profile. This kind of authentication profile is required for API calls authorized by a specific user (for example, making a REST call to a Liferay API using your other [microservice client extensions](./microservice-client-extensions.md)).

Specify an OAuth user agent client extension in your `client-extension.yaml` file:

```yaml
type: oAuthApplicationUserAgent
```

### The Special Behavior of `oAuthApplicationUserAgent`

The `oAuthApplicationUserAgent` client extension causes a special behavior for the host project when it becomes a workload. An additional dependency is defined on metadata which is emitted by DXP as a _route_ (see [Context Sensitive Information](working-with-client-extensions.md#context-sensitive-information)). Any executable workload deployed with this client extension must wait for this route before it runs.

The following is an example of the route defined by the environment variable `LIFERAY_ROUTES_CLIENT_EXTENSION` when a `oAuthApplicationUserAgent` client extension is defined in the project:

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

Application logic which performs secure communication with DXP using a `oAuthApplicationUserAgent` client extension must use the information provided by this route metadata to secure said communication. All necessary OAuth 2 metadata to will be provided this way rather than being hard coded in configuration or source code.

## Related Topics

* [Introduction to Client Extensions](../client-extensions.md)
* [Configuring Client Extensions in `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
