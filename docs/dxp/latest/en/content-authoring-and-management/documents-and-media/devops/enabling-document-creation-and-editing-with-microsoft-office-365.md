---
taxonomy-category-names:
- Digital Asset Management
- Documents and Media
- DXP Configuration
- Data Integration
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 571fd02d-3c00-4ecb-93fe-b3f5666f3418
---

# Enabling Document Creation and Editing with Microsoft Office 365

Before you can use Office 365&trade; to create and edit Documents and Media files, you must configure DXP to connect with an application in the [Azure portal](https://portal.azure.com). You must have administrator rights to perform the following steps.

## Register an Application with the Microsoft Identity Platform

First, configure your application with the Microsoft identity platform&trade;. To do so, follow the steps described in [Microsoft's documentation](https://docs.microsoft.com/en-gb/graph/auth-register-app-v2).

To construct a URL for the *Redirect URI* parameter, follow this pattern: `https://[hostname]/o/document_library/onedrive/oauth2`

Here's the minimum permission set needed to use Office 365&trade; integration:

- `Files.Read.All`
- `Files.ReadWrite.All`

For more information about permissions, see [Microsoft's documentation](https://docs.microsoft.com/graph/permissions-reference).

## Configuring DXP

Connect your DXP installation to your Microsoft identity platform&trade; application. This can be done this in two ways:

- Globally, for all instances in your DXP installation.

   Navigate to *Control Panel* &rarr; *System Settings* &rarr; *Documents and Media* under Content and Data.

- At the instance level, for specific instances in your DXP installation.

   Navigate to the *Control Panel* &rarr; *Instance Settings* &rarr; *Documents and Media* under Content and Data.

To override the global configuration, configure the desired instances individually. You may also leave the global configuration blank if only certain instances must connect to your application.

To configure,

1. Click *OneDrive* in the left menu.

   ![Enter your Client ID, Client Secret, and Tenant.](./enabling-document-creation-and-editing-with-microsoft-office-365/images/01.png)

1. Enter your application's OAuth 2 *Client ID* and *Client Secret*.

1. Enter your *Tenant ID*. To locate it, see [Microsoft's documentation](https://docs.microsoft.com/onedrive/find-your-office-365-tenant-id).

1. Click *Save*.

Access is now granted at the specified level.

!!! note
    To disable this feature, delete the Client ID, Client Secret, and Tenant ID from the form.

## Related Topics

- [Enabling Document Creation and Editing with Google Drive](./google-drive-integration/enabling-document-creation-and-editing-with-google-drive.md)
- [Creating and Editing Documents with Microsoft Office 365](../uploading-and-managing/creating-documents/creating-and-editing-documents-with-microsoft-office-365.md)
