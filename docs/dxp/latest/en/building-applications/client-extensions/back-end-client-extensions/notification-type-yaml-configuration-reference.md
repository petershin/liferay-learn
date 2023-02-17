# Notification Type YAML Configuration Reference

Here is a guide to setting up the definition for a notification type client extension in your `client-extension.yaml` file.

## Usage Details

Here is an example `client-extension.yaml` file with a notification type client extension definition:

```yaml
zebra-notification-type:
oAuth2ApplicationExternalReferenceCode: zebra-oauth-user-agent
    resourcePath: /zebra/notification
    type: notificationType

zebra-oauth-user-agent:
    type: oAuthApplicationUserAgent
```

The required `resourcePath` property defines the path where the notification handler is located. This can point to any implementation of a notification handler that can be accessed as an external application. This value is combined with the `homePageURL` value of the associated OAuth2 application profile to form the complete URL.

Notification type client extensions also require OAuth2 application profiles to secure requests triggered by notifications in Liferay. The example `client-extension.yaml` defines an additional [OAuth user agent client extension](../configuration-client-extensions/oauth-user-agent-client-extension-usage-and-properties.md) for this profile, and the `oAuth2ApplicationExternalReferenceCode` property references that client extension's `key` value.

## YAML Properties

These properties are specific to notification type client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `resourcePath` | String (partial URL) | The resource path defining where the notification handler is located. This value is combined with the OAauth2 application profile's `homePageURL` value for a complete URL. *This property is required for notification type client extensions.* |
| `oAuth2ApplicationExternalReferenceCode` | The external reference code for an OAuth2 application profile, needed for securing requests. *This property is required for notification type client extensions.* |

## Additional Information

* [Back-end Client Extensions](../back-end-client-extensions.md)
* [Working with Client Extensions](../working-with-client-extensions.md)
