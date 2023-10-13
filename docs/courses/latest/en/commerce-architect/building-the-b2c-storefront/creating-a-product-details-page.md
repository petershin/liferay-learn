---
uuid: 22ee7926-f421-4b61-8e9a-c93d6bd41791
---
# Creating a Product Details Page

The product details page displays all the information about a selected product. So far, we’ve added a featured products grid and also a catalog page, but you cannot select any of these products to view more details about them. 

## Creating a New Page

1. Open the *Product Menu* (![Product Menu](../../images/icon-product-menu.png)), and navigate to *Site Builder* &rarr; *Pages*.

1. Click *Add* (![Add](../../images/icon-plus.png)) next to the shop page, to add a child page, and click *Add Page*.

1. Select the master page template.

1. Enter the name as *Product Details* and click *Add*. This opens the new page in edit mode.

## Applying the CSS Client Extension

You must now configure the created page in Liferay to use your deployed client extension:

1. Open the product details page, click on *Edit* (![Edit](../../images/icon-edit.png)) at the top.

1. In the sidebar, navigate to the *Page Design Options* menu (![Page Design Options icon](../../images/icon-format.png)) and click the *Configuration* (![Configuration](../../images/icon-format.png)) icon at the top of the menu.

1. In the CSS Client Extensions section toward the bottom of the page, click *Add CSS Client Extensions*.

1. Select your CSS client extension from the pop-up modal and click *Add*.

1. Click *Save*.

## Customizing the Product Details Page

1. Drag and drop a container on the page. Change the *Container Width* to *Fixed Width*.

1. In the *Advanced* section, give it the CSS class `p-3`.

1. Drag and drop the *Product Details* widget inside the fixed width container.

1. Drag and drop a *Heading* fragment and a *Separator* fragment below the *Product Details* widget

1. Set the header title to *Related Products*.

1. Set the *Heading Level* to *H3*.

1. In the *Advanced* section of the header fragment, add the `text-center`, `mb-1`, and `mt-5` CSS classes. 

1. Click on the separator and go to the *Advanced* section. Add the `section-text-line` and `mb-5` CSS classes.

1. Drag and drop the *Product Publisher* widget inside the fixed width container.

1. Click on the *Actions* (![Actions](../../images/icon-actions.png)) icon to customize the widget.

1. Under *Product Selection*, select *Data Source*.

1. From the *Data Source* dropdown, select *Product Relations related*.

![The product details page displays more information about the selected product.](./creating-a-product-details-page/images/01.png)

The product details page is ready to use now. Go back to the shop page and click on one of the featured products to view more details about it. You can also view products related to the currently selected product in the related products section below it. 

Next: [Creating an Orders Page](./creating-an-orders-page.md)