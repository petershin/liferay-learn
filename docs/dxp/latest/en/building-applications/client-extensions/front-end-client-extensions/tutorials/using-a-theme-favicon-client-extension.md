---
uuid: 75c87280-d934-43a4-b1e1-59d7a3b054ed   
---
# Using a Theme Favicon Client Extension

{bdg-secondary}`Available Liferay 7.4 U45+/GA45+`

You can override the default favicon of a page in Liferay using a theme favicon client extension. This can be done without changing any Liferay code. The client extension overrides the favicon used by the theme on the selected page. You'll use this [Sample Workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-workspace) to build and deploy your client extension.

## Prerequisites

To start developing client extensions,

1. Install Java (JDK 8 or JDK 11).

    ```{note}
    Check the [compatibility matrix](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) for supported JDKs, databases, and environments. See [JVM Configuration](../../../../installation-and-upgrades/reference/jvm-configuration.md) for recommended JVM settings.
    ```

1. Download and unzip the sample workspace:

   ```bash
   curl -J -O https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.sample.workspace-20230217.1154.zip
   ```

Now you have the tools to deploy your first theme favicon client extension.

## Examine the Client Extension

The theme favicon client extension is in the sample workspace's `client-extensions/sample-theme-favicon/` folder. It is defined in the `client-extension.yaml` file in this folder:

```yaml
sample-theme-favicon:
    name: Sample Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

The client extension has the ID `sample-theme-favicon` and contains the key configurations for a theme favicon client extension, including the type and the favicon file to add. See the [Theme Favicon YAML Configuration Reference](../theme-favicon-yaml-configuration-reference.md) for more information on the available properties.

It also contains the `assemble` YAML block:

```yaml
assemble:
    - from: assets
      include: "**/*"
      into: static
```

This specifies that everything in the `assets/` folder should be included as a static resource in the built client extension `.zip` file. The favicon file in a theme favicon client extension is used as a static resource in Liferay.

## Deploy the Client Extension to Liferay

```{include} /_snippets/run-liferay-portal.md
```

Once Liferay starts, run this command from the client extension's folder in the sample workspace:

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

This builds your client extension and deploys the zip to Liferay's `deploy/` folder.

```{note}
To deploy your client extension to Liferay Experience Cloud, use the Liferay Cloud [Command-Line Tool](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line-tool.html#) to run [`lcp deploy`](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line-tool.html#deploying-to-your-dxp-cloud-environment).
```

```{tip}
To deploy all client extensions in the workspace simultaneously, run the command from the `client-extensions/` folder.
```

Confirm the deployment in your Liferay instance's console:

```bash
STARTED sample-theme-favicon_1.0.0
```

## Use the Client Extension on a Page

Configure a page in Liferay to use your deployed client extension:

1. On a page, click the _Edit_ icon ![Edit icon](../../../../images/icon-edit-pencil.png) at the top.

1. In the sidebar, navigate to the Page Design Options menu (![Page Design Options icon](../../../../images/icon-format.png)) and click the configuration icon (![Configuration icon](../../../../images/icon-cog3.png)) at the top of the menu.

1. In the _Favicon_ section under the _Look and Feel_ tab, click _Change Favicon_.

1. Click _Client Extensions_, and select the newly deployed favicon, _Sample Theme Favicon_.

   ![Select the Sample Theme Favicon client extension and click Save.](./using-a-theme-favicon-client-extension/images/01.gif)

1. Scroll down and click _Save_.

1. Go back to the page. The new favicon appears on the browser tab.

![The new favicon appears on the browser tab.](./using-a-theme-favicon-client-extension/images/02.png)

## Next Steps

You have successfully used a theme favicon client extension in Liferay. Next, try deploying other client extension types.

* [Using a CSS Client Extension](./using-a-css-client-extension.md)
* [Using a JS Client Extension](./using-a-javascript-client-extension.md)