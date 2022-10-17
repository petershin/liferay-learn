# Batch Engine API Basics

Liferay's Batch Engine provides REST APIs to import and export data. Call these services to import and export data.

<!-- TASK: Link to Batch Engine Overview in the introduction once it is ready !-->

## Importing Data

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip [Batch Engine API Basics](./liferay-g4j2.zip).

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/liferay-g4j2.zip -O
   ```

   ```bash
   unzip liferay-g4j2.zip
   ```

1. There are two steps involved in importing data using the Batch Engine's REST APIs. First, you must have the fully qualified class name of the class that your are importing. You can get the class name from the API explorer in your installation at `/o/api` by checking the `x-class-name` field under Schemas. Second, you must wait for the task's `executeStatus` to be `COMPLETED`.

1. Use the cURL script to import Accounts to your Liferay instance. On the command line, navigate to the `curl` folder. Execute the `ImportTask_POST_ToInstance.sh` script with the fully qualified class name of Accounts as a parameter.

   ```bash
   ./ImportTask_POST_ToInstance.sh com.liferay.headless.admin.user.dto.v1_0.Account
   ```

   The JSON response shows the creation of a new Import task. Note down the `id` of the task:

   ```bash
   {
      "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
      "contentType" : "JSON",
      "errorMessage" : "",
      "executeStatus" : "STARTED",
      "externalReferenceCode" : "103798d4-7454-810e-c067-2a472d214d5c",
      "failedItems" : [ ],
      "id" : 1234,
      "importStrategy" : "ON_ERROR_FAIL",
      "operation" : "CREATE",
      "processedItemsCount" : 0,
      "startTime" : "2022-10-17T11:11:59Z",
      "totalItemsCount" : 0
   }
   ```

1. On the command line, execute the `ImportTask_GET_ById.sh` script with the task id as a parameter. Replace `1234` with the ID of your import task.

   ```bash
   ./ImportTask_GET_ById.sh 1234
   ```

   ```bash
   {
      "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
      "contentType" : "JSON",
      "endTime" : "2022-10-17T11:11:59Z",
      "errorMessage" : "",
      "executeStatus" : "COMPLETED",
      "externalReferenceCode" : "103798d4-7454-810e-c067-2a472d214d5c",
      "failedItems" : [ ],
      "id" : 1,
      "importStrategy" : "ON_ERROR_FAIL",
      "operation" : "CREATE",
      "processedItemsCount" : 2,
      "startTime" : "2022-10-17T11:11:59Z",
      "totalItemsCount" : 2
   }
   ```

1. Verify the imported data by opening the *Global Menu* (![Applications Menu icon](../../images/icon-applications-menu.png)), and navigating to *Control Panel* &rarr; *Accounts*. See that two new Accounts have been added.

   ![Verify that two new Accounts have been added.](./batch-engine-api-basics/images/02.png)

1. You can also call the The REST service using the Java client. Navigate out of the `curl` folder and into the `java` folder. Compile the source files with the following command:

   ```bash
   javac -classpath .:* *.java
   ```

1. Run the `ImportTask_POST_ToInstance` class with the following command. Replace the `className` value with the fully qualified name of the class, and `data` with the JSON data you want to import. The example below shows the command to import Accounts. Note down the `id` of the task from the JSON response.

   ```bash
   java -cp .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account -Ddata="[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]" ImportTask_POST_ToInstance
   ```

1. Run the `ImportTask_GET_ById` class with the following command. Replace the `importTaskId` value with the ID of your import task. Once the `executeStatus` shows `COMPLETED`, you can verify the data as shown above.

   ```bash
   java -cp .:* -DimportTaskId=1234 ImportTask_GET_ById
   ```

## Examine the cURL Command

The `ImportTask_POST_ToInstance.sh` script calls the REST service with a cURL command.

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ImportTask_POST_ToInstance.sh
    :language: bash
```

Here are the command's arguments:

| Arguments                                                                                         | Description                                         |
| :------------------------------------------------------------------------------------------------ | :-------------------------------------------------- |
| `-H "Content-Type: application/json"`                                                             | Indicates that the request body format is JSON.     |
| `-X POST`                                                                                         | The HTTP method to invoke at the specified endpoint |
| `"http://localhost:8080/o/headless-batch-engine/v1.0/import-task/${1}"`                           | The REST service endpoint                           |
| `-d "[{\"name\": \"Able\", \"type\": \"business\"}, {\"name\": \"Baker\", \"type\": \"guest\"}]"` | The data you are requesting to post                 |
| `-u "test@liferay.com:learn"`                                                                     | Basic authentication credentials                    |

```{note}
Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth2](https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2.html).
```

The other cURL commands use similar JSON arguments.

## Examine the Java Class

The `ImportTask_POST_ToInstance.java` class imports data by calling the Batch Engine related service.

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ImportTask_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

This class invokes the REST service using only three lines of code:

| Line (abbreviated)                                                             | Description                                                                           |
| :----------------------------------------------------------------------------- | :------------------------------------------------------------------------------------ |
| `ImportTaskResource.Builder builder = ...`                                     | Gets a `Builder` for generating a `ImportTaskResource` service instance.              |
| `ImportTaskResource importTaskResource = builder.authentication(...).build();` | Specifies basic authentication and generates a `ImportTaskResource` service instance. |
| `importTaskResource.postImportTask(...);`                                      | Calls the `importTaskResource.postImportTask` method and passes the data to post.     |

Note that the project includes the `com.liferay.headless.batch.engine.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

```{note}
The `main` method's comment demonstrates running the class.
```

The other example Java classes are similar to this one, but call different `ImportTaskResource` and `ExportTaskResource` methods.

```{important}
See [ImportTaskResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-batch-engine/headless-batch-engine-client/src/main/java/com/liferay/headless/batch/engine/client/resource/v1_0/ImportTaskResource.java) and [ExportTaskResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-batch-engine/headless-batch-engine-client/src/main/java/com/liferay/headless/batch/engine/client/resource/v1_0/ExportTaskResource.java) for service details.
```

Below are examples of calling other Batch Engine REST services using cURL and Java.
