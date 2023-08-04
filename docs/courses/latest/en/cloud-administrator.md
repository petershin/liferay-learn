---
toc:
- ./cloud-administrator/setting-up-your-cloud-project.md
- ./cloud-administrator/deploying-code-to-lxc.md
- ./cloud-administrator/cloud-configuration.md
- ./cloud-administrator/cloud-development-lifecycle.md
uuid: f18aba0c-9da6-4057-a9df-0d610216d651
---
# Cloud Administrator

If you want your website on a secure and reliable enterprise cloud platform, you can build it on Liferay Cloud. There are two major offerings you can have for your project:

* **Liferay Experience Cloud (LXC)**: Work with Liferay DXP and all necessary infrastructure provided and maintained for you, according to your specific needs, where you only have to provide your own code or customizations.
* **Liferay Experience Cloud Self-Managed (LXC-SM)**: Work with a Liferay Cloud project where you directly control and configure each service in the cloud yourself, including the web server, database, and Elasticsearch server, and where you are responsible for maintaining and updating them.

You'll learn how to

* Access the Cloud console, where you manage all of your work in the cloud
* Grant access to your other team members
* Use the Cloud CLI tool to deploy changes or customizations
* Deploy custom code projects
* Use the tools in the Cloud console to troubleshoot your changes
* Configure your cloud services, including clustering, automatic scaling (auto-scaling), and hotfixes *(LXC-SM only)*
* Automatically deploy builds for your cloud services *(LXC-SM only)*
* Create and restore backups during testing *(LXC-SM only)*

Start working with a cloud project for Delectable Bonsai, a (fake) company that's using Liferay Cloud's platform to build a reliable, customized experience for their maple syrup business.

Whether you're working with LXC or LXC-SM, get started by [setting up your cloud project](./cloud-administrator/setting-up-your-cloud-project.md).

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Setting Up Your Cloud Project
:link: ./cloud-administrator/setting-up-your-cloud-project.md

Learn how to get started using the Cloud console with LXC or LXC-SM.
:::

:::{grid-item-card}  Deploying Code to LXC
:link: ./cloud-administrator/deploying-code-to-lxc.md

Learn how to deploy and work with a client extension project in LXC.
:::

:::{grid-item-card}  Cloud Configuration
:link: ./cloud-administrator/cloud-configuration.md

Learn how to configure your services and Liferay instance in LXC-SM.
:::

:::{grid-item-card}  Cloud Development Lifecycle
:link: ./cloud-administrator/cloud-development-lifecycle.md

Learn how to work with the Cloud console in LXC-SM as a developer.
:::
::::
