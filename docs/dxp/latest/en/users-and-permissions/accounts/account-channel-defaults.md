---
toc:
  - ./account-channel-defaults/setting-channel-defaults.md
uuid: eeecd784-2cf2-4b02-9c11-52ef261b18ac
---
# Account - Channel Defaults

```{toctree}
:maxdepth: 1

account-channel-defaults/setting-channel-defaults.md
```

You can set up defaults for a channel associated to an account after creating the account. This improves the checkout experience and reduces the time taken to create orders. See [Introduction to Channels](https://learn.liferay.com/web/guest/w/commerce/store-management/channels/introduction-to-channels) for more information. You can set defaults for:

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

You can set a default for all available channels or a specific channel. For further fine-tuning, you can set defaults for specific channels and then set defaults for the remaining. Depending on user roles and permissions, you can change the defaults of an order during checkout. You can also set permissions so that the user can only place orders with the configured defaults.

```{note}
Channel defaults only work in conjunction with eligibility. If the default is not eligible for a particular order, the highest priority eligible entity is set as the default.
```

## Understanding Eligibility

You may want to override all other eligibility conditions when setting a channel default for an account. If you override eligibility, the default becomes applicable even if through configuration, the entity is not eligible for it.

For instance, assume you have two discounts: Discount A (20%) and Discount B (22%) applied to the same product. The pricing engine applies the better discount (22%) to the product, but if you want to set the default as 20% for a particular account, you can set it in the defaults section and enable the *Override Eligibility* toggle.

```{note}
If you don't override eligibility, the default applies to orders only if the order itself is eligible. If the default is not eligible, then the highest priority entity that is eligible for the order is applied. 
```

By setting these defaults, you can reduce the time taken to create orders and improve user experience. Through permissions, you can control if defaults are available to change during checkout.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Setting Channel Defaults
:link: ./account-channel-defaults/setting-channel-defaults.md
:::
::::
