---
taxonomy-category-names:
- Platform
- Staging
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 1c97241d-4b80-4c13-b7b5-ab2f3fe8fac5
---

# Site Staging UI Reference

After enabling Local or Remote Live Staging for your site, most page configuration options are only accessible in your Staging environment. This prevents users from directly editing live pages.

Once Staging is enabled, additional options appear in your Staging environment. These options are in the Staging Bar, Publish to Live menu, and Staging page.

## Staging Bar and Editing Tools

When Staging is enabled for a site, you can access additional options via the staging bar on each of your site's pages. In this bar, you can toggle between Staging and Live environments and click *Publish to Live* for staged pages.

![When Staging is enabled for a site, you can access the staging bar on each of your site's pages.](./site-staging-ui-reference/images/01.png)

The following table and pictures describe the Staging Bar options and editing tools for widget pages:

| Option | Widget Page | # |
| :--- | :--- | :--- |
| *Site Pages Variation* | <ul><li>Toggle between variations of page sets in your staged site using the drop-down menu.</li><li>Manage and create page set variations by clicking *Actions* in the Staging Bar and selecting *Site Pages Variation*. See [Page Versioning](./page-versioning.md) for more information.</li></ul> | 1 |
| *Page Variations* | <ul><li>Toggle between variations of a single page in your staged site using the drop-down menu.</li><li>Manage and create page variations by clicking *Actions* in the Staging Bar and selecting *Page Variations*. See [Page Versioning](./page-versioning.md) for more information.</li></ul> | 2 |
| *Undo/Redo* | <ul><li>Click *Actions* in the Staging Bar and select *Undo*/*Redo*.</li><li>Once you've marked a page as *Ready for Publish Process*, you can't undo or redo recent changes.</li></ul> | 3 |
| *History* | <ul><li>Manage the page revision history by clicking *Actions* in the Staging Bar and selecting *History*.</li><li>Revert a page to an earlier version by clicking *Actions* for the page version you want to restore and selecting *Mark as Ready for Publishing Process*.</li></ul> | 4 |
| *Ready for Publish Process* | <ul><li>Click *Ready for Publish Process* to change the page's status from *Draft* to *Ready for Publish Process*.</li><li>Click *Publish to Live* to configure and initiate publishing for your changes.</li><li>When you publish a page to Live, only the version marked as *Ready for Publish Process* is published.</li></ul> | 5 |
| Edit Content | Use the *Add* button in the Liferay application bar to edit your Widgets. | 6 |

![Use the Staging Bar and editing tools in widget pages.](./site-staging-ui-reference/images/02.png)

## Publish to Live

When you click *Publish to Live*, a modal window appears with additional options for configuring your publish process. You can publish using *Simple* or *Advanced* settings.

![Click Publish to Live to access the publishing modal window.](./site-staging-ui-reference/images/03.png)

!!! warning
    It is recommended to publish small incremental changes to avoid large publishing processes that can take a long time to execute.

## Simple Publishing

**Name**: Enter a descriptive name for your publish process into the *Name* field.

**Changes Since Last Publish Process**: View staged changes made since your last publish process.

**Pages to Publish**: View the number of pages included in your current publish process.

!!! note
    This displays the number of page deletions tracked by the Staging framework. This number counts the page deletions on the staged site, not how many pages are deleted on the live site. There can be inconsistency between the number of page deletions to be published and the actual number of pages present on either of the staged and live sites.

When ready, click *Publish to Live* to initiate publishing.

![Click Publish to Live to initiate publishing.](./site-staging-ui-reference/images/04.png)

## Advanced Publishing

With Advanced publishing, you can access information and settings that you can use to customize your publish process. In the *Custom* tab, you can specify content, dates, pages, and more. Alternatively, click the *Publish Template* tab to select a pre-configured template for your publish process. To access the advanced settings, click *Switch to Advanced Publish Process* in the modal window.

![Use advanced setting to customize your publishing process.](./site-staging-ui-reference/images/05.png)

Custom advanced settings are divided into the following sections:

**Name**: Enter a descriptive name for your publish process into the *Name* field.

**Date**: Select whether to publish your changes immediately, or *schedule* your changes to be published at a later date and time. You can also determine whether and how frequently the publish process is repeated.

![Select when to publish your changes.](./site-staging-ui-reference/images/06.png)

**Deletions**: Select whether you want to *Delete Application Data Before Importing*, and whether you want to *Replicate Individual Deletions*.

![Select whether you want to Delete Application Data Before Importing and whether you want to Replicate Individual Deletions.](./site-staging-ui-reference/images/07.png)

**Pages**: Select which page set variation and individual pages to publish, as well as the look and feel of your selected pages. You can also select *Delete Missing Pages*, which deletes all pages from the live site that are not present on the staged site. If you choose a page to be published from the pages menu, the widgets and their references are always published.

![Select which page set variation and individual pages to publish, as well as the look and feel of selected pages.](./site-staging-ui-reference/images/08.png)

If you want to publish pages with a custom theme, you must check the Theme Settings option under the *Look and Feel* heading for your staging configuration. Otherwise, the default theme is applied.

**Content**: Select the content you want to include in your publish process. Using the radio buttons, you can publish *all* content of the selected types, or specify a date and time parameter to limit the content published. You can also use this option to check the content that changed in Staging and is awaiting publication.

![Select the content you want to include in your publish process.](./site-staging-ui-reference/images/09.png)

| Option | Description |
| :--- | :--- |
| *All* | Shows all the content available for publication. |
| *From Last Publish Date* | Only shows the content updated since the last publication. |
| *Date Range* | Shows the content updated during a specific period of time. |
| *Last* | Shows the content updated in the last hours or days. |

!!! note
    After selecting your Content option, click *Refresh Counts* to update the number of results.

You can also click *Change* for each content type to manage items and other settings included in each type, such as *version history*, *vocabularies*, *previews and thumbnails*, and the *referenced content behavior*. See [Managing Data and Content Types in Staging](./managing-data-and-content-types-in-staging.md) for more information.

!!! important
    By default, content displayed using the following widgets is always included in publishing processes: Dynamic Data Lists Display, Form, Web Content Display, and Wiki Display. For Liferay DXP/Portal 7.4+, you can disable this behavior so that displayed content is only published when explicitly included in the publishing process's configuration. See [Configuring Automatic Publishing of Displayed Content](./configuring-automatic-publishing-of-displayed-content.md) for more information.

**Permissions**: Select whether to include permissions for the pages and widgets when your changes are published.

![Select whether to include permissions for the pages and widgets when your changes are published.](./site-staging-ui-reference/images/10.png)

Instead of configuring advanced options manually every time you publish a page or content, you can save your staging configuration as a [*publish template*](#publish-templates) for future use. To view and select a saved template for your publish process, click the *Publish Templates* tab.

![To view and select a saved template for your publish process, click the Publish Templates tab.](./site-staging-ui-reference/images/11.png)

When ready, click *Publish to Live* to initiate publishing.

## Staging Page

Once you've enabled Staging, the options available from the *Publishing* tab are modified. When in the Live environment, you can only access the *Export* feature. When in the Staging environment, you can only access the *Import* and *Staging* features.

You can also access new options in the Staging page: view publishing processes, create and manage publish templates, and modify or disable Staging for your site.

![You can also access new options in the Staging page.](./site-staging-ui-reference/images/12.png)

### Previous and Future Publishing Processes

When you publish with Staging, it's captured as a *process* and stored for future reference. To view and manage these processes, go to *Site Menu* &rarr; *Publishing* &rarr; *Staging*.

In the *Processes* tab is a list of staging processes that have been completed. From here, you can *relaunch*, *clear* or view a *summary* of any previous publications by clicking a process's *Actions* button (![Actions button](../../../images/icon-actions.png)).

![View and manage previous publishing processes from the Staging page.](./site-staging-ui-reference/images/13.png)

You can also click *Add* (![Add button](../../../images/icon-add.png)) to create a new publish process using a custom configuration or pre-defined publishing template.

In the *Scheduled* tab, you can view all scheduled publishing processes.

### Publish Templates

If you regularly create similar staging configurations, you can create your own publish templates to save time. To create a template, click *Actions* (![Actions button](../../../images/icon-actions.png)) in the *Application* bar of the *Staging* page. Then select *Publish Templates*.

![Click Actions in the Application bar of the Staging page.](./site-staging-ui-reference/images/14.png)

From here, you can create and manage templates for frequent publishing configurations. You can then use a template by clicking its *Actions* button (![Actions button](../../../images/icon-actions.png)) and selecting *Publish*.

![Create and manage templates for frequent publishing configurations.](./site-staging-ui-reference/images/15.png)

You can use a template when publishing a page or content using the *Publish to Live* button in the Staging Bar. See [Advanced Publishing](#advanced-publishing) for more information.

### Staging Configuration

After setting up Staging, you can access the Staging Configuration page by clicking *Actions* (![Actions button](../../../images/icon-actions.png)) in the *Application* bar of the *Staging* page. Then, select *Staging Configuration*.

![Click Actions in the Application bar of the Staging page to access the Staging Configuration.](./site-staging-ui-reference/images/16.png)

From here, you can disable Staging for your site, or modify your [page versioning](page-versioning.md) settings. However, *Staged Content* options cannot be modified after the initial setup.

## Related Topics

- [Staging Overview](../staging.md)
- [Understanding the Publishing Process](./understanding-the-publishing-process.md)
- [Page Versioning](./page-versioning.md)
- [Managing Data and Content Types in Staging](./managing-data-and-content-types-in-staging.md)
