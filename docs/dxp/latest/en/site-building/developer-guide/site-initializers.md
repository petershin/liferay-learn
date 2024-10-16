---
uuid: 34b6efb5-564d-4599-af42-3fb082a7e598
taxonomy-category-names:
- Development and Tooling
- Client Extensions
---
# Site Initializers

{bdg-secondary}`Liferay 2023.Q4+/GA100+`

Site Initializers package pages, content, and configurations to help you jump-start a new site with much of the site already built. You can reuse them across multiple Liferay instances to replicate the essential components of your sites quickly.

See [Using a Site Initializer](../../liferay-development/importing-exporting-data/using-a-site-initializer-client-extension.md) for a complete walk through using a Site Initializer client extension.

## Creating a Site Initializer

Site Initializers are deployed as [*client extensions*](../../liferay-development/importing-exporting-data.md). Creating a Site Initializer requires creating a `client-extension.yaml` file.

Define your new site's name with the `siteName` property in `client-extension.yaml`. See [Working with Client Extensions](../../liferay-development/client-extensions/working-with-client-extensions.md) for more information on defining a client extension.

Add site configurations (such as whether it uses manual membership) in a `site-configuration.json` file. Add this file in a `site-initializer/` folder in your client extension project folder.

For example, this JSON configures the site's type and manual membership:

```json
{
    "manualMembership": "true",
    "membershipRestriction": "0",
    "typeSite": "1"
}
```

You can check the values for these configurations by inspecting data from the `Group_` database table in an existing site.

Adding content to a Site Initializer requires adding JSON data for each asset type following a specific format based on the required schema, and placing it in the right location.

## Adding Files to Import Assets

Almost all asset types are added with JSON in the `site-initializer/` folder. However, the specific asset type determines where and how you must add the data.

- For asset types that are *always scoped to a whole Liferay instance* (and there can be multiple), such as [organizations](../../users-and-permissions/organizations/understanding-organizations.md) or [roles](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md), include them all in a single JSON file named after the asset type at the root of the `site-initializer/` folder (e.g., `roles.json`).
- For more complex asset types (that may require more than a single JSON file), like [fragments](../creating-pages/page-fragments-and-widgets/using-fragments.md) or pages, add a folder named after the asset type (e.g., `fragments/` or `layouts/`) and a specific subfolder for each asset (e.g., `fragment-1/`, `fragment-2/`, etc.). Name the JSON file after the asset type (e.g., `fragment.json`).
- Other asset types belong in a folder named after the asset type (e.g., `object-actions/`), and each asset is included with its own JSON file.

For any asset types that belong in their own folder, you can put the contents in a `group/`, `company/`, or `asset-libraries/` to specify that they should be scoped to the imported site, to the whole Liferay instance, or to the asset library, respectively.

These asset types use more than a single JSON file when you include them:

- *Commerce catalogs* include additional JSON files for options (`[catalog name].options.json`), products (`[catalog name].products.json`), product specifications (`[catalog name].products.specifications.json`), and subscription properties (`[catalog name].products.subscriptions.properties.json`). They also may have a folder (sharing the catalog's name) containing product images.
- *Commerce notification templates* require a separate HTML file with the email template body *for each language* (named after language code, e.g., `en-US.html`).
- *DDM templates* require a separate `.ftl` file with the FreeMarker template itself (with the same name as the JSON file).
- *Fragments* require a separate `index.css`, `index.html`, and `index.js` file for the fragment code. They may be empty if they are not used.
- *Notification templates* require a separate HTML file with the email template body *for each language* (named after language code, e.g., `en-US.html`). Any associated object actions can also be included in a separate `notification-template.object-actions.json` file.
- *Segment experiences* can include a page (with a `page.json` file) and the page definition (in a `page-definition.json` file) in a folder with the same name as the segment experience's JSON file. You can also include child pages in subfolders.
- *Style books* include a separate JSON file for the style book tokens (in a `frontend-tokens-values.json` file) and a separate image file for a thumbnail (e.g., `thumbnail.png`).
- *Pages*, *page templates*, and *utility pages* all require a separate JSON file with the page definition (`page-definition.json`).
- *Vocabularies* may include their contained categories and subcategories in the desired hierarchy (by adding the child categories in a folder named after the parent). Categories *must* be within their containing vocabularies.
- *Web content (journal) articles* require a separate XML file (with the same name as the JSON file) with the article contents. You can also nest them in a desired hierarchy of web content folders, by including a JSON file with the folder's metadata alongside the folder (e.g., `[folder name].metadata.json`), instead of putting them in a folder for each article.
- *Workflow definitions* require a separate XML file (with the same name as the JSON file) with the workflow definition itself, and a separate JSON file for any properties (`workflow-definition.properties.json`).

There are also these exceptions to the above rules:

- *Commerce catalogs* use the catalog's name in a shared folder instead of the asset name (e.g., `[catalog name].json`).
- *DDM structures* may be included as XML structures instead of JSON.
- *Documents* only require the document files themselves (in the desired document folder structure).
- *Keywords* are included in a single, shared JSON file instead of with one file for each, despite being scoped to the site or asset library (e.g., `keywords/group/keywords.json`).
- *Pages*, *page templates*, and *utility pages* require their individual JSON files to be named after the asset type using `page` instead of `layout` (e.g., `page-template.json`).
- *Page sets* for the new site belong in `public/metadata.json` or `private/metadata.json`.
- *Portlet settings* are added as an FTL template instead of JSON.

## Preparing the JSON Data

The most important information needed for most asset types is the JSON data. The quickest way to get the correct data is to create it in another Liferay instance, but the correct method to retrieve it depends on the asset type. You must examine Liferay's source code to determine how to get it for each type.

1. For the type of asset or content you want to add, go to the [`liferay-portal` source code repository](https://github.com/liferay/liferay-portal/tree/master) and search for the correct `Initializer` class for your asset type: `BundleSiteInitializer`, `CommerceSiteInitializer`, or `OSBSiteInitializer`.

   The `Initializer` class has an `_add*` or `_addOrUpdate*` method with the name of your asset. Remember that the asset names in the code follow the names used in the database (e.g., *journal article* instead of *web content article*, or *layout* instead of *page*). If none of these `Initializer` classes have the desired asset type, it is not supported as part of a Site Initializer.

1. In the correct `Initializer` class, check the appropriate method for your chosen type of asset (e.g., `_addOrUpdateNotificationTemplate` for a notification template). Search the method implementation for these method calls:

   - `toDTO`: If the method includes a call to a `toDTO` method, find the corresponding REST API endpoint (at `[your domain]/o/api`) and download the asset using a `get` method there to get usable JSON data. You must identify the asset in its database table if the API requires fetching it by ID.

   - If the method instead includes a call to `[AssetName]Importer.import*` (e.g., `layoutsImporter.importFile`), download the related data using the [export/import center](../../headless-delivery/consuming-apis/data-migration-center.md) or via the *Export* option on the content's page in the site menu. You must enable the feature flag to enable the export/import center.

!!! warning
    The batch framework's export/import center is a [feature under development](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags). Never enable a dev feature flag in production.

If the method doesn't call either of these methods, the asset must follow the database schema itself. You may need your database administrator to query the database directly to get the asset's configuration.

## Adjusting the Data

Once you have the data in a JSON format, you must still make some changes to adjust it. Some information (such as specific IDs) only applies in the Liferay instance it originated from, so it is not allowed in a Site Initializer.

Follow these steps to adjust the data:

1. Remove fields that rely on specific IDs or other assets that may not apply in the target Liferay instance, such as the asset's ID, the creation/modified date, the created user's information, or related asset IDs.

1. If one or more of the fields contains data that is required in a separate file (such as the body of an email notification), remove that field in favor of the other file.

1. If the asset has an external reference code, change it to a new, unique value.

## Replacement Tokens

You can use replacement tokens to set field values for your assets that are specific to each deployment (such as the site ID). Use any of these token values as a substitute for values specific to your site:

- `[$COMPANY_ID$]`
- `[$GROUP_FRIENDLY_URL$]`
- `[$GROUP_ID$]`
- `[$GROUP_KEY$]`
- `[$PORTAL_URL$]`

These tokens convert into a string value (including quotation marks) in the JSON when the Site Initializer is deployed.

!!! tip
    You can also use any of these tokens with the `#` symbol instead (e.g., `[#GROUP_ID#]`) to represent the value without quotation marks (for example, when you need only the numeric value).

You can also use replacement tokens to represent other asset IDs that are not generated until deployment. For example, you can use this JSON to set an `objectDefinitionId` field using the `ObjectDefinition1` asset's ID once it's generated:

```json
"objectDefinitionId": "[$OBJECT_DEFINITION_ID:ObjectDefinition1$]"
```

!!! warning
    Coordinating different asset types in your site requires knowledge of their relationships in Liferay's database. Thoroughly test any changes to your JSON data before deploying it to a production instance.

Both of these formats are supported for this kind of replacement token:

- `[$FIELD_NAME:AssetName$]`: This sets the given field's value to the ID for the asset with a matching `name` field.
- `[$FIELD_NAME:path/to/file/filename$]`: This sets the given field's value to the ID for the asset at the provided file path. (The path should start at client extension's folder, with `/site-initializer/`). Use this format when the necessary asset may not have a unique `name`.

## Deploying a Site Initializer

Site initializers are deployed the same way as other client extensions. The required deployment method depends on how your target Liferay instance is hosted.

See [Deploying to Your Liferay Instance](../../liferay-development/client-extensions/working-with-client-extensions.md#deploying-to-your-liferay-instance) for more information.

## Related Topics

* [Export/Import Center](../../headless-delivery/consuming-apis/data-migration-center.md)
* [Working with Client Extensions](../../liferay-development/client-extensions/working-with-client-extensions.md)
* [Using a Site Initializer Client Extension](../../liferay-development/importing-exporting-data/using-a-site-initializer-client-extension.md)