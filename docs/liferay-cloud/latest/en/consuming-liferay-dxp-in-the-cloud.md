---
toc:
  - ./customizing-liferay-dxp-in-the-cloud/deploying-to-the-liferay-service.md
  - >-
    ./customizing-liferay-dxp-in-the-cloud/updating-your-dxp-instance-to-a-new-minor-version.md
  - ./customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md
  - ./customizing-liferay-dxp-in-the-cloud/liferay-service-environment-variables.md
  - ./customizing-liferay-dxp-in-the-cloud/setting-up-clustering-in-liferay-cloud.md
  - ./customizing-liferay-dxp-in-the-cloud/using-the-mysql-client.md
  - ./customizing-liferay-dxp-in-the-cloud/upgrading-your-liferay-dxp-instance.md
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
uuid: 01625ffe-bb32-4fe9-bfde-9f3adbb3f2de
---
# Customizing Liferay DXP in the Cloud

The Liferay service is the heartbeat of any project. It runs the application's Liferay DXP instance and interacts with other services like the web server, Elasticsearch, and MySQL database.

![The Liferay service is one of several services available in Liferay Cloud.](./customizing-liferay-dxp-in-the-cloud/images/01.png)

The Liferay service in Liferay Cloud can be used in many of the same ways as an on-premise instance of Liferay DXP. However, there are also several differences in configuration and development workflow when working with an instance in Liferay Cloud.

See the [Liferay service limitations](./reference/platform-limitations.md#liferay-service) for more information.

* [Choosing a Version](#choosing-a-version)
* [Deployment (Customization, Patching, and Licensing)](#deployment-customization-patching-and-licensing)
* [Configuration](#configuration)
* [Hot Deploy](#hot-deploy)
* [Enabling Clustering](#enabling-clustering)
* [Running Scripts](#running-scripts)

## Choosing a Version

The major version of Liferay DXP that you are using is configured within the `LCP.json` file within the `liferay/` folder of your Git repository. Set the major version as the `image` variable using a Docker image name within the `LCP.json` file:

```
"image": "liferaycloud/liferay-dxp:7.2-4.0.1"
```

Define the specific service pack and fix pack through the `gradle.properties` file within the same `liferay/` folder. The `liferay.workspace.docker.image.liferay` property defines another Docker image name with this specific fix pack level that is used for the actual deployment:

```properties
liferay.workspace.docker.image.liferay=liferay/dxp:7.2.10-sp2-202005120922
```

```{note}
If your Liferay Cloud stack is not yet updated to 4.x.x, then by default, this version is instead located within a `gradle.properties` file at the root of the repository. In this case, define the version with the `liferay.workspace.lcp.liferay.image` property (which does not need to be defined separately from the major version). See [Understanding Service Stack Versions](./reference/understanding-service-stack-versions.md) for more information on checking the version.
```

You can check the [Services Changelog](https://help.liferay.com/hc/en-us/sections/360006251311-Services-Changelog) for Liferay Cloud to see a reference for each new release. Each new Service update includes Docker images that you can use for your instance. You can also directly check the [DXP tags on Docker Hub](https://hub.docker.com/r/liferay/dxp/tags?page=1) to find the Docker image names to use.

Use the new version from the release notes to update the Docker image value. The new Docker image will be used when your instance starts up or the next time you deploy the Liferay service from your repository. You can also use the Docker images for new releases to upgrade the properties for your other services.

## Deployment (Customization, Patching, and Licensing)

Deploying custom additions to Liferay DXP involves adding the new module, license, or hotfix to the appropriate locations in the Git repository.

With the exception of the `common/` directory, changes added to an environment-specific folder (e.g., `dev`, `uat`, `prod`) will _only_ be propagated when deploying to the corresponding environment. Changes added to a `common/` directory will _always_ be deployed, regardless of the target deployment environment. This applies to all subfolders within the `configs/` directory, for all services.

Because the Liferay service provides many more means of customization compared to other services (such as adding hotfixes, building your module's source code), there are several more considerations to make when deploying the service. See [Deploying to the Liferay Service](./customizing-liferay-dxp-in-the-cloud/deploying-to-the-liferay-service.md) for more information. Additionally, see [Overview of the Deployment Workflow](./updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) for more information on how the deployment workflow in general. For a tutorial on deploying to Liferay Cloud, see [Deploying Changes via the DCP Cloud Console](./updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md).

## Configuration

Applying configurations to the Liferay service, like `portal.properties` changes, requires adding them to the Git repository and pushing the changes to Git. For more information on adding these configuration files, see [Configuring the Liferay DXP Service](./customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md).

Environment variables are also used to configure the Liferay service and, in some cases, override portal properties. See [Liferay Service Environment Variables](./customizing-liferay-dxp-in-the-cloud/liferay-service-environment-variables.md) for more information.

## Hot Deploy

Hot deploy can be done via the Liferay DXP UI. To do so, navigate to the Control Panel → Apps → App Manager. Then, click the dots in the upper-right corner, and click "Upload." From this screen, you can choose a file from your local file system to deploy and install.

```{note}
Using hot deploy in Liferay Cloud is *not* recommended because any customizations deployed with this method will be lost upon a subsequent Liferay service deployment.
```

## Enabling Clustering

Clustering Liferay DXP in Liferay Cloud is a very simplified process compared to doing so in Liferay DXP. Support for clustering is available and enabled out-of-the-box in Liferay Cloud. Additional configurations for clustering behavior and scale does require a few extra steps. See [Setting Up Clustering in Liferay Cloud](./customizing-liferay-dxp-in-the-cloud/setting-up-clustering-in-liferay-cloud.md) for more information.

## Running Scripts

Any `.sh` files found in the `configs/[ENV]/scripts` folder are automatically run prior to starting the service. Scripts may be used for more extensive customizations. However, use caution when doing so. This is the most powerful way to customize Liferay DXP and it can cause undesired side effects.

For example, to include a script that removes all log files, place it in the following directory structure within the project's Git repository:

```
liferay
├── LCP.json
└── configs
    └── dev
        ├── deploy
        ├── osgi
        ├── patching
        └── scripts
            └── remove-log-files.sh
```

## Limitations

Liferay DXP has many powerful features to build, manage, and deploy content to the web. However, some of those features are unavailable on Liferay Cloud:

* [Remote Staging](https://learn.liferay.com/dxp/latest/en/site-building/publishing-tools/staging/configuring-remote-live-staging.html) is currently unsupported on Liferay Cloud. Users migrating from an on-premises installation to Liferay Cloud must convert to Local Staging in order to continue using Staging functionality.

## Related Topics

* [Deploying to the Liferay Service](./customizing-liferay-dxp-in-the-cloud/deploying-to-the-liferay-service.md)
* [Logging Into Your Liferay Cloud Services](getting-started/logging-into-your-liferay-cloud-services.md)
* [Configuring the Liferay DXP Service](./customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md)
* [Deploying Changes via the DCP Cloud Console](updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md)

```{toctree}
:maxdepth: 1

customizing-liferay-dxp-in-the-cloud/deploying-to-the-liferay-service.md
customizing-liferay-dxp-in-the-cloud/updating-your-dxp-instance-to-a-new-minor-version.md
customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md
customizing-liferay-dxp-in-the-cloud/liferay-service-environment-variables.md
customizing-liferay-dxp-in-the-cloud/setting-up-clustering-in-liferay-cloud.md
customizing-liferay-dxp-in-the-cloud/using-the-mysql-client.md
customizing-liferay-dxp-in-the-cloud/upgrading-your-liferay-dxp-instance.md
```

```{raw} html
:file: landingpage_template.html
```

```{raw} html
:file: customizing-liferay-dxp-in-the-cloud/landing.html
```
