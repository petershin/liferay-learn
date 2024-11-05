---
uuid: 5febb86a-2b56-454d-ae87-81757e82fa00
taxonomy-category-names:
- Integration
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Using nestedFields to Query Related Entries

{bdg-secondary}`Liferay 7.4 U69+/GA69+`

The `nestedFields` parameter causes Liferay to return multiple levels of related object entries in a single GET request. Pass the `nestedFields` parameter with the relationship names to include in the query, separating each relationship with a comma: `nestedFields=[firstObjectRelationship],[secondObjectRelationship]`. If the relationships span multiple levels, set the `nestedFieldsDepth` parameter to the depth you need. You can include up to five levels (e.g., `nestedFieldsDepth=5`).

!!! tip
    The `nestedFields` parameter optimizes your request by retrieving entries with related entries that would otherwise require multiple requests. To return only the related entries, Liferay provides dedicated [relationship APIs](../using-custom-object-apis.md#relationship-rest-apis). See [Using Relationship REST APIs](./using-relationship-rest-apis.md) for an introduction.

To proceed, [set up](#setting-up-a-liferay-instance) a new Liferay 7.4 instance and [prepare](#preparing-the-sample-code) the provided tutorial code. Then [run the scripts](#creating-and-querying-related-object-entries) to create related entries and query them using the `nestedFields` parameter.

!!! note
    Currently, access to nested fields or relationships is unavailable when using a custom object on the "many" side of a one-to-many relationship with a system object. Keep this in mind when planning how to retrieve your data.

## Setting Up a Liferay Instance

```{include} /_snippets/run-liferay-portal.md
```

Next, create and relate three object definitions.

### Creating Related Object Definitions

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. [Create](../../creating-and-managing-objects/creating-objects.md) three object drafts.

   First Object:

   | Field        | Value   |
   |:-------------|:--------|
   | Label        | `Able`  |
   | Plural Label | `Ables` |
   | Name         | `Able`  |

   Second Object:

   | Field        | Value    |
   |:-------------|:---------|
   | Label        | `Baker`  |
   | Plural Label | `Bakers` |
   | Name         | `Baker`  |

   Third Object:

   | Field        | Value      |
   |:-------------|:-----------|
   | Label        | `Charlie`  |
   | Plural Label | `Charlies` |
   | Name         | `Charlie`  |

1. Add the `name` text field to each object draft.

   | Label  | Field Name | Type | Required |
   |:-------|:-----------|:-----|:---------|
   | `Name` | `name`     | Text | &#10004; |

1. Define the following relationships.

   For Able:

   | Label           | Relationship Name | Type        | Object |
   |:----------------|:------------------|:------------|:-------|
   | `Able to Baker` | `ableToBaker`     | One to Many | Baker  |

   For Baker:

   | Label              | Relationship Name | Type        | Object  |
   |:-------------------|:------------------|:------------|:--------|
   | `Baker to Charlie` | `bakerToCharlie`  | One to Many | Charlie |

   For Charlie:

   | Label             | Relationship Name | Type         | Object |
   |:------------------|:------------------|:-------------|:-------|
   | `Charlie to Able` | `charlieToAble`   | Many to Many | Able   |

1. [Publish](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) each object.

Once published, you can access each object via Headless APIs.

## Preparing the Sample Code

Run the commands below to download and unzip the provided sample code:

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-w4s7.zip -O
```

```bash
unzip liferay-w4s7.zip
```

The ZIP provides shell scripts that run cURL commands for creating, relating, and querying object entries using REST APIs. This includes two GET commands for querying related entries.

!!! tip
    For a complete list of APIs generated for site and company objects, see [Objects Headless Framework Integration](../using-custom-object-apis.md). You can view and test custom object APIs via the Liferay API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`). Click *REST Applications* and select an API.

## Creating and Querying Related Object Entries

1. Navigate to the `curl` folder in the `liferay-w4s7` project.

   ```bash
   cd liferay-w4s7/curl
   ```

1. Execute `Able_POST_ToCompany` to create Able entries.

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   Copy the first entry's ID for use with the following POST command.

   ```json
   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1"
   }

   {
     ...
     "externalReferenceCode" : "able-two",
     "id" : 47514,
     ...
     "name" : "Able 2"
   }

   {
     ...
     "externalReferenceCode" : "able-three",
     "id" : 47516,
     ...
     "name" : "Able 3"
   }
   ```

1. Execute `Baker_POST_ToCompany` using the ID for `able-one` as a parameter.

   ```bash
   ./Baker_POST_ToCompany.sh [ableId]
   ```

   This creates three Baker entries and relates them to the specified Able entry using the `ableToBaker` relationship.

   Each Baker entry has three `ableToBaker` relationship fields: `ableToBakerERC`, `r_ableToBaker_c_ableId`, and `r_ableToBaker_c_ableERC`.

   ```json
   {
     ...
     "externalReferenceCode" : "baker-one",
     "id" : 47518,
     ...
     "name" : "Baker 1",
     "ableToBakerERC" : "able-one",
     "r_ableToBaker_c_ableId" : 47512,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-two",
     "id" : 47520,
     ...
     "name" : "Baker 2",
     "ableToBakerERC" : "able-one",
     "r_ableToBaker_c_ableId" : 47512,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-three",
     "id" : 47522,
     ...
     "name" : "Baker 3",
     "ableToBakerERC" : "able-one",
     "r_ableToBaker_c_ableId" : 47512,
     "r_ableToBaker_c_ableERC" : "able-one"
   }
   ```

   Copy the first Baker entry ID for use with the following POST command.

1. Execute `Charlie_POST_ToCompany` using the ID for `baker-one` as a parameter.

   ```bash
   ./Charlie_POST_ToCompany.sh [bakerId]
   ```

   This creates three Charlie entries and relates them to the specified Baker entry using the `bakerToCharlie` relationship.

   ```json
   {
     ...
     "externalReferenceCode" : "charlie-one",
     "id" : 47524,
     ...
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlieERC" : "baker-one",
     "name" : "Charlie 1",
     "r_bakerToCharlie_c_bakerId" : 47518
   }

   {
     ...
     "externalReferenceCode" : "charlie-two",
     "id" : 47526,
     ...
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlieERC" : "baker-one",
     "name" : "Charlie 2",
     "r_bakerToCharlie_c_bakerId" : 47518
   }

   {
     ...
     "externalReferenceCode" : "charlie-three",
     "id" : 47528,
     ...
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlieERC" : "baker-one",
     "name" : "Charlie 3",
     "r_bakerToCharlie_c_bakerId" : 47518
   }
   ```

   You now have three Charlie entries related to a Baker entry that is itself related to an Able entry. However, if you query a Charlie entry using a basic GET request, the response only includes details for the Charlie entry. It does not include details for the related Baker or Able entries. To return details for these entries, you must use the `nestedFields` and `nestedFieldsDepth` parameters.

   Copy the first entry's ID for use with the following GET command.

1. Execute `Charlie_GET_ById` using a Charlie entry ID as a parameter.

   ```bash
   ./Charlie_GET_ById.sh [charlieId]
   ```

   This GET request calls an `o/c/charlies` endpoint with the `nestedFields` and `nestedFieldsDepth` parameters.

   ```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
      :language: bash
   ```

   `nestedFields`: Determines the relationship(s) to include in the query (`ableToBaker,bakerToCharlie`).

   `nestedFieldsDepth`: Determines the depth of entries to include (`2`).

   This command returns all three levels of related objects (i.e., Charlie, Baker, and Able).

   ```json
   {
     ...
     "externalReferenceCode" : "charlie-one",
     "id" : 47524,
     ...
     "r_bakerToCharlie_c_baker" : {
       ...
       "externalReferenceCode" : "baker-one",
       "id" : 47518,
       ...
       "r_ableToBaker_c_able" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "bakerToCharlie" : [ {
         ...
         "externalReferenceCode" : "charlie-one",
         "id" : 47524,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 1",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-two",
         "id" : 47526,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 2",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-three",
         "id" : 47528,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 3",
         "r_bakerToCharlie_c_bakerId" : 47518
       } ],
       "name" : "Baker 1",
       "ableToBaker" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "r_ableToBaker_c_ableId" : 47512,
       "r_ableToBaker_c_ableERC" : "able-one"
     },
     "r_bakerToCharlie_c_bakerERC" : "baker-one",
     "bakerToCharlie" : {
       ...
       "externalReferenceCode" : "baker-one",
       "id" : 47518,
       ...
       "r_ableToBaker_c_able" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "bakerToCharlie" : [ {
         ...
         "externalReferenceCode" : "charlie-one",
         "id" : 47524,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 1",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-two",
         "id" : 47526,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 2",
         "r_bakerToCharlie_c_bakerId" : 47518
       }, {
         ...
         "externalReferenceCode" : "charlie-three",
         "id" : 47528,
         ...
         "r_bakerToCharlie_c_bakerERC" : "baker-one",
         "bakerToCharlieERC" : "baker-one",
         "name" : "Charlie 3",
         "r_bakerToCharlie_c_bakerId" : 47518
       } ],
       "name" : "Baker 1",
       "ableToBaker" : {
         ...
         "externalReferenceCode" : "able-one",
         "id" : 47512,
         ...
         "name" : "Able 1"
       },
       "r_ableToBaker_c_ableId" : 47512,
       "r_ableToBaker_c_ableERC" : "able-one"
     },
     "name" : "Charlie 1",
     "r_bakerToCharlie_c_bakerId" : 47518
   }
   ```

1. Execute `Charlie_PUT_CharlieToAble_ByExternalReferenceCode` with these ERCs.

   ```bash
   ./Charlie_PUT_CharlieToAble_ByExternalReferenceCode.sh charlie-one charlie-two charlie-three able-one
   ```

   This relates all three Charlie entries directly with the specified `able-one` entry using the `charlieToAble` relationship.

1. Execute `Able_GET_ByExternalReferenceCode` with the Able entry's ERC.

   ```bash
   ./Able_GET_ByExternalReferenceCode.sh able-one
   ```

   This GET request calls an `o/c/ables` endpoint with the `nestedFields` parameter.

   ```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Able_GET_ByExternalReferenceCode.sh
      :language: bash
   ```

   `nestedFields`: Determines the relationship(s) to include in the query (`charlieToAble`).

   This command returns details for `able-one` along with all details for the three related Charlie entries.

   ```json
   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "charlieToAble" : [ {
       ...
       "externalReferenceCode" : "charlie-one",
       "id" : 47524,
       ...
       "r_bakerToCharlie_c_bakerERC" : "baker-one",
       "bakerToCharlieERC" : "baker-one",
       "name" : "Charlie 1",
       "r_bakerToCharlie_c_bakerId" : 47518
     }, {
       ...
       "externalReferenceCode" : "charlie-two",
       "id" : 47526,
       ...
       "r_bakerToCharlie_c_bakerERC" : "baker-one",
       "bakerToCharlieERC" : "baker-one",
       "name" : "Charlie 2",
       "r_bakerToCharlie_c_bakerId" : 47518
     }, {
       ...
       "externalReferenceCode" : "charlie-three",
       "id" : 47528,
       ...
       "r_bakerToCharlie_c_bakerERC" : "baker-one",
       "bakerToCharlieERC" : "baker-one",
       "name" : "Charlie 3",
       "r_bakerToCharlie_c_bakerId" : 47518
     } ],
     "name" : "Able 1"
   }
   ```

## `Charlie_GET_ById.sh`

```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
   :language: bash
```

## `Able_GET_ByExternalReferenceCode.sh`

```{literalinclude} ./using-nestedfields-to-query-related-entries/resources/liferay-w4s7.zip/curl/Able_GET_ByExternalReferenceCode.sh
   :language: bash
```

## Related Topics

- [Object API Basics](./object-api-basics.md)
- [Using Batch APIs](./using-batch-apis.md)
- [Using Aggregation Terms with REST APIs](./using-aggregation-terms-with-rest-apis.md)
