---
toc:
  - ./platform-services/backup-service.md
  - ./platform-services/database-service.md
  - ./platform-services/search-service.md
  - ./platform-services/web-server-service.md
  - ./platform-services/continuous-integration.md
  - ./platform-services/using-a-custom-service.md
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
uuid: 8dac09ff-0f0e-4e07-93d1-d69feb1d8481
---

# Platform Services

In Liferay Cloud, the processes necessary to host and maintain a site are run by *platform services*. Each service corresponds to a part of what is necessary to keep your application up and running.

## Backup Service

Maintaining regular backups is vital to protecting your project's data. The backup service stores iterations of environment data that can be used to restore your environments if needed. These backups include the Liferay DXP Database and the full contents of the `[LIFERAY_HOME]/data` folder. See [Backup Service](./platform-services/backup-service.md) for more information.

## Database Service

The database service is a proxy in Liferay Cloud to the Cloud SQL service in the Google Cloud Platform where the database itself resides. The database service provides tools for managing and monitoring the Cloud SQL instances. It simplifies the setup, operation, and scaling of your applications. It's a private service inside your application environment and it can only communicate with your other services, not the public internet. See [Database Service](./platform-services/database-service.md) for more information.

## Liferay Service

The Liferay service is the heartbeat of any project in Liferay Cloud (SaaS or PaaS). It runs the application's Liferay DXP instance and interacts with other services like the web server, Elasticsearch, and database. See [Using the Liferay DXP Service](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service.md) for more information.

## Search Service

The Elasticsearch service is the text search engine for your Liferay DXP application. It's a private service that only communicates with the other services in your application, not with the outside internet. See [Search Service](./platform-services/search-service.md) for more information.

## Web Server Service

The Nginx web server functions as a gateway from the open internet to your Liferay Cloud services. It handles all traffic from your users and acts as a high-performance web server. See [Web Server Service (Nginx)](./platform-services/web-server-service.md) for more information.

## CI Service

Liferay Cloud uses [Jenkins](https://jenkins.io/) to power its continuous integration infrastructure service. When you send a pull request or push a commit to one of your pre-configured GitHub branches, an automatic and configurable build is triggered. See [Continuous Integration](./platform-services/continuous-integration.md) for more information.

## Custom Services

You can also create and deploy a custom service to run any new processes within the Liferay Cloud infrastructure. See [Using a Custom Service](./platform-services/using-a-custom-service.md) for more information.