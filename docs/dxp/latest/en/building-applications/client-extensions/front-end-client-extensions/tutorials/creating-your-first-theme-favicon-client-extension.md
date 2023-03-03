# Creating Your First Theme Favicon Client Extension

{bdg-secondary}`Available Liferay 7.4 U45+/GA45+`

You can override the default favicon in Liferay using a theme favicon client extension. This can be done without changing any Liferay code. You'll use this [Sample Workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-workspace) to build and deploy your client extension.

## Prerequisites

You must meet these requirements in your development environment to begin working with client extensions:

1. Install Java (JDK 8 or JDK 11).

    ```{note}
    Please see the [compatibility matrix](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) for information on supported JDKs, databases, and environments. See [JVM Configuration](../../../../installation-and-upgrades/references/jvm-configuration.md) for recommended JVM settings.
    ```

<!-- The name of the sample workspace also has a timestamp attached to it. I believe this will change when there are more deployments to Nexus -->
1. Download and unzip the Sample Workspace

   ```bash
   curl https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.sample.workspace\&\v\=LATEST\&p\=zip -J -O
   ```

   ```bash
   unzip com.sample.workspace-20230217.1154.zip
   ```

Now you have all the necessary tools to deploy your first theme favicon client extension.

## Build and Deploy the Theme Favicon Client Extension

```{include} /_snippets/run-liferay-dxp.md
```

Once Liferay is running,

1. Move into the them favicon client extension directory.

   ```bash
   cd client-extensions/sample-theme-favicon
   ```

<!-- We usually tell devs to do ./gradlew but here it is two directories up. Not sure if that's alright. -->
1. Build and deploy the example.

   ```bash
   ./../../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

## Use the Theme Favicon Client Extension on a Page

To see the deployed client extension,

1. Go to your Liferay instance and click the *Product Menu* (![Product Menu icon.](../../../../images/icon-product-menu.png)). Navigate to *Site Builder* &rarr; *Pages*.

1. Click Add (![Add icon](../../../../images/icon-add.png)) and select *Page*.

1. Click *Widget Page* and enter a name.

   **Name**: Sample Favicon

   ![Enter a name for the widget page and click Add.](./creating-your-first-theme-favicon-client-extension/images/01.png)

1. Click *Add*.

1. In the *Favicon* section under the *Look and Feel* tab, click *Change Favicon*.

1. There's a new tab called *Client Extensions*. Click on it, and select the newly deployed favicon, *Sample Theme Favicon*.

   ![Select the Sample Theme Favicon client extension and click Save.](./creating-your-first-theme-favicon-client-extension/images/02.gif)

1. Scroll down and click *Save*.

Go back to the homepage and click on *Sample Favicon*. The new favicon appears on the browser tab.

![The new favicon appears on the browser tab.](./creating-your-first-theme-favicon-client-extension/images/03.png)

```{tip}
If the buttons on the page still show the default background color, try doing a hard refresh of the page to clear your browser's cache (`CTRL + SHIFT + R` for most browsers). If you change your client extension and redeploy it, you may need to remove it from the page's configuration and re-add it to see the changes.
```

## Theme Favicon Client Extension Directory Structure

```bash
sample-workspace
|__ client-extensions
|____ sample-theme-favicon
|______ assets
|________ favicon.ico
|______ client-extension.yaml
```

There are 2 files inside the `sample-theme-favicon` folder. The favicon (`favicon.ico`) is present inside the `assets` folder and there is a YAML file that must be configured to use a client extension. See [Theme Favicon YAML Configuration Reference](https://github.com/Alec-Shay/liferay-learn/blob/LRDOCS-11456-overview/docs/dxp/latest/en/building-applications/client-extensions/front-end-client-extensions/theme-favicon-yaml-configuration-reference.md) for more information on setting up the YAML file for a theme favicon client extension.

## Next Steps

Congratulations! You have successfully created and used your first theme favicon client extension in Liferay. Next, try deploying other client extension types.

<!-- * Add more links here when they are ready -->