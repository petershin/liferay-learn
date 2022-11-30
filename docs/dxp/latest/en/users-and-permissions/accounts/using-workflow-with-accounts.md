# Using Workflow with Accounts

{bdg-secondary}`Available: Liferay DXP 7.4 U49+/Liferay Portal 7.4 GA49+`

Accounts are fully integrated with Liferay's [workflow engine](../../process-automation/workflow/introduction-to-workflow.md). You can enable an approval workflow process for account creation.

## Enabling a Workflow

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Applications* &rarr; *Workflow* &rarr; *Process Builder*. Click the *Configurations* tab. Click *Edit* for Account Entry.

1. Use the drop-down menu and select a specific workflow (e.g. Single Approver). Click *Save*.

   ![Use the drop-down menu and select Single Approver.](./using-workflow-with-accounts/images/01.png)

   Workflow has now been enabled for accounts.

## Creating an Account

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Accounts*. 

1. Click the Add icon (![Add icon](../../images/icon-add.png)). Give the account a name and set up the account according to your use case. Click *Save*.

1. Go back to the list of accounts. Click *Filter and Order* and select *Pending*. The account you just created is in pending state and only becomes active once the account is approved.

1. Login as a user with approval privileges. Open your *Personal Menu* and click Notifications. Notice that there is a new notification.

   ![Open the personal menu and see the new notification.](./using-workflow-with-accounts/images/02.png)

1. Click on the new notification to review the account in the workflow. You can also click *My Workflow Tasks* and find the pending notification. Review the pending workflow and choose to approve or reject the new account.

1. Click the Actions icon (![Actions icon](../../images/icon-actions.png)) and click *approve*. Add a comment if you like and click *Done*.

   ![Click the actions icon and click approve.](./using-workflow-with-accounts/images/03.png)

   The account is now approved.

Note in this example, John is set to be the reviewer of the single approver workflow. See [Workflow Designer Overview](../../process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md) to learn more about defining your workflow process.