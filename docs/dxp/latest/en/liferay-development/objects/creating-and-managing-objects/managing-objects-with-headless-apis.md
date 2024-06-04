---
uuid: 52fd1b70-d0cb-409e-99ec-fbd60bbf0a0f
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Managing Objects with Headless APIs

{bdg-secondary}`Liferay 7.4+`

You can [create and manage objects](../creating-and-managing-objects.md) from the Applications menu, but you can also use Liferay's REST APIs. Call these services to create and manage objects. Note that in Liferay's codebase, objects are called _object definitions_. Each object definition is made up of various object fields.

## Adding an Object Definition and Object Field

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip the provided sample code:

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/creating-and-managing-objects/liferay-r4g6.zip -O
   ```

   ```bash
   unzip liferay-r4g6.zip
   ```

1. Use the cURL script to add a new object definition to your instance. On the command line, navigate to the `curl` folder. Execute the `ObjectDefinition_POST_ToInstance.sh` script.

   ```bash
   ./ObjectDefinition_POST_ToInstance.sh
   ```

   The JSON response shows a new object definition has been added:

   ```json
   "active" : false,
   "dateCreated" : "2023-05-31T16:51:18Z",
   "dateModified" : "2023-05-31T16:51:18Z",
   "defaultLanguageId" : "en_US",
   "enableCategorization" : true,
   "enableComments" : false,
   "enableObjectEntryHistory" : false,
   "externalReferenceCode" : "4574eea8-03e9-d4c6-b9f9-23368b94350c",
   "id" : 44525,
   "label" : {
     "en_US" : "Foo"
   },
   "name" : "Foo",
   "objectActions" : [ ],
   ...
   "pluralLabel" : {
     "en_US" : "Foos"
   },
   "portlet" : false,
   "restContextPath" : "/o/c/foos",
   "scope" : "company",
   "status" : {
      "code" : 2,
      "label" : "draft",
      "label_i18n" : "Draft"
   },
   "system" : false,
   "titleObjectFieldName" : "id"
   ```

1. Navigate to *Global Menu* &rarr; *Applications* &rarr; *Objects*. See that a new object has been added.

   ![See that a new object definition has been added.](./managing-objects-with-headless-apis/images/01.png)

   Click the _Foo_ object. Note the object's ID number.

1. Use the cURL script to add a new object field to the object definition. On the command line, execute the `ObjectField_POST_ToObjectDefinition.sh` script. Replace 1234 with your object's ID.

   ```bash
   ./ObjectField_POST_ToObjectDefinition.sh 1234
   ```

1. In Liferay, click again on the _Foo_ object. Click the _Fields_ tab. Note that a new Able field was added.

   ![See that a new object field has been added.](./managing-objects-with-headless-apis/images/02.png)

1. The REST services can also be called using the Java client. Navigate out of the `curl` folder and into the `java` folder. Compile the source files:

   ```bash
   javac -classpath .:* *.java
   ```

1. Run the `ObjectDefinition_POST_ToInstance.java` class:

   ```bash
   java -classpath .:* ObjectDefinition_POST_ToInstance
   ```

1. Note the _Foo_ object's ID number. Then run the `ObjectField_POST_ToObjectDefinition.java` class. Replace 1234 with your object's ID.

   ```bash
   java -classpath .:* -DobjectDefinitionId=1234 ObjectField_POST_ToObjectDefinition
   ```

Newly created objects are still in draft status. Make your necessary changes or modifications before publishing. Once objects are published, edits are disabled. See [publishing object drafts](../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) to learn more.

## Examine cURL Command

The `ObjectDefinition_POST_ToInstance.sh` script calls the REST service with a cURL command.

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_POST_ToInstance.sh
    :language: bash
```

Here are the command's arguments:

| Arguments                                                                                                                   | Description                                         |
| :-------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------- |
| `-H "Content-Type: application/json"`                                                                                       | Defines a request body format of JSON.              |
| `-X POST`                                                                                                                   | The HTTP method to invoke at the specified endpoint |
| `"http://localhost:8080/o/object-admin/v1.0/object-definitions"`                                                            | The REST service endpoint                           |
| `-d "{\"label\": {\"en_US\": \"Foo\"}, \"name\": \"Foo\", \"pluralLabel\": {\"en_US\": \"Foos\"}, \"scope\": \"company\"}"` | The data you are requesting to post                 |
| `-u "test@liferay.com:learn"`                                                                                               | Basic authentication credentials                    |

!!! note
    Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth2](../../../headless-delivery/using-oauth2.md). See [Using OAuth2 to Authorize Users](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) for a sample React application that uses OAuth2.

The other cURL commands use similar JSON arguments.

## Examine the Java Class

The `ObjectDefinition_POST_ToInstance.java` class adds an object definition by calling the related service.

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 11-32
```

This class invokes the REST service using only three lines of code:

| Line (abbreviated)                                                                         | Description                                                                                   |
| :----------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------- |
| `ObjectDefinitionResource.Builder builder = ...`                                           | Gets a `Builder` for generating a `ObjectDefinitionResource` service instance.                |
| `ObjectDefinitionResource objectDefinitionResource = builder.authentication(...).build();` | Specifies basic authentication and generates a `ObjectDefinitionResource` service instance.   |
| `ObjectDefinition objectDefinition = objectDefinitionResource.postObjectDefinition(...);`  | Calls the `objectDefinitionResource.postObjectDefinition` method and passes the data to post. |

Note that the project includes the `com.liferay.object.admin.rest.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

!!! note
    The `main` method's comment demonstrates running the class.

The other example Java classes are similar to this one, but call different methods.

!!! important
    See [ObjectDefinitionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/object/object-admin-rest-client/src/main/java/com/liferay/object/admin/rest/client/resource/v1_0/ObjectDefinitionResource.java) for service details.

Below are examples of calling other related REST services using cURL and Java.

## Get Objects from Instance

You can list object definitions by executing the following cURL or Java command.

### ObjectDefinitions_GET_FromInstance.sh

Command:

```bash
./ObjectDefinitions_GET_FromInstance.sh
```

Code:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinitions_GET_FromInstance.sh
   :language: bash
```

### ObjectDefinitions_GET_FromInstance.java

Command:

```bash
java -classpath .:* ObjectDefinitions_GET_FromInstance
```

Code:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinitions_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-25
```

The Instance's object definitions appear in JSON.

## Get an Object Definition

Get a specific object definition with the following cURL or Java command.

!!! tip
    Use ``ObjectDefinitions_GET_FromInstance.[java|sh]`` to get instance ``ObjectDefinition`` IDs.

### ObjectDefinition_GET_ById.sh

Command:

```bash
./ObjectDefinition_GET_ById.sh 1234
```

Code:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_GET_ById.sh
   :language: bash
```

### ObjectDefinition_GET_ById.java

Command:

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_GET_ById
```

Code:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-20
```

The object definition's fields appear in JSON.

## Patch an Object Definition

Do a partial edit of an existing object definition with the following cURL and Java commands. Replace `1234` with your object definition's ID.

### ObjectDefinition_PATCH_ById.sh

Command:

```bash
./ObjectDefinition_PATCH_ById.sh 1234
```

Code:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_PATCH_ById.sh
   :language: bash
```

### ObjectDefinition_PATCH_ById.java

Command:

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_PATCH_ById
```

Code:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 11-32
```

## Put an Object Definition

Completely overwrite an existing object definition with the following cURL and Java commands. Replace `1234` with your object definition's ID.

### ObjectDefinition_PUT_ById.sh

Command:

```bash
./ObjectDefinition_PUT_ById.sh 1234
```

Code:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_PUT_ById.sh
   :language: bash
```

### ObjectDefinition_PUT_ById.java

Command:

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_PUT_ById
```

Code:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 11-33
```

## Delete an Object Definition

Delete an existing object definition with the following cURL and Java commands. Replace `1234` with your object definition's ID.

### ObjectDefinition_DELETE_ById.sh

Command:

```bash
./ObjectDefinition_DELETE_ById.sh 1234
```

Code:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/curl/ObjectDefinition_DELETE_ById.sh
   :language: bash
```

### ObjectDefinition_DELETE_ById.java

Command

```bash
java -classpath .:* -DobjectDefinitionId=1234 ObjectDefinition_DELETE_ById
```

Code:

```{literalinclude} ./managing-objects-with-headless-apis/resources/liferay-r4g6.zip/java/ObjectDefinition_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## Services for Object Fields

The cURL commands and Java classes for object field work in the same way as object definitions.

| Files                                              | Description                                             |
| :------------------------------------------------- | :------------------------------------------------------ |
| `ObjectField_DELETE_ById.[java\|sh]`               | Deletes an object field by ID.                          |
| `ObjectField_GET_ById.[java\|sh]`                  | Gets a specific object field by ID.                     |
| `ObjectField_PATCH_ById.[java\|sh]`                | Patches a specific object field by ID.                  |
| `ObjectField_POST_ToObjectDefinition.[java\|sh]`   | Posts an object field to an object definition.          |
| `ObjectField_PUT_ById.[java\|sh]`                  | Replaces a specific object field by ID.                 |
| `ObjectFields_GET_FromObjectDefinition.[java\|sh]` | Gets a list of object fields from an object definition. |

The [API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md) shows all of the services and schemas for objects and has an interface to try out each service.

## Related Topics

- [Creating Objects](./creating-objects.md)
- [Using Liferay as a Headless Platform](../../../headless-delivery/using-liferay-as-a-headless-platform.md)
- [Sample API Tutorials](../../../headless-delivery/sample-api-tutorials.md)