---
uuid: a70883f3-ee19-487b-9e30-8f989d1afea9
---
# Countries Configuration Reference

You can create a country in Liferay by opening the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigating to *Control Panel* &rarr; *Commerce* &rarr; *Countries*. Click the *Add* (![Add](../images/icon-add.png)) button to add a country.

![Enter the required information to add a country to your Liferay instance.](./countries-configuration-reference/images/01.png)

| Field                 | Description                                                                                |
| :-------------------- | :----------------------------------------------------------------------------------------- |
| Name                  | Country name                                                                               |
| Billing Allowed       | Toggle to enable/disable the country in the *Country* dropdown of billing address          |
| Shipping Allowed      | Toggle to enable/disable the country in the *Country* dropdown of shipping address         |
| Two-Letter ISO Code   | Two letter ISO code as per [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) standard |
| Three-Letter ISO Code | Three letter ISO as per [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) standard    |
| Number                | Numeric code as per [ISO-3166-2](https://www.iso.org/obp/ui/#search/code/) standard        |
| Subject to VAT        | Toggle to determine if the country is subject to VAT                                       |
| Position              | Determines the sort order in the *Country* dropdown                                        |
| Active                | Toggle to enable/disable the country                                                       |

## Filtering Channels

You may want to restrict some countries in some channels. You can do this by selecting the required country and clicking on the *Channels* tab.

1. Activate the *Enable filter channels* toggle.

   ![Activate the Enable filter channels toggle and select the channels you want to disable the country for.](./countries-configuration-reference/images/02.png)

1. Use the checkbox to select the channels for which the country must be unavailable to select during checkout.

1. Click *Save*.

During checkout, you won't see the country in the *Country* dropdown.

## Deactivating a Country for Billing or Shipping

Some stores may need to deactivate a country for shipping or billing purposes.

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Commerce* &rarr; *Countries*.

1. Click the country to be deactivated (Vietnam in this example).

1. Switch the *Billing Allowed* toggle to *No*.

1. Switch the *Shipping Allowed* toggle to *No*.  

    ![Deactivating a country](./countries-configuration-reference/images/03.png)

1. Click *Save*.

Note, billing and shipping have both been disabled. To completely remove a country as an option when entering a shipping address, switch the *Active* toggle to *No*.
