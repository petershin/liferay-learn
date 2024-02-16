---
uuid: 55828537-580c-403d-9e16-e178230bb2f7
taxonomy-category-names:
- Commerce
- Orders and Fulfillment
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using the Minimum Order Amount Rule

{bdg-secondary}`Liferay DXP 7.4 U1+/GA5+`

Because of the cost to fulfill an order, you may want to accept only orders above a certain amount. You can do this through order rules by setting a minimum order amount below which customer checkout is prevented.

## Minimum Amount Rule Overview

When an order rule is applied, the buyer must fulfill the rule to continue checking out. In the case of the minimum order amount rule, buyers must have a total or subtotal cart value set in the rule in order to checkout. If not, a warning message displays the minimum order amount needed to proceed.

![Warning message displayed for not meeting the minimum order amount.](./using-the-minimum-order-amount-rule/images/01.png)

## Adding a Minimum Amount Order Rule

The Minimum Order Amount rule is available out-of-the-box.

1. Open the *Global Menu* (![Global Menu icon](../../images/icon-applications-menu.png)) and navigate to *Commerce* &rarr; *Order Rules*.

1. Click *Add* (![Add icon](../../images/icon-add.png)) and enter the following information.

   **Name:** Minimum Order $30

   **Description:** Testing the minimum order amount order rule

   **Type:** Minimum Order Amount

1. Click *Submit*.

   ![The Order Rules screen contains all you need to configure and activate order rules.](./using-the-minimum-order-amount-rule/images/02.png)

This opens a configuration view for the order rule. The *Priority* decides which order rule takes precedence when there's more than one rule. The lower number takes priority over the higher one. You can activate it using the *Active* toggle and configure it to apply the minimum order amount to the total or subtotal. You can also set the currency here.

## Order Rule Eligibility

![You can set the order rule eligibility for accounts, account groups, channels or order types.](./using-the-minimum-order-amount-rule/images/03.png)

Under the eligibility tab, you can set the order rule eligibility for accounts, account groups, channels or order types. By default it is applicable to all of these. If you want to associate it with a specific entity, choose it by clicking the radio button and using the search bar.