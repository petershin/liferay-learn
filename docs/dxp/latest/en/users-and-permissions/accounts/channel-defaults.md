---
toc:
  - ./channel-defaults/setting-channel-defaults.md
  - ./channel-defaults/channel-defaults-permissions-reference.md
uuid: eeecd784-2cf2-4b02-9c11-52ef261b18ac
taxonomy-category-names:
- Security
- User, Organization, and Account Management
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Channel Defaults

{bdg-secondary}`Available Liferay 7.4 U49+/GA49+`

After creating a business account, you can set [channel](https://learn.liferay.com/web/guest/w/commerce/store-management/channels/introduction-to-channels) defaults for it. This can improve customer experience by reducing the time it takes to create orders and help account managers tailor Commerce behavior for specific accounts. You can set these channel defaults:

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

## Understanding Eligibility and Channel Defaults

Channel defaults work in conjunction with eligibility. This means if an order is not eligible for the set default, Liferay uses the next highest priority value that is eligible. For some channel defaults, you can override this behavior to apply the default regardless of eligibility.

For example, if Discount A is the channel default for a business account but only Order Type X is eligible for Discount A, Liferay does not apply Discount A to orders of a different type. Instead, Liferay applies the next highest priority discount for which the order is eligible, if any exists. However, if you override eligibility, Liferay applies Discount A to all account orders, regardless of eligibility.


