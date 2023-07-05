# Importing Fragments for the Distributor Application Pages

Published objects are integrated with Liferay's core frameworks, so you can map page fragments to object entries, such as form fragments and the Collection Display fragment. Here you'll import pre-configured fragment compositions for use in distributor application pages.

1. Download the Distributor Application fragments ZIP:

   ```bash
   curl https://learn.liferay.com/courses/latest/en/application-development/designing-user-interfaces/importing-fragments-for-the-distributor-application-pages/distributor-application-fragment-set.zip -O
   ```

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and click *Fragments*.

1. Click the *Actions* button for Fragment Sets and select *Import*.

   ![Click the Actions button for Fragment Sets and click Import.](./importing-fragments-for-the-distributor-application-pages/images/01.png)

1. Select the `distributor-application-fragment-set.zip` file and click *Import*.

   ![Select the distributor-application-fragment-set.zip file and click Import.](./importing-fragments-for-the-distributor-application-pages/images/02.png)

1. Confirm the Distributor Application fragments imported successfully. This set should include four fragments:

   * Form Page
   * Success Page
   * Overview Page
   * Display Page

   ![Confirm the Distributor Application fragments imported successfully.](./importing-fragments-for-the-distributor-application-pages/images/03.png)

Now that you've imported the fragments, you can use them to incorporate Distributor Application features and data into your pages. Begin with building the submission form.

Next: [Adding the Form to the Apply Page](./adding-the-form-to-the-apply-page.md)

## Relevant Concepts

* [Displaying Object Entries](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/displaying-object-entries)
* [Using Fragments to Build Forms](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/using-fragments-to-build-forms)
