# Securing Your App with OAuth2

Together with Liferay's [OAuth 2 Applications] you can create third-party applications that access Liferay's headless REST APIs through the OAuth 2.0 authorization protocol. Here you'll see how to create a simple React application that utilizes OAuth2. The sample app demonstrates three different token-based authentication flows: Authorization Code flow, Client Credentials flow, and Password flow. 

## Set Up Liferay DXP

```{include} /_snippets/run-liferay-dxp.md
```

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Security* &rarr; *OAuth 2 Administration*

1. Click the *Add Icon* (![Add Icon](../../images/icon-add.png)) to create a new OAuth2 application. 

1. Give the application a name (e.g. foo). Set the Website URL as `http://localhost:3000`. Set the Callback URI as `http://localhost:3000/grant-type-authorization-code`. Click *Save*.

   ![Fill out the form to the create a new OAuth2 application.](./securing-your-app-with-oauth2/images/01.png)

1. Copy the Client ID and Client Secret to your clipboard. You'll use these values later in the sample React app. To access the Client Secret, click the *Edit* button and a window will open for you to copy the value.

1. Click on the Scopes tab at the top of the page. Scroll down and click `LIFERAY.HEADLESS.ADMIN.USER`. Check the box for `read data on your behalf`. 

   ![Enable read privileges for LIFERAY.HEADLESS.ADMIN.USER.](./securing-your-app-with-oauth2/images/02.png)

   Click *Save*. Your OAuth2 Application now has read privileges for the Admin User API category.

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

1. Verify that you have `node` and `yarn` installed. If you don't, run the following command and follow the prompts:

   ```bash
   ./setup_tutorial.sh
   ```

1. Add your Liferay OAuth Client ID and Client Secret to the app's config files. Navigate to the `utils` folder of `grant-type-authorization-code`. 

   ```bash
   cd liferay-c2b6.zip/c2b6-remote-app/src/grant-type-authorization-code/utils
   ```

   Open the `config.js` file. Paste your Client ID and Client Secret values. Do the same for the `config.js` files in `grant-type-client-credentials` folder and `grant-type-password` folder.

1. Navigate back to the app's root directory and start the React server.

   ```bash
   cd liferay-c2b6.zip/c2b6-remote-app
   ```

   ```bash
   yarn start
   ```

### Authorization Code Flow

The Authorization Code flow is different from the other flows in that the application requires browser interaction. The user must login with their credentials and approve authorization before permission is granted to the app.

1. In the React app, click *Authorization Code Flow* at the top of the page. Click *Authorize*.

   ![In the Authorization Code flow, click the Authorize button.](./securing-your-app-with-oauth2/images/03.png)

1. You are redirected to the login page of your Liferay instance. Input your username and password (e.g. *test@liferay.com:learn*) and click *Sign In*. On the authorization page, click *Authorize*. Note, if you are already logged in, you will be redirected to the authorization page directly.

1. After you are redirected back to the React app, click *Get Authorization Code*. Next, click *Get Token*. The application makes a request to Liferay for an access token.

1. Finally, click *Get Users*. The React app makes a REST API call to Liferay using token-based authentication and returns list of Liferay users.

### Client Credentials Flow

The Client Credentials flow is typically used for server to server interaction and does not involve any users. 

1. In the React app, click *Client Credentials Flow* at the top of the page. 

1. Click *Get Token*. The application makes a request to Liferay for an access token.

1. Click *Get Users*. The React app makes a REST API call to Liferay using token-based authentication and returns list of Liferay users.

### Password Flow

In the Password flow, authentication happens with the React app passing the username and password directly in the request. 

```{warning}
In this flow, the username and password is directly exposed to the application and therefore requires a high level of trust of the application by the user. Passing the username and password in the API request also carries risk. Using this flow is typically not recommended.
```

1. In the React app, click *Password Flow* at the top of the page. 

1. Click *Get Token*. The application makes a request to Liferay for an access token.

1. Click *Get Users*. The React app makes a REST API call to Liferay using token-based authentication and returns list of Liferay users.

## Examine the Code

The React app is made up of three routes that lead to each of the authentication flows. The files are located in three folders corresponding to their flow. In each route, the `components` folder consists of the UI elements for handling the different events that occur upon clicking buttons. For example, the `Authorize.js` file handles the redirect to the authorization page, the `Token.js` file handles fetching the access token, and the `Users.js` file handles fetching the list of users. Also in each route, the `utils` folder consists of the `config.js` file and the `Requests.js` file. 

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

### grant-type-authorization-code

In the Authorization Code flow, the first step is handled by the `Authorize.js` file. A request for authorization is made when the *Authorize* button is clicked.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/components/Authorize.js
:language: javascript
:lines: 6-18
```

Note, in the `config.js` file, in addition to `clientId` and `clientSecret`, `redirectUri` is also required. After authorizing the application, the Liferay server redirects the user back to the Authorization Code flow page of the app. Along with the redirect, a one-time code is passed back in the URL (e.g. `http://localhost:3000/grant-type-authorization-code?code={code}`). 

Then, clicking *Get Authorization Code* calls the `getCode` function and parses this code in the URL to be passed along for the access token request.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/components/Authorize.js
:language: javascript
:lines: 20-26
```

Next, clicking *Get Token* calls the `getAuthToken` function in the `Requests.js` file.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-authorization-code/utils/Requests.js
:language: javascript
:lines: 3-29
```

Note, `client_id`, `client_secret`, `code`, `grant_type`, and `redirect_uri` are sent as parameters in this API request. If the parameters are valid, the Liferay server returns a JSON response with the access token.

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

Note that the access token is passed along in the header of the API request as a `'Authorization': 'Bearer'` type authorization.

### grant-type-client-credentials

In the Client Credentials flow, the `getAuthToken` function in the `Request.js` file is called when the *Get Token* button is clicked.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-client-credentials/utils/Requests.js
:language: javascript
:lines: 3-27
```

Note, `client_id`, `client_secret`, and `grant_type` are sent as parameters in this API request. If the parameters are valid, the Liferay server returns a JSON response with the access token.

The `Users.js` parses the response for the `access_token`. 

Finally, clicking *Get Users* calls the `getUsers` function in the `Requests.js` file.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-client-credentials/utils/Requests.js
:language: javascript
:lines: 29-40
```

Note that the access token is passed along in the header of the API request as a `'Authorization': 'Bearer'` type authorization.

### grant-type-password

In the Password flow, the `getAuthToken` function in the `Request.js` file is called when the *Get Token* button is clicked.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-password/utils/Requests.js
:language: javascript
:lines: 3-29
```

Note, `client_id`, `client_secret`, `grant_type`, `password`, and `username` are sent as parameters in this API request. If the parameters are valid, the Liferay server returns a JSON response with the access token.

The `Users.js` file parses the response for the `access_token`. 

Finally, clicking *Get Users* calls the `getUsers` function in the `Requests.js` file.

```{literalinclude} ./securing-your-app-with-oauth2/resources/liferay-c2b6-overlay/src/grant-type-password/utils/Requests.js
:language: javascript
:lines: 31-42
```

Note that the access token is passed along in the header of the API request as a `'Authorization': 'Bearer'` type authorization.

## Additional Information

* [Using OAuth 2.0](../using-oauth2.md)
* [Creating an OAuth2 Application](./creating-oauth2-applications.md)
* [Authorizing Account Access with OAuth2](./authorizing-account-access-with-oauth2.md)
* [OAuth 2 Scopes](./oauth2-scopes.md)