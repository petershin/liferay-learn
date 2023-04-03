# Setting Channel Defaults

To set channel defaults for an account, open the *Global Menu* ( ![Global Menu](../../../images/icon-applications-menu.png) ) and navigate to *Control Panel* &rarr; *Accounts*. Select an account and click *Channel Defaults*. See the following sections for more information on setting channel defaults. 

```{note}
If you set defaults for all other channels and for individual channels, the individual defaults takes priority if eligible. 
```

## Setting Default Billing and Shipping Addresses

{bdg-secondary}`Available Liferay 7.4 U41+/GA41+` 

1. Click the *Add* button ( ![Add Button](../../../images/icon-add.png) ) under Billing Addresses or Shipping Addresses. 

1. Select *All Channels* or an individual *channel*. 

1. Select an *address*. 

1. Click *Save*. 

   ![Set default billing and shipping addresses for all or individual channels.](./setting-channel-defaults/images/01.png)

## Setting Default Terms and Conditions 

{bdg-secondary}`Available Liferay 7.4 U40+/GA40+` 

1. Click the *Add* button ( ![Add Button](../../../images/icon-add.png) ) under Delivery Terms and Conditions or Payment Terms and Conditions. 

1. Select *All Channels* or an individual *channel*. 

1. (Optional) Enable the *Override Eligibility* toggle to override eligibility set for the delivery terms and conditions individually. 

   ```{important}
   Overriding eligibility for terms and conditions do not make them eligible for a particular channel. Payment terms are linked to a payment method and delivery terms are linked to a shipping option. When there are multiple eligible terms and conditions for a payment method or shipping option, overriding eligibility sets the selected terms and conditions as a default. 
   ```

1. Select a *term*. 

1. Click *Save*. 

   ![Set default terms and conditions for all or individual channels.](./setting-channel-defaults/images/02.png)

## Setting Default Shipping Options

{bdg-secondary}`Available Liferay 7.4 U49+//GA49+`

The default shipping value is determined by existing priority settings configured for the channel. If other shipping options are available, you can select one of them: 

1. Go to *Shipping Options* and click *Edit* for the desired channel. 

1. Select a *shipping option*. 

1. Click *Save*. 

   ![Set a default shipping option for individual channels.](./setting-channel-defaults/images/03.png)

## Setting Default Price Lists and Discounts

{bdg-secondary}`Available Liferay 7.4 U40+/GA40+`

1. Click the *Add* button ( ![Add Button](../../../images/icon-add.png) ) under Price Lists or Discounts. 

1. Select *All Channels* or an individual *channel*. 

1. (Optional) Enable the *Override Eligibility* toggle to override existing eligibility criteria configured for price lists. 

1. Select a *price list* or *discount*. 

1. Click *Save*. 

   ![Set a default price list or discount for all or individual channels.](./setting-channel-defaults/images/04.png)

## Setting Default Currencies

{bdg-secondary}`Available Liferay 7.4 U42+/GA42+`

1. Click the *Add* button ( ![Add Button](../../../images/icon-add.png) ) under Currencies. 

1. Select *All Channels* or an individual *channel*. 

1. Select a *currency*. 

   ```{important}
   This sets the default channel currency for the account during navigation only. Product pages and the catalog uses the currency set here. The currency set for the channel at the time of creation is not modified. 
   ```

1. Click *Save*. 

   ![Set a default currency for all or individual channels.](./setting-channel-defaults/images/05.png)

## Setting Payment Methods

The default payment method is determined by existing priority settings configured for the channel. If other payment methods are available, you can select one of them: 

1. Go to *Payment Methods* and click *Edit* for the desired channel. 

1. Select a payment method. 

1. Click *Save*. 

   ![Set a default payment method for individual channels.](./setting-channel-defaults/images/06.png)

## Setting Channel Account Managers

{bdg-secondary}`Available Liferay 7.4 U46+/GA46+`

```{important}
Channel account manager is not a new role in Liferay. The newly added permission gives users with a regular role a view into accounts outside the organization structure. This was not possible earlier. 
```

Channel account managers view and manage orders for accounts from one or more channels. If you have a channel account manager per channel, they can only manage orders for the selected account coming in from the selected channel. You can have multiple channel account managers for one channel. To select a user as the channel account manager, you need the following permission. 

| Permission                                                               | Description                                                            |
| :----------------------------------------------------------------------- | :--------------------------------------------------------------------- |
| Accounts > Account Entry: Manage Available Accounts via User Channel Rel | Manage accounts by creating a relationship between users and channels. |

![Use this permission to allow a user to appear in the channel account manager dropdown.](./setting-channel-defaults/images/07.png)

```{note}
You can use this permission with _Regular Roles_ only. Users with this permission appear in the channel account manager dropdown. For the user to view and manage orders, you must also enable order related permissions. 

Channel account managers work with or without [organizations](https://learn.liferay.com/web/guest/w/dxp/users-and-permissions/organizations/understanding-organizations). If you use organizations, this user can manage accounts where they are a channel manager in addition to the accounts in the organization they have permission to manage. If you do not use organizations, you can use a channel account manager to control access to individual accounts. 
```

To set up a default channel account manager, 

1. Click the *Add* button ( ![Add Button](../../../images/icon-add.png) ) under Channel Account Managers. 

1. Select *All Channels* or an individual *channel*. 

1. Select a *user*. 

1. Click *Save*. 

   ![Select default channel account manager for all or individual channels.](./setting-channel-defaults/images/08.png)
