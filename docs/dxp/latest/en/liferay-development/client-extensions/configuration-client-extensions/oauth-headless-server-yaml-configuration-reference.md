---
uuid: 57ce5bc2-3e8a-4c7a-b379-bbcc42ae6784
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# OAuth Headless Server YAML Configuration Reference

You can define an OAuth headless server client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines an OAuth headless server client extension:

```yaml
yoke-oauth-headless-server:
    type: oAuthApplicationHeadlessServer
```

## YAML Properties

These properties are specific to OAuth headless server client extensions:

| Name                      | Data Type            | Default Value                                    | Description                                                                                                                                                     |
|:--------------------------|:---------------------|:-------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `description`             | String               |                                                  | The client extension's description.                                                                                                                             |
| `homePageURL`             | String (partial URL) | `https://$[conf:ext.lxc.liferay.com.mainDomain]` | The base address of the OAuth2 application profile's resource server.                                                                                           |
| `name`                    | String               | (Derived from the OAuth2 application profile)    | The OAuth2 application profile's name.                                                                                                                          |
| `privacyPolicyURL`        | URL                  |                                                  | The URL for the OAuth2 application profile's privacy policy.                                                                                                    |
| `scopes`                  | String[]             | []                                               | An array of scopes that are associated with the OAuth2 application profile.                                                                                     |
| `userAccountEmailAddress` | String               | (The default administrator user's email address) | The email address for the user account associated with this OAuth2 application profile. This is only used if the `userAccountScreenName` property is undefined. |
| `userAccountScreenName`   | String               | (The default administrator user's screen name)   | The screen name for the user account associated with the OAuth2 application profile. This overrides the value for `userAccountEmailAddress`.                    |

## Related Topics

* [Microservice Client Extensions](../microservice-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [OAuth User Agent YAML Configuration Reference](./oauth-user-agent-yaml-configuration-reference.md)
