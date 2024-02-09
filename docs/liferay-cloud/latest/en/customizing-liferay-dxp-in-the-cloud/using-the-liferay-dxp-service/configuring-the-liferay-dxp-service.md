---
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
uuid: 002ecd02-b586-483f-bd07-a378f27d14fd
---
# Configuring the Liferay DXP Service

There are several methods available to configure Liferay DXP: through the in [DXP System Settings](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/system-settings.html) and through the use of [config](https://learn.liferay.com/dxp/latest/en/system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.html) and [property files](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/reference/portal-properties.html). DXP property and configuration files for your Liferay DXP instance in Liferay Cloud are deployed by being placed inside of one of the `configs/` folders in the Liferay DXP service directory in your repository.

```
liferay
├── configs
│   ├── common
│   ├── dev
│   ├── local
│   ├── prd
│   └── uat
└── LCP.json
```

With the exception of the `common/` directory, changes added to an environment-specific folder (e.g., `dev`, `uat`, `prod`) will _only_ be propagated when deploying to the corresponding environment. Changes added to a `common/` directory will _always_ be deployed, regardless of the target deployment environment. This applies to all subfolders within the `configs/` directory, for all services.

## Portal Properties

[Portal properties](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/reference/portal-properties.html) are properties saved in a `portal-ext.properties` file. They are used to configure your Liferay DXP environment.

For an on-premises Liferay DXP instance, this file belongs inside of `$LIFERAY_HOME`. When using Liferay Cloud, place portal properties file into the appropriate `configs/[ENV]/` folder(s) for them to be copied into `$LIFERAY_HOME` for the Liferay DXP instance on deployment.

For example, the properties in a dev environment will result from the property files in the `configs/common` directory and the properties in the `configs/dev` directory. If any files have the same name, the file in the environment specific directory will overwrite the file from the `common` directory.

### Splitting Portal Properties into Multiple Files

By default, Liferay will only read properties directly from the `portal-ext.properties` file, but it can be helpful to organize your properties into different files in your repository, such as environment-specific files. You can define additional files to override your portal properties:

* `portal-all.properties`: Contains the properties that change Liferay DXP across environments

* `portal-env.properties`: Contains the properties that only affect the current environment (for example, credentials and URL endpoints for external services that differ from environment to environment)

To use these files, the `portal-ext.properties` file must explicitly import `portal-all.properties` and `portal-env.properties` using the `include-and-override` property:

```
include-and-override=/opt/liferay/portal-all.properties
include-and-override=/opt/liferay/portal-env.properties
```

You can then organize your properties with the following structure:

```
liferay
├── configs
│   ├── common
│   │   ├── portal-ext.properties
│   │   └── portal-all.properties
│   ├── dev
│   │   └── portal-env.properties
│   ├── local
│   │   └── portal-env.properties
│   ├── prd
│   │   └── portal-env.properties
│   └── uat
│       └── portal-env.properties
└── LCP.json
```

The `portal-ext.properties` and `portal-all.properties` files are shared across all environments. You can add any shared properties there and add environment specific properties in each respective `portal-env.properties` file. For more information, see [Portal Property Priority](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/reference/portal-properties.html#portal-property-priority).

!!! note
   Portal properties may also be defined as environment variables. See [the environment variables reference](./liferay-service-environment-variables.md#environment-variables-reference) for more information.

## OSGi Configurations

OSGi configurations (`.cfg` or `.config` files) are used to configure OSGi components in Liferay DXP.

These configuration files belong in the `osgi/configs/` folder inside of `$LIFERAY_HOME`. When using Liferay Cloud, place these files into the appropriate `configs/[ENV]/osgi/` folder(s) for them to be copied into `/osgi/configs` for the Liferay DXP instance on deployment.

## Tomcat Configurations

Configure your Liferay service's Tomcat server by deploying files in the appropriate environment's `liferay/configs/[ENV]` folder to override the configuration files. For example, you can override the `{TOMCAT HOME}/conf/web.xml` file in your Liferay container's file system by placing the customized file in the appropriate `liferay/configs/[ENV]/tomcat/conf/` folder in your repository and deploying the changes.

!!! note
   Two tomcat folders exist in the Liferay container in Liferay Cloud: a generic `tomcat` folder, and a versioned folder (`tomcat-x.x.x`). The `tomcat` folder has a symbolic link to the versioned `tomcat-x.x.x` folder, so overriding a file in the generic `tomcat` folder ensures the new file reflects in both folders.

!!! warning
   Keep in mind when overriding the default Tomcat configuration that the Liferay service in Liferay Cloud exists in a closed network on the Cloud platform. Some network configurations that can be changed in an on-premises Liferay installation cannot be changed from the default values in a Cloud environment, or it may cause issues in your environment.

## Key Deployment Directories Reference

| **File Type**             | **Path**                            | **Description**                                                                                                                                                                             |
| :------------------------ | :---------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Deployed files to Liferay | liferay/configs/[ENV]/deploy/       | Any files deployed directly to Liferay, including [themes, modules](./deploying-to-the-liferay-service.md#deploying-themes-portlets-and-osgi-modules), and [licenses](#deploying-licenses). |
| OSGi configurations       | liferay/configs/[ENV]/osgi/configs/ | Any `.cfg` or `.config` [OSGi configuration files](#osgi-configurations).                                                                                                                   |
| Hotfixes                  | liferay/configs/[ENV]/patching/     | A [hotfix `.zip` file](./deploying-to-the-liferay-service.md#deploying-hotfixes). You can only deploy one hotfix to an environment at a time.                                               |
| Custom shell scripts      | liferay/configs/[ENV]/scripts/      | Scripts here automatically run when the service starts.                                                                                                                                     |
| Other overrides           | liferay/configs/[ENV]/              | Any other configurations that belong your Liferay instance's Liferay Home folder. If they belong in a subdirectory of Liferay Home, place them in the same subdirectory of this folder.     |

## Environment Variables

The Liferay service in Liferay Cloud uses [environment variables](../reference/defining-environment-variables.md) (or [secrets](../tuning-security-settings/managing-secure-environment-variables-with-secrets.md)) in place of some configurations that are done differently with an on-premises instance, such as JVM memory settings or database connection settings. Environment variables can also be used to [override or replace portal properties](./liferay-service-environment-variables.md#overriding-portal-properties).

See [Liferay Service Environment Variables](./liferay-service-environment-variables.md) for more information.

## Related Topics

* [Customizing Liferay DXP in the Cloud](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service.md)
* [Enabling Clustering in Liferay Cloud](./setting-up-clustering-in-liferay-cloud.md)
* [Portal Properties](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/reference/portal-properties.html)
* [Liferay Service Environment Variables](./liferay-service-environment-variables.md)
