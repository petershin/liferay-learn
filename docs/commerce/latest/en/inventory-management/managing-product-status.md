# Managing Product Status

Liferay offers two different ways to manage the status of your products by either **expiring** or **unpublishing** them.

You can set a predefined date for expiring a product. After the date passes, the product is in the *Expired* status. It is no longer available to purchase in the storefront or visible in the search results. You can configure the expiration date for the entire product (all SKUs) or for a particular SKU.

Unpublishing a product converts it into a *Draft* status and removes the product from search results. You can also unpublish products based on inventory levels using a low stock action. See [Low Stock Action](./low-stock-action.md) for more information .

## Setting a Product as Expired

To expire a product:

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) menu and navigate to *Commerce* &rarr; *Products*.

1. Click on a product.

1. Uncheck the *Never Expire* checkbox in the *Schedule* section. This configuration affects all the SKUs of the product.

1. Enter a future expiration date and time. All times are set based on the time zone of the instance.

   ![Setting a product's expiration date.](./managing-product-publication/images/01.png)

   You can view or change the instance time zone by opening the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and going to *Control Panel* &rarr; *Instance Settings*. Then, navigate to *Localization* &rarr; *Time Zone*.

1. Click *Publish*.

After making the changes, it may take some time to remove the product from the catalog. This is due to the default check interval being 15 minutes. You change this by opening the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigating to *Control Panel* &rarr; *System Settings*. Once there, navigate to *Catalog* &rarr; *Products*. Change the *Check Interval* value and click *Save*.

After the expiration date, the product isn't returned when searching on the *Catalog* page. You can also expire individual SKUs and set replacements for them. Read Replacement Products for more information.

![The product has a status of Expired after passing the expiration date.](./managing-product-publication/images/02.png)

You can change the product visibility by entering a new expiration date and republishing the product.

## Setting a Product as Draft

You may need to set a product as draft if you want to make any changes to it. After verifying the information added, you can publish the product to display it back in the storefront.

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) menu and navigate to *Commerce* &rarr; *Products*.

1. Click on a product.

1. Click the *Actions* (![Actions](../images/icon-actions.png)) icon next to the *Publish* button and select *Save as Draft*.

1. Click *OK* to confirm the removal of the product from the catalog page.

![Select Save as Draft to convert the product into draft status.](./managing-product-publication/images/03.png)

You cannot search for the product or view it in the storefront after setting it to the draft status.

![The product has a status of Draft after converting it.](./managing-product-publication/images/04.png)

If you have an approval workflow in place to publish products, you must go through it to publish the product again. If you want to remove the product from the storefront and publish it back again without going through the approval workflow, you can uncheck the *Published* checkbox and click *Publish*.

![Unchecking the published checkbox to remove the product from the storefront.](./managing-product-publication/images/05.png)

## Commerce 2.1 and Below

### Setting a Product as Expired

To expire a product:

1. Navigate to *Control Panel* &rarr; *Commerce* &rarr; *Products*.

1. Click on a product.

1. Uncheck the *Never Expire* checkbox on the *Products Details* tab. This configuration affects all the SKUs of the product.

1. Enter a future expiration date and time. All times are set using the GMT time zone.

    ![Setting a Product's Expiration Date](./managing-product-publication/images/01.png)

1. Click *Publish*.

After making the changes, it may take some time to remove the product from the catalog. This is due to the default check interval being 15 minutes. You change this by opening the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigating to *Control Panel* &rarr; *System Settings*. Once there, go to *Catalog* &rarr; *Products*. Change the *Check Interval* value and click *Save*.

![The product has a status of Expired after passing the expiration date.](./managing-product-publication/images/06.png)

You can change the product visibility by entering a new expiration date and republishing the product.

### Setting a Product as Draft

1. Navigate to *Control Panel* &rarr; *Commerce* &rarr; *Products*.

1. Click on a product.

1. Click on *Save as Draft*.

You cannot search for the product or view it in the storefront after setting it to the draft status.

![The product has a status of Draft after converting it.](./managing-product-publication/images/04.png)

If you have an approval workflow in place to publish products, you must go through it to publish the product again. If you want to remove the product from the storefront and publish it back again without going through the approval workflow, you can uncheck the *Published* checkbox and click *Publish*.

![Unchecking the published checkbox to remove the product from the storefront.](./managing-product-publication/images/05.png)

## Additional Information

* [Configuring Product Visibility Using Channels](../store-management/channels/configuring-product-visibility-using-channels.md)
* [Creating a Simple Product](../product-management/creating-and-managing-products/product-types/creating-a-simple-product.md)
* [Creating a Grouped Product](../product-management/creating-and-managing-products/product-types/creating-a-grouped-product.md)
* [Creating a Virtual Product](../product-management/creating-and-managing-products/product-types/creating-a-virtual-product.md)
* [Low Stock Action](./low-stock-action.md)
