---
taxonomy-category-names:
- Sites
- Page Templates
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: db41d849-e555-4e28-a2fb-4337125b6b4a
---

# Using Utility Pages

{bdg-secondary}`7.4 U86+ and GA86+`

Utility pages serve specific operational tasks and actions and are usually essential for users to interact with a website or application effectively. Utility pages can be configured for a site's 500 and 404 error pages. In the future, this capability will expand to include other common pages (e.g. sign-in and terms of use pages).

Liferay provides [out-of-the-box utility pages](#viewing-utility-pages) that are easily customizable. You can also [create utility pages](#creating-a-new-utility-page) from scratch.

![Liferay provides out-of-the-box solutions that you can use or customize to fit your needs.](./using-utility-pages/images/01.png)

## Viewing Utility Pages

You can edit, preview, or copy utility pages.

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and navigate to *Site Builder* &rarr; *Pages* &rarr; *Utility Pages* tab.

   The out-of-the-box pages are marked with a `PROVIDED BY LIFERAY` tag.

1. Choose a page and click *Actions* (![Actions Icon](../../../images/icon-actions.png)) to view and select one of the available options (e.g. Edit, Preview, or Make a Copy).

!!! tip
    Edit the utility page the same way you would edit a [content page](../using-content-pages/adding-elements-to-content-pages.md).

## Creating a New Utility Page

1. Open the *Site Menu* (![Site Menu](../../../images/icon-product-menu.png)) and navigate to *Site Builder* &rarr; *Pages* &rarr; *Utility Pages* tab.

1. Select *Add* (![Actions Menu](../../../images/icon-add.png)).

1. Choose the type of utility page you want to create.

1. Select *Blank* for an empty content page or choose an available master page template.

1. Name the utility page and click *Save*.

You can edit the newly created utility page the same way you would edit a [content page](../using-content-pages/adding-elements-to-content-pages.md).

## Utility Pages Action Menu Reference

Use the actions menu to perform certain actions with your utility page. To access the actions menu,

1. Open the *Site Menu* (![Site Menu icon](../../../images/icon-product-menu.png)) and navigate to *Site Builder* &rarr; *Pages* &rarr; *Utility Pages* tab.

1. Select Actions (![Actions Menu](../../../images/icon-actions.png)) for the utility page you want.

Here are the available options:

| Action | Definition |
| :--- | :--- |
| Edit | Edit the utility page in the page editor. |
| Preview | Preview the utility page in a new tab. |
| Mark/Unmark as Default | Mark/Unmark the utility page as the default. |
| Rename | Rename the utility page in the modal that opens. Click *Save* to rename your page. |
| Change Thumbnail | Change the thumbnail that shows in your card. Drag and drop an image in the modal that opens. |
| Remove Thumbnail | Remove the utility page's thumbnail from the card. |
| Export | Export the utility page in ZIP format. |
| Make a Copy | Create a copy of the utility page. The copy is automatically named `{Original page's name} (Copy)` and it's created as a draft. |
| Configure | Configure some SEO settings such as HTML Title and Description. See [Configuring SEO and Open Graph](../../displaying-content/using-display-page-templates/configuring-seo-and-open-graph.md) to learn more. |
| Permissions | Manage permissions related to the utility pages. |
| Delete | Delete the utility page. Confirm the deletion in the modal that opens. |

![Use the actions menu to perform actions with the utility pages such as edit, preview, and mark as default.](./using-utility-pages/images/02.png)

!!! note
    If a site contains no pages, the default 404 error page is shown even if a utility page is applied.

## Utility Page Permissions

Utility pages have permissions that govern their use. To find and manage those permissions,

1. Open the *Global Menu* (![Global Menu icon](../../../images/icon-applications-menu.png)), select the *Control Panel* tab and, under Users, select *Roles*.

1. Select the role you want to 

| Permission Name             | Description                                       |
| :-------------------------- | :------------------------------------------------ |
| Add Utility Page            | Required to add a utility page.                   |
| Assign Default Utility Page | Required to assign a utility page a default page. |

<!-- TASK: LPS-155184 Document 404 Error pages can be added to custom site initializers -->

## Related Topics
- [Adding Pages](../adding-pages.md)
- [Adding a Page to a Site](./adding-a-page-to-a-site.md)