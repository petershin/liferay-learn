---
toc:
  - ./upgrading-liferay/upgrade-basics.md
  - ./upgrading-liferay/migrating-configurations-and-properties.md
  - ./upgrading-liferay/upgrade-stability-and-performance.md
  - ./upgrading-liferay/other-upgrade-scenarios.md
  - ./upgrading-liferay/upgrading-custom-development.md
  - ./upgrading-liferay/reference.md
uuid: ef6191ee-72fe-4584-bb7b-76204506d81f
---
# Upgrading Liferay

Liferay is continuously being enhanced with new features as new versions are released. To access these features in your current project, you must upgrade your Liferay instance to a newer version. Upgrading is recommended in most cases as new Liferay versions have better performance, more tools and utility, and patch security vulnerabilities.

Liferay's tools and instructions facilitate upgrading DXP and Portal environments safely and quickly. There are multiple ways to upgrade Liferay, so the best solution depends on multiple factors: if the environment is [clustered](./maintaining-a-liferay-installation/maintaining-clustered-installations.md) (or [sharded](./upgrading-liferay/other-upgrade-scenarios/upgrading-a-sharded-environment.md)), the size of the data set, or the presence and extent of [custom development](./upgrading-liferay/upgrading-custom-development.md). See [Upgrade Basics](./upgrading-liferay/upgrade-basics.md) for more information.

When upgrading a Liferay instance, there are best practices to ensuring the process happens quickly and smoothly. See [Upgrade Stability and Performance](./upgrading-liferay/upgrade-stability-and-performance.md) to learn how to assure success when performing an upgrade. Also make sure to [migrate all configurations and properties](./upgrading-liferay/migrating-configurations-and-properties.md) to the updated DXP or Portal instance.

When working with a new Liferay version, there are important changes to remember. Things like [breaking changes](../liferay-development/liferay-internals/reference/7-4-breaking-changes.md), [deprecations](./upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md), and [renamed language keys](./upgrading-liferay/reference/renamed-language-keys.md) may cause problems if not properly addressed. [Reference](./upgrading-liferay/reference.md) contains a comprehensive list of these changes to address when migrating an existing project to a new version.