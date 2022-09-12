# Syncing Sites and Contacts

Now that you've [Connected Liferay DXP to Analytics Cloud](./connecting-liferay-dxp-to-analytics-cloud.md), it's time to sync your site and your contacts.

## Optional Sample Setup 

If you're also new to Liferay DXP, there isn't much on your Liferay instance for Analytics Cloud to start tracking. Use Liferay Commerce's [Minimum Accelerator Site](https://learn.liferay.com/commerce/latest/en/starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.html) to get some sample content that you can use to explore Analytics Cloud.

1. In your Liferay instance, open the Global Menu (![Global Menu](../images/icon-applications-menu.png)). Navigate to _Control Panel_ &rarr; _Sites_. 

1. Click the (![Add icon](../images/icon-add.png)) and select _Minimum_. Give the sample site a name (e.g. Minimum Site). Click _Add_. The Minimum sample site has now been added.

    ![Select the Minimum Site and add it to your Liferay instance.](./syncing-sites-and-contacts/images/01.png)

Let's add a few sample users to our Liferay instance for Analytics Cloud to also track. 

1. In your Liferay instance, open the Global Menu (![Global Menu](../images/icon-applications-menu.png)). Navigate to _Control Panel_ &rarr; _System_ &rarr; _Server Administration_. Click on the _Script_ tab.

1. In the Script window, paste the following:

    ```groovy
    import com.liferay.portal.kernel.service.UserLocalServiceUtil;
    import com.liferay.portal.kernel.util.LocaleUtil;
    import com.liferay.portal.kernel.service.ServiceContext;
    import com.liferay.portal.kernel.service.ServiceContextThreadLocal;

    ServiceContext serviceContext = ServiceContextThreadLocal.getServiceContext();
    long companyId = serviceContext.getCompanyId();

    UserLocalServiceUtil.addUser(0L, companyId, false, "test", "test", false, "John", "john@liferay.com", LocaleUtil.getDefault(), "John", "", "Liferay", 0, 0, true, 1, 1, 1975, "Manager", new long[0], new long[0], new long[0], new long[0], false, serviceContext);

    UserLocalServiceUtil.addUser(0L, companyId, false, "test", "test", false, "Emily", "emily@liferay.com", LocaleUtil.getDefault(), "Emily", "", "Liferay", 0, 0, false, 3, 1, 1985, "Sales Agent", new long[0], new long[0], new long[0], new long[0], false, serviceContext);

    UserLocalServiceUtil.addUser(0L, companyId, false, "test", "test", false, "David", "david@liferay.com", LocaleUtil.getDefault(), "David", "", "Liferay", 0, 0, true, 5, 1, 1995, "Engineer", new long[0], new long[0], new long[0], new long[0], false, serviceContext);
    ```

    Click _Execute_. Three new users have been added to your instance.

1. Open the Global Menu (![Global Menu](../images/icon-applications-menu.png)) and navigate to _Control Panel_ &rarr; _Instance Settings_. Under the _Platform_ section, click _User Authentication_. Uncheck `Require strangers to verify their email address?
` and click _Save_. Note, this setting makes it so we can login with these sample users without the need for email verification.

1. Open the Global Menu (![Global Menu](../images/icon-applications-menu.png)) and navigate to _Control Panel_ &rarr; _Users and Organizations_.

1. Click on _John Liferay_. Click on _Memberships_. Click _Select_ next to Sites. Click _Minimum Site_. Scroll down to the bottom and click _Save_. The user is now a member of the Minimum site.

1. Add the other two users as members of the Minimum site by following the same steps. 

## Syncing Sites

The first step to syncing sites is creating a new Property. A property is a label that is associated with a single Liferay site or multiple Liferay sites. Analytics Cloud aggregates your data according to how you define your properties. This article shows a simple setup where a single site is associated with a property. To learn more about defining a property with multiple sites see [Scoping Sites and Individuals Using Properties](../connecting-data-sources/scoping-sites-and-individuals-using-properties.md).

1. In Analytics Cloud, navigate to _Settings_ &rarr; _Properties_. Click _New Property_ and input a label. (e.g. Beryl Intranet).

1. In your Liferay DXP instance, open the Global Menu (![Global Menu](../images/icon-applications-menu.png)). Navigate to _Configuration_ &rarr; _Instance Settings_. Under the _Platform_ section, click _Analytics Cloud_. Click _Select Sites_.

1. The property you just created should be listed under Available Properties. Click the name of your property. On the next page, select the site you want to sync and click _Done_.

   ![Select the site you want to sync and list of available sites.](./syncing-sites-and-contacts/images/02.png)

   Upon successful sync, you will see the following message at the bottom left of your screen:

    `Success: Your request completed successfully`

## Syncing Contacts

Next, we'll sync the existing contacts you have in your Liferay Instance. 

```{important}
Analytics Cloud gives you the tools to sync and manage individual contact data. However, the tools discussed here and anywhere else in the documentation, including those directly aimed at addressing privacy regulations (e.g. GDPR), do not guarantee compliance with these privacy regulations. Each company or individual whose website processes personal data and is under the jurisdiction of specific privacy laws must carefully determine the steps necessary to ensure they are fully compliant with these regulations.
```

1. In your Liferay DXP instance, open the Global Menu (![Global Menu](../images/icon-applications-menu.png)). Navigate to _Configuration_ &rarr; _Instance Settings_. Under the _Platform_ section, click _Analytics Cloud_. Click _Select Contacts_.

1. Under the Contact Sync Options, click _Sync Contacts_. Use the switch to enable _Sync All_ if you wish to sync all your contacts. Alternatively, click on _Sync by User Groups_ or _Sync by Organizations_ if you prefer to sync a subset of your contacts. Click _Save and Next_.

1. Liferay DXP stores contact data in two separate tables (Contact and User). Switch between the Contact tab and User tab to select the fields to sync. Analytics Cloud requires some fields to be synced, so those are grayed out. Click _Save_.

    ![Select the fields you want to sync from the list.](./syncing-sites-and-contacts/images/03.png)

    Upon successful sync, you will see the following message at the bottom left of your screen:

    `Success: Your request completed successfully`

Great, now you're all set up! As users visit and interact with your site, Analytics Cloud will begin tracking what's happening. Let's take a dive into [Understanding Your Site's Data](./understanding-your-sites-data.md) and see the different interactions that get tracked.
