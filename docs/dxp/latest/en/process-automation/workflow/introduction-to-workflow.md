---
taxonomy-category-names:
- Platform
- Workflow
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 735846f8-b118-4214-9e9d-8d3c5ae4584f
---
# Introduction to Workflow

Liferay DXP ships with a workflow engine that allows users to review and approve content such as Blogs, Web Content, Wikis before they are published. The Workflow application makes it possible to define any number of business processes/workflows, deploy them, and manage them through a portal interface. Workflow processes are written in `XML` format and several sample workflow processes are available for reference. Lastly, workflow processes can integrate with Users, Groups, and Roles as reviewers and approvers. After you defined your review process, you can select which types of content require a review process before publication.

## Activating Workflow

When a workflow is activated for a particular asset, the *Publish* button is replaced by a *Submit for Workflow* button. When pressed, the asset's status is set as *Pending*, and it must proceed through the workflow before publication.

![Instead of a Publish button, a Submit for Workflow button appears for workflow-enabled resources.](./introduction-to-workflow/images/01.png)

The out-of-the-box workflow process is called *Single Approver*; that means one person is required to review and approve submissions before publication.

To learn more, see the [Activating Workflow](./using-workflows/activating-workflow.md) and [sending assets through review](./using-workflows/reviewing-assets.md) articles.

## Building a Workflow

You can build more complex workflows with multiple reviewers and approvers. Learn how to build an effective workflow:

- [Crafting Review Processes in XML](./developer-guide/crafting-xml-workflow-definitions.md)
- [Visually Designing Review Processes](./designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md) (Subscriber)
- [Uploading Workflow Definitions](./designing-and-managing-workflows/managing-workflows.md#uploading-a-new-workflow-definitions)
- [Managing Workflow Definitions](./designing-and-managing-workflows/managing-workflows.md)

### Using Workflow Metrics to Implement SLAs

{bdg-primary}`Subscription`

The *Metrics* function can be used to measure Service Level Agreements (SLAs) performance in a workflow process. SLAs define the deadlines on a workflow process's events. They can be formally agreed-upon deadlines between you and your customers, or informally created to meet internal goals, tracking events such as:

- Total time to resolution
- Time to complete a specific workflow task

Once an SLA is set, workflow submissions that trigger the SLA timer are reported by the workflow metrics framework automatically and given the status *on time* or *overdue*.

![See Workflow Reports generated based on your SLAs.](./introduction-to-workflow/images/02.png)

See the [Using Workflow Metrics](./using-workflows/using-workflow-metrics.md) article to learn how to add SLAs into your workflows.

## Understanding Workflow Status

An asset in a workflow process always has a status. The status is used to determine important things like whether the asset can be displayed to end users. There are many statuses, but some of the most common and important ones to understand are described here:

- The *draft* status is assigned to content that can be saved before being ready for either review in the workflow or for viewing by end users.
- The *pending* status denotes that the asset is in a workflow process that's not yet completed.
- The *approved* status means the asset is ready for display in the UI for all user's with permission to see it.
- The *denied* status is for assets that have failed to make it through a workflow. This status may be used to trigger a notification to the original submitter of the asset, perhaps to prompt a revision and resubmission of the content.

![Content can have a workflow status.](./introduction-to-workflow/images/03.png)

See the source code's [`WorkflowConstants` class](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/workflow/WorkflowConstants.java) to view all the available statuses.

### Versioned Assets Can Have Multiple Statuses

Versioned assets can have two statuses.

![Versioned assets can have two statuses.](./introduction-to-workflow/images/04.png)

Most assets default to displaying the newest approved version. If an already approved asset is updated, a new version is created and sent through the workflow. When the new version is not yet approved in the workflow, a second status appears for the asset (e.g., *pending*). The last approved version is used until the new version is approved.

## What's Next

- [Activating Workflow](./using-workflows/activating-workflow.md)
- [Managing Workflows](./designing-and-managing-workflows/managing-workflows.md)
- [Workflow Designer Overview](./designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md)