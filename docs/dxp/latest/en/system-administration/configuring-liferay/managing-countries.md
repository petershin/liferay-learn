# Managing Countries

{bdg-secondary}`Available Liferay DXP 7.4 U36/Liferay Portal 7.4 GA36 and above`

Liferay ships with a list of available countries as defined by the [ISO 3166 Standard](https://www.iso.org/iso-3166-country-codes.html). If you have a need to modify an existing entry or add a new entry, use the Countries Management App.

## Enable the Countries Management App

By default, the Countries Management App is hidden from the UI. To enable the UI,

1. Add the following property to your [`portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) file: 
   
   `feature.flag.LPS-122223=true` 

1. Restart your server. The app is now visible.

   ![See the Countries Management app in the UI.](./managing-countries/images/01.png)

## Edit an Existing Country

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Configuration* &rarr; *Countries Management*

1. Select a country by clicking its name, or click _Options_ (![Options icon](../../images/icon-actions.png)) on the country and click _Edit_. Use the search bar to locate a specific country quickly.

1. Make your desired changes and click *Save*. The country has now been modified.

## Deactivate a Country

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Configuration* &rarr; *Countries Management*
   
1. Locate a country by scrolling through the list of countries. Use the search bar to locate a specific country quickly.

1. Click _Options_ (![Options icon](../../images/icon-options.png)) on the Country and click _Deactivate_. 

1. Click _OK_ to confirm and the country is deactivated.

## Activate a Country

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Configuration* &rarr; *Countries Management*

1. Click _Filter and Order_ next to the search bar and select *Inactive* to see a list of deactivated countries. Use the search bar to locate a specific country quickly.

1. Click _Options_ (![Options icon](../../images/icon-options.png)) on the Country and click _Activate_. The country is now active. 

## Delete a Country

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Configuration* &rarr; *Countries Management*

1. Locate a country by scrolling through the list of countries. Use the search bar to locate a specific country quickly.

1. Click _Options_ (![Options icon](../../images/icon-options.png)) on the Country and click _Delete_. 

1. Click _OK_ to confirm and the country is deleted.

```{warning}
Make sure you intend to delete an entry before you click _OK_. The entry cannot be recovered once deleted.
```

## Add a New Country

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Configuration* &rarr; *Countries Management*

1. Click _Add_ (![Add icon](../../images/icon-add.png)) next to the search bar. A new page will appear to add a country.

   ![A new page appears to add a country.](./managing-countries/images/02.png)

1. Fill in the different fields to add a new country. Note, Name, Two-Letter ISO Code, Three-Letter ISO Code, and Number are required fields.

1. Click _Save_ and the new country has been added.