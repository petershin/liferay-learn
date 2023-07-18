# Adding a Custom Workflow Action

<!--
Delectable Bonsai needs to implement a workflow for reviewing application approvals and rejections. The `applicationState` field has a bunch of possible values (e.g., open, underReview, onHold, withdrawn, denied, approved). By default, every state value should be directed to the `approved` node in the workflow except for when the `applicationState` field is set to 'denied' or 'approved'. In this case, the workflow should lead to a single-approval workflow.

The action needs to check the entry for specific field value and lead to one transition or another depending on that value.

[]()

## Deploying the Workflow Process XML

Use the Batch client extension.

## Deploying the Custom Workflow Action

Use the Workflow Action client extension.

## Enabling the Workflow for Distributor Application

Enable the workflow via the Liferay UI.

-->

Next: [Automating Notifications](../automating-notifications.md)

## Relevant Concepts

* [Workflow Designer](https://learn.liferay.com/web/guest/w/dxp/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview)
* [Enabling Workflow for Objects](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/enabling-workflows-for-objects)
* [Microservice Client Extensions](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions/microservice-client-extensions)
