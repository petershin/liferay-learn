# Workflow Action Client Extension Usage and Properties

Workflow action client extensions define external workflow action handlers that you can link to from [Liferay DXP workflows](link). You can configure a specific workflow event so that it calls your client extension.

## Usage Details

Here is an example `client-extension.yaml` file with a workflow action client extension definition:

```yaml
easy-workflow-action-1:
    name: Easy Workflow Action 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /easy-workflow/action/1
    type: workflowAction

easy-oauth-application-user-agent:
    scopes:
        - Liferay.Headless.Admin.Workflow.everything
    type: oAuthApplicationUserAgent
```

The required `resourcePath` property defines where the workflow action handler is located. This can point to any implementation of a workflow action handler that can be accessed as an external application (for example, a Java Spring Boot application). This value is combined with the `homePageURL` value of the associated OAuth2 application profile to form the complete URL.

Workflow action client extensions also require OAuth2 application profiles to secure requests triggered by notifications in Liferay. The example `client-extension.yaml` defines an additional [OAuth user agent client extension](../configuration-client-extensions/oauth-user-agent-client-extension-usage-and-properties.md) for this profile, and the `oAuth2ApplicationExternalReferenceCode` property references that client extension's `key` value.

See [this example project](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-default-workspace/client-extensions/sample-etc) for a complete example project including a workfow action client extension.

## YAML Properties

These properties are specific to workflow action client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `resourcePath` | String (partial URL) | The resource path defining where the workflow action handler is located. This value is combined with the OAauth2 application profile's `homePageURL` value for a complete URL. *This property is required for workflow action client extensions.* |
| `oAuth2ApplicationExternalReferenceCode` | The external reference code for an OAuth2 application profile, needed for securing requests. *This property is required for workflow action client extensions.* |

## Additional Information

* [Back-end Client Extensions](../back-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [Object Action Client Extension Usage and Properties](./object-action-client-extension-usage-and-properties.md)
