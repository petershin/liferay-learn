---
uuid: f12d1fae-61aa-4d42-880c-b0d718838530
---
# Importing and Exporting Users

Once the LDAP server is connected to your Liferay environment, it is time to import or export users

## Importing LDAP Users

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_. 

1. Under security, click _LDAP_.

1. In the left navigation, click _Import_. 

1. Check the box for _Enable Import_. Click _Save_. Note, the default import interval is set to 10 minutes. Liferay performs a bulk import at this interval. 

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_. The users from the LDAP server have been imported.

   ![LDAP users have been imported.](./importing-and-exporting-users/images/01.png)

```{note}
If you choose not to import all the LDAP users at once (i.e. leave enable import box unchecked), users are imported individually when they log in.
```

## Exporting LDAP Users

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_. 

1. Under security, click _LDAP_.

1. In the left navigation, click _Export_. 

1. Check the boxes for _Enable Export_ and _Enable Group Export_. Click _Save_. 

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_. 

1. Edit and save a user. The Liferay user is now added to the LDAP server. Make sure the export mapping fields are set correctly in the export section of the LDAP server configuration.

The next step is [understanding GDPR](./understanding-gdpr.md).

## Relevant Concepts

[Configuring User Import and Export](https://learn.liferay.com/dxp/latest/en/users-and-permissions/connecting-to-a-user-directory/configuring-user-import-and-export.html)

[LDAP Reference Configuration](https://learn.liferay.com/dxp/latest/en/users-and-permissions/connecting-to-a-user-directory/ldap-configuration-reference.html)
