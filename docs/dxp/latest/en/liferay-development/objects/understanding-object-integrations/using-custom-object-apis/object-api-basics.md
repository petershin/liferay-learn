---
uuid: 7cbe4379-3bba-400e-8295-2b60e29e6f84
taxonomy-category-names:
- Integration
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Object API Basics

When you publish an Object, Liferay automatically generates REST APIs for it. These APIs differ for Company and Site scoped Objects, but they all use the `c/[pluralobjectlabel]` naming pattern (e.g., `c/timeoffrequests`). You can use these APIs to create, access, update, and remove Object entries.

In this example, use cURL commands to perform basic CRUD operations for a custom Object. Before proceeding, [set up](#setting-up-a-liferay-instance) a new Liferay DXP/Portal 7.4 instance and [prepare](#preparing-the-sample-code) the provided tutorial code.

!!! tip
    For a complete list of APIs generated for both Site and Company Objects, see [Object's Headless Framework Integration](../using-custom-object-apis.md). You can view and test custom Object APIs via the Liferay API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`). They appear under *REST Applications*.

## Setting Up a Liferay Instance

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to [create](../../creating-and-managing-objects/creating-objects.md) a basic Object for this tutorial:

1. Open the _Global Menu_ (![Global Menu](../../../../images/icon-applications-menu.png)), go to the _Control Panel_ tab, and click _Objects_.

1. Click the _Add_ button (![Add Button](../../../../images/icon-add.png)) and enter these values:

   | Field        | Value   |
   | :----------- | :------ |
   | Label        | `Able`  |
   | Plural Label | `Ables` |
   | Name         | `Able`  |

1. Select the new _Object_ draft, go to the _Fields_ tab, and add a single text field:

   | Label | Field Name | Type | Required |
   | :---- | :--------- | :--- | :------- |
   | Name  | name       | Text | &#10004; |

1. Go to the _Details_ tab and click _Publish_.

   !!! important
       For this tutorial, you must use the above values.

[Publishing an Object](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) creates and activates a new application for receiving and storing data. You can now access it via Headless APIs.

## Preparing the Sample Code

Run the following commands to download and unzip the provided sample code:

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-v1s4.zip -O
```

```bash
unzip liferay-v1s4.zip
```

These scripts include the following APIs:

| HTTP Method | HTTP Endpoint     | Description                                                                                                               |
|:------------|:------------------|:--------------------------------------------------------------------------------------------------------------------------|
| GET         | `/`               | Returns a complete list of Object entries in a Liferay instance; results can be paginated, filtered, searched, and sorted |
| POST        | `/`               | Creates a new Object entry using the details provided in the API call                                                     |
| DELETE      | `/{objectNameId}` | Deletes the specified Object entry and returns a 204 if the operation succeeds                                            |
| GET         | `/{objectNameId}` | Returns details for the specified Object entry                                                                            |
| PUT         | `/{objectNameId}` | Replaces the specified Object entry's details with those provided in the API call                                         |
| GET         | `/{objectNameId}/permissions` | Returns details for the specified Object entry permissions                                                                            |
| PUT         | `/{objectNameId}/permissions` | Replaces the specified Object entry permission details with those provided in the API call                                         |

## Calling the Custom Object's APIs

1. After downloading the sample code, navigate to the `curl` folder in the `liferay-v1s4` project.

   ```bash
   cd liferay-v1s4/curl
   ```

1. Execute `Able_POST_ToCompany`. This creates three entries.

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   The terminal displays the complete schema for the newly created entries. Copy the first entry's ID for use with the following methods.

   ```json
   {
     "id" : 41969,
     ...
     "name" : "Able 1"
   }

   {
     "id" : 41971,
     ...
     "name" : "Able 2"
   }

   {
     "id" : 41973,
     ...
     "name" : "Able 3"
   }
   ```

1. Execute `Ables_GET_FromCompany`. This returns a list of the Object's entries.

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

1. Execute `Able_PUT_ById` with the first entry's ID as a parameter. This replaces the details of the specified entry with the details provided in the API call.

   ```bash
   ./Able_PUT_ById.sh {entry-id}
   ```

   ```json
   {
     "id" : 41969,
     ...
     "name" : "Able One"
   }
   ```

1. Execute `Able_DELETE_ById` with the same ID as its parameter. This deletes the specified entry.

   ```bash
   ./Able_DELETE_ById.sh {entry-id}
   ```

1. Execute `Able_GET_ById` with the same ID as its parameter. This returns the details for the specified entry if it exists.

   ```bash
   ./Able_GET_ById.sh {entry-id}
   ```

   Since you deleted the entry in the preceding step, it returns the following message.

   ```json
   {
   	"status": "NOT_FOUND",
   	"title": "No ObjectEntry exists with the primary key 41969"
   }
   ```

## Examining the Sample cURL Scripts

The following are examples of the tutorial's cURL commands.

### `Able_POST_ToCompany.sh`

```{literalinclude} ./object-api-basics/resources/liferay-v1s4.zip/curl/Able_POST_ToCompany.sh
:language: bash
```

### `Able_PUT_ById.sh`

```{literalinclude} ./object-api-basics/resources/liferay-v1s4.zip/curl/Able_PUT_ById.sh
:language: bash
```

## Managing Object Permissions

Use the Object APIs to read and update permissions for object entries. See [Objects Application Permissions](../../objects-application-permissions.md) for more information.

1. Execute `Able_GET_Permissions` to retrieve a list of Object entry permissions.

   ```bash
   ./Able_GET_Permissions.sh {entry-id}
   ```

   This example returns permissions for all roles. To retrieve permissions for a specific role, use the `roleNames` query parameter.

   ```bash
   curl \
      "http://localhost:8080/o/c/ables/${1}/permissions?roleNames=Site Member" \
      --user "test@liferay.com:learn"
   ```

   In this example, the only role is Owner, and its permissions are: Delete, Permissions, Update, and View.

   ```json
   {
      "actions": {
         "get": {
            "method": "GET",
            "href": "http://localhost:8080/o/c/ables/41969/permissions"
         },
         "replace": {
            "method": "PUT",
            "href": "http://localhost:8080/o/c/ables/41969/permissions"
         }
      },
      "facets": [],
      "items": [
         {
            "actionIds": [
            "DELETE",
            "PERMISSIONS",
            "UPDATE",
            "VIEW"
            ],
            "roleName": "Owner"
         }
      ],
      "lastPage": 1,
      "page": 1,
      "pageSize": 1,
      "totalCount": 1
   }
   ```

1. Execute `Able_PUT_Permissions` with the entry ID as a parameter to replace the entry's details with those provided in the API call.

   ```bash
   ./Able_PUT_Permissions.sh {entry-id}
   ```

   The Update permission was removed from the Owner role.

   ```json
   {
      "actions": {
         "get": {
            "method": "GET",
            "href": "http://localhost:8080/o/c/ables/41969/permissions"
         },
         "replace": {
            "method": "PUT",
            "href": "http://localhost:8080/o/c/ables/41969/permissions"
         }
      },
      "facets": [],
      "items": [
         {
            "actionIds": [
            "DELETE",
            "PERMISSIONS",
            "VIEW"
            ],
            "roleName": "Owner"
         }
      ],
      "lastPage": 1,
      "page": 1,
      "pageSize": 1,
      "totalCount": 1
   }
   ```

## Managing Object Tags and Categories

You can use the Object APIs to read, set, and update tags and categories for object entries that have categorization enabled. See [Tags and Categories](../../../../content-authoring-and-management/tags-and-categories.md) for more information.

Tags are represented by the `keywords` property. You can set or update tags by adding a `keywords` array to the body of any POST, PUT, or PATCH request.

```json
"keywords" : [
   "tag1", "tag2", "tag3"
]
```

After making a GET request for an object entry, you can read its tags in the same `keywords` array.

You can set and update categories for an object entry by adding the `taxonomyCategoryIds` array to any POST, PUT, or PATCH request.

```json
"taxonomyCategoryIds" : [
   1234, 5678
]
```

!!! note
    You must have an existing vocabulary of categories to assign categories to an object entry. See [Defining Categories and Vocabularies for Content](../../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) for more information.

After making a GET request for an object entry, you can read its categories in the `taxonomyCategoryBriefs` array, which contains the `taxonomyCategoryId` and `taxonomyCategoryName` for each assigned category.

```json
"taxonomyCategoryBriefs": [
   {
      "taxonomyCategoryId": 1234,
      "taxonomyCategoryName": "Category A"
   },
   {
      "taxonomyCategoryId": 5678,
      "taxonomyCategoryName": "Category B"
   }
]
```

You can filter object entries by `keywords` and `taxonomyCategoryIds` following the rules described in [API Query Parameters](../../../../headless-delivery/consuming-apis/api-query-parameters.md). Example filter strings may look like these:

- `keywords/any(k:k in ('tag1','tag2'))` retrieves all object entries tagged with `tag1` or `tag2`.

- `taxonomyCategoryIds/any(k:k in (1234,5678))` retrieves all entries linked to the category with ID `1234` or `5678`.

You can sort object entries by fields from related objects using the syntax described in [API Query Parameters](../../../../headless-delivery/consuming-apis/api-query-parameters.md#sorting-by-related-object-data). Example sorting strings may look like these:

- `sort=relatedRelationship/fieldName:asc` sorts the entries based on a field from a directly related object in ascending order.

- `sort=relatedRelationship1/relatedRelationship1/fieldName:desc` sorts the entries based on a field from a nested related object in descending order.

## Related Topics

- [Using Batch APIs](./using-batch-apis.md)
- [Using nestedFields to Query Related Entries](./using-nestedfields-to-query-related-entries.md)
- [Using Aggregation Terms with REST APIs](./using-aggregation-terms-with-rest-apis.md)
