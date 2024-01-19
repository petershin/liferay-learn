---
uuid: ad872c2b-d276-432f-8765-4658dfce1977
taxonomy-category-names:
- Development and Tooling
- Data Frameworks
- Liferay Self-Hosted
- Liferay PaaS
---
# Countries API Basics

{bdg-secondary}`Liferay 7.4 U24+ and GA24+`

Use Liferay's Rest APIs to create and manage countries.

## Adding a Country

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip [Countries API Basics](./liferay-g6m8.zip).

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-g6m8.zip -O
   ```

   ```bash
   unzip liferay-g6m8.zip
   ```

1. Use the cURL script to add a new country to your instance. On the command line, navigate to the `curl` folder. Execute the `Country_POST_ToInstance.sh` script.

   ```bash
   ./Country_POST_ToInstance.sh
   ```

   The JSON response shows a new country has been added:

   ```json
   {
     "a2" : "AB",
     "a3" : "ABL",
     "active" : true,
     "billingAllowed" : true,
     "groupFilterEnabled" : false,
     "id" : 43501,
     "name" : "Foo",
     "number" : 1234,
     "position" : 0.0,
     "regions" : [ ],
     "shippingAllowed" : true,
     "subjectToVAT" : false,
     "title_i18n" : { },
     "zipRequired" : true
   }
   ```

1. The REST service can also be called using the Java client. Navigate out of the `curl` folder and into the `java` folder. Compile the source files like this:

   ```bash
   javac -classpath .:* *.java
   ```

1. Run the `Country_POST_ToInstance.java` class:

   ```bash
   java -classpath .:* Country_POST_ToInstance
   ```

## Examine the cURL Command

The `Country_POST_ToInstance.sh` script calls the REST service with a cURL command.

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_POST_ToInstance.sh
    :language: bash
```

Here are the command's arguments:

| Arguments | Description |
| :--- | :--- |
| `-H "Content-Type: application/json"` | Indicates that the request body format is JSON. |
| `-X POST` | The HTTP method to invoke at the specified endpoint |
| `"http://localhost:8080/o/headless-admin-address/v1.0/countries"` | The REST service endpoint |
| `-d "{\"a2\": \"AB\", \"a3\": \"ABL\", \"name\": \"Foo\", \"number\": \"1234\"}"` | The data you are requesting to post |
| `-u "test@liferay.com:learn"` | Basic authentication credentials |

```{note}
Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth2](../../headless-delivery/using-oauth2.md). See [Using OAuth2 to Authorize Users](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) for a sample React application that uses OAuth2.
```

The other cURL commands use similar JSON arguments.

## Examine the Java Class

The `Country_POST_ToInstance.java` class adds a country by calling the Country-related service.

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

This class invokes the REST service using only three lines of code:

| Line (abbreviated) | Description |
| :----------------- | :---------- |
| `CountryResource.Builder builder = ...` | Gets a `Builder` for generating an `CountryResource` service instance. |
| `CountryResource countryResource = builder.authentication(...).build();` | Specifies basic authentication and generates a `CountryResource` service instance. |
| `Country country = countryResource.postCountry(...);` | Calls the `countryResource.postCountry` method and passes the data to post. |

Note that the project includes the `com.liferay.headless.admin.address.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

```{note}
The `main` method's comment demonstrates running the class.
```

The other example Java classes are similar to this one, but call different `CountryResource` methods.

```{important}
See [CountryResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-address/headless-admin-address-client/src/main/java/com/liferay/headless/admin/address/client/resource/v1_0/CountryResource.java) for service details.
```

Below are examples of calling other `Country` REST services using cURL and Java.

## Get Countries from Instance

You can list countries by executing the following cURL or Java command.

### Countries_GET_FromInstance.sh

Command:

```bash
./Countries_GET_FromInstance.sh
```

Code:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Countries_GET_FromInstance.sh
   :language: bash
```

### Countries_GET_FromInstance.java

Command:

```bash
java -classpath .:* Countries_GET_FromInstance
```

Code:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Countries_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

The Instance's `Country` objects appear in JSON.

## Get a Country

Get a specific country with the following cURL or Java command.

```{tip}
Use ``Countries_GET_FromInstance.[java|sh]`` to get instance ``Country`` IDs.
```

### Country_GET_ById.sh

Command:

```bash
./Country_GET_ById.sh 1234
```

Code:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_GET_ById.sh
   :language: bash
```

### Country_GET_ById.java

Command:

```bash
java -classpath .:* -DcountryId=1234 Country_GET_ById
```

Code:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

The `Country` fields appear in JSON.

## Patch a Country

Do a partial edit of an existing country with the following cURL and Java commands. Replace `1234` with your country's ID.

### Country_PATCH_ById.sh

Command:

```bash
./Country_PATCH_ById.sh 1234
```

Code:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_PATCH_ById.sh
   :language: bash
```

### Country_PATCH_ById.java

Command:

```bash
java -classpath .:* -DcountryId=1234 Country_PATCH_ById
```

Code:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## Put a Country

Completely overwrite an existing country with the following cURL and Java commands. Replace `1234` with your country's ID.

### Country_PUT_ById.sh

Command:

```bash
./Country_PUT_ById.sh 1234
```

Code:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_PUT_ById.sh
   :language: bash
```

### Country_PUT_ById.java

Command:

```bash
java -classpath .:* -DcountryId=1234 Country_PUT_ById
```

Code:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

## Delete a Country

Delete an existing country with the following cURL and Java commands. Replace `1234` with your country's ID.

### Country_DELETE_ById.sh

Command:

```bash
./Country_DELETE_ById.sh 1234
```

Code:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/curl/Country_DELETE_ById.sh
   :language: bash
```

### Country_DELETE_ById.java

Command

```bash
java -classpath .:* -DcountryId=1234 Country_DELETE_ById
```

Code:

```{literalinclude} ./countries-api-basics/resources/liferay-g6m8.zip/java/Country_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

The [API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) shows all of the `Country` services and schemas and has an interface to try out each service.