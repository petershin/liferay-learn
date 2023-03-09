---
toc:
- ./microservice-client-extensions/object-action-yaml-configuration-reference.md
- ./microservice-client-extensions/workflow-action-yaml-configuration-reference.md
- ./microservice-client-extensions/notification-type-yaml-configuration-reference.md
---
# Microservice Client Extensions

```{toctree}
:maxdepth: 3

microservice-client-extensions/object-action-yaml-configuration-reference.md
microservice-client-extensions/workflow-action-yaml-configuration-reference.md
microservice-client-extensions/notification-type-yaml-configuration-reference.md
```

{bdg-secondary}`Available Liferay 7.4 U45+/GA45+`

There are several types of client extensions that you can use to handle tasks outside of your Liferay instance, using your own code. You can write these types of client extensions using any method or type of code you want. Microservice client extensions are hosted outside of Liferay, and can be triggered by various cues from Liferay DXP itself.

Microservice client extensions often require pre-configured authentication profiles to properly handle requests and call protected Liferay API. You can use achieve this by including other client extensions within the same project, like [OAuth user agent client extensions](./configuration-client-extensions.md#oauth-user-agent-client-extensions).

Microservice client extensions are hosted automatically when they are deployed within Liferay Experience Cloud. However, if you are self-hosting a Liferay instance, you must also host any microservices that these client extensions use separately.

## Object Action Client Extensions

> Available for Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)

Object action client extensions define external action handlers that you can bind to an [object definition](../objects.md)'s action events. Binding this action to the client extension ensures that your microservice's handler code is executed when the object's action occurs.

Use this `type` value in your `client-extension.yaml` file to specify an object action client extension:

```yaml
type: objectAction
```

## Workflow Action Client Extensions

> Available for Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)

Workflow action client extensions define external workflow action handlers that you can bind to action events from a [Liferay DXP workflow](../../process-automation/workflow/introduction-to-workflow.md). Binding this action to the client extension ensures that your microservice's handler code is executed when the workflow's action occurs.

Use this `type` value in your `client-extension.yaml` file to specify a workflow action client extension:

```yaml
type: workflowAction
```

## Notification Type Client Extensions

> Available for Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)

Notification type client extensions define external notification handlers that you can bind to any [notification events](../../process-automation/notifications.md) in Liferay. Binding this action to the client extension ensures that your microservice's handler code is executed when the notification event occurs.

Use this `type` value in your `client-extension.yaml` file to specify a notification type client extension:

```yaml
type: notificationType
```

## Additional Information

* [Introduction to Client Extensions](../client-extensions.md)
* [Configuring Client Extensions in `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
