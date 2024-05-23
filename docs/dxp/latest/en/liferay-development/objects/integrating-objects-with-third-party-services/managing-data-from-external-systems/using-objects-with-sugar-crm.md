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

You can create objects that map to [SugarCRM](https://support.sugarcrm.com) objects (e.g., [Leads](https://support.sugarcrm.com/knowledge_base/accounts_contacts_leads/)), using SugarCRM as an external storage system. Once integrated, the Liferay object's data is only stored in SugarCRM. Both systems are automatically updated whenever users add, update, or delete entries in either context.

!!! note
    To use this feature, enable the Proxy Object (LPS-135430) [feature flag](../../../../system-administration/configuring-liferay/feature-flags.md).

## Preparing SugarCRM

In SugarCRM , you must generate an [OAuth key](https://support.sugarcrm.com/documentation/sugar_versions/14.0/sell/administration_guide/system/#OAuth_Keys) to configure API integration with Liferay. After that you can connect Liferay objects to system or custom objects in SugarCRM.

Gather the information Liferay needs to retrieve an access token and connect to your SugarCRM instance using an OAuth password grant:

* The URL to your instance's [root API endpoint](https://support.sugarcrm.com/documentation/sugar_developer/sugar_developer_guide_14.0/integration/web_services/rest_api/#How_to_Access_the_REST_Service)
* The URL to the endpoint for retrieving the [OAuth token](https://support.sugarcrm.com/documentation/sugar_developer/sugar_developer_guide_14.0/integration/web_services/rest_api/#Authentication)
* The Consumer Key to the [generated OAuth Key](https://support.sugarcrm.com/documentation/sugar_versions/14.0/sell/administration_guide/system/#OAuth_Keys_Fields)
* The user name and password of a [SugarCRM administrative user](https://support.sugarcrm.com/documentation/sugar_versions/14.0/sell/administration_guide/system/#OAuth_Keys_Fields)

Before creating your Liferay object, ensure the SugarCRM object includes all desired fields. Define any missing fields before linking with Liferay object fields.

## Configuring Your Liferay Instance

Connect your Liferay instance to SugarCRM:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Instance Settings*.

1. Click *Third Party* and go to the *SugarCRM Integration* entry.

1. Fill out the configuration form with the details gathered from your SugarCRM instance.

   **Access Token URL:** The URL to your instance's root API endpoint

   **Base URL:** The URL to the endpoint for retrieving the OAuth token

   **Client ID:** The Consumer Key to the OAuth Key

   **Grant Type:** `password`.

   **Password:** The password of a user that can authenticate to SugarCRM

   **User Name:** The user name of a user that can authenticate to SugarCRM

   ![Enter your SugarCRM details.](./using-objects-with-sugar-crm/images/01.png)

1. Click *Save*.

## Creating an Object with the SugarCRM Storage Type

To create a proxy object for storing data in SugarCRM, follow the [usual process](../../creating-and-managing-objects.md), but select the *SugarCRM* storage type. This configures the object to use SugarCRM as an external storage system.

![Select the SugarCRM storage type.](./using-objects-with-sugar-crm/images/02.png)

<!-- Is this true for SugarCRM? -->
!!! note
    Currently, the SugarCRM storage type only supports custom [fields](../../creating-and-managing-objects/fields.md), [views](../../creating-and-managing-objects/views.md), and [layouts](../../creating-and-managing-objects/layouts.md).

<!-- How does one know what to put as the ERC? -->
After creating the object draft, [add fields](../../creating-and-managing-objects/fields/adding-fields-to-objects.md) for each custom field in the SugarCRM object. To prevent data loss, ensure each field corresponds to a field in the SugarCRM object. Then edit each field and add external reference codes that link to the desired SugarCRM fields. For each ERC, use the name of the corresponding custom SugarCRM field (e.g., `Title_c`, `Due_Date__c`).

![Use the SugarCRM field name for the external reference code.](./using-objects-with-sugar-crm/images/03.png)

Once published, the Liferay object's data is only stored in SugarCRM. Both systems are automatically updated whenever users add, update, or delete entries on either side of the relationship.

## Related Topics

* [Creating Objects](../../creating-and-managing-objects/creating-objects.md)
* [Adding Fields](../../creating-and-managing-objects/fields/adding-fields-to-objects.md)
