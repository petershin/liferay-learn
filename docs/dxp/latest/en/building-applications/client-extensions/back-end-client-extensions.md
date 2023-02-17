---
toc:
- ./back-end-client-extensions/object-action-yaml-configuration-reference.md
- ./back-end-client-extensions/workflow-action-yaml-configuration-reference.md
- ./back-end-client-extensions/notification-type-yaml-configuration-reference.md
---
# Back-End Client Extensions

```{toctree}
:maxdepth: 3

back-end-client-extensions/object-action-yaml-configuration-reference.md
back-end-client-extensions/workflow-action-yaml-configuration-reference.md
back-end-client-extensions/notification-type-yaml-configuration-reference.md
```

There are several types of client extensions that you can use to handle tasks outside of your Liferay instance, using your own code. You can write these types of client extensions using any method or type of code you want. Back-end client extensions are hosted outside of Liferay, and can be triggered by various cues from Liferay DXP itself.

Back-end client extensions often require pre-configured authentication profiles to properly handle requests and call protected Liferay API. You can use achieve this by including other client extensions within the same project, like [OAuth user agent client extensions](./configuration-client-extensions.md#oauth-user-agent-client-extensions).

## Object Action Client Extensions

> Available for Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)

Object action client extensions define external action handlers that you can link [Objects](link) to. You can configure your client extension as an object action, so that the defined object calls it when its event takes place.

Use this `type` value in your `client-extension.yaml` file to specify an object action client extension:

```yaml
type: objectAction
```

## Workflow Action Client Extensions

> Available for Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)

Workflow action client extensions define external workflow action handlers that you can link to from [Liferay DXP workflows](link). You can configure a specific workflow event so that it calls your client extension.

Use this `type` value in your `client-extension.yaml` file to specify a workflow action client extension:

```yaml
type: workflowAction
```

## Notification Type Client Extensions

> Available for Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)

Notification type client extensions define external notification handlers that you can trigger from any operation in Liferay DXP that supports sending [notifications](link). Your client extension handles the notifications themselves via any desired method.

Use this `type` value in your `client-extension.yaml` file to specify a notification type client extension:

```yaml
type: notificationType
```

## Back-End Client Extension Properties

These properties are usable within the client extension definition for any type of back-end client extension (in your `client-extension.yaml` file):

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `type` | String | The specific type of client extension. *Used for all client extension types.* |
| `dxp.lxc.liferay.com.virtualInstanceId` | String | The virtual instance ID (`webId`) this client extension targets when it is deployed. *Used for all client extension types.* |
