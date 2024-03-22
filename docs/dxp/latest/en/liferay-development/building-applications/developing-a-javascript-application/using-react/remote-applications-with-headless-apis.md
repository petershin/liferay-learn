---
uuid: 522fc1b1-ab1d-4126-b828-98e1e1e805bd
taxonomy-category-names:
- Development and Tooling
- Javascript Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Remote Applications with Headless APIs

{bdg-secondary}`Available 7.4+`

After [creating and publishing objects](../../../objects/creating-and-managing-objects/creating-objects.md), headless REST APIs are automatically generated. Here you'll see how to integrate these endpoints to create a simple CRUD (create, read, update, and delete) remote application.

## Set Up Liferay DXP

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps to add the `/o/c/*` URL pattern to the *Default Portal CORS Configuration*:

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *System Settings* &rarr; *Security Tools*.

1. Go to the *Portal Cross-Origin Resource Sharing (CORS)* tab and click *Default Portal CORS Configuration*.

1. Add a *URL Pattern* with the `/o/c/*` value and click *Save*. This enables CORS for all Object APIs.

   ![Add the /o/c/* URL Pattern for Object APIs.](./remote-applications-with-headless-apis/images/01.png)

## Creating an Object for the CRUD Application

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *Objects*.

1. Click the *Add* button (![Add Button](../../../../images/icon-add.png)) and enter these values:

   | Field | Value |
   | :--- | :--- |
   | Label | J4X7-Object |
   | Plural Label | J4X7-Objects |
   | Name | J4X7Object |

   ```{note}
   The provided React application uses these values.
   ```

1. Select the new *Object* draft, click the *Field* tab, and add these *fields*:

   | Label | Field Name | Type |
   | :--- | :--- | :--- |
   | name | name | Text |
   | description | description | Text |

1. Click the *Details* tab and click *Publish*.

## Set Up the CRUD Application

1. Download and unzip the [CRUD application](./liferay-j4x7.zip).

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-javascript-application/using-react/liferay-j4x7.zip -O
   ```

   ```bash
   unzip liferay-j4x7.zip
   ```

   ```bash
   cd liferay-j4x7
   ```

1. Verify you have `node` and `yarn` installed. If you don't, run the following command and follow the prompts:

   ```bash
   ./setup_tutorial.sh
   ```

1. Navigate to the CRUD application's folder and start the React server.

   ```bash
   cd j4x7-custom-element
   ```

   ```bash
   yarn start
   ```

   Once started, go to `localhost:3000` to view the CRUD application. 

1. Enter a name and description and click *Add* to add a J4X7 Object. A new item has been added.

   ![Input a name and description and click Add.](./remote-applications-with-headless-apis/images/02.png)

1. Note the J4X7 Object's ID number that you just created. Enter the ID number and a new name and description. Click *Patch*. The item has been updated with the new name and description.

1. Enter the ID number and click *Delete*. The item has now been deleted.

## Examine the Code

The sample CRUD application is separated into two parts: a file that contains the API requests and files that contain the forms to handle the CRUD operations.

### Handle Requests

The `Requests.js` file uses JavaScript's built-in `fetch()` method. 

`getObjects()` makes a GET request for all the objects.

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 25-33
```

`addObject()` makes a POST request with a name and description for a new object.

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 1-13
```

`patchObject()` makes a PATCH request with a specific object ID and a new name and description.

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 35-47
```

`deleteObject()` makes a DELETE request with a specific object ID.

```{literalinclude} ./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/utils/Requests.js
:language: javascript
:lines: 15-23
```

```{note}
Basic authentication is used here for demonstration purposes. For production, you should authorize users via [OAuth 2.0](../../../../headless-delivery/using-oauth2.md). See [Using OAuth2 to Authorize Users](../../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md) for a sample React application that uses OAuth2.
```

### Implement Forms

[`GetForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/components/GetForm.js) calls the `getObjects` method and parses the response as JSON. Each J4X7 entry is listed by the form.

[`AddForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/components/AddForm.js) receives input and calls the `addObject` method upon the user clicking *Add*.

[`PatchForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/components/PatchForm.js) receives input and calls the `patchObject` method upon the user clicking *Patch*.

[`DeleteForm.js`](./remote-applications-with-headless-apis/resources/liferay-j4x7-overlay/src/components/DeleteForm.js) receives input and calls the `deleteObject` method upon the user clicking *Delete*.

The forms are gathered together and displayed on one page with the [`App.js`](./remote-apps-with-headless-apis/resources/liferay-j4x7-overlay/src/App.js) file.

## Related Topics

[Creating a Basic Custom Element](../../../integrating-external-applications/creating-a-basic-custom-element.md)
[Headless Framework Integration](../../../objects/understanding-object-integrations/using-custom-object-apis.md)
