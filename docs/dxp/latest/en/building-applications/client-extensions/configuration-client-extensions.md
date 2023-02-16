---
toc:
- ./configuration-client-extensions/oauth-user-agent-client-extension-usage-and-properties.md
- ./configuration-client-extensions/oauth-headless-server-client-extension-usage-and-properties.md
---
# Configuration Client Extensions

```{toctree}
:maxdepth: 3

configuration-client-extensions/oauth-user-agent-client-extension-usage-and-properties.md
configuration-client-extensions/oauth-headless-server-client-extension-usage-and-properties.md
```

You can deploy specific configurations to one or more Liferay instances with client extensions to simplify your work with Liferay. For example, you can use configuration client extensions to deploy OAuth2 authentication profiles to enable your other client extensions that require authentication.

## OAuth Headless Server Client Extensions

> Available for Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)

OAuth headless server client extensions define OAuth2 application profiles in Liferay that are pre-configured with a `Headless Server` client profile. This kind of authentication profile is required for API calls that are not triggered by a specific user.

Use this `type` value in your `client-extension.yaml` file to specify an OAuth headless server client extension:

```yaml
type: oAuthApplicationHeadlessServer
```

## OAuth User Agent Client Extensions

> Available for Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)

OAuth user agent client extensions define OAuth2 application profiles in Liferay that are pre-configured with a `User Agent Application` client profile. This kind of authentication profile is required for API calls that are triggered by a specific user (for example, making a REST call to a Liferay API using your other [back-end client extensions](./back-end-client-extensions.md)).

Use this `type` value in your `client-extension.yaml` file to specify an OAuth user agent client extension:

```yaml
type: oAuthApplicationUserAgent
```

## Configuration Client Extension Properties

These properties are usable within the client extension definition for any type of configuration client extension (in your `client-extension.yaml` file):

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `type` | String | The specific type of client extension. *Used for all client extension types.* |
| `dxp.lxc.liferay.com.virtualInstanceId` | String | The virtual instance ID (`webId`) this client extension targets when it is deployed. *Used for all client extension types.* |
