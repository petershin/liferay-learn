---
toc:
  - ./channel-defaults/setting-channel-defaults.md
uuid: eeecd784-2cf2-4b02-9c11-52ef261b18ac
---
# Channel Defaults

```{toctree}
:maxdepth: 1

channel-defaults/setting-channel-defaults.md
```

After creating a business account, you can set [channel](https://learn.liferay.com/web/guest/w/commerce/store-management/channels/introduction-to-channels) defaults for it. This improves the checkout experience, reduces the time taken to create orders and allows further customizations to the default behavior of Liferay Commerce. You can set the following defaults for both individual channels and all remaining channels: 

* Billing Address
* Shipping Address
* Delivery Terms and Conditions
* Payment Terms and Conditions
* Shipping Options
* Price Lists
* Discounts
* Currencies
* Payment Methods
* Channel Account Managers

Depending on user roles and permissions, you can change the defaults of an order during checkout. You can also set permissions so users can only place orders with the channel defaults. 

```{note}
Channel defaults work in conjunction with eligibility. If the default is not eligible for a particular order, the highest priority eligible entity is used during order creation. Overriding eligibility for a channel default ignores the eligibility configured for that entity.
```

## Understanding Eligibility

You may want to override all other eligibility conditions when setting a channel default for an account. If you override eligibility, the default becomes applicable even if through configuration, the entity is not eligible for it.

For instance, assume you have a discount: Discount A (22%) applicable for Order Type X. Without overriding eligibility, if you create an order of type Y, Discount A is not applied as it is not eligible. This follows the eligibility configured for the entity and the order uses the next highest priority eligible discount, if any. If you override eligibility, any order that's created gets Discount A applied to it. 

```{note}
If you don't override eligibility, the default applies to orders only if the order itself is eligible. If the default is not eligible, then the highest priority entity that is eligible for the order is applied. 
```

By setting these defaults, you can reduce the time taken to create orders and improve user experience. Through permissions, you can control if defaults are available to change during checkout.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Setting Channel Defaults
:link: ./channel-defaults/setting-channel-defaults.md
:::
::::
