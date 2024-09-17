---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: 277bf5b8-1723-45f0-aa7e-b0141e2181d3
---
# Development Requirements

Before beginning deployment in Liferay PaaS, developers planning to create modules should install the required tools. There are various development tools and frameworks that developers can use to create their customizations, but deployment to Liferay Cloud begins with the GitHub project created during the provisioning process.

To set up a local environment for development with Liferay Cloud, the following are required:

- [Java (using a supported JDK version)](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-Quarterly-Releases-Compatibility-Matrix): required for running Liferay instances locally

- [Gradle 4+](http://www.gradle.org/downloads): used to run any of various build commands for Liferay DXP and Liferay Cloud

- [Git](https://git-scm.com/): necessary for adding changes to deploy to Liferay Cloud

- Repository hosting service account: required to push code changes to a remote repository and submit changes for Liferay Cloud builds. You can use an account for any of these available options:

  - [GitHub](https://github.com/)
  - [Bitbucket](https://bitbucket.org/)
  - [GitLab](https://gitlab.com/)
  - [Azure](https://azure.microsoft.com/en-us/products/devops/repos)

!!! note
    Liferay Cloud has similar prerequisites to [Liferay Workspace](https://help.liferay.com/hc/en-us/articles/360029147471-Liferay-Workspace). Developers who are familiar with creating a Liferay Workspace using [Liferay Dev Studio](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191007&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191038), [Maven](https://help.liferay.com/hc/en-us/articles/360017885592-Maven-Workspace), or the [Liferay IntelliJ Plugin](https://plugins.jetbrains.com/plugin/10739-liferay-intellij-plugin) will have most of the necessary tools already set up.

## Related Topics

- [Configuring Your GitHub Repository](../getting-started/configuring-your-github-repository.md)
- [Configuring Your Bitbucket Repository](./configuring-your-bitbucket-repository.md)
- [Configuring Your GitLab Repository](./configuring-your-gitlab-repository.md)
- [Overview of the Liferay Cloud Deployment Workflow](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
- [Logging Into Your Liferay DXP Instance](../getting-started/logging-into-your-liferay-cloud-services.md)