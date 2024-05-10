---
uuid: 5f3757e3-af96-4486-bb2f-a5b7f56b62de
taxonomy-category-names:
- Platform
- Multi-Channel Experiences (Headless Delivery)
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Batch Engine API Basics - Exporting Data

Liferay's Headless Batch Engine provides REST APIs to import and export data. Call these services to export data from Liferay.

<!-- TASK: Link to Batch Engine Overview in the introduction once it is ready !-->

## Exporting Data

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip [Batch Engine API Basics](./liferay-g4j2.zip).

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/liferay-g4j2.zip -O
   ```

   ```bash
   unzip liferay-g4j2.zip
   ```

1. To export data, you must have the fully qualified class name of the entity you are exporting. You can get the class name from the API explorer in your installation at `/o/api`. Scroll down to the *Schemas* section and note down the `x-class-name` field of the entity you want to export.

1. Use the following cURL script to export accounts from your Liferay instance. On the command line, navigate to the `curl` folder. Execute the `ExportTask_POST_ToInstance.sh` script with the fully qualified class name of *Account* and `json` as parameters. The `json` parameter denotes the format of the exported data. It also supports `jsont`, `jsonl` and `csv` formats.

   ```bash
   ./ExportTask_POST_ToInstance.sh com.liferay.headless.admin.user.dto.v1_0.Account json
   ```

   The JSON response shows the creation of a new export task. Note the `id` of the task:

   ```json
   {
     "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
     "contentType" : "JSON",
     "errorMessage" : "",
     "executeStatus" : "INITIAL",
     "externalReferenceCode" : "6c5286a2-aa28-175b-041e-eacca4a54d3b",
     "id" : 1234,
     "processedItemsCount" : 0,
     "totalItemsCount" : 0
   }
   ```

   ```{important}
   `jsont` is the required format for `*.batch-engine-dat.json` files when using in conjunction with batch client extensions. 
   
   When using `json` or `jsonl` as the output format, all fields are exported by default. To specify fields, you must provide an additional query parameter (`fieldNames`) with the fields you want to export. Each field must be separated by a comma (,). When using `csv` as the export format, this is a mandatory query parameter.
   ```

1. The current `executeStatus` is `INITIAL`. It denotes the submission of a task to the Batch Engine. You must wait until this is `COMPLETED` to download the data. On the command line, execute the `ExportTask_GET_ById.sh` script and replace `1234` with the ID of your export task.

   ```bash
   ./ExportTask_GET_ById.sh 1234
   ```

   ```json
   {
     "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
     "contentType" : "JSON",
     "endTime" : "2022-10-19T14:13:58Z",
     "errorMessage" : "",
     "executeStatus" : "COMPLETED",
     "externalReferenceCode" : "6c5286a2-aa28-175b-041e-eacca4a54d3b",
     "id" : 1234,
     "processedItemsCount" : 8,
     "startTime" : "2022-10-19T14:13:58Z",
     "totalItemsCount" : 8
   }
   ```

   If the `executeStatus` is `COMPLETED`, you can download the exported data. If not, execute the command again to ensure the task has finished execution. If the `executeStatus` shows `FAILED`, check the `errorMessage` field to understand what went wrong.

1. Once the `executeStatus` is `COMPLETED`, you can download the exported data by executing the `ExportTaskContent_GET_ById.sh` script and replacing `1234` with the ID of your export task.

   ```bash
   ./ExportTaskContent_GET_ById.sh 1234
   ```

   This downloads the exported data as a `.zip` file in the current directory. Extract it and use an appropriate application to view the data.

1. You can also call the The REST service using the Java client. Navigate out of the `curl` folder and into the `java` folder. Compile the source files:

   ```bash
   javac -classpath .:* *.java
   ```

1. Run the `ExportTask_POST_ToInstance` class. Replace `able` with the fully qualified name of the class.

   ```bash
   java -classpath .:* -DclassName=able ExportTask_POST_ToInstance
   ```

   For example, export `Account` data:

   ```bash
   java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account ExportTask_POST_ToInstance
   ```

   Note the `id` of the export task from the JSON response.

1. Run the `ExportTask_GET_ById` class with the following command. Replace `1234` with the ID of your export task.

   ```bash
   java -classpath .:* -DexportTaskId=1234 ExportTask_GET_ById
   ```

1. Once the `executeStatus` shows `COMPLETED`, you can download the data by running the `ExportTaskContent_GET_ById` class. Replace `1234` with the ID of your export task.

   ```bash
   java -classpath .:* -DexportTaskId=1234 ExportTaskContent_GET_ById
   ```

## Examine the cURL Command

The `ExportTask_POST_ToInstance.sh` script calls the REST service with a cURL command.

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_POST_ToInstance.sh
    :language: bash
```

Here are the command's arguments:

| Arguments                                                                    | Description                                         |
| :--------------------------------------------------------------------------- | :-------------------------------------------------- |
| `-H "Content-Type: application/json"`                                        | Indicates that the request body format is JSON.     |
| `-X POST`                                                                    | The HTTP method to invoke at the specified endpoint |
| `"http://localhost:8080/o/headless-batch-engine/v1.0/export-task/${1}/${2}"` | The REST service endpoint                           |
| `-u "test@liferay.com:learn"`                                                | Basic authentication credentials                    |

```{note}
Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth2](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2). See [Using OAuth2 to Authorize Users](../using-oauth2/using-oauth2-to-authorize-users.md) for a sample React application that uses Oauth2.
```

## Examine the Java Class

The `ExportTask_POST_ToInstance.java` class exports data by calling the Batch Engine related service.

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTask_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-21
```

This class invokes the REST service using only three lines of code:

| Line (abbreviated)                                                             | Description                                                                           |
| :----------------------------------------------------------------------------- | :------------------------------------------------------------------------------------ |
| `ExportTaskResource.Builder builder = ...`                                     | Gets a `Builder` for generating a `ExportTaskResource` service instance.              |
| `ExportTaskResource exportTaskResource = builder.authentication(...).build();` | Specifies basic authentication and generates a `ExportTaskResource` service instance. |
| `exportTaskResource.postExportTask(...);`                                      | Calls the `exportTaskResource.postExportTask` method and passes the data to post.     |

Note that the project includes the `com.liferay.headless.batch.engine.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

```{note}
The `main` method's comment demonstrates running the class.
```

The other example Java classes are similar to this one, but call different `ExportTaskResource` methods.

```{important}
See [ExportTaskResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-batch-engine/headless-batch-engine-client/src/main/java/com/liferay/headless/batch/engine/client/resource/v1_0/ExportTaskResource.java) for service details.
```

Below are examples of calling other Batch Engine export REST services using cURL and Java.

## Get the ExportTask Status

You can get the status of an export task by executing the following cURL or Java command. Replace `1234` with the ID of your export task.

### ExportTask_GET_ById.sh

Command:

```bash
./ExportTask_GET_ById.sh 1234
```

Code:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_GET_ById.sh
   :language: bash
```

### ExportTask_GET_ById.java

Run the `ExportTask_GET_ById` class. Replace `1234` with the ID of your export task.

Command:

```bash
java -classpath .:* -DexportTaskId=1234 ExportTask_GET_ById
```

Code:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTask_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

## Exporting Data from a Site

You can export data from a site by executing the following cURL or Java command. The example below exports blog posts from a site. [Find your Site’s ID](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services#identify-the-site-containing-the-data) and replace `1234` with it. When using another entity, you must also update the fully qualified class name parameter in the cURL script.

### ExportTask_POST_ToSite.sh

Command:

```bash
./ExportTask_POST_ToSite.sh com.liferay.headless.delivery.dto.v1_0.BlogPosting json 1234
```

Code:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_POST_ToSite.sh
   :language: bash
```

### ExportTask_POST_ToSite.java

Run the `ExportTask_POST_ToSite` class. Replace `1234` with your site's ID and `able` with the fully qualified name of the class you want to export:

```bash
java -classpath .:* -DsiteId=1234 -DclassName=able ExportTask_POST_ToSite
```

For example, export `BlogPosting` data: 

```bash
java -classpath .:* -DsiteId=1234 -DclassName=com.liferay.headless.delivery.dto.v1_0.BlogPosting ExportTask_POST_ToSite
```

Code:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTask_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

```{note}
The second parameter is `json` and denotes the output format of the exported data. You can also use `jsonl` and `csv` here. If using CSV, it is mandatory to specify the fields you want to export as a comma separated string and pass it as the fifth parameter in the `exportTaskResource.postExportTask()` method.
```

The JSON response displays information of the newly created export task. Note the `id` to keep track of its `executeStatus`. Once completed, you can execute `ExportTaskContent_GET_ById.[java|sh]` with the export task ID to download the data.

## Get Contents of the Exported Data

You can download the exported data with the following cURL and Java commands. Replace `1234` with the export task's ID. It is then downloaded as a `.zip` file in the current directory.

### ExportTaskContent_GET_ById.sh

Command:

```bash
./ExportTaskContent_GET_ById.sh 1234
```

Code:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTaskContent_GET_ById.sh
   :language: bash
```

### ExportTaskContent_GET_ById.java

Command

```bash
java -classpath .:* -DexportTaskId=1234 ExportTaskContent_GET_ById
```

Code:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTaskContent_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 11-27
```

The [API Explorer](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/consuming-rest-services) lists all of the Headless Batch Engine services and schemas and has an interface to try out each service.

## Related Topics

* [Batch Engine API Basics - Importing Data](./batch-engine-api-basics-importing-data.md)
* [Data Migration Center](./data-migration-center.md)
