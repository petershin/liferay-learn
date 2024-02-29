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

## Selecting a Utility Page as Default

To select a new utility page as default, follow these steps:

1. Open the *Site Menu* (![Site Menu icon](../../../images/icon-product-menu.png)) and navigate to *Site Builder* &rarr; *Pages* &rarr; *Utility Pages* tab.

1. Select Actions (![Actions Menu](../../../images/icon-actions.png)) for the utility page you want to set as default.

1. Select *Mark as Default*.

![Select a utility page as the default page in the actions menu.](./using-utility-pages/images/02.png)

!!! note
    If a site contains no pages, the default 404 error page is shown even if a utility page is applied.

## Utility Page Permissions

Utility pages have permissions that govern their use.

| Permission Name             | Description                                       |
| :-------------------------- | :------------------------------------------------ |
| Add Utility Page            | Required to add a utility page.                   |
| Assign Default Utility Page | Required to assign a utility page a default page. |

<!-- TASK: LPS-155184 Document 404 Error pages can be added to custom site initializers -->

## Related Topics
- [Adding Pages](../adding-pages.md)
- [Adding a Page to a Site](./adding-a-page-to-a-site.md)