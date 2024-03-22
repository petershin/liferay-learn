---
toc: 
  - ./creating-a-basic-custom-element/custom-element-yaml-configuration-reference.md
uuid: fdced878-aea0-40b8-9959-828e9787d373
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Creating a Basic Custom Element

{bdg-secondary}`Liferay 7.4+`

Custom element client extensions use Liferay's frontend infrastructure to register external, remote applications with the Liferay platform and render them as widgets.

```{warning}
Deploying Custom elements or IFrames like other types of client extensions is a **beta feature** in Liferay 7.4. This tutorial deploys custom element remote applications differently, and it is still the recommended approach until a future update.
```

Here you'll create a basic remote application using Liferay's [`create_custom_element.sh`](https://raw.githubusercontent.com/liferay/liferay-portal/master/tools/create_custom_element.sh) script. After the application is generated, you'll compile its code and host its `.js` and `.css` files. Once hosted, you'll copy each file's URLs and use them to create a custom element. Finally, you can deploy the application to site pages as a widget.

![Use the create_custom_element.sh script to create a simple React application.](./creating-a-basic-custom-element/images/01.png)

```{note}
Custom element client extensions can use any technology, regardless of how it's built, packaged, or hosted. This tutorial only offers a sample custom element application using React.
```

Running `create_custom_element.sh` requires the latest versions of [Node.JS](https://nodejs.org/), [NPM](https://www.npmjs.com/), and [YARN](https://classic.yarnpkg.com/). Before proceeding, ensure these tools are installed.

## Run the `create_custom_element.sh` Script

When calling `create_custom_element.sh`, you must provide a valid HTML element name and specify the desired JavaScript framework (i.e., React or Vue).

Run this command to generate the React application's code:

```bash
curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_custom_element.sh | bash -s h5v7-custom-element react
```

This calls the script with two arguments: a custom HTML element name (`h5v7-custom-element`) and the desired JavaScript framework (`react`).

When finished running, the script automatically creates a new React application with these elements in a folder named `h5v7-custom-element`:

```bash
h5v7-custom-element
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
│       │   ├── components
│       │   └── pages
│       │       └── HelloBar.js
│       ├── hello-foo
│       │   ├── components
│       │   └── pages
│       │       └── HelloFoo.js
│       └── hello-world
│           ├── components
│           └── pages
│               └── HelloWorld.js
└── yarn.lock
```

### Understanding the `index.js` File

   ```{literalinclude} ./creating-a-basic-custom-element/resources/liferay-h5v7.zip/h5v7-custom-element/src/index.js
       :language: js
   ```

The generated `index.js` file includes two customizations necessary for using the application as a Liferay custom element remote application.

* `WebComponent`: On line 21, the application is declared a `WebComponent` so it can connect to Liferay's framework.
* `ELEMENT_ID`: On line 30, `ELEMENT_ID` is set to `h5v7-custom-element`, instead of the conventional `<div id="root" />`. This is because a remote application's HTML Element Name must match the application's `ELEMENT_ID`, and `<div id="root" />` does not work for this purpose.

### Understanding the React Routes

The generated code includes three routes: `hello-world` (default), `hello-foo`, and `hello-bar`. Routes are alternative sets of code that you can use when running an application. See [Using Routes with Custom Elements](./using-routes-with-custom-elements.md) for a basic example.

## Building the React Application

After running `create_custom_element.sh`, navigate to the new `h5v7-custom-element` folder and build the application:

```bash
cd h5v7-custom-element
```

```bash
yarn build
```

This command creates an optimized production build, which includes the `.js` and `.css` files necessary for running the application.

Before proceeding, confirm the code has compiled successfully and note the application's `.js` and `.css` files.

```
Creating an optimized production build...
Compiled successfully.

File sizes after gzip:

  43.51 kB  build/static/js/main.114dde4a.js
  121 B     build/static/css/main.9877909d.css
```

These files must be [hosted](#hosting-the-application-files) in a location accessible to Liferay. They can be hosted on a remote server or a data storage system optimized for serving static resources. For demonstration purposes, this example uploads them to Liferay's Document Library and hosts them using WebDAV URLs.

```{tip}
Unique file names are generated for every build. When testing your custom applications, remember to update your `.js` and `.css` files after builds.
```

## Hosting the Application Files

For demonstration purposes this tutorial hosts the application’s static resources in Liferay’s Document Library. In a production environment, you should host the application’s files on a server optimized for hosting static resources.

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and go to *Documents and Media*.

1. Click *Add* (![Add Button](../../images/icon-add.png)) and select *Multiple Files Upload*.

1. Drag and drop the `.js` and `.css` files into the upload area.

   Alternatively, use *Select Files* to upload them.

   ![Upload the .js and .css files to the Liferay Document Library.](./creating-a-basic-custom-element/images/02.png)

1. Click *Publish*.

This adds the files to the Document Library and assigns them unique URLs, which you'll use to create the remote application.

To view each file's URL, click the *Info* icon (![Info Icon](../../images/icon-information.png)) and select a file. Copy each file's *WebDAV URL* and save them for use in the next step.

![Copy each file's WebDAV URL.](./creating-a-basic-custom-element/images/03.png)

For example,

* `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
* `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## Registering the Application with Liferay

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), click the *Applications* tab, and go to *Remote Apps*.

1. Click *Add* (![Add Button](../../images/icon-add.png)).

1. Enter these values:

   | Field | Value |
   | :--- | :--- |
   | Name | H5V7-Custom-Element |
   | Type | Custom Element |
   | HTML Element Name | `h5v7-custom-element` |
   | URL | WebDAV URL for the `.js` file |
   | CSS URL | WebDAV URL for the `.css` file |
   | Portlet Category Name | Remote Apps |

1. Click *Save*.

Once saved, Liferay creates a widget named H5V7-Custom-Element, which you can deploy to site pages like other page widgets. This widget appears under the selected Portlet Category Name.

![Deploy the H5V7-Custom-Element widget to site pages.](./creating-a-basic-custom-element/images/04.png)

## Related Topics

* [Custom Element YAML Configuration Reference](./creating-a-basic-custom-element/custom-element-yaml-configuration-reference.md)
* [Customizing Liferay's Look and Feel](../customizing-liferays-look-and-feel.md)
* [Integrating External Applications](../integrating-external-applications.md)
* [Using Routes with Custom Elements](./using-routes-with-custom-elements.md)
* [Client Extensions UI Reference](../customizing-liferays-look-and-feel/client-extensions-ui-reference.md)
