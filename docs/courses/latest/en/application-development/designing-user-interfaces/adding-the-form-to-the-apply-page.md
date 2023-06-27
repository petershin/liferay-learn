# Adding the Form to the Apply Page

<!-- Need dynamic form. Add to site page. Integrate with site design. Make available in the UI. Needs to also Form for submitting applications.

With Liferay objects, this involves adding form fragments to a content page or page template. -->

1. Navigate to the Apply page and click *Edit* (![Edit Button](../../images/icon-edit.png)).

   ![Navigate to the Apply page and click Edit.](./adding-the-form-to-the-apply-page/images/01.png)

1. Drag and drop the *Form Page* fragment into the empty Fragment Elements container at the bottom of the page.

   ![Drag and drop the Form Page fragment into the empty Fragment Elements container.](./adding-the-form-to-the-apply-page/images/02.png)

   This includes a form container that's mapped to the Distributor Application object and its fields. The form organizes form elements into these groups:

   * General Details
   * Primary Contact Information
   * Business Details
   * Business Address
   * Additional Business Information
   * Attachments
   * Submit

   ![The Form Page fragment includes seven containers with fragments already mapped to object fields.](./adding-the-form-to-the-apply-page/images/03.png)

1. Select these fields and mark them as required:

   * Applicant Email
   * Primary Contact Name
   * Primary Contact Email
   * Business Name
   * Business Website
   * Business Phone Number

   ![Mark fields as required.](./adding-the-form-to-the-apply-page/images/04.png)

1. Select these fields and enter a display label for them:

   | Field                            | Label                   |
   |:---------------------------------|:------------------------|
   | Primary Contact Name             | Full Name               |
   | Primary Contact Title            | Title                   |
   | Primary Contact Email            | Email                   |
   | Primary Contact Phone Number     | Phone Number            |

   The provided fragments include display labels for the business, bank, and reference fields.

   ![Enter display labels for fields.](./adding-the-form-to-the-apply-page/images/05.png)

1. Set placeholder text for these fields:

   | Field                        | Placeholder                         |
   |:-----------------------------|:------------------------------------|
   | Primary Contact Phone Number | `e.g., +1 (777) 777-7777`           |
   | Business Website             | `e.g., https://businesswebsite.com` |
   | Business Phone Number        | `e.g., +1 (777) 777-7777`           |

   ![Set placeholder test for fields.](./adding-the-form-to-the-apply-page/images/06.png)

1. Select the Form Container fragment, set the Success Message to *Page*, and select *Application Submission*.

   ![Set the Success Message to Page and select Application Submission.](./adding-the-form-to-the-apply-page/images/07.png)

1. Click *Publish*.

Next: [Adding Details to the Success Page](./adding-details-to-the-success-page.md)
