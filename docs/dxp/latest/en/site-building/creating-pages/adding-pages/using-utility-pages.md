---
uuid: db41d849-e555-4e28-a2fb-4337125b6b4a
---

# Using Utility Pages

In Liferay, you can customize system level pages, such as error pages and 404 pages, from the UI using utility pages, without having to engage a developer. 

You can use utility pages as system-level pages, such as 404 pages. 

## 404 Error Utility Pages

404 error ("Page Not Found") pages appear when users navigate to a page that does not exist. 

<!-- TASK: LPS-155184 Document 404 Error pages can be added to custom site initializers -->

To create a 404 error utility page, 

1. Navigate to *Site Builder* &rarr; *Pages* &rarr; *Utility Pages*.

1. Select *Add* (![Actions Menu](../../../images/icon-add.png)). 

1. Select *Blank* for an empty content page or an available master page template.

To apply the 404 Utility Page as the default 404 error page,

1. Select the Actions menu (![Actions Menu](../../../images/icon-actions.png)) for the utility page. 

1. Select *Mark as Default*. 

![Select a custom 404 error utility page as the default page when a user encounters a missing page on the website.](./using-utility-pages/images/02.png)

```{note}
If a site contains no pages, the default 404 error page is shown even if a utility page is applied.
```
