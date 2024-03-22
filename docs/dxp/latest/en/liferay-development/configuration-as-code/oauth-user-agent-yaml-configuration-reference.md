---
uuid: 4801c0d5-123d-471e-a8c6-d080342488c8
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# OAuth User Agent YAML Configuration Reference

You can define an OAuth user agent client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines an OAuth user agent client extension:

```yaml
xray-oauth-user-agent:
    type: oAuthApplicationUserAgent
```

[The example workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) includes a project with an OAuth user agent client extension.

## YAML Properties

These properties are specific to OAuth user agent client extensions:

| Name | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `description` | String | | The client extension's description. |
| `homePageURL` | String (partial URL) | `https://$[conf:ext.lxc.liferay.com.mainDomain]` | The base address of the OAuth2 application profile's resource server. |
| `name` | String | (Derived from the OAuth2 application profile) | The OAuth2 application profile's name. |
| `privacyPolicyURL` | URL | | The URL for the OAuth2 application profile's privacy policy. |
| `scopes` | String[] | [] | An array of scopes that are associated with the OAuth2 application profile. |

## Related Topics

* [Microservice Client Extensions](../integrating-microservices.md)
* [Working with Client Extensions](../client-extensions/working-with-client-extensions.md)
* [OAuth Headless Server YAML Configuration Reference](./oauth-headless-server-yaml-configuration-reference.md)
