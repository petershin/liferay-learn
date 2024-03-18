---
uuid: 16455895-2b77-463c-bc0c-ed767b740b02
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Using Routes with Custom Elements

{bdg-secondary}`Liferay 7.4+`

Custom element client extensions use Liferay's frontend infrastructure to register external applications with the Liferay platform and render them as widgets. For applications that include multiple routes (e.g., [React Router](https://reactrouter.com/)), you can define remote application properties to determine which routes are used for a widget at runtime. These properties can be set for an application via the Remote Apps menu in Liferay or the widget's configuration options once deployed.

!!! warning
   Deploying Custom elements or IFrames like other types of client extensions is a **beta feature** in Liferay 7.4. This tutorial deploys custom element remote applications differently, and it is still the recommended approach until a future update.

In this tutorial, you'll create a basic React application using Liferay's `create_custom_element.sh` script, which generates a sample app with three routes: `hello-world`, `hello-foo`, `hello-bar`. After compiling the application and hosting its `.js` and `.css` files, you'll register the application with Liferay and deploy it as a page widget. Finally, you'll configure it to use each of the alternative routes.

![Create a basic custom element remote appliaction with alternate routes and use the route property to configure which is rendered.](./using-routes-with-custom-elements/images/01.png)

!!! note
   Custom element client extensions can use any technology, regardless of how it's built, packaged, or hosted. This tutorial only offers a sample custom element application with basic routing.

Running `create_custom_element.sh` requires the latest versions of [Node.JS](https://nodejs.org/), [NPM](https://www.npmjs.com/), and [YARN](https://classic.yarnpkg.com/). Before proceeding, ensure these tools are installed.

## Creating, Building, and Hosting the React Application

1. Start a new Liferay DXP 7.4+ container. You can continue to the next steps while the container starts.

   ```docker
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
   ```

1. Run this command in a separate terminal to generate the React application.

   ```bash
   curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_custom_element.sh | bash -s j1v3-custom-element react
   ```

1. Verify the application was created successfully.

   The script creates a new React application called `j1v3-custom-element` with these elements:

   ```bash
   j1v3-custom-element
   ├── node_modules
   ├── README.md
   ├── package.json
   ├── public
   │   └── index.html
   ├── src
   │   ├── common
   │   │   ├── services
   │   │   │   └── liferay
   │   │   │       ├── api.js
   │   │   │       └── liferay.js
   │   │   └── styles
   │   │       ├── hello-world.scss
   │   │       ├── index.scss
   │   │       └── variables.scss
   │   ├── index.js
   │   └── routes
   │       ├── hello-bar
   │       │   └── pages
   │       │       └── HelloBar.js
   │       ├── hello-foo
   │       │   └── pages
   │       │       └── HelloFoo.js
   │       └── hello-world
   │           └── pages
   │               └── HelloWorld.js
   └── yarn.lock
   ```

1. Navigate to the new `j1v3-custom-element` folder and build the application.

   ```bash
   cd j1v3-custom-element
   ```

   ```bash
   yarn build
   ```

1. Verify the build succeeded and note the application's `.js` and `.css` files.

   ```bash
   Creating an optimized production build...
   Compiled successfully.

   File sizes after gzip:

   43.51 kB  build/static/js/main.114dde4a.js
   121 B     build/static/css/main.9877909d.css
   ```

1. Sign in to Liferay at `<http://localhost:8080>` using the email address *test@liferay.com* and the password *test*. When prompted, change the password to *learn*.

1. Open the *Site Menu* (![Site Menu](../../../../images/icon-product-menu.png)), expand *Content & Data*, and go to *Documents and Media*.

1. Click *Add* (![Add Button](../../../../images/icon-add.png)) and select *Multiple Files Upload*.

1. Drag and drop the `.js` and `.css` files into the upload area.

   ![Upload the .js and .css files to the Liferay Document Library.](./using-routes-with-custom-elements/images/02.png)

1. Click *Publish*.

This adds the files to the Liferay Document Library and assigns them unique WebDAV URLs, which you'll use to create the remote application.

!!! tip
   This tutorial hosts the application’s static resources in Liferay’s Document Library for demonstration purposes. In a production environment, you should host the application’s files on a server optimized for hosting static resources.

To view each file's URL, click the *Info* icon (![Info Icon](../../../../images/icon-information.png)) and select one of the files at a time. Copy each file's *WebDAV URL* and save them for use in the next step.

![Copy each file's WebDAV URL.](./using-routes-with-custom-elements/images/03.png)

For example,

- `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
- `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## Registering and Deploying the Application

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), click on the *Applications* tab, and go to *Remote Apps*.

1. Click *Add* (![Add Button](../../../../images/icon-add.png)).

1. Enter these values:

   | Field                 | Value                          |
   | :-------------------- | :----------------------------- |
   | Name                  | J1V3-Custom-Element            |
   | Type                  | Custom Element                 |
   | HTML Element Name     | `j1v3-custom-element`          |
   | URL                   | WebDAV URL for the `.js` file  |
   | CSS URL               | WebDAV URL for the `.css` file |
   | Instanceable          | &#10004;                       |
   | Portlet Category Name | Remote Apps                    |

1. Click *Save*.

Once saved, Liferay creates a widget named J1V3-Custom-Element, which you can deploy to Site Pages like any other Page widget. It appears under the selected Portlet Category Name.

Since J1V3-Custom-Element is instanceable, you can add many of them to a page, each with its own independent configuration. For this example, add the widget to a page twice.

![Deploy two instances of the J1V3-Custom-Element widget.](./using-routes-with-custom-elements/images/04.png)

## Using the `route` Property

The auto-generated app includes three routes: `hello-world`, `hello-foo`, `hello-bar`. By default the application uses the `hello-world` route. However, you can use remote application properties to configure it to use an alternate route. You can set these properties via [the Remote Apps menu](#defining-a-route-property-via-the-remote-apps-menu) or a [widget's configuration options](#defining-a-route-property-via-widget-configuration).

### Defining a Route Property via the Remote Apps Menu

1. Open the *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png)), click on the *Applications* tab, and go to *Remote Apps*.

1. Select *J1V3-Custom-Element*.

   ![Select J1V3-Custom-Element.](./using-routes-with-custom-elements/images/05.png)

1. Enter `route=hello-foo` into the Properties field.

   ![Enter route=hello-foo into the Properties field.](./using-routes-with-custom-elements/images/06.png)

1. Click *Publish*.

1. Verify both deployed widgets use the `HelloFoo` route.

   ![Verify both widgets use the HelloFoo route.](./using-routes-with-custom-elements/images/07.png)

### Defining a Route Property via Widget Configuration

1. Edit the Page containing the J1V3-Custom-Element widgets.

1. Click the *Options* button (![Options Button](../../../../images/icon-actions.png)) for one of the widgets and select *Configuration*.

   ![Click the Options button and select Configuration.](./using-routes-with-custom-elements/images/08.png)

1. Enter `route=hello-bar` into the Properties field.

   ![Enter route=hello-bar into the Properties field.](./using-routes-with-custom-elements/images/09.png)

1. Click *Save*.

1. Verify the configured widget uses the `hello-bar` route, while the other widget still uses the `hello-foo` route.

   ![Verify the configured widget uses the HelloBar route.](./using-routes-with-custom-elements/images/10.png)

## Analyzing the Route Code

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/index.js
    :language: js
    :lines: 1-63
```

This `index.js` file creates the `WebComponent` class, which extends the `HTMLElement` interface. This class implements the interface's [`connectedCallback()`](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements#using_the_lifecycle_callbacks) function, which calls [`ReactDOM.render`](https://reactjs.org/docs/react-dom.html#render) with `App` as a parameter. When `App` is called, it checks for any defined `"route"` attribute and compares that value with the available routes. If it matches either `hello-foo` or `hello-bar`, it returns and renders the corresponding route. Otherwise, it returns and renders `hello-world`.

Each of the routes is imported into the `index.js` file from the `routes` folder:

```bash
routes
├── hello-bar
│   └── pages
│       └── HelloBar.js
├── hello-foo
│   └── pages
│       └── HelloFoo.js
└── hello-world
    └── pages
        └── HelloWorld.js
```

### HelloWorld.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-world/pages/HelloWorld.js
   :language: js
   :lines: 8-14
```

### HelloFoo.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-foo/pages/HelloFoo.js
   :language: js
   :lines: 8-12
```

### HelloBar.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-bar/pages/HelloBar.js
   :language: js
   :lines: 8-12
```

## Related Topics

- [Frontend Client Extensions](../../frontend-client-extensions.md)
- [Understanding Custom Element and IFrame Client Extensions](../understanding-custom-element-and-iframe-client-extensions.md)
- [Creating a Basic Custom Element](./creating-a-basic-custom-element.md)
- [Remote Applications UI Reference](../client-extensions-ui-reference.md)