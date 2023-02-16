# OAuth Headless Server Client Extension Usage and Properties

OAuth headless server client extensions define OAuth2 application profiles in Liferay that are pre-configured with a `Headless Server` client profile. This kind of authentication profile is required for API calls that are not triggered by a specific user. The client extension associates with a particular user account that is used for authentication.

## Usage Details

Here is an example `client-extension.yaml` file with an OAuth headless server client extension definition:

```yaml
yoke-oauth-headless-server:
  type: oAuthApplicationHeadlessServer
```

## YAML Properties

These properties are specific to OAuth headless server client extensions:

| Name | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `description` | String | | The client extension's description. |
| `homePageURL` | String (partial URL) | `https://$[conf:ext.lxc.liferay.com.mainDomain]` | The base address of the OAuth2 application profile's resource server. |
| `name` | String | (Derived from the OAuth2 application profile) | The OAuth2 application profile's name. | `privacyPolicyURL` | URL | | The URL for the OAuth2 application profile's privacy policy. |
| `scopes` | String[] | [] | An array of scopes that are associated with the OAuth2 application profile. |
| `userAccountEmailAddress` | String | (The default administrator user's email address) | The email address for the user account associated with this OAuth2 application profile. Only used if the `userAccountScreenName` property is undefined. |
| `userAccountScreenName` | String | (The default administrator user's screen name) | The screen name for the user account associated with the OAuth2 application profile. Overrides the value for `userAccountEmailAddress` if defined. |

## Additional Information

* [Back-end Client Extensions](../back-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [OAuth User Agent Client Extension Usage and Properties](./oauth-user agent-client-extension-usage-and-properties.md)
