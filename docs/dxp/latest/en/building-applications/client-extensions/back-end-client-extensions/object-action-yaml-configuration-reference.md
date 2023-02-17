# Object Action YAML Configuration Reference

Here is a guide to setting up the definition for an object action client extension in your `client-extension.yaml` file.

## Usage Details

Here is an example `client-extension.yaml` file with a notification type client extension definition:

```yaml
easy-object-action-1:
    name: Easy Object Action 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /easy-object/action/1
    type: objectAction

easy-oauth-application-user-agent:
    type: oAuthApplicationUserAgent
```

The required `resourcePath` property defines where the object action handler is located. This can point to any implementation of an object action handler that can be accessed as an external application (for example, a Java Spring Boot application). This value is combined with the `homePageURL` value of the associated OAuth2 application profile to form the complete URL.

Object action client extensions also require OAuth2 application profiles to secure requests triggered by notifications in Liferay. The example `client-extension.yaml` defines an additional [OAuth user agent client extension](../configuration-client-extensions/oauth-user-agent-client-extension-usage-and-properties.md) for this profile, and the `oAuth2ApplicationExternalReferenceCode` property references that client extension's `key` value.

See [this example project](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions/sample-etc) for a complete example project including object action client extensions.

## YAML Properties

These properties are specific to object action client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `resourcePath` | String (partial URL) | The resource path defining where the object action handler is located. This value is combined with the OAauth2 application profile's `homePageURL` value for a complete URL. *This property is required for object action client extensions.* |
| `oAuth2ApplicationExternalReferenceCode` | The external reference code for an OAuth2 application profile, needed for securing requests. *This property is required for object action client extensions.* |

## Additional Information

* [Back-end Client Extensions](../back-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [Workflow Action YAML Configuration Reference](./workflow-action-yaml-configuration-reference.md)
