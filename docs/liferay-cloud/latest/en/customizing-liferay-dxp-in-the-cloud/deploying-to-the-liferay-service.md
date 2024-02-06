---
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Cloud Platform Builds and Deployments
- Liferay PaaS
uuid: 5cc0862d-ae06-4a61-ac47-953fd1e914c3
---
# Deploying to the Liferay Service

As with other services, deploying custom additions involves adding your configurations or files to the appropriate locations in your Git repository. However, deploying the Liferay service slightly differs from deploying other services.

The Liferay service makes use of a [Liferay workspace](https://learn.liferay.com/dxp/latest/en/building-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) to give you more options to add [deployable files](#deploying-themes-portlets-and-osgi-modules), [source code](#building-and-deploying-source-code), and more. These are easily included with a [CI build](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md), but if you are using the [CLI tool](../reference/command-line-tool.md), some [extra steps](#cli-tool-deployment) are necessary specifically for the Liferay service.

## Defining the Liferay DXP Docker Image

The Liferay service image (defined in the `LCP.json` file, like other services) is not the same as the Liferay DXP Docker image. The Liferay DXP Docker image determines the exact version (including the fix pack) of Liferay that runs in your Liferay service. This is defined in your repository's `liferay/gradle.properties` file, with the `liferay.workspace.docker.image.liferay` property.

Check the [Liferay DXP Docker tags](https://hub.docker.com/r/liferay/dxp/tags) to find the right image for your version of DXP.

```{important}
The major version number of DXP defined in the `image` property of the Liferay service's `LCP.json` file **must match** the major version in the `liferay.workspace.docker.image.liferay` property in `liferay/gradle.properties`. The Liferay service may fail to start up after deployment if the two are different.
```

## CLI Tool Deployment

To add [deployable files](#deploying-themes-portlets-and-osgi-modules), [built source code](#building-and-deploying-source-code), [hotfixes](#deploying-hotfixes), and [licenses](#deploying-licenses) using the [CLI tool](../reference/command-line-tool.md), you must include them in a special `Dockerfile` image that is generated before you deploy. These extra steps are not necessary if you deploy a build via the [CI service](../platform-services/continuous-integration.md).

If you deploy the Liferay service with the CLI normally (when deploying all services at once, or from the `liferay/` directory), a **default version** of the Liferay DXP image (using the major version defined in `LCP.json`) that does not contain your customizations is deployed. This happens because you must specifically build and deploy any customizations with the service for them to be included.

Follow these steps to deploy the Liferay service with your customizations:

1. From the command-line in the `liferay/` directory, run:

   ```bash
   ./gradlew clean createDockerfile deploy
   ```

   This builds all of your customizations, and arranges them into a `build/liferay/` subfolder. It also adds a `Dockerfile` specifically for a customized version of DXP.

1. Copy the `LCP.json` file into the newly generated `build/docker/` subfolder.

1. Run the `lcp deploy` command as usual from this subfolder.

This deploys the customized service instead of a default version.

## Deploying Themes, Portlets, and OSGi Modules

To install themes, portlets, or OSGi modules, include a WAR or JAR file into a `configs/[ENV]/deploy/` folder in your Liferay DXP service directory.

For example, to deploy a custom JAR file to your development environment (using the `dev/` environment folder), your Liferay DXP service directory could look like this:

```
liferay
  ├── LCP.json
  └── configs
      └── dev
          ├── deploy
          │   └── com.liferay.apio.samples.portlet-1.0.0.jar
          ├── osgi
          ├── patching
          ├── scripts
          └── portal-ext.properties
```

Once deployed, any files within the `configs/[ENV]/deploy/` directory are copied to the `$LIFERAY_HOME/deploy/` folder in your Liferay service's container.

```{note}
Certain files and configurations are forced to be present when an image is deployed, and they may override your added files. Look for the message `DXPCloud Liferay Overrides` in your service's logs to identify when your files are overridden.
```

## Building and Deploying Source Code

The source code for new additions can also be included in a CI build. When the build starts, it compiles the source code automatically.

CI builds compile source code within these folders:

* The `liferay/modules` folder for new modules
* The `liferay/themes` folder for custom themes
* The `liferay/wars` folder for exploded WARs

Once deployed, the deployable `.jar` or `.war` files are copied to the `$LIFERAY_HOME/deploy/` folder in your Liferay service's container. This occurs whether the build in CI compiles your code, or you generate it yourself using the available [Gradle command](#cli-tool-deployment) before deployment.

## Deploying Hotfixes

To apply a hotfix, add the hotfix ZIP file to a `configs/[ENV]/patching/` folder within the Liferay DXP service directory. When you deploy this change, the hotfix is applied to the Liferay DXP instance.

```{note}
See [Updating Your DXP Instance to a New Minor Version](./updating-your-dxp-instance-to-a-new-minor-version.md) to update to a new minor version of Liferay DXP instead (such as a new [service pack](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.html#service-packs)).
```

For example, you can deploy a hotfix to your development environment with a structure like the following:

```
liferay
  ├── LCP.json
  └── configs
      └── dev
          ├── deploy
          ├── osgi
          ├── patching
          │   └── liferay-hotfix-2-7110.zip
          └── scripts
```

Note that the hotfix must be re-applied each time the server starts up. For this reason, updating to the latest Fix Pack or Service pack of the Liferay DXP Docker image in your `LCP.json` file is better than adding a hotfix into this folder for the long term; you can update the Docker version by replacing the `image` environment variable in this file (in the `liferay/` directory).

### Patching via Environment Variable

You can also install hotfixes as part of the CI build process instead of directly committing them to your Git repository. This approach is ideal for large hotfixes so you can avoid keeping large files in your repository.

Add a hotfix to the `LCP_CI_LIFERAY_DXP_HOTFIXES_[ENV]` environment variable (either through the `Environment Variables` tab in the Liferay Cloud console, or in the `ci` service's `LCP.json` file) for the CI service to apply it automatically during the build process. If you need multiple bug fixes, ask support to package them into a single hotfix.

```{note}
If you add this environment variable to the `LCP.json` for your `ci` service, you must deploy the `ci` service to your **infra environment** to complete the update.
```

See the following example of defining hotfixes in the `LCP.json` file:

```
"env": {
    "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON": "liferay-hotfix-17-7210",
    "LCP_CI_LIFERAY_DXP_HOTFIXES_DEV": "liferay-hotfix-33-7210"
}
```

```{note}
This environment variable is only available if you have upgraded to at least version 4.x.x services. See [Understanding Service Stack Versions](../reference/understanding-service-stack-versions.md) for more information on checking the version.
```

## Deploying Licenses

You can add your own license by putting it into a `configs/[ENV]/deploy/` folder within the Liferay DXP service directory.

For example, you can add licenses to your development environment with a structure like this in your Liferay DXP service directory:

```
liferay
  ├── LCP.json
  └── configs
      └── dev
          ├── deploy
          │   ├── license.xml
          │   └── license.aatf
          ├── osgi
          ├── patching
          └── scripts
```

Behind the scenes, XML licenses are copied to `$LIFERAY_HOME/deploy`, and AATF licenses are copied to `$LIFERAY_HOME/data`.

## Related Topics

* [Customizing Liferay DXP in the Cloud](../customizing-liferay-dxp-in-the-cloud.md)
* [Configuring the Liferay DXP Service](./configuring-the-liferay-dxp-service.md)
* [Overview of the Liferay Cloud Deployment Workflow](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
* [CLI Tool](../reference/command-line-tool.md)
