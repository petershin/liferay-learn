---
uuid: d20aeabb-1523-486a-9848-f72f8b25d9cb
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Workflow Action YAML Configuration Reference

You can define a workflow action client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines a workflow action and an OAuth user agent:

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

The required `resourcePath` property defines the workflow action handler's location. Point to any implementation of a workflow action handler that's accessible as an external application (for example, a Java Spring Boot application). This value is combined with the `homePageURL` value of the OAuth2 application profile to form the complete URL.

Workflow action client extensions require OAuth2 application profiles to secure requests triggered by workflow actions in Liferay. The example above defines an additional [OAuth user agent client extension](../configuration-as-code/oauth-user-agent-yaml-configuration-reference.md) for this profile, and the `oAuth2ApplicationExternalReferenceCode` property references that client extension's `key` value.

[The sample workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) demonstrates adding a workflow action client extension.

## YAML Properties

These properties are specific to workflow action client extensions:

| Name                                   | Data Type            | Description |
| :------------------------------------- | :------------------- | :--- |
| `resourcePath`                           | String (partial URL) | (Required) The path to the workflow action handler. This value is combined with the OAauth2 application profile's `homePageURL` value for a complete URL. |
| `oAuth2ApplicationExternalReferenceCode` | String               | (Required) The external reference code for an OAuth2 application profile, needed for securing requests. |

## Related Topics

* [Microservice Client Extensions](../integrating-microservices.md)
* [Working with Client Extensions](../client-extensions/working-with-client-extensions.md)
* [Object Action YAML Configuration Reference](./object-action-yaml-configuration-reference.md)
