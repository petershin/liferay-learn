---
uuid: 97867b30-c051-4b92-8da8-2a11f7313e18
taxonomy-category-names:
- Commerce
- Products
- Product Information
- Liferay Self-Hosted
- Liferay PaaS
---
# Commerce 2.1 and below: Using Product Options

## Creating an Option Template

1. Navigate to *Control Panel* &rarr; *Commerce* &rarr; *Products*.

1. Go to the *Options* tab. This displays a list of existing templates on the left and the *Option Template Detail* form on the right.

1. Click *Add* (![Add icon](../../../../images/icon-add.png)).

   ![Creating an option template.](./commerce-2-1-and-below-using-product-options/images/01.png)

1. Click *Save*.

You can now apply this option template to products.

1. (Optional) Enable the *Use in Faceted Navigation* toggle to use the option as a search filter for products.

1. (Optional) Enable the *SKU Contributor* toggle to use the option's values to [create SKUs](../creating-skus-for-product-variants.md). Customers must select from the available option values.

!!! warning
    You cannot use boolean as a SKU contributor. Attempting to do so shows the following warning message: `SKU Contributor cannot be set as true for the selected Field Type.`

## Adding Option Values

Depending on the field type, you may need to create values for the option.

1. Click *Values* next to the option.

1. Click *Add* (![Add icon](../../../../images/icon-add.png)) and enter details for the value.

   ![Adding values to the option.](./commerce-2-1-and-below-using-product-options/images/02.png)

1. Click *Save*.

You can repeat these steps to add more values. The priority field determines the display order of the values with the lowest values displayed first.

## Applying an Option Template to a Product

Once you apply a template to a product, you can make any changes to the product's option. These changes will not affect the option template or any other product.

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), and navigate to *Commerce* &rarr; *Products*.

1. Select a product and go to Options.

   ![Go to the Options tab of a product.](./commerce-2-1-and-below-using-product-options/images/03.png)

1. Enter a name in the *Add Options* field, and click *Create New*. If there's an option template already created, click *Select*.

This applies the option template to the product. If choosing an existing option template, all values from the template are included. You can select the option to add, remove, or edit values without affecting the template values.
