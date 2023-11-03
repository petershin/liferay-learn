---
uuid: 4d2bce66-7c41-423a-9cf8-9a01817e53eb
---
# Using Workflow with FAQs

<!-- Approving FAQs with Workflow could be a better title -->

<!-- Some configuration might be done first: Move the FAQs article into a folder called FAQs, configure the folder to restrict it to FAQs and use the single approver workflow.

WARN: If you configure the root folder with Reject Everything, by default all other folders you create will inherit this. You must set the restrictions/workflow on each subfolder. Does this warning go in this article or in the introductory article? -->

Clarity's initial site is in place and the first pieces of [content were added](../creating-content.md) by the content manager directly. It's time for other users to begin creating content for Clarity. To aid this effort, review processes are required to ensure the quality and consistency of published content. Liferay's workflow processes allow just such reviews. Clarity wants its customer advocacy specialist, Rex Randle, to turn common customer questions into FAQ entries, published after review and approval by the content manager, Olivia O'Neal. Preston Palmer, the site administrator, can manage workflows in the site to set this up.
<!-- Too much info, some can be extracted to the introduction, and probably presented as a table -->

1. Log in as Preston Palmer, the site administrator.

   **Email Address:** preston.palmer@liferay.com

   **Password:** learn

1. Open the _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) then click _Configuration_ &rarr; _Workflow_.

1. Scroll down to Web Content Article and click _Edit_.

1. Choose _Single Approver_ and click _Save_.

   ![Use the single approver workflow with web content articles.](./using-workflow-with-faqs/images/01.png)

Now all web content articles added in the site will go through a review process as defined by the Single Approver workflow definition. Create a new FAQ to see how it works:
<!-- Content creator or some sort of customer advocate? Receives the emails that come to hello@clarityvisionsolutions.com. This is a new user to add to the site initializer. -->

1. Log in as Rex Randle, the custom advocacy specialist who fields customer questions at the `hello@claritvisionsolutions.com` email address (visible in the footer of the site).

   **Email Address:** rex.randle@liferay.com

   **Password:** learn

1. Open the _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) then click _Content & Data_ &rarr; _Web Content_.

   <!--Assumes that the FAQs article already exists-->
1. Click the _Clarity Site FAQs_ article to open it for editing, and scroll to the last field group:

1. Click _Add FAQ_ (![Add](../../images/icon-add.png)) on the last field group:

   ![Add a new field group to the FAQ to add a new questions and answer.](./using-workflow-with-faqs/images/02.png)
1. In the newly appearing FAQ, enter this question:

   ```
   How can I send you my prescription?
   ```

1. Enter the answer:

   ```
   Scan or photograph it, then send it to hello@claritvisionsolutions.com
   ```

1. Click *Submit for Workflow* at the top of the page.

   The button used to say _Publish_, but it changes when workflow is enabled.

The content is in the workflow, marked as _Pending_ in the administrative UI. It's also marked as _Approved_, because the first version of the article, before Rex's recent edits and before workflow was even enabled, is available and published on the FAQs display page. The pending status means that the latest version of the item is unavailable for publication on the display page.
<!-- TMI? -->

![Because an approved version of the content is available, the Approved and Pending statuses are displayed for the FAQ.](./using-workflow-with-faqs/images/03.png)

The content manager, Olivia O'Neal, must review Rex's new content. 

1. Log in as Olivia O'Neal.

   **Email Address:** olivia.oneal@liferay.com

   **Password:** learn

   <!--Our custom navigation menu doesn't have my workflow tasks. We'll need to add it or some other way (personal page with link or that uses the regular personal menu? -->
   <!-- Enhance the fragment: if the user has the permissions XXX, show the My Workflow Tasks link in the menu-->
1. On the home page, click the user avatar and select _My Workflow Tasks_.

1. Open the _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) then click _Content & Data_ &rarr; _Web Content_.

   All workflow tasks assigned directly to a user are listed in the My Workflow Task widget's Assigned to Me tab.

1. Click the _Assigned to My Roles_ tab.

   Workflow tasks that Olivia O'Neal can claim because she's part of a role defined in the workflow appear here. 

1. Click the asset's _Actions_ button (![Actions](../../images/icon-actions.png)) and select _Assign to Me_.

   ![Assign the content to Olivia O'Neal.](./using-workflow-with-faqs/images/04.png)

1. Enter the comment _I'll take this one--Olivia_ in the Comment text field, then click _Done_.

   Now the task appears in Assigned to Me.

Once the task is assigned the content review proceeds:

1. Click the name of the pending _Clarity Site FAQs_ item in My Workflow Tasks. A preview of the FAQ appears, with the review status. The preview barely shows anything, so Olivia needs to look at it more closely:

   ![The preview page is useful but too much content is clipped.](./using-workflow-with-faqs/images/05.png)

1. Click _View Diffs_ (![Diff](../../images/icon-diff.png)).

   ![The diff view shows you what changed.](./using-workflow-with-faqs/images/06.png)

1. Review what changed, then close the pop-up window.

1. Click _Actions_ (![Actions](../../images/icon-actions.png)) and select _Approve_.

1. Enter the comment _Looks good!_ and click _Done_.

Since the submission is approved and there is only one reviewer in the Single Approver workflow, the task is moved to the Completed section of the Assigned to Me tab. The asset is published and viewable on the Clarity Site FAQs display page.

![The added FAQ is published on the Clarity Site FAQs display page.](./using-workflow-with-faqs/images/07.png)

<!-- Overkill, or separate article? Should we add events to a folder too, especially if we're adding a workflow that rejects home folder submissions? Should these folders be added in the content module? -->
This simple setup works, but the same workflow is used for all Clarity's web content articles. In reality, Clarity wants FAQs to use one workflow and Events to use another. To accomplish this, some changes are needed:

1. Move the Clarity Site FAQs article into a web content folder.
1. Configure the folder to accept only FAQs and to use its own workflow.
<!--1. Make sure nobody can add FAQs to the root folder. NOTE: this makes it more complicated than we want. The right way to do this is to introduce logic for checking the structure, then sending it through a workflow if it matches. -->
1. Remove the site level workflow configuration.

First create a web content folder for FAQs:

1. Log in as Olivia O'Neal, the content manager.

   **Email Address:** olivia.oneal@liferay.com

   **Password:** learn

1. Open the _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) then click _Content & Data_ &rarr; _Web Content_.

1. Click _Add_ (![Add](../../images/icon-add.png)) &rarr; Folder.

1. Enter the name _FAQs_ and click _Save_.

1. Go back to the root folder, and check the box for _Clarity Site FAQs_.

1. Click _Move_ (![Move](../../images/icon-move-folder.png)), then _Select_.

1. Expand the folders under _Home_ and choose _FAQs_.

1. Click _Move_.

Next, configure the folder to accept only FAQs and configure workflow for the folder:

1. Go into the FAQs folder if you're not already there.

1. Click _Information_ (![Info](../../images/icon-information.png)) to open the folder's information panel.

   ![Open the folder's information panel.](./using-workflow-with-faqs/images/08.png)

1. Click _Actions_ (![Actions](../../images/icon-actions.png)) &rarr; _Edit_, then expand _Structure Restrictions and Workflow_.

1. Select _Define Specific Restrictions and Workflow for This Folder (FAQs)_.

1. Click _Choose Structure_, then click _FAQs_ from the Structures list.

1. For Workflow, select _Single Approver_.

   ![The FAQs folder uses the Single Approver workflow and only allows content with the FAQs structure.](./using-workflow-with-faqs/images/09.png)

   The FAQs folder uses the Single Approver workflow and only allows content with the FAQs structure.

<!-- Would a customer actually do this? I made this up thinking that if you're organizing web content into folders to use different workflows for different types/structures, you'd want to prevent adding web content to the un-workflown home/root folder -->
<!--
Next, prevent users from adding FAQs or other content to the Home folder. Add a workflow that rejects all submissions and notifies the content creator that they must submit content to a folder: 

1. Adding workflow definitions requires access to the control panel. Log in with Kyle Klein, the instance administrator.

   **Email Address:** kyle.klein@liferay.com

   **Password:** learn

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Applications_ &rarr; _Process Builder_ (in the Workflow section).

1. Click _Add_ (![Add ](../../images/icon-add.png)), and the diagram view of the workflow builder appears (see the left side of the below image). If you're running Liferay Community Edition, the source view appears, as on the right in this image:

   ![The FAQs folder uses the Single Approver workflow and only allows content with the FAQs structure.](./using-workflow-with-faqs/images/10.png)

1. Name the workflow _Reject Everything_.
1. Click _Source View_ (![Source](../../images/icon-source-view.png)), then click _Import a file_.

1. Choose the `reject-everything.xml` file from the unzipped `liferay-m4h2.zip` file, then click _Publish_.

   Add the download and unzip instructions
   Without this though, there's absolutely no adding of workflows. Could add one to Liferay Administrator since it's an admin task?

1. Log back in as Olivia O'Neal and configure the Home folder to use the Reject Everything workflow.

1. Test the new workflow by adding an Event web content to the Home folder. After submitting the event for publication, the content is first set to pending. Refreshing the page shows that it was automatically denied:

   ![The content added to the Home folder is auto-denied by the workflow.](./using-workflow-with-faqs/images/11.png)

-->

1. Go to _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) then click _Configuration_ &rarr; _Workflow_. Disable the site level workflow configuration for web content articles.

Now Clarity is using folder-based web content management, where each folder is configured to accept a certain type of content and use a certain workflow. 

<!--
New FAQ options:

Bad FAQ to reject:
**Question:** I was emailed a link to a Clarity coupon code from a Nigerian Prince. Is it legit?
**Answer:** There's only one way to find out. Click on any links in the email and see what happens!

Good FAQ (approve)
**Question:** Can I order just a single lens? 
**Answer:** Not right now, but stay tuned. We plan to offer monocles in the future, and at that point we will also sell single lenses.
-->
