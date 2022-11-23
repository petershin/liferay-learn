# Regions API Basics

{bdg-secondary}`Available Liferay 7.4 U24+ and GA24+`

Use Liferay's REST APIs to create and manage regions.

## Adding a Region

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip [Regions API Basics](./liferay-r2p3.zip).

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-r2p3.zip -O
   ```

   ```bash
   unzip liferay-r2p3.zip
   ```

1. Use the cURL script to add a new region to a country. On the command line, navigate to the `curl` folder. Execute the `Region_POST_ToCountry.sh` script. 

   ```bash
   ./Region_POST_ToCountry.sh 1234
   ```

   Replace `1234` with a country's ID. Use [Get Countries from Instance](./countries-api-basics.md#get-countries-from-instance) to get a list of IDs.

   The JSON response shows a new Region has been added:

   ```bash
   "active" : true,
   "countryId" : 43501,
   "id" : 43503,
   "name" : "Foo",
   "position" : 0.0,
   "regionCode" : "ABL",
   "title_i18n" : { }

   ```

1. The REST service can also be called using the Java client. Navigate out of the `curl` folder and into the `java` folder. Compile the source files:

   ```bash
   javac -classpath .:* *.java
   ```

1. Run the `Region_POST_ToCountry.java` class: 

   ```bash
   java -classpath .:* -DcountryId=1234 Region_POST_ToCountry
   ```

## Examine the cURL Command

The `Region_POST_ToCountry.sh` script calls the REST service with a cURL command.

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_POST_ToCountry.sh
    :language: bash
```

Here are the command's arguments:

| Arguments | Description |
| :--- | :--- |
| `-H "Content-Type: application/json"` | Indicates that the request body format is JSON. |
| `-X POST` | The HTTP method to invoke at the specified endpoint |
| `"http://localhost:8080/o/headless-admin-address/v1.0/countries/${1}/regions"` | The REST service endpoint |
| `-d "{\"name\": \"Foo\", \"regionCode\": \"ABL\"}"` | The data you are requesting to post |
| `-u "test@liferay.com:learn"` | Basic authentication credentials |

```{note}
Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth2](../../headless-delivery/using-oauth2.md). See [Using OAuth2 to Authorize Users](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) for a sample React application that uses OAuth2.
```

The other cURL commands use similar JSON arguments.

## Examine the Java Class

The `Region_POST_ToCountry.java` class adds a region by calling the Region-related service.

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_POST_ToCountry.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

This class invokes the REST service using only three lines of code:

| Line (abbreviated) | Description |
| :----------------- | :---------- |
| `RegionResource.Builder builder = ...` | Gets a `Builder` for generating an `RegionResource` service instance. |
| `RegionResource regionResource = builder.authentication(...).build();` | Specifies basic authentication and generates a `RegionResource` service instance. |
| `Region region = regionResource.postRegion(...);` | Calls the `regionResource.postRegion` method and passes the data to post. |

Note that the project includes the `com.liferay.headless.admin.address.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

```{note}
The `main` method's comment demonstrates running the class.
```

The other example Java classes are similar to this one, but call different `RegionResource` methods.

```{important}
See [RegionResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-address/headless-admin-address-client/src/main/java/com/liferay/headless/admin/address/client/resource/v1_0/RegionResource.java) for service details.
```

Below are examples of calling other `Region` REST services using cURL and Java.

## Get Regions from Instance

You can list regions by executing the following cURL or Java command.

### Regions_GET_FromInstance.sh

Command:

```bash
./Regions_GET_FromInstance.sh
```

Code:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Regions_GET_FromInstance.sh
   :language: bash
```

### Regions_GET_FromInstance.java

Command:

```bash
java -classpath .:* Regions_GET_FromInstance
```

Code:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Regions_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

The Instance's `Region` objects appear in JSON.

## Get a Region

Get a specific region with the following cURL or Java command.

```{tip}
Use ``Regions_GET_FromInstance.[java|sh]`` to get instance ``Region`` IDs.
```

### Region_GET_ById.sh

Command:

```bash
./Region_GET_ById.sh 1234
```

Code:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_GET_ById.sh
   :language: bash
```

### Region_GET_ById.java

Command:

```bash
java -classpath .:* -DregionId=1234 Region_GET_ById
```

Code:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

The `Region` fields appear in JSON.

## Patch a Region

Do a partial edit of an existing Region with the following cURL and Java commands. Replace `1234` with your Region's ID.

### Region_PATCH_ById.sh

Command:

```bash
./Region_PATCH_ById.sh 1234
```

Code:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_PATCH_ById.sh
   :language: bash
```

### Region_PATCH_ById.java

Command:

```bash
java -classpath .:* -DregionId=1234 Region_PATCH_ById
```

Code:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## Put a Region

Completely overwrite an existing region with the following cURL and Java commands. Replace `1234` with your region's ID.

### Region_PUT_ById.sh

Command:

```bash
./Region_PUT_ById.sh 1234
```

Code:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_PUT_ById.sh
   :language: bash
```

### Region_PUT_ById.java

Command:

```bash
java -classpath .:* -DregionId=1234 Region_PUT_ById
```

Code:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

## Delete a Region

Delete an existing region with the following cURL and Java commands. Replace `1234` with your region's ID.

### Region_DELETE_ById.sh

Command:

```bash
./Region_DELETE_ById.sh 1234
```

Code:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/curl/Region_DELETE_ById.sh
   :language: bash
```

### Region_DELETE_ById.java

Command

```bash
java -classpath .:* -DregionId=1234 Region_DELETE_ById
```

Code:

```{literalinclude} ./regions-api-basics/resources/liferay-r2p3.zip/java/Region_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

The [API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) shows all of the `Region` services and schemas and has an interface to try out each service.
