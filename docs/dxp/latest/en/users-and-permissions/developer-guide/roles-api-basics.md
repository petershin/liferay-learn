---
uuid: ed3e08d0-1622-4147-b84c-1d07b4187a86
taxonomy-category-names:
- Development and Tooling
- Data Frameworks
- Liferay Self-Hosted
- Liferay PaaS
---
# Roles API Basics

You can [create and manage roles](../roles-and-permissions/creating-and-managing-roles.md) from the Application menu, but you can also use Liferay's REST APIs. Call these services to manage roles.

## Associate a User to a Regular Role

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip [Roles API Basics](./liferay-z3v5.zip).

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-z3v5.zip -O
   ```

   ```bash
   unzip liferay-z3v5.zip
   ```

1. Use the [Users_GET_FromInstance](./user-account-api-basics.md#get-instance-users) to get a list of user IDs. Make note of the user ID you wish to associate with a regular role.

1. Use the [Roles_GET_FromInstance](#get-roles-from-instance) to get a list of all role IDs. Make note of the role ID you wish to associate that is `roleType: regular`. For example, the Analytics Administrator regular role type.

1. Use the cURL script to associate a user to a regular Role. On the command line, navigate to the `curl` folder. Execute the `RoleUserAssociation_POST_ToInstance.sh` script. Replace `1234` with a regular role's ID. Replace `5678` with a user's ID.

   ```bash
   ./RoleUserAssociation_POST_ToInstance.sh 1234 5678
   ```

1. Navigate to *Global Menu* &rarr; *Control Panel* &rarr; *Roles*. Under the Regular Roles tab, click the specific role you used to a associate the user. Click the *Assignees* tab. See that the user has been associated with the selected role.

   ![See that the user has been associated.](./roles-api-basics/images/01.png)

1. The REST service can also be called using the Java client. Navigate out of the `curl` folder and into the `java` folder. Compile the source files with the following command:

   ```bash
   javac -classpath .:* *.java
   ```

1. Run the `RoleUserAssociation_POST_ToInstance.java` class with the following command.

   ```bash
   java -classpath .:* -DroleId=1234 -DuserAccountId=5678 RoleUserAssociation_POST_ToInstance
   ```

## Examine the cURL Command

The `RoleUserAssociation_POST_ToInstance.sh` script calls the REST service with a cURL command.

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToInstance.sh
    :language: bash
```

Here are the command's arguments:

| Arguments                                                                                     | Description                                         |
| :-------------------------------------------------------------------------------------------- | :-------------------------------------------------- |
| `-H "Content-Type: application/json"`                                                         | Indicates that the request body format is JSON.     |
| `-X POST`                                                                                     | The HTTP method to invoke at the specified endpoint |
| `"http://localhost:8080/o/headless-admin-user/v1.0/roles/${1}/association/user-account/${2}"` | The REST service endpoint                           |
| `-u "test@liferay.com:learn"`                                                                 | Basic authentication credentials                    |

!!1 note
    Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth2](../../headless-delivery/using-oauth2.md). See [Using OAuth2 to Authorize Users](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) for a sample React application that uses OAuth2.

The other cURL commands use similar JSON arguments.

## Examine the Java Class

The `RoleUserAssociation_POST_ToInstance.java` class associated a user to a regular role by calling the role-related service.

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

This class invokes the REST service using only three lines of code:

| Line (abbreviated)                                                 | Description                                                                     |
| :----------------------------------------------------------------- | :------------------------------------------------------------------------------ |
| `RoleResource.Builder builder = ...`                               | Gets a `Builder` for generating an `RoleResource` service instance.             |
| `RoleResource roleResource = builder.authentication(...).build();` | Specifies basic authentication and generates a `RoleResource` service instance. |
| `roleResource.postRoleUserAccountAssociation(...);`                | Calls the `postRoleUserAccountAssociation` method and passes the data to post.  |

Note that the project includes the `com.liferay.headless.admin.user.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

!!! note
    The `main` method's comment demonstrates running the class.

The other example Java classes are similar to this one, but call different `RoleResource` methods.

!!! important
    See [RoleResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/AccountResource.java) for service details.

Below are examples of calling other `Role` REST services using cURL and Java.

## Get Roles from Instance

You can list roles by executing the following cURL or Java command.

### Roles_GET_FromInstance.sh

Command:

```bash
./Roles_GET_FromInstance.sh
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/Roles_GET_FromInstance.sh
   :language: bash
```

### Roles_GET_FromInstance.java

Command:

```bash
java -classpath .:* Roles_GET_FromInstance
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/Roles_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-21
```

The Instance's `Roles` objects appear in JSON.

## Get a Role

Get a specific role with the following cURL or Java command.

!!! tip
    Use ``Roles_GET_FromInstance.[java|sh]`` to get instance ``Role`` IDs.

### Role_GET_ById.sh

Command:

```bash
./Role_GET_ById.sh 1234
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/Role_GET_ById.sh
   :language: bash
```

### Role_GET_ById.java

Command:

```bash
java -classpath .:* -DroleId=1234 Role_GET_ById
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/Role_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

The `Role` fields appear in JSON.

## Associate a User to a Site Role

You can associate a user with a specific site role. Replace `1234` with the role's ID. Replace `5678` with your site's ID. Replace `9012` with your user's ID.

### RoleUserAssociation_POST_ToSite.sh

Command:

```bash
./RoleUserAssociation_POST_ToSite.sh 1234 5678 9012
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToSite.sh
   :language: bash
```

### RoleUserAssociation_POST_ToSite.java

Command:

```bash
java -classpath .:* -DroleId=1234 -DsiteId=5678 -DuserAccountId=9012 RoleUserAssociation_POST_ToSite
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## Associate a User to a Organization Role

You can associate a user with a specific organization role. Replace `1234` with your organization's ID. Replace `5678` with your role's ID. Replace `9012` with your user's ID.

### RoleUserAssociation_POST_ToOrganization.sh

Command:

```bash
./RoleUserAssociation_POST_ToOrganization.sh 1234 5678 9012
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_POST_ToOrganization.sh
   :language: bash
```

### RoleUserAssociation_POST_ToOrganization.java

Command:

```bash
java -classpath .:* -DorganizationId=1234 -DroleId=5678 -DuserAccountId=9012 RoleUserAssociation_POST_ToOrganization
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_POST_ToOrganization.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## Remove Regular Role Association

Remove a regular role association from a specific user. Replace `1234` with the role's ID. Replace `5678` with your user's ID. 

### RoleUserAssociation_DELETE_FromInstance.sh

Command:

```bash
./RoleUserAssociation_DELETE_FromInstance.sh 1234 5678
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_DELETE_FromInstance.sh
   :language: bash
```

### RoleUserAssociation_DELETE_FromInstance.java

Command

```bash
java -classpath .:* -DroleId=1234 -DuserAccountId=5678 RoleUserAssociation_DELETE_FromInstance
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_DELETE_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

## Remove Site Role Association

Remove a site role association from a specific user. Replace `1234` with the role's ID. Replace `5678` with your site's ID. Replace `9012` with your user's ID.

### RoleUserAssociation_DELETE_FromSite.sh

Command:

```bash
./RoleUserAssociation_DELETE_FromSite.sh 1234 5678 9012
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_DELETE_FromSite.sh
   :language: bash
```

### RoleUserAssociation_DELETE_FromSite.java

Command

```bash
java -classpath .:* -DroleId=1234 -DsiteId=5678 -DuserAccountId=9012 RoleUserAssociation_DELETE_FromSite
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_DELETE_FromSite.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

## Remove Organization Role Association

Remove an organization role association from a specific user. Replace `1234` with the organization's ID. Replace `5678` with your role's ID. Replace `9012` with your user's ID.

### RoleUserAssociation_DELETE_FromOrganization.sh

Command:

```bash
./RoleUserAssociation_DELETE_FromOrganization.sh 1234 5678 9012
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/curl/RoleUserAssociation_DELETE_FromOrganization.sh
   :language: bash
```

### RoleUserAssociation_DELETE_FromOrganization.java

Command

```bash
java -classpath .:* -DorganizationId=1234 -DroleId=5678 -DuserAccountId=9012 RoleUserAssociation_DELETE_FromOrganization
```

Code:

```{literalinclude} ./roles-api-basics/resources/liferay-z3v5.zip/java/RoleUserAssociation_DELETE_FromOrganization.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

The [API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) shows all of the `Role` services and schemas and has an interface to try out each service.

!!! note
    Starting Liferay DXP 2024.Q4+/GA129+, you can use external reference codes to `GET/PUT/PATCH/DELETE` roles.
