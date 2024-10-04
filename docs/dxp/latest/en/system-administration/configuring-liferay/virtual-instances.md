---
toc:
  - ./virtual-instances/adding-a-virtual-instance.md
  - ./virtual-instances/instance-configuration.md
  - ./virtual-instances/users.md
  - ./virtual-instances/user-authentication.md
  - ./virtual-instances/email-settings.md
  - ./virtual-instances/analytics.md
  - ./virtual-instances/localization.md
  - ./virtual-instances/infrastructure.md
  - ./virtual-instances/third-party.md
  - ./virtual-instances/redirect-urls.md
uuid: 30c545cd-892f-4b63-8120-d611f16d6689
taxonomy-category-names:
- Platform
- DXP Configuration
- Liferay Self-Hosted
- Liferay PaaS
---

# Virtual Instances

Liferay DXP can host multiple "portals" on one installation. These are called *virtual instances*. Each virtual instance has completely separate data and configurations. Each is accessed via a unique domain name and for all intents and purposes, is a separate Liferay-based implementation that shares an installation with additional instances.

Configuration of a Liferay DXP system happens at different [scopes](./understanding-configuration-scope.md). Configuration at the virtual instance scope is the next most broad scope after the system scope.

!!! important
    The system scope is the highest level configuration scope. All virtual instances are impacted by configuration done at this scope. The *instance* scope applies only to one particular virtual instance. If your installation contains only one virtual instance, there's no practical difference between a system-scoped configuration and a virtual instance-scoped configuration. Both types of configuration apply throughout your system.

Perhaps you already have a server hosting a Liferay DXP installation and a database. It has many [Users](../../users-and-permissions/users.md), [Sites](../../site-building.md), and specific [instance settings](./virtual-instances/instance-configuration.md). If you require a second similar installation, then adding a virtual instance might be right for you.

Because of the unique domain name, visitors are directed to the correct virtual instance. Because virtual instances share an application server and OSGi container, they also share these customizations:

-  All custom code you've deployed
-  [System-scoped configurations](./system-settings.md) (e.g., `.config` files and changes made in *Control Panel* &rarr; *Configuration* &rarr; *System Settings*).
-  Application server configuration.

You can add and manage virtual instances in *Control Panel* &rarr; *Configuration* &rarr; *Virtual Instances*.

![Add and manage virtual instances of Liferay in the Control Panel's Virtual Instances section.](./virtual-instances/images/01.png)

You can configure an instance in *Control Panel* &rarr; *Configuration* &rarr; *Instance Settings*. The Instance Settings are organized into three sections:

- Platform
- Security
- Content and Data

Here you can learn about the Platform settings.

![Instance Settings has several Platform categories.](./virtual-instances/images/02.png)

## Related Topics

- [Security](../../installation-and-upgrades/securing-liferay.md)
- [Search](../../using-search.md)
- [System Settings](./system-settings.md)