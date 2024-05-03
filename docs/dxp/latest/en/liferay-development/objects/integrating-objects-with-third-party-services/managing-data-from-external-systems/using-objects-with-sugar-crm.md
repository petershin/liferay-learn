---
uuid: 6ab10d7b-f529-42d5-9fdf-71e88b41f4f5
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using Objects with SugarCRM

{bdg-link-primary}`[Beta Feature](../../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

<!-- Is the use case basically identical? What in SugarCRM corresponds to the object? I don't see applications so it is all the resources in the menu (e.g., Leads, Opportunities, Tasks, etc.)? I have no experience with CRMs prior to this -->
You can create objects that integrate with [SugarCRM objects](https://help.salesforce.com/s/), using SugarCRM as an external storage system. Once integrated, the Liferay object's data is only stored in SugarCRM. Both systems are automatically updated whenever users add, update, or delete entries in either context.

Using this integration requires a standard or custom SugarCRM object, as well as a SugarCRM connected app for Liferay with OAuth enabled. See [Preparing SugarCRM](#preparing-sugarcrm) for more information.

!!! note
    To use this feature, enable the Proxy Object (LPS-135430) [feature flag](../../../../system-administration/configuring-liferay/feature-flags.md).

## Preparing SugarCRM

<!-- Need someone to walk me through this as I don't see an obvious equivalent to the Salesforce applications in SugarCRM -->

SugarCRM [connected apps](https://help.salesforce.com/s/articleView?id=sf.connected_app_overview.htm&type=5) are frameworks for allowing external applications to integrate with your SugarCRM account via APIs and standard protocols (e.g., SAML, OAuth). Before proceeding, [create a connected app](https://help.salesforce.com/s/articleView?id=sf.connected_app_create.htm&type=5) to enable your Liferay instance to integrate with SugarCRM.

![Create a connected app in SugarCRM for connecting with your Liferay server.](./using-objects-with-sugar-crm/images/01.png)

When setting up the connected app in SugarCRM, [enable and configure OAuth](https://help.salesforce.com/s/articleView?id=sf.connected_app_create_api_integration.htm&type=5) for the API integration with Liferay. During this process, be sure to copy the OAuth consumer key and secret. These details are necessary when [configuring your Liferay instance](#configuring-your-liferay-instance).

![Enable OAuth for the Liferay connected app and retrieve the OAuth consumer key and secret for use in your Liferay instance.](./using-objects-with-sugar-crm/images/02.png)

Before creating your Liferay object, ensure your [standard](https://help.salesforce.com/s/articleView?id=sf.extend_click_find_objectmgmt_parent.htm&type=5) or [custom](https://help.salesforce.com/s/articleView?id=sf.dev_objectedit.htm&type=5) SugarCRM object includes all desired fields. These fields must be defined before you can link Liferay object fields to them.

![Ensure the custom SugarCRM object includes all desired fields.](./using-objects-with-sugar-crm/images/03.png)

## Configuring Your Liferay Instance

The base URL to your SugarCRM instance, the path to its OAuth token, the Client ID (this may be called the Consumer Key in the SugarCRM interface). Al;so the grant type, password, and user name (is you choose password as grant type, I'm guessing?)

Follow these steps to connect your Liferay instance to SugarCRM:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Instance Settings*.

1. Click *Third Party* and go to the *SugarCRM Integration* tab.

1. Enter your SugarCRM login info and OAuth credentials for the [Liferay connected app](https://help.salesforce.com/s/articleView?id=sf.connected_app_overview.htm&type=5).

   For *Login URL*, you can use `https://login.salesforce.com/` or the login URL for your SugarCRM domain.

   ![Enter your SugarCRM details.](./using-objects-with-sugar-crm/images/04.png)

1. Click *Save*.

## Creating an Object with the SugarCRM Storage Type

Creating an object for storing data in SugarCRM follows the same process for creating any object, except that you select the *SugarCRM* storage type during draft creation. This configures the object to use SugarCRM as an external storage system. See [Creating Objects](../../creating-and-managing-objects/creating-objects.md) to learn more about creating objects.

![Select the SugarCRM storage type.](./using-objects-with-sugar-crm/images/05.png)


<!-- Is this true for SugarCRM? -->
!!! note
    Currently, the SugarCRM storage type only supports custom [fields](../../creating-and-managing-objects/fields.md), [views](../../creating-and-managing-objects/views.md), and [layouts](../../creating-and-managing-objects/layouts.md).

After creating the object draft, [add fields](../../creating-and-managing-objects/fields/adding-fields-to-objects.md) for each custom field in the SugarCRM object. To prevent data loss, ensure each field corresponds to a custom field in the desired SugarCRM object. Then edit each field and add external reference codes that link to the desired SugarCRM fields. For each ERC, use the name of the corresponding custom SugarCRM field (e.g., `Title_c`, `Due_Date__c`).

![Use the SugarCRM field name for the external reference code.](./using-objects-with-sugar-crm/images/06.png)

Once published, the Liferay object's data is only stored in SugarCRM. Both systems are automatically updated whenever users add, update, or delete entries on either side of the relationship.

## Related Topics

* [Creating Objects](../../creating-and-managing-objects/creating-objects.md)
* [Adding Fields](../../creating-and-managing-objects/fields/adding-fields-to-objects.md)
