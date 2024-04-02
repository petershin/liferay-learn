---
uuid: 7600c13a-c687-4637-97ca-abac89b05107
---
# Deploying the Application

The Distributor Application solution incorporates several Liferay features, such as [Objects](https://learn.liferay.com/w/dxp/building-applications/objects), [Picklists](https://learn.liferay.com/w/dxp/building-applications/objects/picklists), and [Workflows](https://learn.liferay.com/w/dxp/process-automation/workflow/). It also utilizes page builder features to [build dynamic and responsive user interfaces](https://learn.liferay.com/w/dxp/site-building/creating-pages), [design forms](https://learn.liferay.com/w/dxp/process-automation/forms/creating-and-managing-forms), [display object data](https://learn.liferay.com/w/dxp/building-applications/objects/displaying-object-entries), and more.

For the purpose of this course, we will deploy the application using [Client Extensions](https://learn.liferay.com/w/dxp/building-applications/client-extensions), which are stored in Clarity's prebuilt [Liferay Workspace](https://learn.liferay.com/web/guest/w/dxp/building-applications/tooling/liferay-workspace). Some portions of the application are already configured in the prebuilt solution; you will complete other parts yourself as you progress through this module.

In this article, you'll learn how to:

* Install and use Clarity's preconfigured Liferay Workspace.
* Build and deploy Client Extensions.
* Test the solution in Liferay's UI.

## Downloading and Deploying the Solution's Material

Follow these steps to install the prebuilt Clarity workspace:

1. Download and unzip the workspace in a folder of your choice using these commands:

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.clarity.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

1. After extracting the workspace, go into the `client-extensions` folder.

   ```bash
   cd [workspace-root]/client-extensions/
   ```

1. Build the Client Extensions projects:

   ```bash
   ../gradlew clean build
   ```

The compiled `.zip` files are created in each project's `dist/` folder.

```bash
[project-name]
├── batch
├── build
├── dist
│   └── [project-name].zip
└── client-extension.yaml
```

Client Extensions are deployed by placing these archives in the correct location of your running Liferay instance.

!!! note
    The following steps assume you're using Liferay SaaS. See [Deploying to Your Liferay Instance](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions/working-with-client-extensions#deploying-to-your-liferay-instance) if you're a PaaS or Self-Hosted user.

In order to deploy Client Extensions to your SaaS environment, you'll use the Liferay Cloud CLI tool you installed in [Module 2](../module-2-developer-setup/liferay-workspace.md#prerequisites).

The predefined Clarity solution can be implemented and deployed by following these steps:

1. Go to the `liferay-clarity-batch` folder.

   ```bash
   cd liferay-clarity-batch/
   ```

1. Deploy the compiled Client Extension file in the project's `dist/` folder with this command:

   ```bash
   lcp deploy --ext [path-to-zip-file]
   ```

1. When prompted, choose the project environment where the extension will be deployed.

   ![The command returns a list of available projects to deploy the extension.](./deploying-the-application/images/01.png)

1. After the deployment finishes, open the [Cloud Console](https://console.liferay.cloud/) and go into the chosen project environment's Services menu. Make sure the `liferayclaritybatch`'s service status shows `ready`.

Now that you've deployed the solution's client extensions, all the necessary components should be within your Liferay instance. You can verify this by navigating  to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Picklists_. Once the menu opens, confirm that all picklists display.

   ![All picklists appear after deploying the Client Extension.](./deploying-the-application/images/02.png)

### Bonus Exercise

The prebuilt solution uses two Liferay objects, the Distributor Application object and the Application Evaluation object. You will learn more about these objects and how they are configured in the following sections. For now, let's create and review a Distributor Application entry.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_. Notice that two new options appear under Object: Application Evaluations and Distributor Applications.

   ![The Control Panel now shows the Application Evaluations and Distributor Applications menus.](./deploying-the-application/images/03.png)

1. Open _Distributor Applications_.

1. Click _Add_ (![Add Button](../../images/icon-add.png)) to create a new Distributor Application entry.

1. Fill out the form with any information, then click _Save_.

1. Return to the Distributor Applications menu and check your created entry.

   ![The created application entry is displayed in the Distributor Application menu.](./deploying-the-application/images/04.png)

After creating an entry for the Distributor Applications object, you can check how the review process works.

1. Go to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Application Evaluations_.

1. Click _Add_ (![Add Button](../../images/icon-add.png)) to create a new Application Evaluation entry.

1. In the Application to Evaluations field, select the application entry's Business Name to relate this evaluation to it.

1. Fill out the review form as you prefer, then click _Save_.

1. Return to the Application Evaluations menu and check the created review entry.

   ![The evaluation entry is shown in the Application Evaluations menu.](./deploying-the-application/images/05.png)

An evaluation entry is automatically assigned to the application. You can confirm this relationship between them by navigating to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Distributor Applications_, selecting an entry, and going to the _Evaluation Notes_ tab.

   ![The Evaluation Notes displays the assigned evaluations related to the application entry](./deploying-the-application/images/06.png)

Now that you've deployed the main parts of the solution, let's move on. The following sections will guide you through the features of the solution and some of the decisions Clarity had to make in designing it.

Up Next: [Modeling Data Structures](./modeling-data-structures.md)

## Additional Resources

* [Objects](https://learn.liferay.com/en/w/dxp/building-applications/objects)
* [Picklists](https://learn.liferay.com/w/dxp/building-applications/objects/picklists)
* [Liferay Workspace](https://learn.liferay.com/web/guest/w/dxp/building-applications/tooling/liferay-workspace)
* [Client Extensions](https://learn.liferay.com/w/dxp/building-applications/client-extensions)
* [Deploying Client Extensions](https://learn.liferay.com/w/dxp/building-applications/client-extensions/working-with-client-extensions#deploying-to-your-liferay-instance)
