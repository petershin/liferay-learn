---
uuid: c4a0fc7c-99d6-441f-b0aa-20e65a44c4d3
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Object Validation Rule YAML Configuration Reference

To define an Object Validation Rule client extension, add the `objectValidationRule` type to your `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` example defines a validation rule and an OAuth user agent:

```yaml
easy-object-validation-rule-1:
    name: Easy Object Validation Rule 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /object/validation/rule/1
    type: objectValidationRule

easy-oauth-application-user-agent:
    type: oAuthApplicationUserAgent
```

The required `resourcePath` property defines the Object Validation Rule handler's location. Point to any implementation of an Object Validation Rule handler that's accessible as an external application (for example, a Java Spring Boot application). This value is combined with the `homePageURL` value of the associated OAuth2 application profile to form the complete URL.

Object Validation Rule client extensions require OAuth2 application profiles to secure the requests they trigger in Liferay. The `client-extension.yaml` defines an additional [OAuth user agent client extension](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md) for this profile, and the `oAuth2ApplicationExternalReferenceCode` property references that client extension's `key` value.

The [sample workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) demonstrates how to use an Object Validation Rule client extension with Spring Boot application.

## Restricting Client Extension Scope

By default, object validation rule client extensions are available to all object definitions in all Liferay instances.

To restrict access by object definition, add the `allowedObjectDefinitionNames` property along with a list of objects that can use the validation:

```yaml
easy-object-validation-rule-1:
    allowedObjectDefinitionNames:
        - C_EasyObject
        - User
```

In this example, `easy-object-validation-rule-1` only appears as an option when [defining validations](../../objects/creating-and-managing-objects/validations.md) for the `C_EasyObject` and `User` objects.

To restrict access by instance, add the `dxp.lxc.liferay.com.virtualInstanceId` property with the desired virtual instance's ID:

```yaml
easy-object-validation-rule-1:
    allowedObjectDefinitionNames:
        - C_EasyObject
        - User
    dxp.lxc.liferay.com.virtualInstanceId: easy-virtual-host-1.com
```

In this example, `easy-object-validation-rule-1` only appears as an option for the `C_EasyObject` and `User` objects in the `easy-virtual-host-1.com` instance.

## YAML Properties

These properties are specific to Object Validation Rule client extensions:

| Name                                     | Data Type            | Description                                                                                                                                                      |
|:-----------------------------------------|:---------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `allowedObjectDefinitionNames`           | List                 | Scope the client extension to specified object definitions (e.g., `C_EasyObject`, `User`)                                                                        |
| `dxp.lxc.liferay.com.virtualInstanceId`  | String               | Scope the client extension to a specified virtual instance using its ID (e.g., `easy-virtual-host-1.com`).                                                       |
| `resourcePath`                           | String (partial URL) | (Required) The path to the Object Validation Rule handler. This value is combined with the OAauth2 application profile's `homePageURL` value for a complete URL. |
| `oAuth2ApplicationExternalReferenceCode` | String               | (Required) The external reference code for an OAuth2 application profile, needed for securing requests.                                                          |

## Related Topics

* [Microservice Client Extensions](../microservice-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
* [Validations](./workflow-action-yaml-configuration-reference.md)
