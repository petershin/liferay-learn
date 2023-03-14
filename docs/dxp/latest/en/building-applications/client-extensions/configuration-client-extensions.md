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

{bdg-secondary}`7.4 U45+/GA45+`

Liferay instance configurations are deployable with client extensions. For example, you can deploy OAuth2 authentication profiles as configuration client extensions, enabling your other client extensions that require authentication.

## OAuth Headless Server Client Extensions

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)`

You can use a client extension to configure a Liferay OAuth2 application pre-configured with a `Headless Server` client profile. This kind of authentication profile is required for API calls that are not authorized by a specific user.

Specify an OAuth headless server client extension in your `client-extension.yaml` file:

```yaml
type: oAuthApplicationHeadlessServer
```

## OAuth User Agent Client Extensions

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)`

You can use a client extension to configure a Liferay OAuth2 application pre-configured with a `User Agent Application` client profile. This kind of authentication profile is required for API calls authorized by a specific user (for example, making a REST call to a Liferay API using your other [microservice client extensions](./microservice-client-extensions.md)).

Specify an OAuth user agent client extension in your `client-extension.yaml` file:

```yaml
type: oAuthApplicationUserAgent
```

## Additional Information

* [Introduction to Client Extensions](../client-extensions.md)
* [Configuring Client Extensions in `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
