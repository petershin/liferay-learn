---
uuid: 5a6706c2-05f9-4d7c-8b41-a8f69516694d
---
# Liferay Deployment Options

Liferay SaaS, Liferay PaaS, and Liferay Self-Hosted are available as different deployment options. Clarity considers the advantages and disadvantages of each approach.

At a high level:

* Liferay SaaS - All installation, maintenance, backups, upgrades, etc. are handled by Liferay.
* Liferay PaaS - Have Liferay manage your cloud infrastructure while keeping control over your database, file storage, backups, etc.
* Liferay Self-Hosted - Have full control and ownership of all aspects of deployment and maintenance of Liferay.

## Liferay SaaS

In Liferay SaaS, the cloud infrastructure and Liferay DXP application is managed for you, so you can focus on what matters to your business. It is the fastest way to get started with Liferay. No need to worry about setting up an application server or database. Begin working with Liferay's out-of-the-box features immediately.

After sign up, you'll receive an administrator login to your Liferay instance, as well as a login to the Liferay cloud console. If customization is required, custom development is still available through [client extensions](https://learn.liferay.com/w/dxp/building-applications/client-extensions). Client extensions can be applied through the cloud console.

With Liferay SaaS, backups and upgrades are managed for you. There is no need to update your environment or patch previous releases. You can rest assured that your Liferay environment will be up-to-date with the latest releases.

## Liferay PaaS

With Liferay PaaS, let Liferay handle the cloud infrastructure while you still maintain control of the different web services. You are responsible for configuring the Liferay instance, the database, file storage, and search. Configuration and maintenance is all done through the cloud console and your GitHub repository.

After sign up, you'll receive a login to the Liferay cloud console as well as an invitation to Liferay's `dxpcloud` GitHub repository. The GitHub repository contains templates to use for configuring Liferay and other services. Once configured and deployed, log in to the cloud console to monitor Liferay and the different web services.

Custom development is available through the use of client extensions. 

To upgrade in Liferay PaaS, perform upgrades locally on your database backup and file storage backup. The new backups must be uploaded in the Liferay cloud console as new backups.

## Liferay Self-Hosted

With the self-hosted approach, Liferay can be deployed on any [supported application server](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix#application-server). The Tomcat bundle includes the Apache Tomcat application server with Liferay pre-deployed. It is a quick and easy way to install and deploy Liferay.

With this approach, you are responsible to setup and maintain your application server, file storage, and database. Backups and upgrade are also your responsibility. Download new versions of Liferay and use Liferay's upgrade tools to upgrade your file stroage and database.

Next: [Liferay SaaS and Clarity](./liferay-saas-and-clarity.md)
