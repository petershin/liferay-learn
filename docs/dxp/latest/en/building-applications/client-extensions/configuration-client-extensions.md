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

### The `ext-init-metadata` Dependency Side Effect

The `oAuthApplicationHeadlessServer` client extension causes a side effect for the host workload. First, an additional dependency is defined for metadata which is provided by DXP as a _config tree_ (a directory structure which forms a set of key/value pairs where file names are the keys and file contents are the values).

The following is an example of the _config tree_:

```bash
.
# the oauth authorization uri of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.authorization.uri
# the audience of the oauth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.audience
# the client id of the oauth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.client.id
# the client secret of the oauth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.client.secret
# the scopes of the oauth headless server application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.headless.server.scopes
# the introspection uri of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.introspection.uri
# the jwks (JSON Web Keys Set) uri of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.jwks.uri
# the token uri of the DXP virtual instance (no protocol, domain or port)
└── <oAuth2ApplicationExternalReferenceCode>.oauth2.token.uri
```

Workloads in Liferay Experience Cloud will have this metadata automatically mounted into the workload container at the path `/etc/liferay/lxc/ext-init-metadata`.

For on-premises applications this same _config tree_ structure is emitted by DXP in `${liferay.home}/cx-metadata/<virtualInstanceIdOrDefault>/<projectId>`. This path can then be provided to client extension microservices to have access to that same metadata.

## OAuth User Agent Client Extensions

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)`

You can use a client extension to configure a Liferay OAuth2 application pre-configured with a `User Agent Application` client profile. This kind of authentication profile is required for API calls authorized by a specific user (for example, making a REST call to a Liferay API using your other [microservice client extensions](./microservice-client-extensions.md)).

Specify an OAuth user agent client extension in your `client-extension.yaml` file:

```yaml
type: oAuthApplicationUserAgent
```

### The `ext-init-metadata` Dependency Side Effect

The `oAuthApplicationUserAgent` client extension causes a side effect for the host workload. First, an additional dependency is defined for metadata which is provided by DXP as a _config tree_ (a directory structure which forms a set of key/value pairs where file names are the keys and file contents are the values).

The following is an example of the _config tree_:

```bash
.
# the oauth authorization uri of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.authorization.uri
# the introspection uri of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.introspection.uri
# the jwks (JSON Web Keys Set) uri of the DXP virtual instance (no protocol, domain or port)
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.jwks.uri
# newline separated redirect uris of the DXP virtual instance
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.redirect.uris
# the token uri of the DXP virtual instance
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.token.uri (no protocol, domain or port)
# the audience of the oauth user agent application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.user.agent.audience
# the client id of the oauth user agent application
├── <oAuth2ApplicationExternalReferenceCode>.oauth2.user.agent.client.id
# the scopes of the oauth user agent application
└── <oAuth2ApplicationExternalReferenceCode>.oauth2.user.agent.scopes
```

Workloads in Liferay Experience Cloud will have this metadata automatically mounted into the workload container at the path `/etc/liferay/lxc/ext-init-metadata`.

For on-premises applications this same _config tree_ structure is emitted by DXP in `${liferay.home}/cx-metadata/<virtualInstanceIdOrDefault>/<projectId>`. This path can then be provided to client extension microservices to have access to that same metadata.

## Related Topics

* [Introduction to Client Extensions](../client-extensions.md)
* [Configuring Client Extensions in `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
