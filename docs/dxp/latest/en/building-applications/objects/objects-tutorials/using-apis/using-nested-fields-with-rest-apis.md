---
uuid: 5febb86a-2b56-454d-ae87-81757e82fa00
---
# Using `nestedFields` to Query Related Entries

{bdg-secondary}`Available Liferay 7.4 U69+/GA69+`

With custom object APIs, you can use the `nestedFields` parameter to return multiple levels of related objects in a single GET request. To do this, you must pass the names of the relationships you want to include in the query. If these relationships span multiple levels, use the `nestedFieldsDepth` parameter to indicate the depth of entries to include in the query. You can include up to five levels (e.g., `nestedFieldsDepth=5`).

```{tip}
The `nestedFields` parameter is a convenient way to retrieve information that would usually require multiple requests. With it, you can retrieve an entry along with its related entries. To return only the related entries, Liferay provides dedicated [relationship APIs](../../understanding-object-integrations/headless-framework-integration.md#relationship-rest-apis). See [Using Relationship REST APIs](./using-relationship-rest-apis.md) for an introduction.
```

To proceed, [set up](#setting-up-a-liferay-instance) a new Liferay 7.4 instance and [prepare](#preparing-the-sample-code) the provided tutorial code. Then, run the scripts to create related entries and query them using the `nestedFields` parameter.

## Setting Up a Liferay Instance

```{include} /_snippets/run-liferay-portal.md
```

Next, [create](../../creating-and-managing-objects/creating-objects.md) three objects:

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

1. Add the `name` text field to each object draft.

   | Label | Field Name | Type | Required |
   | :--- | :--- | :--- | :--- |
   | `Name` | `name` | Text | &#10004; |

1. Define the following relationships.

   For Able:

   | Label | Relationship Name | Type | Object |
   | :--- | :--- | :--- | :--- |
   | `Able to Baker` | `ableToBaker` | One to Many | Baker |

   For Baker:

   | Label | Relationship Name | Type | Object |
   | :--- | :--- | :--- | :--- |
   | `Baker to Charlie` | `bakerToCharlie` | One to Many | Charlie |

   For Charlie:

   | Label | Relationship Name | Type | Object |
   | :--- | :--- | :--- | :--- |
   | `Charlie to Able` | `charlieToAble` | Many to Many | Able |

1. [Publish](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) each object.

Once published, you can access each object via Headless APIs.

## Preparing the Sample Code

Run the commands below to download and unzip the provided sample code:

```bash
curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-w4s7.zip -O
```

```bash
unzip liferay-w4s7.zip
```

The sample code includes cURL scripts for creating, relating, and querying object entries.

```{tip}
For a complete list of APIs generated for site and company objects, see [Objects Headless Framework Integration](../../understanding-object-integrations/headless-framework-integration.md). You can view and test custom object APIs via the Liferay API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`). Click *REST Applications* and select an API.
```

## Using the Sample Code

Follow these steps to add and query related object entries:

1. Navigate to the `curl` folder in the `liferay-w4s7` project.

   ```bash
   cd liferay-w4s7/curl
   ```

1. Execute `Able_POST_ToCompany` to create `Able` entries.

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

1. Execute `Baker_POST_ToCompany` using an `Able` entry ID as a parameter.

   ```bash
   ./Baker_POST_ToCompany.sh [ableId]
   ```

   This creates `Baker` entries related to the specified `Able` entry. Copy the first `Baker` entry ID for use with the following POST command.

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

1. Execute `Charlie_POST_ToCompany` using a `Baker` entry ID as a parameter.

   ```bash
   ./Charlie_POST_ToCompany.sh [bakerId]
   ```

   This creates `Charlie` entries related to the preceding `Baker` entry. Copy the first entry's ID for use with the following GET command.

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

1. Execute `Charlie_GET_ById` using a `Charlie` entry ID as a parameter.

   ```bash
   ./Charlie_GET_ById.sh [charlieId]
   ```

   This queries the entry using nested fields and returns the schema for all three levels of the related objects.

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

1. Execute `Charlie_PUT_CharlieToAble_ByExternalReferenceCode` with the following ERCs.

   ```bash
   ./Charlie_PUT_CharlieToAble_ByExternalReferenceCode.sh charlie-one charlie-two charlie-three able-one
   ```

   This relates all three `Charlie` entries with the specified able entry using the `charlieToAble` relationship.

1. Execute `Able_GET_ByExternalReferenceCode` with the `Able` entry's ERC.

   ```bash
   ./Able_GET_ByExternalReferenceCode.sh able-one
   ```

   This queries the `Able` entry using the `nestedFields` parameter and returns its schema with the schema of all related `Charlie` entries.

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

## Examining the `Charlie_GET_ById` Script

```{literalinclude} ./using-nested-fields-with-rest-apis/resources/liferay-w4s7.zip/curl/Charlie_GET_ById.sh
   :language: bash
```

The provided GET method calls a URL with the `nestedFields` and `nestedFieldsDepth` parameters.

`nestedFields`: Determines the relationship(s) to include in the query (e.g., `ableToBaker,bakerToCharlie`).

`nestedFieldsDepth`: Determines the depth of entries you want to include and can be set between 0-5.

## Related Topics

* [Object API Basics](./object-api-basics.md)
* [Using Batch APIs](./using-batch-apis.md)
* [Using Aggregation Terms with REST APIs](./using-aggregation-terms-with-rest-apis.md)
