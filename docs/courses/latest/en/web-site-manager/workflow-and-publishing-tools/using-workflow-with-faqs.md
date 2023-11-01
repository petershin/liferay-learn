---
uuid: 4d2bce66-7c41-423a-9cf8-9a01817e53eb
---
# Using Workflow with FAQs

<!-- Approving FAQs with Workflow could be a better title -->

<!-- Some configuration might be done first: Move the FAQs article into a folder called FAQs, configure the folder to restrict it to FAQs and use the single approver workflow.

WARN: If you configure the root folder with Reject Everythign, by default all other folders you create will inherit this. You must set the restrictions/workflow on each subfolder. -->

1. Log in a Preston Palmer, the site administrator.

   **Email Address:** preston.palmer@liferay.com

   **Password:** learn

1. Open the _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) then click _Configuration_ &rarr; _Workflow_.

1. Scroll down to Web Content Article and click _Edit_.

1. Choose _Single Approver_ and click _Save_.

   ![Use the single approver workflow with web content articles.](./using-workflow-with-faqs/images/01.png)

To create the FAqs, log in as the content creator, Rex Randle.
<!-- Content creator or some sort of customer advocate? Receives the emails that come to hello@clarityvisionsolutions.com. This is a new user to add to the site initializer. -->

1. Log in a Rex Randle, the custom advocacy specialist who fields customer questions at the `hello@claritvisionsolutions.com` email address (visible in the footer of the site).

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

1. Click *Submit for Publication* at the top of the page.

   The button used to say _Publish_, but it changes when workflow is enabled.

You can see that the content is in the workflow, as it's marked as Pending in the administrative UI. It's also marked as Approved, because the first version of the article, before your recent edits, is available for publication. The Pending status means that the item is going through the workflow, and unless an approved version is available, it won't be searchable or shown in the UI to most users.

![Because an approved version of the content is available, the Approved and Pending statuses are displayed for the FAQ.](./using-workflow-with-faqs/images/03.png)

The content manager, Olivia O'Neal, must review the content. 

1. Log in as Olivia O'Neal

1. On the home page, click the user avatar and select _My Workflow Tasks_.

   All workflow tasks assigned directly to a user are listed in the My Workflow Task widget's _Assigned to Me_ tab.

1. To claim a task, click the _Assigned to My Roles_ tab.

1. Click the asset's _Actions_ button (![Actions](../../images/icon-actions.png)) and select _Assign to Me_.

   ![Assign the content to Olivia O'Neal.](./using-workflow-with-faqs/images/04.png)

1. Enter the comment _I'll take this one--Olivia_ in the Comment text field, then click _Done_.

   Now the task appears in _Assigned to Me_ for Olivia.

Once the task is assigned the review can happen:

1. Click the name of the pending _Clarity Site FAQs_ in My Workflow Tasks. There is a preview of the FAQ and the review status. The preview barely shows anything, so Olivia needs to look at it more closely:

   ![The preview page is useful but too much content is clipped.](./using-workflow-with-faqs/images/05.png)

1. Click _View Diffs_ (![Diff](../../images/icon-diff.png)).

   ![The diff view shows you what changed.](./using-workflow-with-faqs/images/06.png)

1. Review what changed, then close the popup window.

1. Click the _Actions_ button (![Actions](../../images/icon-actions.png)) and select _Approve_.

1. Enter the comment _Looks good!_ and click _Done_.

Since the submission is approved and there is only one reviewer in the Single Approver workflow, the task is moved to the Completed section of the Assigned to Me tab. The asset is published and viewable on the Clarity Site FAQs display page.

![The added FAQ is published on the Clarity Site FAQs display page.](./using-workflow-with-faqs/images/07.png)


<!--
New FAQ options:

Bad FAQ to reject:
**Question:** I was emailed a coupon code from a Nigerian Prince. Is it legit?
**Answer:** There's only one way to find out. Click on any links in the email and see what happens!

Good FAQ (approve)
**Question:** Can I order just a single lens? 
**Answer:** Not right now, but stay tuned. We plan to offer monocles in the future, and at that point we will also sell single lenses.
-->
