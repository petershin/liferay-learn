---
taxonomy-category-names:
- Platform
- Workflow
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: e7464862-01ef-4ae1-82eb-152b40e026f6
---
# Reviewing Assets

When an asset's workflow is [activated](./activating-workflow.md), one or more users must review it before publication. You can assign workflow review processes to specific users or to a particular Role (for example: Portal or Site Content Reviewer). In the latter case, anyone assigned to that Role may approve or reject the submission. For example, with the out-of-the-box *Single Approver* process, the workflow tasks are assigned to a Portal or Site Content Reviewer or anyone with administrator rights.

!!! tip
    DXP subscribers: bulk management of workflow items is possible using the [Workflow Metrics application](./using-workflow-metrics.md#managing-workflow-tasks-in-bulk).

Once an asset has been submitted, the *Workflow* application sends a notification to all the potential reviewers. To access notifications, click your avatar and select *Notifications*.

![Workflow sends a notification an asset is ready for review.](./reviewing-assets/images/01.png)

## Reviewing an Asset

To begin reviewing an asset, you must assign the task to yourself. Note that when using the Single Approver workflow, tasks are by default assigned to a Role. (You can also build custom workflows which assign review tasks to specific users instead of by Roles.)

### Assigning the Review Task

1. Click your avatar and select *My Workflow Tasks*.

1. All workflow tasks assigned directly to a user appear in the My Workflow Task widget's *Assigned to Me* tab.

   ![The assets assigned to a user appear in Assigned to Me.](./reviewing-assets/images/02.png)

1. To claim a task, click the *Assigned to My Roles* tab.

   ![The Assets assigned to Roles appear in each associated user's Assigned to My Roles tab.](./reviewing-assets/images/03.png)

1. Click the asset's *Actions* button (![Actions](../../../images/icon-actions.png)) and select *Assign to Me*.

   ![Assign the task to self.](./reviewing-assets/images/04.png)

1. Enter an optional comment in the *Comment* text field.

1. Click *Done*.

### Approving or Rejecting a Task

Once you have assigned to task to yourself, you can approve or reject the submission.

1. Click the name of the asset to review the asset. Here, there is a preview of the asset (a *Wiki Page*) and the review status.

   ![Review the asset.](./reviewing-assets/images/05.png)

1. Click the *Actions* button (![Actions](../../../images/icon-actions.png)) and select *Approve* or *Reject*.

   ![Approve or reject the asset.](./reviewing-assets/images/06.png)

1. Enter an optional comment and click *Done*.

Once a task is complete, one of several things happens:

- If the submission is rejected, then the asset is not published. The asset exits the workflow process. On the User's *Notifications*, the original author is notified that the submission was rejected and must be modified before resubmitted. It is marked as *Update* in *My Workflow Tasks*.

- If there are more than one reviewers, the task is advanced to the next reviewer in the chain.

- If the submission is approved and there is only one reviewer, then the task is moved to the *Completed* section on the *Assigned to Me* tab. The asset is published.

![The completed task is in Assigned to Me tab.](./reviewing-assets/images/07.png)

The approved asset (the Wiki Page) is now published in the widget.

## Related Topics

- [Managing Notifications and Requests](../../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md)
- [Workflow Task Nodes](../developer-guide/workflow-task-node-reference.md)
- [Workflow Notifications](https://help.liferay.com/hc/articles/360028834772-Workflow-Notifications)