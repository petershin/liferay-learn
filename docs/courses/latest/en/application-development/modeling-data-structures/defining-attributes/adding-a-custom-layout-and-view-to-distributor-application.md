# Adding a Custom Layout and View to Distributor Application

When you published the Distributor Application object, Liferay created a default [layout](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/layouts) and [view](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/views). The layout provides a UI for creating and editing object entries, while the view provides a UI for viewing and managing existing entries. Here you'll use cURL scripts to create a custom layout and view.

```{note}
Subsequent lessons will explore how to design engaging, responsive user interfaces with Liferay's page builder features. Object custom layouts and views are only used here during development.
```

## Adding the Layout and View

1. Download and unzip the resources for [this exercise](./liferay-t7z2.zip).

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/modeling-data-structures/defining-attributes/adding-a-custom-layout-and-view-to-distributor-application/liferay-t7z2.zip -O
   ```

   ```bash
   unzip liferay-t7z2.zip
   ```

   This ZIP file includes shell scripts that use the `object-admin` REST APIs to add a layout and view to the Distributor Application object.

1. Navigate to `liferay-t7z2/curl`.

   ```bash
   cd liferay-t7z2/curl
   ```

1. Run this script to add the layout:

   ```bash
   ./ObjectLayout_POST_BasicLayout_ByExternalReferenceCode.sh
   ```

1. Verify Basic Layout appears in the Layouts tab for the Distributor Application object.

   ![Verify Basic Layout appears in the Layouts tab for the Distributor Application object.](./adding-a-custom-layout-and-view-to-distributor-application/images/01.png)

   The layout includes two tabs and organizes the fields into collapsible blocks:

   * The first tab is available during entry creation includes six sections: General Details, Contact Information, Business Details, Business Address, Additional Business Info, and Attachments.

   * The second tab is only available when editing an existing application and includes two sections: Bank Details and Credit Reference Details.

   ![The layout organizes fields into two tabs.](./adding-a-custom-layout-and-view-to-distributor-application/images/02.png)

1. Add the view:

   ```bash
   ./ObjectView_POST_BasicView_ByExternalReferenceCode.sh
   ```

1. Verify Basic View appears in the Views tab for the Distributor Application object.

   ![Verify Basic View appears in the Views tab for the Distributor Application object.](./adding-a-custom-layout-and-view-to-distributor-application/images/03.png)

   The view includes five columns: ID, Applicant Name, Business Name, Create Date, Status.

   ![The view includes five columns: ID, Applicant Name, Business Name, Create Date, Status.](./adding-a-custom-layout-and-view-to-distributor-application/images/04.png)

Since the custom layout and view are marked as default for Distributor application, they are active immediately.

## Using the Custom Layout and View

Practice creating entries in the Distributor Application object to verify the object is using the new layout and view.

* Layout:

   ![The layout includes two tabs and organizes the fields into collapsible blocks.](./adding-a-custom-layout-and-view-to-distributor-application/images/05.png)

* View:

   ![The view defines a table with five columns.](./adding-a-custom-layout-and-view-to-distributor-application/images/06.png)

So far you've added all the fields and picklists Delectable Bonsai needs for following KYC policies, complying with AML laws, and weighing the prospective value of each application.

Now Delectable Bonsai needs a way to store evaluation notes and relate them to specific applications. This is where object relationships come in.

Next: [Defining Relationships](../defining-relationships.md)

## Relevant Concepts

* [Layouts](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/layouts)
* [Views](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/views)
