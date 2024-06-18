---
uuid: 4982da46-46d9-4f42-bcb0-fb6c6a695193
taxonomy-category-names:
- Commerce
- Storefronts
- Shipping Methods
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Applying Shipping Method Restrictions

Your store may have shipping restrictions to specific countries or regions. This means these countries are not available during the checkout process. These restrictions apply to all shipping options for a particular shipping method. For example, restrictions applied to the _Flat Rate_ shipping method don't apply to the _Variable Rates_ shipping method.

To apply a restriction:

1. Navigate to the _Site Administration_ → _Commerce_ → _Settings_.
1. Click the _Shipping Methods_ tab.
1. Click any Shipping Method; in this example, _Flat Rate_.
1. Click the _Restrictions_ tab.
1. Click the (+) button to add a new restriction.
1. Check all the boxes for countries where you do not want to ship to; in this example; Antarctica and Bahrain.
1. Click _Add_.

    ![Apply a shipping method restriction](./applying-shipping-method-restrictions/images/01.png)

Your store is now restricted from shipping to those countries. Repeat these steps for _Variable Rate_. If you are customizing Liferay Commerce by adding additional carrier shipping methods (UPS, DHL, and so forth) through an extension point, you may want to include the same function to restrict delivery by region.

## Related Topics

* [Using the Flat Rate Shipping Method](./using-the-flat-rate-shipping-method.md)
* [Variable Rate](./using-the-variable-rate-shipping-method.md)
