---
uuid: 9557c412-c225-497b-88dc-659fdc6b1864
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Object Action YAML Configuration Reference

You can define an object action client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` defines an object action and an OAuth user agent:

```yaml
easy-object-action-1:
    name: Easy Object Action 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /easy-object/action/1
    type: objectAction

easy-oauth-application-user-agent:
    type: oAuthApplicationUserAgent
```

The required `resourcePath` property defines the object action handler's location. Point to any implementation of an object action handler that's accessible as an external application (for example, a Java Spring Boot application). This value is combined with the `homePageURL` value of the associated OAuth2 application profile to form the complete URL.

Object action client extensions require OAuth2 application profiles to secure requests triggered by object actions in Liferay. The `client-extension.yaml` defines an additional [OAuth user agent client extension](../configuration-as-code/oauth-user-agent-yaml-configuration-reference.md) for this profile, and the `oAuth2ApplicationExternalReferenceCode` property references that client extension's `key` value.

[The sample workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) demonstrates adding an object action client extension.

## Restricting Client Extension Scope

By default, object action client extensions are available to all object definitions in all Liferay instances.

To restrict access by object definition, add the `allowedObjectDefinitionNames` property along with a list of objects that can use the action:

```yaml
easy-object-action-1:
    allowedObjectDefinitionNames:
        - C_EasyObject
        - User
```

In this example, `easy-object-action-1` only appears as an option when [defining actions](../objects/creating-and-managing-objects/actions.md) for the `C_EasyObject` and `User` objects.

To restrict access by instance, add the `dxp.lxc.liferay.com.virtualInstanceId` property with the desired virtual instance's ID:

```yaml
easy-object-action-1:
    allowedObjectDefinitionNames:
        - C_EasyObject
        - User
    dxp.lxc.liferay.com.virtualInstanceId: easy-virtual-host-1.com
```

In this example, `easy-object-action-1` only appears as an option for the `C_EasyObject` and `User` objects in the `easy-virtual-host-1.com` instance.

## YAML Properties

These properties are specific to object action client extensions:

| Name                                     | Data Type            | Description                                                                                                                                             |
|:-----------------------------------------|:---------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------|
| `allowedObjectDefinitionNames`           | List                 | Scope the client extension to specified object definitions (e.g., `C_EasyObject`, `User`)                                                               |
| `dxp.lxc.liferay.com.virtualInstanceId`  | String               | Scope the client extension to a specified virtual instance using its ID (e.g., `easy-virtual-host-1.com`).                                              |
| `resourcePath`                           | String (partial URL) | (Required) The path to the object action handler. This value is combined with the OAauth2 application profile's `homePageURL` value for a complete URL. |
| `oAuth2ApplicationExternalReferenceCode` | String               | (Required) The external reference code for an OAuth2 application profile, needed for securing requests.                                                 |

## Related Topics

* [Microservice Client Extensions](../integrating-microservices.md)
* [Working with Client Extensions](../client-extensions/working-with-client-extensions.md)
* [Workflow Action YAML Configuration Reference](./workflow-action-yaml-configuration-reference.md)
