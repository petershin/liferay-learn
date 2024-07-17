---
uuid: 438fdca1-dbbf-46d4-8973-4edb3ac6ec6a
taxonomy-category-names:
- Content Management System
- Wiki
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Wiki API Basics

Liferay's Headless Delivery application provides REST services for the [Wiki](../../wiki.md) application. With these services, you can add Wiki nodes and pages, list their information, modify their content, or remove them altogether. Here you'll call those services using cURL commands and Java classes.

## Preparing Tutorial Resources

Before proceeding with the tutorial, first set up a clean Liferay Docker container and prepare the provided tutorial code for use.

### Liferay Docker Container

```{include} /_snippets/run-liferay-portal.md
```

Once started, retrieve the Site ID. To find your Site ID, open the *Site Menu* (![Site Menu](../../../images/icon-menu.png)), and go to *Configuration* &rarr; *Site Settings* &rarr; *Site Configuration*.

![Find the Site ID under Site Configuration settings.](./wiki-api-basics/images/01.png)

### Tutorial Code

This tutorial provides sample code to demonstrate the Headless API. This code includes both sample cURL and Java files for use throughout the tutorial.

Run the following command to download and unzip the [sample code](https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/wiki/developer-guide/liferay-q8u2.zip):

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/collaboration-and-social/wiki/developer-guide/liferay-q8u2.zip -O
```

```bash
unzip liferay-q8u2.zip
```

While the cURL scripts come ready for use, you must manually compile the Java source files before you can run them. To do this, go to the project's `java` folder, and run the `javac` command.

```bash
cd liferay-q8u2/java
```

```bash
javac -classpath .:* *.java
```

Note that the project includes the `com.liferay.headless.delivery.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

The provided code includes APIs for the `WikiNode` and `WikiPage` services. See [Tutorial Code Reference](#tutorial-code-reference) for a list of all included sample APIs.

```{important}
The provided code uses basic authentication for demonstration purposes. For production, you should authorize users with [OAuth2](../../../headless-delivery/using-oauth2.md).
```

## Calling the Sample WikiNode APIs

In this exercise, you can use either the cURL commands or Java classes to call the `WikiNode` APIs. The following output examples correspond to the cURL commands, which slightly differ from the output for the provided Java classes.

1. Navigate to the `curl` or `java` folder in the `liferay-q8u2` project.

   **For cURL:**

   ```bash
   cd liferay-q8u2/curl
   ```

   **For Java:**

   ```bash
   cd liferay-q8u2/java
   ```

1. Execute `WikiNode_POST_ToSite` using your Site ID as a parameter. This creates a new Wiki node in the specified Site.

   **For cURL:**

   ```bash
   ./WikiNode_POST_ToSite.sh {site-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DsiteId={site-id} WikiNode_POST_ToSite
   ```

   The terminal displays the complete schema for the newly created Wiki node. The provided API calls only define the `description` and `name` fields for the new node.

1. Copy the node's ID for use with the following GET, PUT, and DELETE methods.

   ```json
   {
     ...
     "description" : "Foo",
     ...
     "id" : 38405,
     "name" : "Able Node",
     ...
   }
   ```

1. Execute `WikiNodes_GET_FromSite` using the Site ID for its parameter. This returns a list of all Wiki nodes in the specified Site.

   **For cURL:**

   ```bash
   ./WikiNodes_GET_FromSite.sh {site-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DsiteId={site-id} WikiNodes_GET_FromSite
   ```

   ```{note}
   All DXP/Portal instances come with a default Wiki node called `Main`. This node is shown in the above output, along with any nodes you've created.
   ```

1. Execute `WikiNode_PUT_ById` using the Wiki node ID for its parameter. This replaces the details of the specified Wiki node with the details provided in the API call.

   **For cURL:**

   ```bash
   ./WikiNode_PUT_ById.sh {wiki-node-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiNode_PUT_ById
   ```

   ```json
   {
     ...
     "description" : "Bar",
     ...
     "id" : 38405,
     "name" : "Baker Node",
     ...
   }
   ```

1. Execute `WikiNode_DELETE_ById` using the same Wiki node ID for its parameter. This deletes the specified node.

   **For cURL:**

   ```bash
   ./WikiNode_DELETE_ById.sh {wiki-node-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiNode_DELETE_ById
   ```

1. Execute `WikiNode_GET_ById` using the same Wiki node ID for its parameter. This returns the details for the specified node if it exists.

   **For cURL:**

   ```bash
   ./WikiNode_GET_ById.sh {wiki-node-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiNode_GET_ById
   ```

   Since you deleted the node in the preceding step, it returns the following message.

   ```json
   {
     "status" : "NOT_FOUND",
     "title" : "No WikiNode exists with the primary key 38405"
   }
   ```

## Calling the Sample WikiPage APIs

You can use either the cURL commands or Java classes to call the `WikiPage` APIs. The following output examples correspond to the cURL commands, which differ slightly from the output for the provided Java classes.

1. Navigate to the `curl` or `java` folder in the `liferay-q8u2` project.

   **For cURL:**

   ```bash
   cd liferay-q8u2/curl
   ```

   **For Java:**

   ```bash
   cd liferay-q8u2/java
   ```

1. Execute `WikiNode_POST_ToSite` to create a node for your Wiki page.

   **For cURL:**

   ```bash
   ./WikiNode_POST_ToSite.sh {site-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DsiteId={site-id} WikiNode_POST_ToSite
   ```

   ```{note}
   Since Wiki pages are stored in Wiki nodes, at least one node must exist before you can create any Wiki pages.
   ```

1. Copy the node's ID from the output for use with the `WikiPage_POST_ToNode` call.

   ```json
   {
     ...
     "description" : "Foo",
     ...
     "id" : 38504,
     "name" : "Able Node",
     ...
   }
   ```

1. Execute `WikiPage_POST_ToNode` using the above node ID for its parameter. This creates a new Wiki page for the specified node.

   **For cURL:**

   ```bash
   ./WikiPage_POST_ToNode.sh {wiki-node-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiPage_POST_ToNode
   ```

1. Copy the page's ID for use with the `WikiPage_POST_ToParent` call.

   ```json
   {
     ...
     "content" : "Foo",
     ...
     "description" : "Able Page",
     "encodingFormat" : "text/x-wiki",
     ...
     "headline" : "Able Page",
     "id" : 38506,
     ...
   }
   ```

1. Execute `WikiPage_POST_ToParent` using the above Wiki page ID for its parameter. This creates a child page for the specified Wiki page.

   **For cURL:**

   ```bash
   ./WikiPage_POST_ToNode.sh {wiki-page-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DparentWikiPageId={wiki-page-id} WikiPage_POST_ToParent
   ```

   ```json
   {
      ...
      "content" : "Foo",
      ...
      "description" : "Charlie Page",
      "encodingFormat" : "text/x-wiki",
      ...
      "headline" : "Charlie Page",
      "id" : 38510,
      ...
   }
   ```

1. Execute `WikiPages_GET_FromNode` using the Wiki node ID for its parameter. This returns a list of all Wiki pages added to the specified node, which includes both of the newly created Wiki pages.

   **For cURL:**

   ```bash
   ./WikiPages_GET_FromNode.sh {wiki-node-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DwikiNodeId={wiki-node-id} WikiPages_GET_FromNode
   ```

1. Execute `WikiPages_GET_FromParent` using the Wiki parent page ID for its parameter. This returns any existing child pages for the specified Wiki page.

   **For cURL:**

   ```bash
   ./WikiPages_GET_FromParent.sh {wiki-page-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DparentWikiPageId={wiki-page-id} WikiPages_GET_FromParent
   ```

1. Execute `WikiPage_PUT_ById` using either of the above Wiki page IDs for its parameter. This replaces the original page's content with the content defined in the API call.

   **For cURL:**

   ```bash
   ./WikiPage_PUT_ById.sh {wiki-page-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DwikiPageId={wiki-page-id} WikiPage_PUT_ById
   ```

   ```json
   {
     "content" : "Bar",
     ...
     "encodingFormat" : "text/x-wiki",
     ...
     "headline": "Baker Page",
     "id" : 38515,
     ...
   }
   ```

1. Execute `WikiPage_DELETE_ById` using the desired Wiki page ID for its parameter. This deletes the specified Wiki page.

   **For cURL:**

   ```bash
   ./WikiPage_DELETE_ById.sh {wiki-page-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DwikiPageId={wiki-page-id} WikiPage_DELETE_ById
   ```

1. Execute `WikiPage_GET_ById` using the deleted Wiki page's ID for its parameter. This returns the details for the specified page if it exists.

   **For cURL:**

   ```bash
   ./WikiPage_GET_ById.sh {wiki-page-id}
   ```

   **For Java:**

   ```bash
   java -classpath .:* -DwikiPageId={wiki-page-id} WikiPage_GET_ById
   ```

   Since the page was deleted in the preceding step, you see the following message.

   ```json
   {
     "status" : "NOT_FOUND",
     "title" : "No WikiNode exists with the primary key 38515"
   }
   ```

## Tutorial Code Reference

The provided sample code includes cURL scripts and Java classes for the following `WikiNode` and `WikiPage` APIs.

### Sample WikiNode APIs

| Service | HTTP Method | HTTP Endpoint | Description |
| :--- | :--- | :--- | :--- |
| WikiNode | `POST` | `/v1.0/sites/[siteId]/wiki-nodes` | Creates a new Wiki node in the specified Site using the details provided in the API call |
| WikiNode | `GET` | `/v1.0/sites/[siteId]/wiki-nodes` | Returns a complete list of all Wiki nodes in the specified Site; results can be paginated, filtered, searched, and sorted |
| WikiNode | `GET` | `/v1.0/wiki-nodes/[wikiNodeId]` | Returns details for the specified node entity |
| WikiNode | `PUT` | `/v1.0/wiki-nodes/[wikiNodeId]` | Replaces the specified node's details with those provided in the API call |
| WikiNode | `DELETE` | `/v1.0/wiki-nodes/[wikiNodeId]` | Deletes the specified node and returns a 204 if the operation succeeds |

### Sample WikiPage APIs

| Service | HTTP Method | HTTP Endpoint | Description |
| :--- | :--- | :--- | :--- |
| WikiPage | `POST` | `/v1.0/wiki-nodes/[wikiNodeId]/wiki-pages` | Creates a new Wiki page in the specified node using the details provided in the API call |
| WikiPage | `POST` | `/v1.0/wiki-pages/[parentWikiPageId]/wiki-pages` | Creates a new Wiki child page for the specified Wiki page using the details provided in the API call. |
| WikiPage | `GET` | `/v1.0/wiki-nodes/[wikiNodeId]/wiki-pages` | Returns a complete list of all Wiki pages added to the specified Wiki node; results can be paginated, filtered, searched, and sorted |
| WikiPage | `GET` | `/v1.0/wiki-pages/[parentWikiPageId]/wiki-pages` | Returns a complete list of all Wiki child pages added to the specified Wiki page; results can be paginated, filtered, searched, and sorted |
| WikiPage | `GET` | `/v1.0/wiki-pages/[wikiPageId]` | Returns details for the specified Wiki page entity |
| WikiPage | `PUT` | `/v1.0/wiki-pages/[wikiPageId]` | Replaces the specified page's details with those provided in the API call |
| WikiPage | `DELETE` | `/v1.0/wiki-pages/[wikiPageId]` | Deletes the specified page and returns a 204 if the operation succeeds |

```{important}
When using POST and PUT methods for Wiki pages, you must define both the `headline` and `encodingFormat` fields. The `headline` field sets the page's main title, while the `encodingFormat` field determines the page's media format (e.g., HTML, BBCode, etc.).
```

## Examining the Sample cURL Scripts

The following are representative examples of the tutorial's cURL commands.

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/curl/WikiNode_POST_ToSite.sh
   :language: bash
```

### `WikiPage_POST_ToNode.sh`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/curl/WikiPage_POST_ToNode.sh
   :language: bash
```

### `WikiPages_GET_FromNode.sh`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/curl/WikiPages_GET_FromNode.sh
   :language: bash
```

## Examining the Sample Java Classes

The following are representative examples of the tutorial's Java commands.

### `WikiNode_POST_ToSite.java`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/java/WikiNode_POST_ToSite.java
   :language: java
   :lines: 4-28
```

### `WikiPage_POST_ToNode.java`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/java/WikiPage_POST_ToNode.java
   :language: java
   :lines: 4-29
```

### `WikiPages_GET_FromNode.java`

```{literalinclude} ./wiki-api-basics/resources/liferay-q8u2.zip/java/WikiPages_GET_FromNode.java
   :language: java
   :lines: 6-25
```

## Related Topics

* [Using Liferay as a Headless Platform](../../../headless-delivery/using-liferay-as-a-headless-platform.md)
* [Consuming Rest Services](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
