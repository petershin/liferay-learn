---
toc:
  - ./system-administration/installing-and-managing-apps.md
  - ./system-administration/file-storage.md
  - ./system-administration/configuring-liferay.md
  - ./system-administration/using-the-script-engine.md
  - ./system-administration/using-the-server-administration-panel.md
  - ./system-administration/data-integration.md
  - ./system-administration/audit-framework.md
  - ./system-administration/using-glowroot-with-liferay.md
uuid: 2d02b170-ad53-48b3-ad0b-b6a72444397e
taxonomy-category-names:
- Platform
- DXP Configuration
- Liferay Self-Hosted
- Liferay PaaS
---
# System Administration

Liferay is highly adaptable and customizable. You can configure multiple aspects of it in the system or instance scope. For an overview of the different settings and configurations you can use with Liferay, see [Configuring Liferay](./system-administration/configuring-liferay.md).

All files uploaded to Liferay DXP are stored in the instance’s designated [file store](./system-administration/file-storage.md). This includes files uploaded using Documents and Media, as well as those uploaded using applications that support file attachments (e.g., Message Boards). The file store can be hosted on the local machine, on a network mounted file system, in a database, or in the cloud.

You can use the out-of-the-box [server administration panel](./system-administration/using-the-server-administration-panel.md) to manage and monitor system memory usage, low-level properties, some third-party integrations, document repository migration, logging, scripting, mail server configuration, and portal shutdown. Liferay’s [audit framework](./system-administration/audit-framework.md) shows activities relating to users, user groups, organizations, roles, multi-factor authentication, and objects (definitions, fields, actions, layouts, relationships, validations, and views) on your instance.

Liferay provides a robust [script engine](./system-administration/using-the-script-engine.md) for executing Groovy scripts. You can execute scripts to perform maintenance tasks involving data cleanup, user maintenance operations, bulk Liferay API invocations, or even system level operations.

You can add all kinds of functionality to your DXP installation by purchasing and installing apps. Apps are available in the [Liferay Marketplace](./system-administration/installing-and-managing-apps.md), and tools such as the App Manager are also available to help you manage apps in your installation.

Liferay bundles [Glowroot](./system-administration/using-glowroot-with-liferay.md), the open source Java application monitoring tool. It displays helpful statistics about your system (e.g. server requests, errors, etc.) with minimal overhead. Use Glowroot to troubleshoot issues and analyze performance issues.