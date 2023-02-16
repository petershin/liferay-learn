# OAuth User Agent Client Extension Usage and Properties

OAuth user agent client extensions define OAuth2 application profiles in Liferay that are pre-configured with a `User Agent Application` client profile. This kind of authentication profile is required for API calls that are triggered by a specific user (for example, making a REST call to a Liferay API using your other [back-end client extensions](./back-end-client-extensions.md)).

## Usage Details

Here is an example `client-extension.yaml` file with an OAuth user agent client extension definition:

```yaml
xray-oauth-user-agent:
    type: oAuthApplicationUserAgent
```

See [this example project](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions/sample-etc) for a complete example project including an OAuth user agent client extension.

## YAML Properties

These properties are specific to OAuth user agent client extensions:

| Name | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `description` | String | | The client extension's description. |
| `homePageURL` | String (partial URL) | `https://$[conf:ext.lxc.liferay.com.mainDomain]` | The base address of the OAuth2 application profile's resource server. |
| `name` | String | (Derived from the OAuth2 application profile) | The OAuth2 application profile's name. | `privacyPolicyURL` | URL | | The URL for the OAuth2 application profile's privacy policy. |
| `scopes` | String[] | [] | An array of scopes that are associated with the OAuth2 application profile. |

## Additional Information

* [Back-end Client Extensions](../back-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [OAuth Headless Server Client Extension Usage and Properties](./oauth-headless-server-client-extension-usage-and-properties.md)
