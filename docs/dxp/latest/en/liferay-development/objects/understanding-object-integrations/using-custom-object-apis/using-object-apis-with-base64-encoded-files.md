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

!!! important
    This feature is currently behind a release feature flag (LPS-174455). Read [Release Feature Flags](../../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.

When using objects with [attachment fields](../../creating-and-managing-objects/fields/attachment-fields.md), you can generally upload files from your computer or use files uploaded to the [Documents and Media](../../../../content-authoring-and-management/documents-and-media.md) application. Both cases require multiple steps.

You can either post the document and provide its ID or external reference code (ERC) when posting the object entry, or you can post the object entry and attach the file to it later.

Alternatively, you can post Base64-encoded files in one step by using a REST API call and attaching the files to it.

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

   Alternatively, you can run the following cURL command in the terminal to create the object. Afterward, you can access the object definition at Global Menu &rarr; Control Panel &rarr; Objects and continue with the next step.

   ```bash
   curl \
      "http://localhost:8080/o/object-admin/v1.0/object-definitions" \
      --data '{
         "active": true,
         "externalReferenceCode": "able",
         "label": {
            "en_US": "Able"
         },
         "modifiable": true,
         "name": "Able",
         "objectFields": [
            {
               "businessType": "Attachment",
               "externalReferenceCode": "users-computer-attachment-1",
               "indexed": true,
               "label": {
                  "en_US": "usersComputerAttachment1"
               },
               "localized": false,
               "name": "usersComputerAttachment1",
               "objectFieldSettings": [
                  {
                     "name": "acceptedFileExtensions",
                     "value": "jpeg, jpg, pdf, png"
                  },
                  {
                     "name": "maximumFileSize",
                     "value": 100
                  },
                  {
                     "name": "fileSource",
                     "value": "userComputer"
                  },
                  {
                     "name": "showFilesInDocumentsAndMedia",
                     "value": false
                  }
               ],
               "readOnly": "false",
               "required": false,
               "system": false,
               "unique": false
            },
            {
               "businessType": "Attachment",
               "externalReferenceCode": "users-computer-attachment-2",
               "indexed": true,
               "label": {
                  "en_US": "usersComputerAttachment2"
               },
               "localized": false,
               "name": "usersComputerAttachment2",
               "objectFieldSettings": [
                  {
                     "name": "acceptedFileExtensions",
                     "value": "jpeg, jpg, pdf, png"
                  },
                  {
                     "name": "maximumFileSize",
                     "value": 100
                  },
                  {
                     "name": "fileSource",
                     "value": "userComputer"
                  },
                  {
                     "name": "showFilesInDocumentsAndMedia",
                     "value": true
                  },
                  {
                     "name": "storageDLFolderPath",
                     "value": "/Able"
                  }
               ],
               "readOnly": "false",
               "required": false,
               "system": false,
               "unique": false
            },
            {
               "businessType": "Attachment",
               "externalReferenceCode": "docs-and-media-attachment",
               "indexed": true,
               "label": {
                  "en_US": "docsAndMediaAttachment"
               },
               "localized": false,
               "name": "docsAndMediaAttachment",
               "objectFieldSettings": [
                  {
                     "name": "acceptedFileExtensions",
                     "value": "jpeg, jpg, pdf, png"
                  },
                  {
                     "name": "maximumFileSize",
                     "value": 100
                  },
                  {
                     "name": "fileSource",
                     "value": "documentsAndMedia"
                  }
               ],
               "readOnly": "false",
               "required": false,
               "system": false,
               "unique": false
            }
         ],
         "pluralLabel": {
            "en_US": "Ables"
         },
         "scope": "company",
         "status": {
            "code": 0,
            "label": "approved",
            "label_i18n": "Approved"
         },
         "system": false
         }' \
      --header "Content-type: application/json" \
      --request "POST" \
      --user "test@liferay.com:learn"
   ```

1. Go to the *Details* tab, select *Company* as the Scope, select *Object* under Panel Link, and click [*Publish*](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts).

   !!! important
       For this tutorial, you must use the above values.

Once published, you can access the object via Headless APIs.

## Preparing the Sample Code

Run the following commands to download and unzip the provided sample code:

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-p7x7.zip -O
```

```bash
unzip liferay-p7x7.zip
```

These scripts include the following APIs:

| HTTP Method | HTTP Endpoint | Description                                                                                                                                                                                                                                                                                                                                                       |
|:------------|:--------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GET         | `/`           | Returns a complete list of object entries in a Liferay instance; results can be paginated, filtered, searched, and sorted.                                                                                                                                                                                                                                        |
| POST        | `/`           | Creates object entries using the details provided in the API call. There are three different POST methods: one to post an attachment through the user's computer, one to post an attachment through the user's computer with the `Show the files in Documents and Media` option toggled on, and one to post an attachment in the Documents and Media application. |

## Using the Sample Code

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
   --data '{
   "externalReferenceCode" : "users-computer-attachment-1",
   "usersComputerAttachment1" : {
   "fileBase64" : "iVBORw0KGgoAAAANSUhEUgAAAD0AAAAXCAIAAAA3N9DuAAAAA3NCSVQICAjb4U/...",
   "name": "img1.png"
   }...
   ```

   The terminal should display a similar output.

   ```bash
   {
      "actions" : {
         "permissions" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/c/ables/32250/permissions"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/c/ables/32250"
         },
         "replace" : {
            "method" : "PUT",
            "href" : "http://localhost:8080/o/c/ables/32250"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/c/ables/32250"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/c/ables/32250"
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
      "dateCreated" : "2024-05-13T13:58:12Z",
      "dateModified" : "2024-05-13T13:58:12Z",
      "externalReferenceCode" : "users-computer-attachment-1",
      "id" : 32250,
      "keywords" : [ ],
      "status" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      },
      "taxonomyCategoryBriefs" : [ ],
      "usersComputerAttachment1" : {
         "id" : 32245,
         "link" : {
            "href" : "/documents/32242/32244/img1.png/3596b554-ea93-3ce1-29a2-19a72cf4a75e?version=1.0&t=1715608692123&download=true&objectDefinitionExternalReferenceCode=able&objectEntryExternalReferenceCode=users-computer-attachment-1",
            "label" : "img1.png"
         },
         "name" : "img1.png"
      }
   }
   ```

   Note that the response doesn't contain the `fileBase64` encoding by default. See [Getting the Attachment's Content in the Response](#getting-the-attachments-content-in-the-response) to learn more.

To create an object entry with an attachment using the `Upload Directly from the User's Computer` Request Files option and the `Show Files in Documents and Media` option toggled on,

1. Execute `Able_POST_FromUsersComputer2.sh`. This creates an object entry with a Base64 file attached to it.

   ```bash
   ./Able_POST_FromUsersComputer2.sh
   ```

   Use the `fileBase64` parameter to attach the file to the object entry.

   ```bash
   ...
   --data '{
   "externalReferenceCode" : "users-computer-attachment-2",
   "usersComputerAttachment2" : {
   "fileBase64": "iVBORw0KGgoAAAANSUhEUgAAAD0AAAAXCAIAAAA3N9DuAAAAA3NCSVQICAjb4U/...",
   "name": "img2.png"
   }...
   ```

   !!! note
       Even with the `Show Files in Documents and Media` option toggled on, specifying a folder is unnecessary.The selection is based automatically on the company for company-scoped object definitions or the site for site-scoped object definitions.

   The terminal should display a similar output.

   ```bash
   {
      "actions" : {
         "permissions" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/c/ables/32270/permissions"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/c/ables/32270"
         },
         "replace" : {
            "method" : "PUT",
            "href" : "http://localhost:8080/o/c/ables/32270"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/c/ables/32270"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/c/ables/32270"
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
      "dateCreated" : "2024-05-13T14:32:58Z",
      "dateModified" : "2024-05-13T14:32:58Z",
      "externalReferenceCode" : "users-computer-attachment-2",
      "id" : 32270,
      "keywords" : [ ],
      "status" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      },
      "taxonomyCategoryBriefs" : [ ],
      "usersComputerAttachment2" : {
         "id" : 32265,
         "link" : {
            "href" : "/documents/20119/32263/img2.png/51a5c8fd-77f1-5e92-2c05-e4957c5cec69?version=1.0&t=1715610778158&download=true&objectDefinitionExternalReferenceCode=able&objectEntryExternalReferenceCode=users-computer-attachment-2",
            "label" : "img2.png"
         },
         "name" : "img2.png"
      }
   }
   ```

   Note that the response doesn't contain the `fileBase64` encoding by default. See [Getting the Attachment's Content in the Response](#getting-the-attachments-content-in-the-response) to learn more.

### Posting an Attachment Uploaded or Selected From The Documents and Media Item Selector

To create an object entry with an attachment using the `Upload or Select from Documents and Media Item Selector` Request Files option,

1. Execute `DocumentsAndMedia_POST_Folder.sh` to create the folder to store the uploaded file. Use the site ID as a parameter. In this example, the site ID is `20122`

   !!! tip
       Locate the site ID at *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)) &rarr; *Configuration* &rarr; *Site Settings* &rarr; *Site Configuration* under Platform.

   ```bash
   ./DocumentsAndMedia_POST_Folder.sh [site ID]
   ```

   The terminal should display a similar output.

   ```bash
   {
      "actions" : {
         "subscribe" : {
            "method" : "PUT",
            "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32023/subscribe"
         },
         "unsubscribe" : {
            "method" : "PUT",
            "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32023/unsubscribe"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32023"
         },
         "replace" : {
            "method" : "PUT",
            "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32023"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32023"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/headless-delivery/v1.0/document-folders/32023"
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
      "dateCreated" : "2024-05-17T14:08:12Z",
      "dateModified" : "2024-05-17T14:08:12Z",
      "description" : "able folder description",
      "externalReferenceCode" : "able-folder",
      "id" : 32023,
      "name" : "able folder",
      "numberOfDocumentFolders" : 0,
      "numberOfDocuments" : 0,
      "siteId" : 20117,
      "subscribed" : false
   }
   ```

1. Then, execute `Able_POST_FromDocumentsAndMedia.sh`. This creates an object entry with a Base64 file attached to it and places it in the recently created folder. Use the folder's external reference code (ERC) and the site ID as parameters. In this example, the ERC is `able-folder` and the site ID is `20122`.

   !!! note
       If the `siteId` is not included, null, or empty, the file is uploaded to the default site's root folder.

   ```bash
   ./Able_POST_FromDocumentsAndMedia.sh able-folder 20122
   ```

   Use the `folder` parameter to add the externalReferenceCode and the siteId where the document will be stored.

   ```bash
   --data '{...
      "folder": {
            "externalReferenceCode": "'${1}'",
            "siteId": "'{2}'"
      ...},
   ```

   The terminal should display a similar output.

   ```bash
   {
      "actions" : {
         "permissions" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/c/ables/32189/permissions"
         },
         "get" : {
            "method" : "GET",
            "href" : "http://localhost:8080/o/c/ables/32189"
         },
         "replace" : {
            "method" : "PUT",
            "href" : "http://localhost:8080/o/c/ables/32189"
         },
         "update" : {
            "method" : "PATCH",
            "href" : "http://localhost:8080/o/c/ables/32189"
         },
         "delete" : {
            "method" : "DELETE",
            "href" : "http://localhost:8080/o/c/ables/32189"
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
      "dateCreated" : "2024-05-20T12:24:53Z",
      "dateModified" : "2024-05-20T12:24:53Z",
      "externalReferenceCode" : "docs-and-media-attachment-1",
      "id" : 32189,
      "keywords" : [ ],
      "status" : {
         "code" : 0,
         "label" : "approved",
         "label_i18n" : "Approved"
      },
      "taxonomyCategoryBriefs" : [ ],
      "docsAndMediaAttachment" : {
         "id" : 32184,
         "link" : {
            "href" : "/documents/20117/32182/img3.png/5748562e-a954-4121-41f3-f28e01c8f7a9?version=1.0&t=1716207893037&download=true&objectDefinitionExternalReferenceCode=able&objectEntryExternalReferenceCode=docs-and-media-attachment-1",
            "label" : "img3.png"
         },
         "name" : "img3.png"
      }
   }
   ```

   Note that the response doesn't contain the `fileBase64` encoding by default. See [Getting the Attachment's Content in the Response](#getting-the-attachments-content-in-the-response) to learn more.

### Getting a List of All Entries

1. Run `Able_GET_FromCompany.sh` to return a list of all created entries.

   ```bash
   ./Able_GET_FromCompany.sh
   ```

   The response should include information about the attached files such as the `id`, a `link` where you can download them, `label`, and `name`.

   ```bash
   ...
   "usersComputerAttachment1" : {
      "id" : 32245,
      "link" : {
      "href" : "/documents/32242/32244/img1.png/3596b554-ea93-3ce1-29a2-19a72cf4a75e?version=1.0&t=1715608692123&download=true&objectDefinitionExternalReferenceCode=able&objectEntryExternalReferenceCode=users-computer-attachment-1",
      "label" : "img1.png"
      },
      "name" : "img1.png"
   }
   ...
   ```

   Note that the response contains the address for the file, but it doesn't contain the `fileBase64` encoding by default. See [Getting the Attachment's Content in the Response](#getting-the-attachments-content-in-the-response) to learn more.

### Updating an Object Entry With an Attachment

You can use a call similar to POST and replace the details of the specified entry with the details provided in the API call. You can alter any information you want (e.g., `externalReferenceCode`, `fileBase64`, or `name`) using a PUT request.

Execute `Able_PUT_ById.sh` to change the external reference code and the name of the file attached to the object entry. Use the object entry ID as a parameter.

   ```bash
   ./Able_PUT_ById.sh [Object-ID]
   ```

   A response displays the updated information for the object entry. Note that the response contains the address for the file, but it doesn't contain the `fileBase64` encoding by default. See [Getting the Attachment's Content in the Response](#getting-the-attachments-content-in-the-response) to learn more.

The new external reference code is `users-computer-attachment-1-altered` and the new image name is `img1-altered.png`.

### Deleting an Object Entry With an Attachment

1. Execute `Able_DELETE_ById.sh` to delete the object entry and its attachment. Use the object entry ID as a parameter.

   ```bash
   ./Able_DELETE_ById.sh [Object-ID]
   ```

1. There is no content in the response.

### Getting the Attachment's Content in the Response

To get the Base64 encoded file in the response, you must request it as a nested field by using the `nestedFields=[ERC].fileBase64` query parameter. This avoids calculating the Base64 encoding if the user hasn't required it.

```bash
curl \
   "http://localhost:8080/o/c/ables/by-external-reference-code/users-computer-attachment-1?nestedFields=usersComputerAttachment1.fileBase64" \
   --request "GET" \
   --user "test@liferay.com:learn"
```

The terminal should display a similar output with the Base64 encoded file, its ID, link, label, and name.

```bash
...
   "usersComputerAttachment1" : {
      "fileBase64" : "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",
      "id" : 32145,
      "link" : {
         "href" : "/documents/32142/32144/img1.png/188837e5-472e-6cd0-6dc7-30e46a2600e0?version=1.0&t=1716206091936&download=true&objectDefinitionExternalReferenceCode=able&objectEntryExternalReferenceCode=users-computer-attachment-1",
         "label" : "img1.png"
      },
      "name" : "img1.png"
   }
}
```

### Getting the Attachment's Folder in the Response

## Related Topics

- [Object API Basics](./object-api-basics.md)
- [Using Batch APIs](./using-batch-apis.md)
- [Using nestedFields to Query Related Entries](./using-nestedfields-to-query-related-entries.md)
