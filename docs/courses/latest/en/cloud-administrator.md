---
toc:
- ./cloud-administrator/setting-up-your-cloud-project.md
- ./cloud-administrator/deploying-code-to-liferay-saas.md
- ./cloud-administrator/cloud-configuration.md
- ./cloud-administrator/cloud-development-lifecycle.md
uuid: f18aba0c-9da6-4057-a9df-0d610216d651
---
# Cloud Administrator

With Liferay Cloud you can build your website on a secure and reliable enterprise cloud platform. Two offerings are available:

* **Liferay SaaS**: Includes a Liferay DXP instance running on infrastructure provisioned and maintained by Liferay. Utilize out-of-the-box Liferay DXP features to build your site and deploy your own code or client extensions to achieve customizations, when necessary.

* **Liferay PaaS**: Includes a Liferay Cloud project where you directly control and configure each service in the cloud yourself, including Liferay DXP, the web server, database, and Elasticsearch server. You are responsible for maintaining and updating these services.

You'll learn how to

* Access the Cloud console, where you manage all of your work in the cloud
* Grant access to your other team members
* Use the Cloud CLI tool to deploy changes or customizations
* Deploy custom code projects
* Use the tools in the Cloud console to troubleshoot your changes
* Configure your cloud services, including clustering, automatic scaling (auto-scaling), and hotfixes *(Liferay PaaS only)*
* Automatically deploy builds for your cloud services *(Liferay PaaS only)*
* Create and restore backups during testing *(Liferay PaaS only)*

Start working with a cloud project for Delectable Bonsai, a (fake) company that's using Liferay Cloud's platform to build a reliable, customized experience for their maple syrup business.

Whether you're working with Liferay SaaS or PaaS, get started by [setting up your cloud project](./cloud-administrator/setting-up-your-cloud-project.md).

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Setting Up Your Cloud Project
:link: ./cloud-administrator/setting-up-your-cloud-project.md

Learn how to get started using the Cloud console with Liferay SaaS or PaaS.
:::

:::{grid-item-card}  Deploying Code to Liferay SaaS
:link: ./cloud-administrator/deploying-code-to-liferay-saas.md

Learn how to deploy and work with a client extension project in Liferay SaaS.
:::

:::{grid-item-card}  Cloud Configuration
:link: ./cloud-administrator/cloud-configuration.md

Learn how to configure your services and Liferay instance in Liferay PaaS.
:::

:::{grid-item-card}  Cloud Development Lifecycle
:link: ./cloud-administrator/cloud-development-lifecycle.md

Learn how to work with the Cloud console in Liferay PaaS as a developer.
:::
::::
