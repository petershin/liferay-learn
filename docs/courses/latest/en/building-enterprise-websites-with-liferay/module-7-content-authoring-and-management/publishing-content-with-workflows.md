---
uuid: 1f1df919-03ad-4743-a53f-120bdd93e56e
---
# Publishing Content with Workflows

In the previous sections, you learned about the tools Liferay provides for managing digital assets and web content, and you put some of them to use in enhancing Clarity's enterprise marketing website. However, Clarity's recent growth means that managing this website is no longer an isolated project for a small team or an individual. Rather, it is a complex undertaking that spans multiple departments and internal stakeholders within the organization. As such, Clarity needs standardized approval processes and means for publishing an increasing volume of content and collaborating among its disparate teams.

## Publishing Tools

<!--TODO: Touch on staging a little bit more  -->

While traditional staging with Liferay can address basic requirements, publications is an advanced and flexible solution for collaborative content management with granular control over publishing. Rather than duplicating content and maintaining two separate datasets, publications work with versioned records. Sets of changes are grouped into a publication. Each publication exists independently and can be permissioned with role-based access control. These are some of the features of publications that satisfy Clarity's business requirements:

- Version control system that allows branching, merging, and tracking changes

- Better collaboration and communication by creating teams with discrete roles for users

- Flexible publishing and streamlined workflow with draft versions, approvals, and scheduling of individual items or entire sets of changes

- Best suited for complex sites with frequent changes managed by multiple teams

- Reliable rollback when human error occurs and reversion is necessary.

Publications are ideal when there are frequent changes involving multiple departments that must be published at different times. For their enterprise marketing website, Clarity chooses publications over staging as their collaboration and publishing solution.

## Workflows

Workflows ensure that changes go through the right gates during the publishing process. Liferay ships with a *Single Approver* workflow out of the box that requires a second set of eyes on your work. In addition to this basic workflow, Liferay provides a visual designer that you can use to define your own custom workflows.

Workflows can be associated with different asset types so you don't have to use the same approval process for everything. This flexibility also allows you to assign different workflows to different individuals or teams within your organization. Both staging and publications can accommodate approvals through workflows.

These are some of the features that make workflows a critical part of publishing and governing content with Liferay:

- Automate repetitive tasks like approvals, notifications, and content routing to save time

- Reduce the risk of human error from manual processes with automated steps and rules

- Assign specific tasks and approvals to designated users, clarifying roles and responsibilities and creating transparency throughout the process

- Improve communication by automating notifications that keep stakeholders informed about progress and status

- Improve review processes with structured feedback loops

- Build flexible solutions by customizing workflows for your specific needs

- Integrate workflows seamlessly with other Liferay features, including headless APIs

<!--Exercise 16a-->
## Exercise: Configuring Publications and Workflow for Content

You can leverage Publications with Workflow to implement robust publishing processes for site and content changes. Here you'll enable publications and configure a single approver workflow for any new articles published to Clarity’s website as Ian Miller.

To do this,

1. Sign in as Ian Miller.

   * Username: `ian.miller@clarityvisionsolutions.com`
   * Password: `learn`

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Applications* tab, and click *Publications*.

1. Toggle *Enable Publications* and click *Save*. This redirects to the publications page.

1. Click *Add* (![Add Button](../../images/icon-add.png)) to create a new publication.

   Alternatively, you can click the *Publications* drop-down menu at the top of the page and select *Create New Publication*.

1. Enter the name `Article Publication` and click *Create*.

1. Return to *Clarity Public Enterprise Website*.

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and click *Web Content*.

1. In the Web Content tab, click *Actions* (![Actions Button](../../images/icon-actions.png)) for the Articles folder and select *Edit*.

1. Navigate to the Structure Restrictions and Workflow section and select *Set the default workflow for the folder’s content (Articles)*.

1. Select the *Single Approver* option and click *Save*.

   ![The Single Approver workflow will be assigned to the Articles folder.](./publishing-content-with-workflows/images/01.png)

You have set up a publication for tracking changes to Clarity's article web content, along with a workflow for approving new articles before they are published to the production site.

Next, let's learn how to invite other users to work on the publication you created.

### Inviting Users and Assigning Roles in a Publication

The Publications application has an option to invite users to collaborate in a publication. These users can be invited even if they don't have Publications permissions assigned to them.

Here you'll invite Christian Carter and Clara Murphy to work on the Article Publication process as Ian Miller.

To do this,

1. Go to the *Publications* application in the Global Menu.

1. Click *Actions* (![Actions Button](../../images/icon-actions.png)) for Article Publication and select *Invite Users*.

1. In the Invite Users panel, enter the email `christian.carter@clarityvisionsolutions.com`.

1. Use the roles drop-down to add Christian Carter as an Editor.

1. Repeat steps 3-4 to invite Clara Murphy using these values:

   | Email                                     | Role      |
   |-------------------------------------------|-----------|
   | `clara.murphy@clarityvisionsolutions.com` | Publisher |

   ![Invite Christian Carter and Clara Murphy to the Article Publication.](./publishing-content-with-workflows/images/02.png)

1. Click *Send* and click *OK* when prompted.

Great! Now Christian Carter and Clara Murphy can contribute to the publication. Next, you'll impersonate them and go through the publishing workflow.

<!--Exercise 16b-->
## Exercise: Managing Changes with a Content Publishing Workflow

Publications provides a convenient way to manage changes to your Liferay instance. With it, you and your team can create and collaborate on blocks of changes called ‘publications’. You can then publish those changes to production when ready.

In this exercise you'll add a new article as Christian Carter, then review it with the single approver workflow and push the changes to production as Clara Murphy. These changes will be done in the Article Publication process.

### Creating and Submitting a New Article to the Workflow

Here you'll create a new article and submit it for approval as Christian Carter.

To do this,

1. Sign in as Christian Carter.

   * Username: `christian.carter@clarityvisionsolutions.com`
   * Password: `learn`

   Note that the publications menu now appears at the top of the page and a new notification for the publication invitation was received.

   ![The publications menu appears and a new notification was received.](./publishing-content-with-workflows/images/03.png)

1. Click the user profile icon, go to *Notifications*, and select the publications invitation.

   ![The invitation notification appears in the notification queue.](./publishing-content-with-workflows/images/04.png)

   This opens the details menu for the Article Publication.

1. Click the *Publications* drop-down menu at the top of the page, click *Select a Publication*, and choose *Article Publication*.

1. Back in your Clarity website, open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and click *Web Content*.

1. Click into the *Articles* folder and click *New* &rarr; *Article*.

1. Enter these values:

   | Field    | Value                                                                                                                  |
   |:---------|:-----------------------------------------------------------------------------------------------------------------------|
   | Title    | Clarity x Warby Parker                                                                                                 |
   | Image    | *Asset Library* &rarr; *Marketing Assets* &rarr; `revolutionizing_industry`                                            |
   | Headline | Summer 2024 Collaboration                                                                                              |
   | Content  | Eyewear enthusiasts rejoice! Fan favorites Clarity and Warby Parker have joined forces for a collaborative collection. |

1. Click *Submit for Workflow*.

Great! You just created a new article and submitted it for review in the Article Publication. Next, you'll learn how to approve and publish changes.

### Reviewing Content in a Workflow and Publishing a Publication

Here you'll finish reviewing the article and pushing all changes to production as Clara Murphy, Christian Carter's manager.

To do this,

1. Sign in as Clara Murphy.

   * Username: `clara.murphy@clarityvisionsolutions.com`
   * Password: `learn`

   The publications menu now appears at the top of the page and two new notifications for the publication invitation and review request were received.

   ![The invitation and review request notifications appear in the menu.](./publishing-content-with-workflows/images/05.png)

1. Click the *Publications* drop-down menu at the top of the page, click *Select a Publication*, and choose *Article Publication*.

1. Click the *Article Publication* menu at the top of the page and select *Review Changes*. You will be redirected to the publication page with a log of changes.

   Alternatively, you can navigate to *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) &rarr; *Applications* &rarr; *Publications*.

1. Click *Publish* to try and save the changes. This action will fail because the workflow that you implemented as Ian Miller requires an approval before publication.

   ![The action will fail if any changes are pending.](./publishing-content-with-workflows/images/06.png)

1. Click the user profile icon and go to *My Workflow Tasks*.

1. Switch to the *Assigned to My Roles* tab to see the pending workflow task.

1. Click *Actions* (![Actions Button](../../images/icon-actions.png)) for the workflow task and select *Assign to Me*. You may optionally add a message before confirming the approval.

1. Click *Done* in the pop-up window to assign the task to yourself. This redirects you to the *Assigned to Me* tab.

1. Click *Actions* (![Actions Button](../../images/icon-actions.png)) again and select *Approve*. You can also add a message before confirming.

1. Click *Done* to approve the article.

1. Return to *Review Changes* for the publication. The status of the change is now `Approved`.

1. Click *Publish*, verify there are no conflicts, and click *Publish* again to add the changes to production.

   ![You can publish the publication if there are no conflicts.](./publishing-content-with-workflows/images/07.png)

Great! You've successfully used workflow with publications to review and publish a web content article.

## Conclusion

This concludes *Publishing Content with Workflows*.

Up Next: [Personalizing Experiences for Clarity’s Users](./personalizing-experiences-for-claritys-users.md)

<!-- TODO: Add Additional Resources section. -->
