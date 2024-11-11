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

Begin by configuring an application in the Microsoft identity platform&trade;. Follow the steps in [Microsoft's documentation](https://docs.microsoft.com/en-gb/graph/auth-register-app-v2).

In the platform, register the redirect URI for the application. Use this pattern for the Redirect URI: `https://[hostname]/o/document_library/onedrive/oauth2` (e.g., `https://localhost:8080/o/document_library/onedrive/oauth2`).

Locate the `Application (client) ID` and the `Directory (tenant) ID` in your app registration. These identifiers are used while [configuring DXP](#configuring-dxp).

!!! important
    You need the `Files.Read.All` and `Files.ReadWrite.All` permissions for Office 365&trade; integration. For more information about permissions, see [Microsoft's documentation](https://docs.microsoft.com/graph/permissions-reference).

## Configuring DXP

Connect your DXP installation to the Microsoft identity platform&trade; application. Configuration can be set at either the global level (for all instances) or per-instance level.

You can configure instances individually to override global settings, or leave the global configuration blank if only specific instances require access.

To access the global configuration, open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *System Settings* &rarr; *Documents and Media* under Content and Data.

To access the instance-level configuration, open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to the *Control Panel* &rarr; *Instance Settings* &rarr; *Documents and Media* under Content and Data.

To complete the configuration,

1. Click *OneDrive* in the left menu.

   ![Enter your Client ID, Client Secret, and Tenant.](./enabling-document-creation-and-editing-with-microsoft-office-365/images/01.png)

1. Enter your application's OAuth 2 *Client ID* and *Client Secret*.

1. Enter your *Tenant ID*. To locate it, see [Microsoft's documentation](https://docs.microsoft.com/onedrive/find-your-office-365-tenant-id).

1. Click *Save*.

The integration is now enabled at the specified level.

!!! note
    To disable this feature, delete the *Client ID*, *Client Secret*, and *Tenant ID* from the form.

## Related Topics

- [Enabling Document Creation and Editing with Google Drive](./google-drive-integration/enabling-document-creation-and-editing-with-google-drive.md)
- [Creating and Editing Documents with Microsoft Office 365](../uploading-and-managing/creating-documents/creating-and-editing-documents-with-microsoft-office-365.md)
