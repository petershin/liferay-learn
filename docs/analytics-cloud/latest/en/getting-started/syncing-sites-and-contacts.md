# Syncing Sites and Contacts

Now that you've [Connected Liferay DXP to Analytics Cloud](./connecting-liferay-dxp-to-analytics-cloud.md), it's time to sync your site and your contacts.

```{note}
If you are new to Liferay DXP, there isn't much content on your Liferay instance for Analytics Cloud to start tracking. If you want to learn Analytics Cloud by jump-starting a demo site, consider using Liferay Commerce's [Minium Accelerator Site](https://learn.liferay.com/commerce/latest/en/starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.html) to generate some sample content. 
```

## Syncing Sites

The first step to syncing sites is creating a new Property. A property is a label associated with a single Liferay site or multiple Liferay sites. Analytics Cloud aggregates your data according to how you define your properties. This example shows a simple setup where a single site is associated with a property. To learn more about defining a property with multiple sites see [Scoping Sites and Individuals Using Properties](../workspace-settings/scoping-sites-and-individuals-using-properties.md).

1. In Analytics Cloud, navigate to _Settings_ &rarr; _Properties_. Click _New Property_ and input a label. (e.g. Minium Site).

2. In your Liferay DXP instance, open the Global Menu (![Global Menu](../images/icon-applications-menu.png)). Navigate to _Configuration_ &rarr; _Instance Settings_. Under _Platform_, click _Analytics Cloud_. Click _Select Sites_.

3. The property you just created appears under Available Properties. Click the name of your property. On the next page, select the site you want to sync and click _Done_.

   ![Select the site you want to sync and list of available sites.](./syncing-sites-and-contacts/images/02.png)

   Upon successful sync, this message appears at the bottom left of your screen:

    `Success: Your request completed successfully`

## Syncing Contacts

Next, you'll sync the existing contacts you have in your Liferay Instance. 

```{important}
Analytics Cloud gives you tools to sync and manage individual contact data. However, the tools discussed here and anywhere else in the documentation, including those directly aimed at addressing privacy regulations (e.g. GDPR), do not guarantee compliance with these privacy regulations. Each company or individual whose website processes personal data and is under the jurisdiction of specific privacy laws must carefully determine the steps necessary to ensure full compliance with these regulations.
```

1. In your Liferay DXP instance, open the Global Menu (![Global Menu](../images/icon-applications-menu.png)). Navigate to _Configuration_ &rarr; _Instance Settings_. Under _Platform_, click _Analytics Cloud_. Click _Select Contacts_.

1. Under the Contact Sync Options, click _Sync Contacts_. Use the switch to enable _Sync All_ to sync all your contacts. Alternatively, click _Sync by User Groups_ or _Sync by Organizations_ if you prefer to sync a subset of your contacts. Click _Save and Next_. 

1. Liferay DXP stores contact data in two separate tables (Contact and User). Switch between the _Contact_ tab and _User_ tab to select the fields to sync. Analytics Cloud requires some fields to be synced, so those are grayed out. For this example, keep the default selection. Click _Save_.

    ![Select the fields you want to sync from the list.](./syncing-sites-and-contacts/images/03.png)

    Upon successful sync, the following message appears at the bottom left of your screen:

    `Success: Your request completed successfully`

Great, now you're all set up! As users visit and interact with your site, Analytics Cloud begins tracking what's happening. Once that happens, you can take a dive into [Viewing the Analytics Dashboard](././viewing-the-analytics-dashboard.md) to see the different interactions that get tracked.
