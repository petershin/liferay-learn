---
uuid: d0c86b06-4702-4a9b-92a8-f0b7e731f7c2
taxonomy-category-names:
- Commerce
- Products
- Product Information
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Product Configuration Reference

Using a product's configuration page, you can add additional metadata, media, attachments, create product relations, and more.

## Product Details

Configure the following settings from the Product Detail's tab:

* Details (Catalog, Name, Short Description, and Full Description)
* SEO (Friendly URL, Meta Title, Meta Description, Meta Keywords)
* Categorization (Public Categories, Tags)
* Schedule (Published, Display Date, Expiration Date, Never Expire)
* Specifications

![View and configure product details.](./product-configuration-reference/images/01.png)

### General Product Details

| Field             | Description                                                              |
| :---------------- | :----------------------------------------------------------------------- |
| Catalog           | The catalog associated with the product (this association is permanent). |
| Name              | The name of the product.                                                 |
| Short Description | A short description of the product.                                      |
| Full Description  | A more detailed description of the product.                              |

### SEO

| Field            | Description                                           |
| :--------------- | :---------------------------------------------------- |
| Friendly URL     | The product's friendly URL.                           |
| Meta Title       | The product's title to help search engines locate it. |
| Meta Description | The product's description used by search engines.     |
| Meta Keyword     | The product's Keywords used by search engines.        |

### Categorization

| Field             | Description                                            |
| :---------------- | :----------------------------------------------------- |
| Public Categories | Select from global categories to apply to the product. |
| Tags              | Select from global tags to apply to the product.       |

### Schedule

| Field           | Description                                                                                                                                                                         |
| :-------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Published       | Check this to ensure that the product is visible and available for sale.                                                                                                            |
| Display Date    | The date when the product is first available for sale.                                                                                                                              |
| Expiration Date | The date when the product expires. (only if *Never Expire* is unchecked). Note that this is not the product's expiry date. It removes the product from the available ones for sale. |
| Never Expire    | Check this to schedule a product for expiration.                                                                                                                                    |

### Specifications

| Field    | Description                                                     |
| :------- | :-------------------------------------------------------------- |
| Label    | The specification's name.                                       |
| Value    | The specification's value.                                      |
| Group    | Links the specification to another specification group.         |
| Position | Determines the display order, beginning with the lowest number. |

## Options

Product options provide a convenient way to add custom fields to your products. You can use them to create product variants based on attributes (e.g., size, quantity, color, material), bundles, and more. See [Using Product Options](./using-product-options.md) for more information.

![Adding product variants using product options.](./product-configuration-reference/images/02.png)

| Field       | Description                                                                             |
| :---------- | :-------------------------------------------------------------------------------------- |
| Add Options | Create new options or applying existing options to the product.             |
| Options     | List of options added to the product. Select an Option to edit its settings and values. |

## SKUs

SKUs represent variants of a product. See [Creating SKUs for Product Variants](./creating-skus-for-product-variants.md) to learn more. At the time of creation, a product has the `default` SKU. You can edit its settings or remove it and create a new one. To sell a product, you need at least one active SKU. By default, the SKUs inherit the specifications and configurations of the parent product. However, you can override some of these individually. See [Overriding Product Level Information](./overriding-product-level-information.md) to learn more.

![SKUs represent variants of a product.](./product-configuration-reference/images/03.png)

## Media

Use this section to upload product images and attachments. See [Product Images](./product-images.md) and [Product Attachments](./product-attachments.md) for more information.

![Add images and attachments to enrich the product's metadata.](./product-configuration-reference/images/04.png)

## Product Relations

You can link the current product to other products using product relations. The connected products can be displayed using the Product Publisher widget on the Product Details page. See [Related Products, Up-Sells, and Cross-Sells](./related-products-up-sells-and-cross-sells.md) to learn more.

![Create product relations to link other products to the current product.](./product-configuration-reference/images/05.png)

## Product Groups

Product groups are static groups of products you can use for targeted discounts or pricing. See [Introduction to Product Groups](../../../pricing/promoting-products/introduction-to-product-groups.md) to learn how to create and configure product groups. 

![Add the product to a product group for targeted discounts or pricing.](./product-configuration-reference/images/06.png)

| Field                | Description                                                                               |
| :------------------- | :---------------------------------------------------------------------------------------- |
| Select Product Group | Create new product groups or applying existing ones to the product.                       |
| Product Groups       | List of product groups containing the product. Select a product group to change its name. |

## Subscription

Create and manage subscription options for the selected product. Examples include magazines, service contracts with renewal options, and regularly consumed items. See [Enabling Subscriptions for a Product](./enabling-subscriptions-for-a-product.md) to learn more.

![Enable subscriptions for the product.](./product-configuration-reference/images/07.png)

## Visibility

By default, products are visible across all channels and catalogs. But you can limit visibility to specific channels and account groups. See [Configuring Product Visibility Using Channels](../../../store-management/channels/configuring-product-visibility-using-channels.md) and [Configuring Product Visibility Using Account Groups](./configuring-product-visibility-using-account-groups.md) for more information.

![Managing the product's visibility.](./product-configuration-reference/images/08.png)

## Configuration

This section contains additional configuration options for the product. There are three sections: tax category, shipping, and inventory. Virtual products don't have the shipping section.

![Configure additional options for the product.](./product-configuration-reference/images/09.png)

### Tax Category

| Field        | Description                                              |
| :----------- | :------------------------------------------------------- |
| Tax Category | Select a tax category from a list of the available ones. |
| Tax Exempt   | Activate this toggle to exempt this product from tax.    |

### Shipping

| Field                | Description                                                                        |
| :------------------- | :--------------------------------------------------------------------------------- |
| Shippable            | Activate this toggle to specify the product is shippable.                          |
| Free Shipping        | Activate this toggle to allow free shipping for this product.                      |
| Ship Separately      | Activate this toggle to allow shipping this product separately.                    |
| Shipping Extra Price | Enter the extra price for shipping that gets added to the shipping method's price. |
| Width                | Enter the product's width.                                                         |
| Height               | Enter the product's height.                                                        |
| Depth                | Enter the product's depth.                                                         |
| Weight               | Enter the product's weight.                                                        |

### Inventory

| Field                    | Description                                                                                                                                                                                  |
| :----------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Inventory Engine         | Select an inventory engine.                                                                                                                                                                  |
| Low Stock Action         | Select a [low stock action](../../../inventory-management/low-stock-action.md) from a list of the available ones.                                                                            |
| Availability Estimate    | Select an [availability estimate](../../../inventory-management/availability-estimates.md) from a list of the available ones.                                                                |
| Low Stock Threshold      | Set the quantity threshold that triggers the low stock action.                                                                                                                               |
| Display Availability     | Activate this toggle to display the product's availability on the product details page.                                                                                                      |
| Allow Back Orders        | Activate this toggle to allow back orders for this product.                                                                                                                                  |
| Display Stock Quantity   | Activate this toggle to display the product's stock quantity on the product details page.                                                                                                    |
| Maximum Order Quantity   | Set the maximum order quantity for the product.                                                                                                                                              |
| Minimum Order Quantity   | Set the minimum order quantity for the product.                                                                                                                                              |
| Multiple Order Quantity  | Set the allowed multiples that a customer can purchase. If you set the value to `3`, then the customer can purchase only `3` units of the product or other multiples of `3` (`6`, `9`, etc). |
| Allowed Order Quantities | Set the allowed order quantities that a customer can purchase. You must enter values separated by a command (`,`).                                                                           |

## Grouped (for Grouped Products)

This tab is only visible for grouped products. Click *New* to add more products to the grouped product. See [Creating a Grouped Product](../product-types/creating-a-grouped-product.md) for more information.

## Virtual (for Virtual Products)

This tab is only available for virtual products. The Details section appears only if you scroll down and click *Save*. See [Creating a Virtual Product](../product-types/creating-a-virtual-product.md) for more information.

## Related Topics

* [Creating a Simple Product](../product-types/creating-a-simple-product.md)
* [Virtual Product Reference](../product-types/virtual-product-reference.md)
