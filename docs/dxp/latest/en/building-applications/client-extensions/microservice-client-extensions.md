---
toc:
  - ./microservice-client-extensions/tutorials.md
  - ./microservice-client-extensions/object-action-yaml-configuration-reference.md
  - ./microservice-client-extensions/workflow-action-yaml-configuration-reference.md
  - ./microservice-client-extensions/notification-type-yaml-configuration-reference.md
uuid: c35ace6c-9e29-4e9e-be37-b4799a8b21d5
---
# Microservice Client Extensions

{bdg-secondary}`7.4 U45+/GA45+`

Define microservice client extensions to run your own code in response to events in your Liferay instance. How you implement the code is up to you: use the patterns and technologies you like. Microservice client extensions are hosted outside of Liferay and are triggered by cues from Liferay itself.

Microservice client extensions require pre-configured authentication profiles to handle requests properly and call protected Liferay APIs. You can add authentication profiles by including them as client extensions within the same project (e.g., [OAuth user agent client extensions](./configuration-client-extensions.md#oauth-user-agent-client-extensions)).

Microservice client extensions are hosted automatically when deployed within Liferay Experience Cloud. If self-hosting a Liferay instance, you must host the microservices that these client extensions use separately.

## Object Action Client Extensions

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)`

Object action client extensions define external action handlers that bind to an [object definition's](../objects.md) action events. Your microservice's handler code is executed when the object action occurs.

Use the `type` value in your `client-extension.yaml` file to specify an object action client extension:

```yaml
type: objectAction
```

## Workflow Action Client Extensions

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)`

Workflow action client extensions define external workflow action handlers that bind to action events from a [Liferay workflow](../../process-automation/workflow/introduction-to-workflow.md). Your microservice's handler code is executed when the workflow action occurs.

Use the `type` value in your `client-extension.yaml` file to specify a workflow action client extension:

```yaml
type: workflowAction
```

## Notification Type Client Extensions

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)`

Notification type client extensions define external notification handlers that bind to [notification events](../../process-automation/notifications.md) in Liferay. Your microservice's handler code is executed when the notification event occurs.

Use the `type` value in your `client-extension.yaml` file to specify a notification type client extension:

```yaml
type: notificationType
```

## Related Topics

* [Introduction to Client Extensions](../client-extensions.md)
* [Configuring Client Extensions in `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
