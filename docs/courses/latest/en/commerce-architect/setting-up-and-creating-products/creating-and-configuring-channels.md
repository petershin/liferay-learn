---
uuid: 988eaa6e-32e7-4517-b9df-e98a80c8dd4e
---
# Creating and Configuring Channels

A channel is a place where you sell products. In Liferay, you must link a site to a channel to be able to sell products on that site. Delectable Bonsai operates two online stores, one for B2B customers and one for B2C customers. To support this, you must create two channels and link them to their corresponding sites. 

To create a channel,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Commerce* → *Channels*.

1. Click the *Add* (![Add](../../images/icon-add.png)) button and enter the following details:

   **Name:** Delectable Bonsai B2B

   **Currency:** USD

   **Type:** Site

   ![Enter the name, currency, and type for the channel.](./creating-and-configuring-channels/images/01.png)

1. Click *Add*.

This creates a new channel for the B2B store. You must now link it to a Liferay site and configure the channel. 

## Configuring the Channel

For the B2B channel, we’ll configure a payment method, shipping method, and ensure that the site type is set to B2B. 

In the *Details* section, ensure the *Commerce Site Type* is set to *B2B* for the B2B channel. When the site type is B2B, every account in the site must be a business account. Select the *Type* tab, and click *Select Site*. Choose the *Delectable Bonsai B2B* site and click *Save*. You can now use this channel to accept customer orders from your site. 

```{note}
For the B2C channel, you must set the *Commerce Site Type* as *B2C*. There’s also a B2X type that permits both personal and business accounts. See [Site Types](https://learn.liferay.com/web/guest/w/commerce/starting-a-store/sites-and-site-types#site-types) for more information.
```

Delectable Bonsai offers their B2B customers an option to pay by money order. They ship using a variable shipping rate that is calculated based on the weight of the shipment. You can use Liferay’s out-of-the-box payment and shipping methods to implement both of these. 

### Configuring a Payment Method

1. Go to the *Payment Methods* section and select *Money Order*.

1. Activate it using the toggle.

1. Click *Save*.

   We want this to be eligible for all order types. If you want a specific message page to appear during checkout, go to the *Configuration* tab and enable the message page. You can also customize the message that appears in this checkout step. 

### Configuring a Shipping Method

1. Now, go to the *Shipping Methods* section and select *Variable Rate*.

1. Activate it using the toggle.

1. Click *Save*.

1. Go to the *Shipping Options* page, click the *Add* (![Add](../../images/icon-add.png)) button.

1. Enter the name as *Standard Shipping* and click *Save*.

1. Go to *Shipping Option Settings* and click the *Add* (![Add](../../images/icon-add.png)) button. 

1. Select the shipping option created earlier from the dropdown.

1. In the *Settings* section, enter the following details:

   **Shipping Option:** Standard Shipping

   **Weight From:** 0.0

   **Weight To:** 10.0

   **Fixed Price:** 4.99

   **Price per Unit of Weight:** 2.99

   ![Configure the available tiers of variable rate shipping.](./creating-and-configuring-channels/images/02.png)

1. Repeat this two more times with the following details: 

   | Shipping Option   | Weight From | Weight To | Fixed Price | Price per Unit of Weight |
   | :---------------- | :---------- | :-------- | :---------- | :----------------------- |
   | Standard Shipping | 10.01       | 20.0      | 5.99        | 3.99                     |
   | Standard Shipping | 20.01       | 30.0      | 6.99        | 4.99                     |

In the next section, we’ll set up order notifications and enable buyer order approval workflows. We’ll see how the order lifecycle changes when there’s a workflow in place and how users are notified at different stages of the order. 

Next: [Configuring Workflows and Notifications](./configuring-workflows-and-notifications.md)
