# Using OAuth2 to Authorize Users

You can create applications that access Liferay's headless REST APIs using the OAuth 2.0 authorization protocol. The provided sample React app demonstrates three different OAuth2 token-based authentication flows: authorization code flow, client credentials flow, and password flow. For more details on the OAuth2 Administration panel see [Creating an OAuth2 Application](./creating-oauth2-applications.md)

## Set Up Liferay DXP

```{include} /_snippets/run-liferay-dxp.md
```

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Security* &rarr; *OAuth 2 Administration*.

1. Click *Add* (![Add Icon](../../images/icon-add.png)) to create a new OAuth2 application. 

1. Give the application a name (e.g., foo). Set the Website URL as `http://localhost:3000` and the Callback URI as `http://localhost:3000/grant-type-authorization-code`. Click *Save*.

   ![Fill out the form to the create a new OAuth2 application.](./using-oauth2-to-authorize-users/images/01.png)

1. Copy the Client ID and Client Secret to your clipboard. To get the Client Secret click *Edit*. Copy the value from the pop-up window.

   These values are needed later in the sample React app. 

1. Click the _Scopes_ tab at the top of the page. Scroll down, click _LIFERAY.HEADLESS.ADMIN.USER_, then check the box for _read data on your behalf_. 

   ![Enable read privileges for LIFERAY.HEADLESS.ADMIN.USER.](./using-oauth2-to-authorize-users/images/02.png)

   Click *Save*. Your OAuth2 Application now has read privileges for the Admin User API category.

1. Next, open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *System Settings* &rarr; *Security Tools*.

1. Go to the *Portal Cross-Origin Resource Sharing (CORS)* tab and click *Default Portal CORS Configuration*.

1. Add a *URL Pattern* with the value `/o/headless-admin-user/*` and click *Save*. This enables CORS for the `headless-admin-user` category of APIs.

## Deploy the Sample React App

1. Download and unzip the [OAuth2 React App](./liferay-c2b6.zip).

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/liferay-c2b6.zip -O
   ```

   ```bash
   unzip liferay-c2b6.zip
   ```

   ```bash
   cd liferay-c2b6.zip
   ```

1. Verify that `node` and `yarn` are installed. If not, run the setup script and follow the prompts:

   ```bash
   ./setup_tutorial.sh
   ```

1. Add your Liferay OAuth Client ID and Client Secret to the app's config files. Navigate to the `utils` folder of `grant-type-authorization-code`.

   ```bash
   cd liferay-c2b6.zip/c2b6-remote-app/src/grant-type-authorization-code/utils
   ```

   Open the `config.js` file and add your Client ID and Client Secret values. Do the same for the `config.js` files in `grant-type-client-credentials` folder and `grant-type-password` folder.

1. Navigate back to the app's root directory and start the React server.

   ```bash
   cd liferay-c2b6.zip/c2b6-remote-app
   ```

   ```bash
   yarn start
   ```

### Authorization Code Flow

The authorization code flow requires users to log in with their credentials and approve authorization before permission is granted to the app. This additional step is avoided with the other flows.

1. Open the React app running at <http://localhost:3000>, then click *Authorization Code Flow* at the top of the page. Click *Authorize*.

   ![In the authorization code flow, click the Authorize button.](./using-oauth2-to-authorize-users/images/03.png)

1. If you're not already logged in, you are redirected to the Liferay login page before being sent to the authorization page. Enter your username and password (e.g. *test@liferay.com:learn*) and click *Sign In*. On the authorization page, click *Authorize*. If you are already logged in, you are sent to the authorization page directly.

1. You are redirected back to the React app. Click *Get Authorization Code*, then click *Get Token*. The application makes a request to Liferay for an access token.

1. Click *Get Users*. The React app makes a REST API call to Liferay using token-based authentication and returns a list of Liferay users.

### Client Credentials Flow

The client credentials flow is used typically for server to server interaction and does not involve any users.

1. Open the React app running at <http://localhost:3000>, then click *Client Credentials Flow* at the top of the page. 

1. Click *Get Token*. The application makes a request to Liferay for an access token.

1. Click *Get Users*. The React app makes a REST API call to Liferay using token-based authentication and returns a list of Liferay users.

### Password Flow

In the password flow authorization, the React app passes the username and password directly in the request.

```{warning}
In a password flow, the username and password are directly exposed to the application. Thus the user must trust the application. Passing the username and password in the API request also carries risk. Using password flow is not recommended.
```

1. Open the React app running at <http://localhost:3000>, then click *Password Flow* at the top of the page. 

1. Click *Get Token*. The application makes a request to Liferay for an access token.

1. Click *Get Users*. The React app makes a REST API call to Liferay using token-based authentication and returns a list of Liferay users.

## Examine the Code

The React app has three routes, each leading to a different authentication flow. The files for configuring each route/flow are located in separate folders. Each route's `components` folder defines the UI elements for handling the events fired by clicking buttons. For example, the `Authorize.js` file redirects to the authorization page, `Token.js` fetches the access token, and `Users.js` fetches the list of users. Each route's `utils` folder holds the `config.js` and `requests.js` files. 

```
src
├── grant-type-authorization-code
│   ├── components
│   |   ├── Authorize.js
│   |   ├── Token.js
│   |   └── Users.js
│   ├── utils
│   |   ├── config.js
│   |   └── Requests.js
│   └── AuthorizationCode.js
├── grant-type-client-credentials
│   ├── components
│   |   ├── Token.js
│   |   └── Users.js
│   ├── utils
│   |   ├── config.js
│   |   └── Requests.js
│   └── ClientCredentials.js
├── grant-type-password
│   ├── components
│   |   ├── Token.js
│   |   └── Users.js
│   ├── utils
│   |   ├── config.js
│   |   └── Requests.js
│   └── Password.js
├── App.js
└── index.js
```

### Authorization Grant Type

In `grant-type-authorization-code`, the first step is handled by the `Authorize.js` file. A request for authorization is made when the *Authorize* button is clicked.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/components/Authorize.js
:language: javascript
:lines: 6-18
```

In addition to the standard `clientId` and `clientSecret`, a `redirectUri` is also required in the `config.js` file. After authorizing the application, the Liferay server redirects the user back to the Authorization Code Flow page of the app. Along with the redirect, a one-time authorization code is passed back to the app in the URL (e.g. `http://localhost:3000/grant-type-authorization-code?code={code}`). 

Clicking *Get Authorization Code* calls the `getCode` function to parse the authorization code. Then it can be passed in the access token request.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/components/Authorize.js
:language: javascript
:lines: 20-26
```

Clicking *Get Token* calls the `getAuthToken` function in the `Requests.js` file.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/utils/Requests.js
:language: javascript
:lines: 3-29
```

The parameters `client_id`, `client_secret`, `code`, `grant_type`, and `redirect_uri` are sent in this API request. If the parameters are valid, Liferay returns a JSON response with the access token.

Example response:

```json
{
    "access_token": "2fda85abec524112dae612d35e9f9abd71650d364dee47c645b7574c6bffe91",
    "token_type": "Bearer",
    "expires_in": 600,
    "scope": "Liferay.Headless.Admin.User.everything.read"
}
```

The `Users.js` file parses the response for the `access_token`. 

Finally, clicking *Get Users* calls the `getUsers` function in the `Requests.js` file.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/utils/Requests.js
:language: javascript
:lines: 31-42
```

The access token is passed in the header of the API request as an `'Authorization': 'Bearer'` type authorization.

### Client Credentials Grant Type

In `grant-type-client-credentials`, the `Request.js` file's `getAuthToken` function is called when the *Get Token* button is clicked.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-client-credentials/utils/Requests.js
:language: javascript
:lines: 3-27
```

The parameters `client_id`, `client_secret`, and `grant_type` are sent in this API request. If the parameters are valid, Liferay returns a JSON response with the access token.

The `Users.js` file parses the response for the `access_token`.

Finally, clicking *Get Users* calls the `getUsers` function in the `Requests.js` file.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-client-credentials/utils/Requests.js
:language: javascript
:lines: 29-40
```

The access token is passed along in the header of the API request as an `'Authorization': 'Bearer'` type authorization.

### Password Grant Type

In `grant-type-password`, the `Request.js` file's `getAuthToken` function is called when the *Get Token* button is clicked.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-password/utils/Requests.js
:language: javascript
:lines: 3-29
```

The parameters `client_id`, `client_secret`, `grant_type`, `password`, and `username` are sent as parameters in this API request. If the parameters are valid, the Liferay server returns a JSON response with the access token.

The `Users.js` file parses the response for the `access_token`.

Finally, clicking *Get Users* calls the `getUsers` function in the `Requests.js` file.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-password/utils/Requests.js
:language: javascript
:lines: 31-42
```

The access token is passed along in the header of the API request as an `'Authorization': 'Bearer'` type authorization.

## Additional Information

* [Using OAuth 2.0](../using-oauth2.md)
* [Creating an OAuth2 Application](./creating-oauth2-applications.md)
* [Authorizing Account Access with OAuth2](./authorizing-account-access-with-oauth2.md)
* [OAuth 2 Scopes](./oauth2-scopes.md)
