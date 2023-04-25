---
uuid: 26cee4e4-07ad-4341-a5d6-ee4c715f7009
---
# Creating a Basic IFrame Client Extension

{bdg-secondary}`7.4+`

IFrame client extensions use Liferay's front-end infrastructure to register external applications as `<iframe>` HTML elements as widgets on Liferay pages. Unlike other front-end client extensions, IFrames do not provide a static resource.

```{warning}
IFrame client extensions are under development and are unsupported in Liferay 7.4.
```

Start with a client extension (from the [sample workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/sample-workspace)).


## Prerequisites

To start developing client extensions,

1. Install Java (JDK 8 or JDK 11).

   ```{note}
   Check the [compatibility matrix](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) for supported JDKs, databases, and environments. See [JVM Configuration](../../../../installation-and-upgrades/reference/jvm-configuration.md) for recommended JVM settings.
   ```

1. Download and unzip the sample workspace:

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

Now you have the tools to deploy your IFrame client extension.

## Examine and Modify the Client Extension

The IFrame client extension is in the sample workspace's `client-extensions/liferay-sample-iframe-1/` folder. It's defined in the `client-extension.yaml` file:

```yaml
liferay-sample-iframe-1-counter-app:
    name: Counter App
    type: iframe
    url: https://arnab-datta.github.io/counter-app
```

The client extension has the ID `liferay-sample-iframe-1` and contains the key configurations for an IFrame client extension, including the `name`, `type` and the URL of the app to ingest as an IFrame. See the [IFrame YAML configuration reference](../iframe-yaml-configuration-reference.md) for more information on the available properties.

Next, deploy the client extension.

## Deploy the Client Extension to Liferay

```{include} /_snippets/run-liferay-portal.md
```

Once Liferay starts, go to the client extension's folder in the sample workspace and run

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

This builds your client extension and deploys the zip to Liferay's `deploy/` folder.

```{note}
To deploy your client extension to Liferay Experience Cloud, use the Liferay Cloud [Command-Line Tool](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) to run [`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment).
```

```{tip}
To deploy all client extensions in the workspace simultaneously, run the command from the `client-extensions/` folder.
```

Confirm the deployment in your Liferay instance's console:

```
STARTED liferay-sample-iframe-1_1.0.0 [1592]
```

Now that your client extension is deployed, configure Liferay to use it. 

## Use the Client Extension on a Page

Configure a page in Liferay to use your deployed client extension: 

1. Click _Edit_ ![Edit](../../../../images/icon-edit-pencil.png) at the top of any page.

1. Add the widget to the page. In the Fragments and Widgets sidebar (![Fragments and Widgets](../../../../images/icon-plus.png)), click *Widgets*.

1. Find the Client Extensions &rarr; Counter App widget and drag it onto the page. Click *Publish*.

   ![Drag the Counter App onto a page.](./using-an-iframe-client-extension/images/01.png)

Confirm the Counter App is working by adding some items. 

## Additional Information

* [Front-end Client Extensions](../../front-end-client-extensions.md)
* [Understanding Custom Element and IFrame Client Extensions](../understanding-custom-element-and-iframe-client-extensions.md)
* [Client Extensions UI Reference](../remote-applications-ui-reference.md)
