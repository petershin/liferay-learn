---
uuid: 7de0146e-dcec-4da0-9956-36d9e97af032
taxonomy-category-names:
- Development and Tooling
- Data Frameworks
- Liferay Self-Hosted
- Liferay PaaS
---
# User Account API Basics

You can [add and manage users](../users/adding-and-managing-users.md) from the Control Panel, but you can also use Liferay's REST APIs. You can call these services to add, edit, delete users.

Start with adding a new user.

## Adding Users

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip [User Account API Basics](./liferay-y6q4.zip).

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/users-and-permissions/developer-guide/liferay-y6q4.zip -O
   ```

   ```bash
   unzip liferay-y6q4.zip
   ```

1. Use the cURL script to add a new User to your Liferay instance. On the command line, navigate to the `curl` folder. Execute the `User_POST_ToInstance.sh` script.

   ```bash
   ./User_POST_ToInstance.sh
   ```

   The JSON response shows a new user has been added:

   ```json
   {
     "additionalName": "",
     "alternateName": "able",
     "birthDate": "1977-01-01T00:00:00Z",
     "customFields": [],
     "dashboardURL": "",
     "dateCreated": "2021-05-19T16:04:46Z",
     "dateModified": "2021-05-19T16:04:46Z",
     "emailAddress": "able@liferay.com",
     "familyName": "Foo",
     "givenName": "Able",
     "id": 39321,
     "jobTitle": "",
     "keywords": [],
     "name": "Able Foo",
     "organizationBriefs": [],
     "profileURL": "",
     "roleBriefs": [
       {
         "id": 20113,
         "name": "User"
       }
     ],
     "siteBriefs": [
       {
         "id": 20127,
         "name": "Global"
       },
       {
         "id": 20125,
         "name": "Guest"
       }
     ],
     "userAccountContactInformation": {
       "emailAddresses": [],
       "facebook": "",
       "jabber": "",
       "postalAddresses": [],
       "skype": "",
       "sms": "",
       "telephones": [],
       "twitter": "",
       "webUrls": []
     }
   }%
   ```

   Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Users and Organizations*. Verify the addition of a new user. Note the user's `id` number for later commands.

   ![Verify the addition of a new user.](./user-account-api-basics/images/01.png)

1. The REST service can also be called with a Java class. Navigate out of the `curl` folder and into the `java` folder. Compile the source files with the following command:

   ```bash
   javac -classpath .:* *.java
   ```

1. Run the `User_POST_ToInstance` class with the following command:

   ```bash
   java -classpath .:* User_POST_ToInstance
   ```

   Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Users and Organizations*. Verify the addition of a new user.

Read on to see how the cURL command and Java class work. 

## Examine the cURL Command

The `User_POST_ToInstance.sh` script calls the REST service with a cURL command. 

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_POST_ToInstance.sh
    :language: bash
```

Here are the command's arguments:

| Arguments                                                                                                                      | Description                                         |
| :----------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------- |
| `-H "Content-Type: application/json"`                                                                                          | Indicates that the request body format is JSON.     |
| `-X POST`                                                                                                                      | The HTTP method to invoke at the specified endpoint |
| `"http://localhost:8080/o/headless-admin-user/v1.0/user-accounts"`                                                             | The REST service endpoint                           |
| `-d "{\"alternateName\": \"Able\", \"emailAddress\": \"able@liferay.com\", \"familyName\": \"Foo\", \"givenName\": \"Able\"}"` | The data you are requesting to post                 |
| `-u "test@liferay.com:learn"`                                                                                                  | Basic authentication credentials                    |

!!! note
    Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth2](../../headless-delivery/using-oauth2.md). See [Using OAuth2 to Authorize Users](../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) for a sample React application that uses OAuth2.

The other cURL commands use similar JSON arguments.

## Examine the Java Class

The `User_POST_ToInstance.java` class adds a user by calling the user related service.

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

The class calls the REST service with only three lines of code:

| Line (abbreviated)                                                              | Description                                                                             |
| :------------------------------------------------------------------------------ | :-------------------------------------------------------------------------------------- |
| `UserAccountResource.Builder builder = ...`                                     | Gets a `Builder` for generating a `UserAccountResource` service instance.               |
| `UserAccountResource userAccountResource = builder.authentication(...).build()` | Specifies basic authentication and generates a `UserAccountResources` service instance. |
| `UserAccount userAccount = userAccountResource.postUserAccount(...)`            | Calls the `userAccountResource.postUserAccount` method and passes the data to post.     |

Note that the project includes the `com.liferay.headless.admin.user.client.jar` file as a dependency. You can find client JAR dependency information for all REST applications in the API explorer in your installation at `/o/api`.

!!! note
    The `main` method's comment demonstrates running the class.

The other example Java classes are similar to this one but call different `UserAccountResource` methods.

!!! important
    See [UserAccountResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/UserAccountResource.java) for service details.

Below are examples of calling the other user REST services using cURL and Java.

## Get Instance Users

Get a list of all users with the following cURL and Java commands.

### Users_GET_FromInstance.sh

Command:

```bash
./Users_GET_FromInstance.sh
```

Code:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/Users_GET_FromInstance.sh
   :language: bash
```

### Users_GET_FromInstance.java

Command:

```bash
java -classpath .:* Users_GET_FromInstance
```

Code:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/Users_GET_FromInstance.java
   :dedent: 1
   :language: java
   :lines: 11-22
```

All the users from your instance appear in the JSON response.

### Filtering, Paginating, Searching, and Sorting Orders

Users returned by this API can be filtered, paginated, searched, and sorted. See the [`getUserAccountsPage`](https://github.com/liferay-content-solutions/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/UserAccountResource.java#L272-L275) method for more information. Use the following `UserAccount` fields to filter, search, and sort the results:

* `keywords`
* `roleNames`
* `userGroupRoleNames`
* `birthDate`
* `dateCreated`
* `dateModified`
* `lastLoginDate`
* `organizationIds`
* `roleIds`
* `userGroupIds`
* {bdg-secondary}`Liferay DXP 2024.Q3+/Portal 7.4 GA125+` `status`
* `alternateName`
* `screenName`
* `emailAddress`
* `familyName`
* `givenName`
* `jobTitle`
* `name`
* {bdg-secondary}`Liferay DXP 2024.Q4+/Portal 7.4 GA129+` `customFields`

| Filter Query                                                 | Description                                                                                             |
| :----------------------------------------------------------- | :------------------------------------------------------------------------------------------------------ |
| `status eq 0`                                                | The user account status must be `Active`.                                                               |
| `status eq 5`                                                | The user account status must be `Inactive`.                                                             |
| `roleIds in ('20100', 20104')`                               | The user account must have the role of an Administrator (`20100`) or a Power User (`20104`).            |
| `jobTitle eq 'Parts Consultant'`                             | The user account job title must be Parts Consultant.                                                    |
| `customFields/githubProfileUrl eq 'www.github.com/able.foo'` | The user account has a custom field called `githubProfileUrl` with the value `www.github.com/able.foo`. |

| Sort Query                            | Description                                                                                   |
| :------------------------------------ | :-------------------------------------------------------------------------------------------- |
| `dateCreated:desc`                    | Sort by `dateCreated` in descending order.                                                    |
| `dateCreated:desc,lastLoginDate:desc` | Sort by `dateCreated` in descending order first, then by `lastLoginDate` in descending order. |

Read [API Query Parameters](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/api-query-parameters) for more information.

## Get a User

Get a specific user with the following cURL and Java commands. Note, replace `1234` with your user's ID.

### User_GET_ById.sh

Command:

```bash
./User_GET_ById.sh 1234
```

Code:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_GET_ById.sh
   :language: bash
```

### User_GET_ById.java

Command:

```bash
java -classpath .:* -DuserId=1234 User_GET_ById
```

Code:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

The user is returned in the JSON response.

## Patch a User

Do a partial edit of an existing user with the following cURL and Java commands. Note, replace `1234` with your user's ID.

### User_PATCH_ById.sh

Command:

```bash
./User_PATCH_ById.sh 1234
```

Code:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_PATCH_ById.sh
   :language: bash
```

### User_PATCH_ById.java

Command:

```bash 
java -classpath .:* -DuserId=1234 User_PATCH_ById
```

Code:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

In the example, Able and Baker's last names have changed from Foo to Bar.

## Put a User

Do a complete overwrite of an existing user with the following cURL and Java commands. Note, replace `1234` with your user's ID.

### User_PUT_ById.sh

Command:

```bash
./User_PUT_ById.sh 1234
```

Code:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_PUT_ById.sh
   :language: bash
```

### User_PUT_ById.java

Command:

```bash 
java -classpath .:* -DuserId=1234 User_PUT_ById
```

Code:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-28
```

This replaces the previous data with Able Goo and Baker Goo in the example.

![The previous user data has been replaced with the Patch service.](./user-account-api-basics/images/03.png)

!!! tip
    Use `User_PATCH_ById.[java|sh]` or `User_PUT_ById.[java|sh]` to activate or deactivate a user by changing the `status` field to `Active` or `Inactive`.
    To change the status of a user with a workflow active, you must use the `headless-admin-workflow` API instead. Find usage details in the [API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md).

## Delete a User

Delete an existing user with the following cURL and Java commands. Note, replace `1234` with your user's ID.

### User_DELETE_ById.sh

Command:

```bash
./User_DELETE_ById.sh 1234
```

Code:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/curl/User_DELETE_ById.sh
   :language: bash
```

### User_DELETE_ById.java

Command:

```bash 
java -classpath .:* -DuserId=1234 User_DELETE_ById
```

Code:

```{literalinclude} ./user-account-api-basics/resources/liferay-y6q4.zip/java/User_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

This deletes both users Able Goo and Baker Goo.

## Related Topics

Check out the [API Explorer](../../headless-delivery/consuming-apis/consuming-rest-services.md) to see the list of all User related REST services.

!!! note
    Get user postal addresses with [PostalAddresses_GET_FromUser](./postal-address-api-basics.md#get-postal-addresses-from-user)
