---
uuid: d4c25858-b99c-46e9-a459-91b75af678f3
taxonomy-category-names:
- Integration
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using Relationship REST APIs

{bdg-secondary}`Liferay 7.4 U70+/GA70+`

When you add relationships to custom or system objects, Liferay generates REST endpoints for accessing those relationships. You can relate and disassociate entries, as well as return an entry's related entries. These endpoints are added to the parent object in one-to-many relationships and to both objects in many-to-many relationships.

To proceed, [set up](#setting-up-a-liferay-instance) a new Liferay 7.4 instance and [prepare](#preparing-the-sample-code) the provided tutorial code. Then, run the scripts to create object entries and manage their relationships with one another.

## Setting Up a Liferay Instance

```{include} /_snippets/run-liferay-portal.md
```

Next, [create](../../creating-and-managing-objects/creating-objects.md) three related custom objects:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Create three object drafts.

   First Object:

   | Field | Value |
   | :--- | :--- |
   | Label | `Able` |
   | Plural Label | `Ables` |
   | Name | `Able` |

   Second Object:

   | Field | Value |
   | :--- | :--- |
   | Label | `Baker` |
   | Plural Label | `Bakers` |
   | Name | `Baker` |

   Third Object:

   | Field | Value |
   | :--- | :--- |
   | Label | `Charlie` |
   | Plural Label | `Charlies` |
   | Name | `Charlie` |

1. Add the `name` field to each object draft.

   | Label | Field Name | Type | Required |
   | :--- | :--- | :--- | :--- |
   | `Name` | `name` | Text | &#10004; |

1. Add these relationships to the able object:

   | Label | Relationship Name | Type | Object |
   | :--- | :--- | :--- | :--- |
   | `Able to Baker` | `ableToBaker` | One to Many | Baker |
   | `Able to Charlie` | `ableToCharlie` | One to Many | Charlie |

1. [Publish](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) each object.

Once published, you can access their REST APIs, including the following relationship APIs:

| Object  | HTTP Method | HTTP Endpoint                                                      | Java Method                       |
|:--------|:------------|:-------------------------------------------------------------------|:----------------------------------|
| Able    | GET         | `/{ableId}/ableToBaker`                                            | `getAbleAbleToBakerBakerPage`     |
| Able    | GET         | `/{ableId}/ableToCharlie`                                          | `getAbleAbleToCharlieCharliePage` |
| Able    | DELETE      | `/{ableId}/ableToBaker/{bakerId}`                                  | `deleteAbleAbleToBakerBaker`      |
| Able    | PUT         | `/{ableId}/ableToBaker/{bakerId}`                                  | `putAbleAbleToBakerBaker`         |
| Able    | DELETE      | `/{ableId}/ableToCharlie/{charlieId}`                              | `deleteAbleAbleToCharlieCharlie`  |
| Able    | PUT         | `/{ableId}/ableToCharlie/{charlieId}`                              | `putAbleAbleToCharlieCharlie`     |
| Able    | PUT         | `/by-external-reference-code/{ableERC}/ableToBaker/{bakerERC}`     | `putAbleAbleToBakerBaker`         |
| Able    | PUT         | `/by-external-reference-code/{ableERC}/ableToCharlie/{charlieERC}` | `putAbleAbleToCharlieCharlie`     |
| Charlie | GET         | `/{charlieId}/ableToCharlie`                                       | `getCharlieAbleToCharlieAblePage` |
| Charlie | DELETE      | `/{charlieId}/ableToCharlie/{ableId}`                              | `deleteCharlieAbleToCharlieAble`  |
| Charlie | PUT         | `/{charlieId}/ableToCharlie/{ableId}`                              | `putCharlieAbleToCharlieAble`     |
| Charlie | PUT         | `/by-external-reference-code/{ableERC}/ableToCharlie/{charlieERC}` | `putCharlieAbleToCharlieAble`     |

```{tip}
For a complete list of APIs generated for site and company objects, see [Objects Headless Framework Integration](../../understanding-object-integrations/using-custom-object-apis.md). You can view and test custom Object APIs via the Liferay API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`). Click *REST Applications* and select an API.
```

## Preparing the Sample Code

Run these commands to download and unzip the provided sample code:

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-f9m2.zip -O
```

```bash
unzip liferay-f9m2.zip
```

The sample code includes commands for creating entries for each object and using their relationship APIs.

## Using the Sample Code

Use the REST APIs to add object entries and manage their relationships:

1. Navigate to the `curl` folder in the `liferay-f9m2` project.

   ```bash
   cd liferay-f9m2/curl
   ```

1. Run `POST` commands to create three entries for each object. These entries have predefined external reference codes (ERCs) following the `[objectname]-[number]` naming pattern (e.g., `able-one`).

   ```bash
   ./Able_POST_Batch.sh
   ```

   ```bash
   ./Baker_POST_Batch.sh
   ```

   ```bash
   ./Charlie_POST_Batch.sh
   ```

1. Run `Able_PUT_AbleToBaker_ByExternalReferenceCode` with the `able-one` ERC and all three baker ERCs.

   ```bash
   ./Able_PUT_AbleToBaker_ByExternalReferenceCode.sh able-one baker-one baker-two baker-three
   ```

   This relates the able entry with the baker entries and prints the response.

   ```json
   {
     ...
     "externalReferenceCode" : "baker-one",
     "id" : 42427,
     ...
     "name" : "Baker 1",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-two",
     "id" : 42429,
     ...
     "name" : "Baker 2",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }

   {
     ...
     "externalReferenceCode" : "baker-three",
     "id" : 42431,
     ...
     "name" : "Baker 3",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }
   ```

1. Run `Able_DELETE_AbleToBaker_ById` with two IDs: the ID for `able-one` and the ID for `baker-three`.

   ```bash
   ./Able_DELETE_AbleToBaker_ById.sh {able-entry-id} {baker-entry-id}
   ```

   This disassociates the entries.

1. Run `Able_GET_AbleToBaker_ById` with the same able ID to confirm they are no longer related.

   ```bash
   ./Able_GET_AbleToBaker_ById.sh {able-entry-id}
   ```

   ```json
   {
     ...
     "externalReferenceCode" : "baker-two",
     "id" : 42429,
     ...
     "name" : "Baker 2",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   },
   {
     ...
     "externalReferenceCode" : "baker-one",
     "id" : 42427,
     ...
     "name" : "Baker 1",
     "r_ableToBaker_c_ableId" : 42421,
     "r_ableToBaker_c_ableERC" : "able-one"
   }
   ```

1. Run `Able_PUT_AbleToCharlie_ByExternalReferenceCode` with the `able-one` ERC and all three charlie ERCs.

   ```bash
   ./Able_PUT_AbleToCharlie_ByExternalReferenceCode.sh able-one charlie-one charlie-two charlie-three
   ```

   This relates the able entry with the charlie entries and prints the response.

   ```json
   {
     ...
     "externalReferenceCode" : "charlie-one",
     "id" : 42433,
     ...
     "name" : "Charlie 1"
   }
   {
     ...
     "externalReferenceCode" : "charlie-two",
     "id" : 42435,
     ...
     "name" : "Charlie 2"
   }
   {
     ...
     "externalReferenceCode" : "charlie-three",
     "id" : 42437,
     ...
     "name" : "Charlie 3"
   }
   ```

1. Run `Charlie_GET_AbleToCharlie_ById` with the ID for `charlie-one`.

   ```bash
   ./Charlie_GET_AbleToCharlie_ById.sh {charlie-entry-id}
   ```

   This returns a list of all able entries related to the specified charlie entry.

   ```json
   {
     ...
     "items" : [ {
       ...
       "externalReferenceCode" : "able-one",
       "id" : 42421,
       ...
       "name" : "Able 1"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 1,
     "totalCount" : 1
   }
   ```

1. Run `Charlie_PUT_AbleToCharlie_ByExternalReferenceCode` with the `charlie-one` and `able-two` ERCs.

   ```bash
   ./Charlie_PUT_AbleToCharlie_ByExternalReferenceCode.sh charlie-one able-two
   ```

   This relates the charlie entry to another able entry.

   ```json
   {
     ...
     "externalReferenceCode" : "able-two",
     "id" : 42423,
     ...
     "name" : "Able 2"
   }
   ```

1. Run `Charlie_GET_AbleToCharlie_ById` with the ID for `charlie-one` and confirm there are now two related able entries.

   ```bash
   ./Charlie_GET_AbleToCharlie_ById.sh {charlie-entry-id}
   ```

   ```json
   {
     ...
     "items" : [ {
       ...
       "externalReferenceCode" : "able-two",
       "id" : 42423,
       ...
       "name" : "Able 2"
     }, {
       ...
       "externalReferenceCode" : "able-one",
       "id" : 42421,
       ...
       "name" : "Able 1"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 2,
     "totalCount" : 2
   }
   ```

1. Run `Able_GET_ById` with the ID for `able-one`.

   ```bash
   ./Able_GET_ById.sh {able-entry-id}
   ```

   This command uses the `nestedFields` parameter to return all related baker and charlie entries.

   ```json
   {
     "externalReferenceCode" : "able-one",
     "id" : 42421,
     ...
     "ableToCharlie" : [ {
       ...
       "externalReferenceCode" : "charlie-one",
       "id" : 42433,
       ...
       "name" : "Charlie 1"
     }, {
       ...
       "externalReferenceCode" : "charlie-two",
       "id" : 42435,
       ...
       "name" : "Charlie 2"
     }, {
       ...
       "externalReferenceCode" : "charlie-three",
       "id" : 42437,
       ...
       "name" : "Charlie 3"
     } ],
     "name" : "Able 1",
     "ableToBaker" : [ {
       ...
       "externalReferenceCode" : "baker-one",
       "id" : 42427,
       ...
       "name" : "Baker 1",
       "r_ableToBaker_c_ableId" : 42421,
       "r_ableToBaker_c_ableERC" : "able-one"
     }, {
       ...
       "externalReferenceCode" : "baker-two",
       "id" : 42429,
       ...
       "name" : "Baker 2",
       "r_ableToBaker_c_ableId" : 42421,
       "r_ableToBaker_c_ableERC" : "able-one"
     } ]
   }
   ```

   See [Using nestedFields to Query Related Entries](./using-nestedfields-to-query-related-entries.md) for more information on the `nestedFields` parameter.

## Examining the Code

### `Charlie_PUT_AbleToCharlie_ByExternalReferenceCode`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Charlie_PUT_AbleToCharlie_ByExternalReferenceCode.sh
   :language: bash
```

### `Charlie_GET_AbleToCharlie_ById`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Charlie_GET_AbleToCharlie_ById.sh
   :language: bash
```

### `Able_DELETE_AbleToBaker_ById`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Able_DELETE_AbleToBaker_ById.sh
   :language: bash
```

### `Able_GET_ById.sh`

```{literalinclude} ./using-relationship-rest-apis/resources/liferay-f9m2.zip/curl/Able_GET_ById.sh
   :language: bash
```

## Related Topics

* [Headless Framework Integration](../../understanding-object-integrations/using-custom-object-apis.md)
* [Using Nested Fields with REST APIs](./using-nestedfields-to-query-related-entries.md)
* [Defining Object Relationships](../../creating-and-managing-objects/relationships/defining-object-relationships.md)
