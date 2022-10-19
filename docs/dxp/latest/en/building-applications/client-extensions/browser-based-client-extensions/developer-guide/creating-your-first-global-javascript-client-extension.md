# Creating Your First Global JavaScript Client Extension

A basic global JavaScript client extension is a great place to start with developing your own client extensions. You can use a global JS client extension to run your own JavaScript on any page in Liferay without worrying about any Liferay code. You'll use the [Blade CLI](../../../tooling/blade-cli.md) to generate, build, and deploy your client extension along the way.

## Prerequisites

You must have these requirements ready in your development environment to begin working with client extensions:

1. Install Java (JDK 8 or JDK 11).

    ```{note}
    Please see the [compatibility matrix](link->HC compatibility matrix) for information on supported JDKs, databases, and environments. See [JVM Configuration](link->JVM Configuration) for recommended JVM settings.
    ```

1. Install the [Blade CLI](../../../tooling/blade-cli/installing-and-updating-blade-cli.md).

1. Prepare a Liferay Workspace for your development environment. You can [use the Blade CLI](../../../tooling/liferay-workspace/creating-a-liferay-workspace.md#creating-a-liferay-workspace-with-blade-cli) to quickly set this up for your desired version of Liferay.

1. You must also have a running instance of Liferay to test your client extension with. You can quickly start up a Liferay instance for testing by [Starting with a Docker Image](../../../../getting-started/starting-with-a-docker-image.md).

Now you have all the necessary tools to deploy your first global JS client extension.

## Create the Client Extension with Blade CLI

The Blade CLI allows you to easily generate the skeleton for many types of client extensions, including global JS extensions. Follow these steps to get started:

1. Open a command line in your Liferay workspace and navigate to the `client-extensions/` folder:

    ```bash
    cd client-extensions
    ```

1. Run this command to invoke the Blade CLI, filling in the desired name for the new folder to generate:

    ```bash
    blade create -t client-extension <new-folder-name>
    ```

    The tool starts up and provides you with a list of client extension types to choose from.

1. Use the arrow keys to highlight `globalJS` from the list of client extension types and press Enter.

    ![Select globalJS from the provided list of client extension types.](screenshot link)

1. Enter the desired name for your client extension at the prompt.

The Blade CLI tool creates a subfolder with your chosen name within `client-extensions/`. These files are inside of it:

* **client-extension.yaml**: A YAML file containing the basic definition of your client extension, including the `type` (`globalJS`), your chosen name, and a generated URL. Edit this file if you want to change any of this information for your client extension. *Note that you can potentially add more client extension definitions to this YAML file if you want to build and deploy them together.*

* **src/global.js**: A global JS file that automatically runs when a page is configured to use this client extension. This is the only source file in a global JS client extension by default.

Now you have a basic client extension to work with. Next, let's look at what this client extension does and how to adjust its behavior.

## Modify and Deploy the Client Extension

By default, the `src/global.js` file contains this line of code:

```js
window.alert('Global JavaScript deployed.');
```

This causes a popup window to appear when you open the page with the given message.

Open up the `global.js` file and modify the message to one of your own, like this:

```js
window.alert('Hello World! Global JavaScript successfully deployed.');
```

Once you are satisfied with your changes to the JS code, deploy your client extension to your Liferay testing instance. If you are running Liferay from a Docker container, run this command from your client extension's root folder:

```bash
blade gw deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

<!-- TODO: add alternative other instructions for deploying to LXC, etc. -->

Confirm the deployment in your Liferay instance's console:

```
STARTED my-global-js-client-extension_1.0.0
```

Now that your client extension is successfully deployed, you only need to configure your Liferay instance to use it to see it in action.

## Use the Client Extension on a Page

You must configure a page in your Liferay instance to specifically use your deployed client extension. Follow these steps to see your global JS in use:

1. Log in to your running Liferay instance.

1. On any page, click the Edit icon ![Edit icon](../../../../images/icon-edit-pencil.png) at the top.

1. In the sidebar, navigate to the Page Design Options menu (![Page Design Options icon](../../../../images/icon-format.png)), and click the configuration icon ![Configuration icon](../../../../images/icon-cog3.png) at the top of the menu.

    ![Click the cog wheel icon in the Page Design Options menu to access configurations for this type of client extension.](link to screenshot)

1. Click on the *Advanced* tab, and expand the *JavaScript* section toward the bottom of the page to find the *JavaScript Client Extensions* configuration section.

1. Click the *Add JavaScript Client Extensions* button to add the new client extension (to the page head or page bottom).

    ![Add the JavaScript client extension in this menu. It will appear in a list depending on whether you added it to the page head or page bottom.](link to screenshot)

1. Click Save.

<!-- POSSIBLE BUG: It seems like the JS only runs when viewing the page in Edit mode? Is it only being configured for the "Edit" version of the page? Or is there some other configuration required to allow it to work in regular View mode?  -->

Now your client extension is configured and you can see it in action. Navigate back to the page you configured, and see the alert window pop up with a message from the client extension.

![This example client extension creates an alert message popup when the page is loaded.](link to screenshot)

```{tip}
If the alert window does not appear at first, try doing a hard refresh of the page to clear your browser's cache (`CTRL + SHIFT + R` for most browsers). If you change your client extension and redeploy it, you may need to remove it from the page's reconfiguration and re-add it to see the changes.
```

## Next Steps

Congratulations! You have successfully created and used your first global JS client extension in Liferay. Next, try deploying other client extension types.

* [Creating Your First Global CSS Client Extension](./creating-your-first-global-css-client-extension.md)

<!-- TODO: point to other documentation for more advanced tutorials, or other client extension types. -->