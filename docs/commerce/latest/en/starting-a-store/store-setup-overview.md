---
uuid: 2c1c1fa2-205d-4867-a52e-23177c13da25
taxonomy-category-names:
- Commerce
- Storefronts
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Store Setup Overview

Initial store setup uses the [admin account](./introduction-to-the-admin-account.md). Read the [Liferay Commerce Configuration Overview](../store-management/liferay-commerce-configuration-overview.md) to familiarize yourself with the Liferay Commerce configuration layout and available options.

## Store Setup

!!! note
    You can use an [accelerator](../starting-a-store/accelerators.md) to create the storefront. Using an accelerator configures many of the settings mentioned here. See [Using the Minium Accelerator to Jump Start Your B2B Store](../starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.md) for further details.

### Configure Global Commerce Settings

Global commerce configurations for Liferay include setting the store timezone, available languages, adding regions and region specific measurement units, and more.

- [Setting Locale Options](../store-management/locale-options.md)
- [Adding Regions](../store-management/configuring-countries-and-regions.md#adding-regions)
- [Setting up Warehouses](../inventory-management/warehouse-reference-guide.md)
- [Creating Channels](../store-management/channels.md)

### Create a Storefront

Liferay supports B2B, B2C, and B2C-B2B stores. [Site Types](../starting-a-store/sites-and-site-types.md) designate a store's business model and determines how the storefront works with accounts.

Liferay Commerce is built on Liferay DXP. For more information about how Liferay DXP sites work, see [Building a Site](https://learn.liferay.com/w/dxp/site-building/sites/adding-a-site).

### Configure Storefront Settings

Storefront settings include payment, taxes, and shipping. 

#### Accepting Payment

Liferay provides support for several third party payment processors along with the use of money orders to accept payment. 

- [Payments](../store-management/configuring-payment-methods.md)
- [Managing Payment Methods](../store-management/configuring-payment-methods/managing-payment-methods.md)
- [Authorize.net](../store-management/configuring-payment-methods/authorize-net.md)
- [PayPal](../store-management/configuring-payment-methods/mercanet.md)
- [Mercanet](../store-management/configuring-payment-methods/mercanet.md)
- [Money Orders](../store-management/configuring-payment-methods/mercanet.md)

#### Collecting Applicable Taxes

To collect the applicable taxes, Liferay can create tax categories and set tax rates by address or by a fixed rate.

- [Creating Tax Categories](../pricing/configuring-taxes/creating-tax-categories.md)
- [Setting Rates for Tax Calculations](../pricing/configuring-taxes/setting-rates-for-tax-calculations.md)
- [Applying Tax Rates](../pricing/configuring-taxes/applying-tax-rates.md)

#### Shipping Products

Liferay can calculate shipping rates in several ways.

- [Shipping Methods](../store-management/configuring-shipping-methods.md)
- [Variable Rate](../store-management/configuring-shipping-methods/using-the-variable-rate-shipping-method.md)
- [Flat Rate](../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md)

## Creating the Catalog

After setting up the store, begin [creating a new catalog](../product-management/catalogs/creating-a-new-catalog.md).

### Adding Products to a Catalog

When adding a product, there are three product types: **Simple**, **Grouped**, and **Virtual**. See [Introduction to Product Types](../product-management/creating-and-managing-products/product-types.md) for more information.

#### Adding Product Information

Liferay supports storing and managing a wide variety of product information using catalogs. See below to learn more about the product information management capabilities of Liferay.

- [Product Options](../product-management/creating-and-managing-products/products/using-product-options.md)
- [Product Specifications](../product-management/creating-and-managing-products/products/specifications.md)
- [Product Images](../product-management/creating-and-managing-products/products/product-images.md)
- [Product Relations](../product-management/creating-and-managing-products/products/related-products-up-sells-and-cross-sells.md)
- [Product Categorization](../product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md)
- [Availability Estimates](../inventory-management/availability-estimates.md)
- [Low Stock Action](../inventory-management/low-stock-action.md)

#### Product Pricing

There are several ways to price products, and these methods are related to one another in a pricing hierarchy: base price, price list, tiered price, promo price, and discount. Pricing is managed per SKU.

- [Pricing](../pricing/introduction-to-pricing.md)
- [Price Lists](../pricing/creating-a-price-list.md)
- [Discounts](../pricing/promoting-products/introduction-to-discounts.md)

#### Managing Inventory

- [Inventory Management](../inventory-management.md)

## Creating the Storefront

Building a store in Liferay requires more than a complete catalog. You must add a series of pages to display and sell your products.

See [Creating Store Content](../creating-store-content/creating-store-content.md) to learn more.

## Managing Customer Accounts

To learn more about accounts, inviting users to accounts, account roles, and more, see below:

- [Introduction to Accounts](../users-and-accounts/account-management.md)
- [Creating a New Account](../users-and-accounts/account-management/creating-a-new-account.md)
- [Inviting Users to an Account](../users-and-accounts/account-management/inviting-users-to-an-account.md)
- [Adding Addresses to an Account](../users-and-accounts/account-management/adding-addresses-to-an-account.md)
- [Account Roles](../users-and-accounts/account-management/account-roles.md)
- [Creating a New Account Group](../users-and-accounts/account-management/creating-a-new-account-group.md)

## Managing Orders and Shipments

After receiving an order, you can send it to an ERP (Enterprise Resource Planning) and optionally to a CRM (Customer Relationship Management). Once the requested goods are available for shipping, your inventory manager may track the shipment. See below to learn about the life cycle of an order and a shipment.

- [Order Life Cycle](../order-management/orders/order-life-cycle.md)
- [Shipment Life Cycle Overview](../order-management/shipments/shipment-life-cycle-overview.md)
- [Creating a shipment](../order-management/shipments/creating-a-shipment.md)
- [Canceling a Shipment](../order-management/shipments/cancelling-a-shipment.md)
