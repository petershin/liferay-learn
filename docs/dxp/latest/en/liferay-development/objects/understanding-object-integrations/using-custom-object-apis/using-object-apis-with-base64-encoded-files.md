---
uuid: e437d8ee-18a7-4255-9878-0da6a4e02727
taxonomy-category-names:
- Integration
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Using Object APIs With Base64 Encoded Files

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+`

When creating object entries with [attachment fields](../../creating-and-managing-objects/fields/attachment-fields.md) through APIs, you can generally upload files from your computer or use files uploaded to the [Documents and Media](../../../../content-authoring-and-management/documents-and-media.md) application. Both scenarios require multiple steps.

You can either upload the document and provide its ID or external reference code (ERC) when posting the object entry via API, or you can post the object entry via API and attach the file to it later through the UI.

Alternatively, you can post object entries with attachments in one step by making a POST request and including a Base64-encoded file in the request body.

!!! note
    {bdg-secondary}`Liferay DXP 2024.Q4+` The Objects framework supports External Reference Codes (ERCs) to give you a way to identify external resources across systems.

    In particular, the Objects Framework uses ERCs to link attachments to object entries, enabling consistent references across environments. When object entries are imported, their attachments are recognized automatically if present, or placeholders are created for later resolution. Additionally, for attachments uploaded directly by users and hidden from Documents and Media, the content can be included in exported data in Base64 format to facilitate availability upon import.

Before proceeding, [set up](#setting-up-a-liferay-instance) a new Liferay DXP/Portal 7.4 instance and [prepare](#preparing-the-sample-code) the provided tutorial code.

## Setting Up a Liferay Instance

```{include} /_snippets/run-liferay-portal.md
```

Follow these steps to [create](../../creating-and-managing-objects/creating-objects.md) a basic object for this tutorial:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the *Add* button (![Add Button](../../../../images/icon-add.png)) and enter these values:

   | Field        | Value |
   |:-------------|:------|
   | Label        | Able  |
   | Plural Label | Ables |
   | Name         | Able  |

1. Select the new *Object* draft, go to the *Fields* tab, and add the following fields:

   | Label                    | Field Name               | Type       | Request Files                                                                                      |
   |:-------------------------|:-------------------------|:-----------|:---------------------------------------------------------------------------------------------------|
   | usersComputerAttachment1 | usersComputerAttachment1 | Attachment | `Upload Directly from the User's Computer`                                                         |
   | usersComputerAttachment2 | usersComputerAttachment2 | Attachment | `Upload Directly from the User's Computer` (Toggle the `Show Files in Documents and Media` option) |
   | docsAndMediaAttachment   | docsAndMediaAttachment   | Attachment | `Upload or Select from Documents and Media Item Selector`                                          |

   Alternatively, execute `ObjectDefinition_POST_ToInstance.sh` to create the object definition. Afterward, you can access the object definition at *Global Menu* &rarr; *Control Panel* &rarr; *Objects* and continue with the next step.

   ```bash
   ./ObjectDefinition_POST_ToInstance.sh
   ```

1. In the Details tab, select *Company* as the Scope, *Object* under Panel Link, and click [*Publish*](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts).

   !!! important
       For this tutorial, you must use the above values.

Once published, you can access the object via APIs.

## Preparing the Sample Code

Run the following commands to download and unzip the provided sample code:

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-p7x7.zip -O
```

```bash
unzip liferay-p7x7.zip
```

These scripts include the following APIs:

| HTTP Method | HTTP Endpoint     | Description                                                                                                                |
| :---------- | :---------------- | :------------------------------------------------------------------------------------------------------------------------- |
| GET         | `/`               | Returns a complete list of object entries in a Liferay instance; results can be paginated, filtered, searched, and sorted. |
| POST        | `/`               | Creates object entries using the details provided in the API call.                                                         |
| PUT         | `/[objectNameId]` | Replaces the specified Object entry's details with those provided in the API call                                          |
| DELETE      | `/[objectNameId]` | Deletes the specified Object entry and returns a 204 if the operation succeeds                                             |

1. After downloading the sample code, navigate to the `curl` folder in the `liferay-p7x7` project.

   ```bash
   cd liferay-p7x7/curl
   ```

### Posting an Attachment Uploaded Directly From the User's Computer

To create an object entry with an attachment using the `Upload Directly from the User's Computer` Request Files option,

1. Execute `Able_POST_FromUsersComputer1.sh`. This creates an object entry with a Base64 file attached to it.

   ```bash
   ./Able_POST_FromUsersComputer1.sh
   ```

   Use the `fileBase64` parameter to attach the file to the object entry.

   ```bash
   ...
	--data-raw '{
		"externalReferenceCode": "ATTACHMENT_FROM_USERS_COMPUTER_1",
		"usersComputerAttachment1": {
			"fileBase64": "iVB0...gg==",
			"name": "AttachmentFromUsersComputer1.png"
		}
   ...
   ```

   The terminal shows a similar output.

   ```bash
   {
      "actions": {
         "permissions": {
            "method": "GET",
            "href": "http://localhost:8080/o/c/ables/32268/permissions"
         },
         "get": {
            "method": "GET",
            "href": "http://localhost:8080/o/c/ables/32268"
         },
         "replace": {
            "method": "PUT",
            "href": "http://localhost:8080/o/c/ables/32268"
         },
         "update": {
            "method": "PATCH",
            "href": "http://localhost:8080/o/c/ables/32268"
         },
         "delete": {
            "method": "DELETE",
            "href": "http://localhost:8080/o/c/ables/32268"
         }
      },
      "creator": {
         "additionalName": "",
         "contentType": "UserAccount",
         "familyName": "Test",
         "givenName": "Test",
         "id": 20122,
         "name": "Test Test"
      },
      "dateCreated": "2024-06-05T16:37:26Z",
      "dateModified": "2024-06-05T16:37:26Z",
      "externalReferenceCode": "ATTACHMENT_FROM_USERS_COMPUTER_1",
      "id": 32268,
      "keywords": [],
      "status": {
         "code": 0,
         "label": "approved",
         "label_i18n": "Approved"
      },
      "taxonomyCategoryBriefs": [],
      "usersComputerAttachment1": {
         "id": 32263,
         "link": {
            "href": "/documents/32260/32262/AttachmentFromUsersComputer1.png/f0a02e6a-8eeb-d021-bfdd-82da1afab1cf?version=1.0&t=1717605446526&download=true&objectDefinitionExternalReferenceCode=ABLE&objectEntryExternalReferenceCode=ATTACHMENT_FROM_USERS_COMPUTER_1",
            "label": "AttachmentFromUsersComputer1.png"
         },
         "name": "AttachmentFromUsersComputer1.png"
      }
   }
   ```

   Note that the response doesn't contain the `fileBase64` encoding by default. See [Getting the Attachment's Content in the Response](#getting-the-attachments-content-in-the-response) to learn more.

Execute `Able_POST_FromUsersComputer2.sh` to create an object entry with an attachment using the `Upload Directly from the User's Computer` Request Files option and the `Show Files in Documents and Media` option toggled on. Note that specifying a folder is unnecessary. The folder selection is based automatically on the company for company-scoped object definitions or the site for site-scoped object definitions.

```bash
./Able_POST_FromUsersComputer2.sh
```

### Posting an Attachment Uploaded or Selected From The Documents and Media Item Selector

1. Execute `DocumentFolder_POST_ToSite.sh` to create the folder to store the uploaded file. Use the site ID as a parameter. In this example, the site ID is `20117`

   !!! tip
       Locate the site ID at *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)) &rarr; *Configuration* &rarr; *Site Settings* &rarr; *Site Configuration* under Platform.

   ```bash
   ./DocumentFolder_POST_ToSite.sh [site-id]
   ```

   The terminal should display a similar output.

   ```bash
   {
   "actions" : {
      "subscribe" : {
         "method" : "PUT",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32258/subscribe"
      },
      "unsubscribe" : {
         "method" : "PUT",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32258/unsubscribe"
      },
      "get" : {
         "method" : "GET",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32258"
      },
      "replace" : {
         "method" : "PUT",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32258"
      },
      "update" : {
         "method" : "PATCH",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32258"
      },
      "delete" : {
         "method" : "DELETE",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32258"
      }
   },
   "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Test",
      "givenName" : "Test",
      "id" : 20122,
      "name" : "Test Test"
   },
   "customFields" : [ ],
   "dateCreated" : "2024-06-05T16:37:12Z",
   "dateModified" : "2024-06-05T16:37:12Z",
   "description" : "This folder stores the attachment files for this exercise.",
   "externalReferenceCode" : "ABLE_FOLDER",
   "id" : 32258,
   "name" : "Able Folder",
   "numberOfDocumentFolders" : 0,
   "numberOfDocuments" : 0,
   "siteId" : 20117,
   "subscribed" : false
   }
   ```

1. Execute `Able_POST_FromDocumentsAndMedia.sh`. This creates an object entry with a Base64 file attached to it and places it in the recently created folder. Use the folder's ERC and the site ID as parameters. In this example, the ERC is `ABLE_FOLDER` and the site ID is `20117`.

   ```bash
   ./Able_POST_FromDocumentsAndMedia.sh [ERC] [site-id]
   ```

   Use the `folder` parameter to add the `externalReferenceCode` and the `siteId` to store the document. 

   ```bash
   ...
   "folder": {
      "externalReferenceCode": "'${1}'",
      "siteId": "'${2}'"
   },
   ...
   ```

   !!! note
       If the `siteId` or the `ERC` are not included, null, or empty, the POST request still works, and the file is uploaded to the default site's root folder.

   The terminal should display a similar output.

   ```bash
   {
   "actions" : {
      "permissions" : {
         "method" : "GET",
         "href" : "http://localhost:8080/o/c/ables/32337/permissions"
      },
      "get" : {
         "method" : "GET",
         "href" : "http://localhost:8080/o/c/ables/32337"
      },
      "replace" : {
         "method" : "PUT",
         "href" : "http://localhost:8080/o/c/ables/32337"
      },
      "update" : {
         "method" : "PATCH",
         "href" : "http://localhost:8080/o/c/ables/32337"
      },
      "delete" : {
         "method" : "DELETE",
         "href" : "http://localhost:8080/o/c/ables/32337"
      }
   },
   "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Test",
      "givenName" : "Test",
      "id" : 20122,
      "name" : "Test Test"
   },
   "dateCreated" : "2024-06-05T16:37:36Z",
   "dateModified" : "2024-06-05T16:37:36Z",
   "externalReferenceCode" : "ATTACHMENT_FROM_DOCS_AND_MEDIA",
   "id" : 32337,
   "keywords" : [ ],
   "status" : {
      "code" : 0,
      "label" : "approved",
      "label_i18n" : "Approved"
   },
   "taxonomyCategoryBriefs" : [ ],
   "docsAndMediaAttachment" : {
      "id" : 32332,
      "link" : {
         "href" : "/documents/20119/0/AttachmentFromDocumentsAndMedia.png/bbe75f48-04ce-2967-1721-973655b9a853?version=1.0&t=1717605455991&download=true&objectDefinitionExternalReferenceCode=ABLE&objectEntryExternalReferenceCode=ATTACHMENT_FROM_DOCS_AND_MEDIA",
         "label" : "AttachmentFromDocumentsAndMedia.png"
      },
      "name" : "AttachmentFromDocumentsAndMedia.png"
   }
   }
   ```

   !!! note
       Uploading a file with the same name as an existing file in the destination folder results in the new file being renamed with a unique sequential number in parentheses (i.e., `Name (n).extension`).

   Note that the response doesn't contain the `fileBase64` encoding by default. See [Getting the Attachment's Content in the Response](#getting-the-attachments-content-in-the-response) to learn more.

### Getting a List of All Entries

1. Run `Able_GET_FromCompany.sh` to get a list of all entries.

   ```bash
   ./Able_GET_FromCompany.sh
   ```

   The response should include information about the attached file such as the `id`, a `link` where you can download it, its `label`, and its `name`.

   ```bash
   ...
   "dateCreated" : "2024-06-05T16:37:26Z",
   "dateModified" : "2024-06-05T16:37:26Z",
   "externalReferenceCode" : "ATTACHMENT_FROM_USERS_COMPUTER_1",
   "id" : 32268,
   "keywords" : [ ],
   "status" : {
   "code" : 0,
   "label" : "approved",
   "label_i18n" : "Approved"
   },
   "taxonomyCategoryBriefs" : [ ],
   "usersComputerAttachment1" : {
   "id" : 32263,
   "link" : {
      "href" : "/documents/32260/32262/AttachmentFromUsersComputer1.png/f0a02e6a-8eeb-d021-bfdd-82da1afab1cf?version=1.0&t=1717605446526&download=true&objectDefinitionExternalReferenceCode=ABLE&objectEntryExternalReferenceCode=ATTACHMENT_FROM_USERS_COMPUTER_1",
      "label" : "AttachmentFromUsersComputer1.png"
   },
   "name" : "AttachmentFromUsersComputer1.png"
   }
   ...
   ```

   Note that the response contains the address for the files, but it doesn't contain the `fileBase64` encodings by default. See [Getting the Attachment's Content in the Response](#getting-the-attachments-content-in-the-response) to learn more.

### Updating an Object Entry With an Attachment

Use a PUT request to replace the entire object entry with the details provided in the API call. In this case, the same structure used to POST the object entry must be used with the PUT request, with alterations to the specific fields you wish to update.

Similarly, although a PATCH request would include only specific fields to be changed in the structure, you must ensure the PATCH structure and content match those used during creation too.

To alter an entry using a PUT request,

1. Execute `Able_PUT_ById.sh` to change the external reference code and the name of the file attached to the object entry. Use the object entry ID as a parameter.

   In this example, the ID for the `ATTACHMENT_FROM_USERS_COMPUTER_1` entry retrieved in the [GET request](#getting-a-list-of-all-entries) is `32268`.

   ```bash
   ./Able_PUT_ById.sh [Object-ID]
   ```

   A response displays the updated information for the object entry. Note that the response contains the address for the file, but it doesn't contain the `fileBase64` encoding by default. See [Getting the Attachment's Content in the Response](#getting-the-attachments-content-in-the-response) to learn more.

1. The external reference code is now `ATTACHMENT_FROM_USERS_COMPUTER_1_ALTERED` and the image is named `AttachmentFromUsersComputer1Altered.png`.

   ```bash
   "dateCreated" : "2024-06-05T16:37:26Z",
   "dateModified" : "2024-06-05T16:38:11Z",
   "externalReferenceCode" : "ATTACHMENT_FROM_USERS_COMPUTER_1_ALTERED",
   ...
      "link" : {
         "href" : "/documents/32260/32262/AttachmentFromUsersComputer1Altered.png/da5fe5a1-c36c-e016-846e-20720b7469a8?version=1.0&t=1717605491796&download=true&objectDefinitionExternalReferenceCode=ABLE&objectEntryExternalReferenceCode=ATTACHMENT_FROM_USERS_COMPUTER_1_ALTERED",
         "label" : "AttachmentFromUsersComputer1Altered.png"
      },
      "name" : "AttachmentFromUsersComputer1Altered.png"
   }
   ```

### Deleting an Object Entry With an Attachment

1. Execute `Able_DELETE_ById.sh` to delete the object entry and its attachment. Use the object entry ID as a parameter.

   ```bash
   ./Able_DELETE_ById.sh [Object-ID]
   ```

1. There is no content in the response.

### Getting the Attachment's Content in the Response

To get the Base64 encoded file in the response, you must request it as a nested field by using the `nestedFields=[fieldName].fileBase64` query parameter. This avoids calculating the Base64 encoding if the user hasn't requested it.

Execute this cURL command in your terminal to get the attachment's content for the entry with the `ATTACHMENT_FROM_USERS_COMPUTER_2` ERC:

```bash
curl \
   "http://localhost:8080/o/c/ables/by-external-reference-code/ATTACHMENT_FROM_USERS_COMPUTER_2?nestedFields=usersComputerAttachment2.fileBase64" \
   --request "GET" \
   --user "test@liferay.com:learn"
```

The terminal should display a similar output with the Base64 encoded file, its ID, link, label, and name.

```bash
...
"usersComputerAttachment2" : {
   "fileBase64" : "iVBORw0KG...kJggg==",
   "id" : 32283,
   "link" : {
   "href" : "/documents/20119/32281/AttachmentFromUsersComputer2.png/266a539c-506c-8273-96d2-15206933b993?version=1.0&t=1717605449655&download=true&objectDefinitionExternalReferenceCode=ABLE&objectEntryExternalReferenceCode=ATTACHMENT_FROM_USERS_COMPUTER_2",
   "label" : "AttachmentFromUsersComputer2.png"
   },
   "name" : "AttachmentFromUsersComputer2.png"
}
```

### Getting the Attachment's Folder in the Response

To get the folder where the Base64 encoded file is stored in the response, you must request it as a nested field by using the `nestedFields=[fieldName].folder` query parameter. This avoids unnecessary access to data.

Execute this cURL command in your terminal to get the folder for the entry with the `ATTACHMENT_FROM_DOCS_AND_MEDIA` ERC:

```bash
curl \
   "http://localhost:8080/o/c/ables/by-external-reference-code/ATTACHMENT_FROM_DOCS_AND_MEDIA?nestedFields=docsAndMediaAttachment.folder" \
   --request "GET" \
   --user "test@liferay.com:learn"
```

The terminal shows a similar output with the folder's `ERC` and `siteId` where it's located.

```bash
...
"docsAndMediaAttachment" : {
   "folder" : {
   "externalReferenceCode" : "ABLE_FOLDER",
   "siteId" : 20117
   },
...
```

## Related Topics

- [Object API Basics](./object-api-basics.md)
- [Using Batch APIs](./using-batch-apis.md)
- [Using nestedFields to Query Related Entries](./using-nestedfields-to-query-related-entries.md)
