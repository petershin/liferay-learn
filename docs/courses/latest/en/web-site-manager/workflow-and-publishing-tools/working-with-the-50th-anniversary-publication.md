---
uuid: 2b57d2ab-0644-431a-980e-0698ce7dbf9a
---
# Working in the 50th Anniversary Publication

The publication template is in place for Clarity's special events. Now the publication administrator will create the publication, enabling the publication editors to begin working on its content.

1. Log in with Preston Palmer, a publication administrator in the template and the site administrator:

   **Email Address:** preston@clarityvisionsolutions.com

   **Password:** learn

1. In the publications bar, click _Create New Publication_.

   ![You can add a publication from the publications bar.](./working-with-the-50th-anniversary-publication/images/01.png)

1. Replace the name with _50th Anniversary_.

1. Click _Create_.

   Preston is working in the new publication automatically after it's created.

   ![The site is ready for editing in the selected publication.](./working-with-the-50th-anniversary-publication/images/02.png)

## Working on the 50th Anniversary Changes

1. Sign in with Rex Randle. Rex has web content creation permission due to his job, Customer Advocacy Specialist.

   **Email Address:** rex@clarityvisionsolutions.com

   **Password:** learn

1. Open the _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) then click _Content & Data_ &rarr; _Web Content_, and click the _Events_ folder.

1. Click _New_ &rarr; _Event_ and specify

   * Title: _Clarity is Turning 50!_
   * Summary: _Clarity is turning 50, so let's celebrate!_
   * Body: _Check out our limited-time only frames! Clarity turned 50, and we're excited to offer these frames while they last._
   * Banner Image: Select the _clarity-special-frames_ image.

1. Click _Submit for Workflow_.

1. Let's see what this looks like in the ongoing publication. Log in again with Preston Palmer, the publication administrator. Open the _Review Changes_ screen from the publications bar.

   ![The web content for the 50th anniversary event is pending in the workflow.](./working-with-the-50th-anniversary-publication/images/03.png)

1. Click _Publish_.

   ![The changes cannot be published until the workflow items are resolved.](./working-with-the-50th-anniversary-publication/images/04.png)

   You cannot publish the changes until the items in the workflow are first reviewed.

The content manager, Olivia O'Neal, must first review Rex's new content within the publication.

1. Log in as Olivia O'Neal.

   **Email Address:** olivia@clarityvisionsolutions.com

   **Password:** learn

1. If it's not already selected in the publications bar, select the 50th Anniversary publication. Open the publications bar and click _Select Publication_.

1. Go to the review screen for the publication, click the user avatar, and select _My Workflow Tasks_.

   ![Workflow reviewers use My Workflow Tasks to manage workflow items.](./working-with-the-50th-anniversary-publication/images/05.png)

   All workflow tasks assigned directly to a user appear in the My Workflow Task widget's Assigned to Me tab.

1. Click _Assigned to My Roles_.

   Workflow tasks that Olivia O'Neal can claim because she's part of a role defined in the workflow appear here. 

1. Click the asset's _Actions_ button (![Actions](../../images/icon-actions.png)) and select _Assign to Me_.

1. Enter the comment _I'll take this one--Olivia_ in the Comment text field, then click _Done_.

   Now the task appears in Assigned to Me.

Once the task is assigned the content review proceeds:

1. Click the name of the pending _Clarity is Turning 50!_ item in My Workflow Tasks. A preview appears, with the review status.

1. Click _Preview_ (![Preview](../../images/icon-preview.png)) to see the event:

   ![Preview the content before approving.](./working-with-the-50th-anniversary-publication/images/06.png)

1. Click the back arrow, then click _Actions_ (![Actions](../../images/icon-actions.png)) and select _Approve_.

1. Enter the comment _Looks good!_ and click _Done_.

Since the submission is approved and there is only one reviewer in the Single Approver workflow, the task is moved to the Completed section of the Assigned to Me tab. The event can now be published with the other content in support of the 50th anniversary event.

## Updating the Master Page in the Publication

Olivia O'Neal is a publication editor as configured in the template, so she can continue working in the publication. First, a new announcement fragment is needed:

1. Go to _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) &rarr; _Design_ &rarr; _Fragments_.

1. Find _J2B6 Announcement_ and click _Actions_ (![Actions](../../images/icon-actions.png)) &rarr; _Make a Copy_.

1. Find _J2B6 Announcement (Copy)_ and click _Actions_ (![Actions](../../images/icon-actions.png)) &rarr; _Rename_.

1. Rename it to _50th Anniversary Announcement_.

1. Click the fragment to open the editor. Edit the HTML:

   * Replace the entire line that has the text "Save an average of $100 with vision insurance!" with this: 

       ```html
         <span data-lfr-editable-type="text" data-lfr-editable-id="text">Learn about our 50th Anniversary limited time only frames!</span>
      ```

   * On the next line, change the text `Learn How` to `Learn More`.

1. Click _Publish_.

Next, the announcement fragment in the master page must be replaced with the new one. Within the 50th Anniversary publication,

1. Open the site's master page, _Clarity MP_.

1. In the header, delete the _J2B6 Announcement_. In its place add _K3C7 50th Anniversary Announcement_.

1. Publish the master page, then open the publications bar and click _Review Changes_. The new fragment being added to the master page is tracked.

   ![A new announcement fragment is being added in the publication.](./working-with-the-50th-anniversary-publication/images/08.png)

1. Go to _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) &rarr; _Content & Data_ &rarr; _Web Content_.

1. Click _New_ &rarr; _Event_ and specify

   * Title: _Clarity is Turning 50!_
   * Summary: _Clarity is turning 50, so let's celebrate!_
   * Body: _Check out our limited-time only frames! Clarity turned 50, and we're excited to offer these frames while they last._
   * Banner Image: Select the _clarity-special-frames_ image.

1. Go to _Site Menu_ (![Site Menu](../../images/icon-product-menu.png)) &rarr; _Site Builder_ &rarr; _Navigation Menus_ and click _Clarity Navigation Menu_.

1. Add an item to the More submenu for the event you just created by clicking _Add Child_ &rarr; _Web Content Article_ &rarr; _Clarity is Turning 50!_.

   ![Add the web content article to the navigation menu.](./working-with-the-50th-anniversary-publication/images/09.png)

Now the content is ready for the 50th anniversary!

Next: [publish the content for the event](./publishing-the-50th-anniversary-content.md)

## Relevant Concepts

* [Making and Publishing Changes](https://learn.liferay.com/w/dxp/site-building/publishing-tools/publications/making-and-publishing-changes)
* [Using Workflow with Publications](https://learn.liferay.com/w/dxp/site-building/publishing-tools/publications/using-workflow-with-publications)
* [Resolving Conflicts](https://learn.liferay.com/w/dxp/site-building/publishing-tools/publications/resolving-conflicts)
