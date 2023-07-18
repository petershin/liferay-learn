# Adding Details to the Success Page

When users submit a distributor application, the success page appears: Application Submission. Currently, this page only includes a banner image. Delectable Bonsai wants to

* Display basic information for the new application
* Provide links for viewing and editing the application

1. Navigate to the Application Submission page and click *Edit* (![Edit Button](../../images/icon-edit.png)).

   ![Navigate to the Application Submission page.](./adding-details-to-the-success-page/images/01.png)

1. Drag and drop the *Success Page* fragment into the empty container at the bottom of the page.

   ![Drag and drop the Success Page fragment into the empty container](./adding-details-to-the-success-page/images/02.png)

   This composition includes a Collection Display fragment that uses the Distributor Application's collection provider. The Collection Display also includes sub-fragments that are mapped to these Distributor Application fields:

   * Business Name
   * ID
   * Creation Date
   * Application State

   ![The Collection Display fragment is configured to use the Distributor Application's collection provider.](./adding-details-to-the-success-page/images/03.png)

   Users can also click View Your Application to access its display page or Edit Your Application to access the applications overview page.

1. Click *Publish*.

Great! Now when users see this success page, it is populated with data from their application. Additionally, they can view or edit their application.

Presently, there is no display page for distributor applications, so clicking View Your Application doesn't lead anywhere. You'll fix that next.

Next: [Creating a Display Page for Distributor Applications](./creating-a-display-page-for-distributor-applications.md)
