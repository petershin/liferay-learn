---
uuid: db41d849-e555-4e28-a2fb-4337125b6b4a
---

# Using Utility Pages

System level pages, like terms of service or 404 error pages, effect a users' experience on a site. Traditionally, customizing these type of pages required a developer, making it difficult to modify these pages quickly. In Liferay, you can customize these pages directly from the UI using utility pages.

Utility pages are content pages that you can create and apply to system-level pages, providing additional flexibility to your site's look and feel and tailoring the users' experience.

Currently, the pages that can be modified are:

* Error Pages
  * 404 Pages

## 404 Error Utility Pages

404 error pages, or "Page not Found" pages, are pages displayed when users navigate to a webpage that does not exist. Site initializers, like the Welcome site, include default 404 error Utility Pages, providing examples of how these pages can be customized.

<!-- TASK: LPS-155184 Document 404 Error pages can be added to custom site initializers -->

### Creating and Applying 404 Utility Page

1. Navigate to *Site Builder* &rarr; *Pages* &rarr; *Utility Pages*

1. Select *Add* (![Actions Menu](../../../images/icon-add.png)) 

1. Select *Blank* for an empty content page or an available master page template.

![Selecting Add to create a new 404 utility page](./using-utility-pages/01.png)

To apply the 404 Utility Page as the default 404 error page:

1. Select the Actions menu (![Actions Menu](../../../images/icon-actions.png)) for the utility page

1. Select *Mark as Default*

![Selecting a custom 404 error utility page as the default page when a user encounters a missing page on the website](./using-utility-pages/02.png)

```{note}
If a site does not contain any pages, the default 404 error page will be displayed even if a utility page is applied.
```
