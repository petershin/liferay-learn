---
uuid: a70883f3-ee19-487b-9e30-8f989d1afea9
---
# Countries Configuration Reference

By default, Liferay includes over 240 countries, but you can add more countries if needed. To do this,

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)), go to the *Commerce* tab, and click *Countries*.

1. Click the *Add* button (![Add Button](../images/icon-add.png)).

1. Enter these details for the country.

   | Field                 | Description                                                                               |
   |:----------------------|:------------------------------------------------------------------------------------------|
   | Name                  | Country name                                                                              |
   | Billing Allowed       | Enable/Disable the country in the *Country* dropdown for billing address                  |
   | Shipping Allowed      | Enable/Disable the country in the *Country* dropdown for shipping address                 |
   | Two-Letter ISO Code   | Two letter ISO code per [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) standard   |
   | Three-Letter ISO Code | Three letter ISO code per [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) standard |
   | Number                | Numeric code per [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) standard          |
   | Subject to VAT        | Determine if the country is subject to VAT                                                |
   | Position              | Determine the country's sort order in the Country dropdown                                |
   | Active                | Enable/Disable the country                                                                |

   ![Enter the required information to add a country to your Liferay instance.](./countries-configuration-reference/images/01.png)

1. Click *Save*.

## Filtering Channels for Countries

You may want to restrict some countries in different channels. To do this,

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)), go to the *Commerce* tab, and click *Countries*.

1. Begin editing the desired country and go to the *Channels* tab.

1. Toggle *Enable filter channels*.

   ![Toggle Enable filter channels and select the channels you want to disable the country for.](./countries-configuration-reference/images/02.png)

1. Select the channels for which the country is unavailable during checkout.

1. Click *Save*.

During checkout, the country does not appear in the Country dropdown for the selected channels.

## Deactivating a Country for Billing or Shipping

For some stores, you may need to deactivate a country for shipping or billing purposes. To do this,

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)), go to the *Commerce* tab, and click *Countries*.

1. Begin editing the desired country.

1. Toggle *Billing Allowed* to disable it for billing.

1. Toggle *Shipping Allowed* to disable it for shipping.  

   ![Toggle Billing Allowed and Shipping Allowed.](./countries-configuration-reference/images/03.png)

1. Click *Save*.

The country is no longer available for billing and shipping. To completely remove a country as an option, toggle *Active* to disable it.
