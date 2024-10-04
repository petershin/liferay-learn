---
toc:
  - ./installation-and-upgrades/activating-liferay-commerce-enterprise.md
  - ./installation-and-upgrades/upgrading-liferay-commerce.md
  - ./installation-and-upgrades/maintenance-versions.md
  - ./installation-and-upgrades/3-0-release-notes.md
  - ./installation-and-upgrades/3-0-breaking-changes.md
  - ./installation-and-upgrades/4-0-breaking-changes.md
  - ./installation-and-upgrades/installing-commerce-2-1-and-below.md
uuid: 0ad5f4ec-341f-4ebe-b828-39d1f4cb1b39
taxonomy-category-names:
- DXP Self-Hosted Installation, Maintenance, and Administration
- Commerce
- Liferay Self-Hosted
- Liferay PaaS
---
# Installation and Upgrades

{bdg-secondary}`Liferay DXP 7.3 and Below`

Liferay Commerce is a digital commerce platform built on Liferay DXP. See the prerequisites and available options for installing, deploying, and maintaining Liferay Commerce.

!!! important
    For Liferay DXP 7.4 GA1+, all Commerce modules are enabled by default and ready for use. There's no separate installation required. See [Activating Liferay Commerce Enterprise](./installation-and-upgrades/activating-liferay-commerce-enterprise.md) for more information.

## Prerequisites

For an optimal installation experience, please review the compatibility matrix and related installation material before starting.

* [Liferay DXP 7.3 and Commerce 3.0 Compatibility Matrix](https://help.liferay.com/hc/en-us/articles/360049238151) for a list of supported technologies.

## Liferay Commerce 3.0 and Below

Liferay Commerce 3.0 comes bundled with Liferay Portal 7.3 CE GA6 and Liferay DXP 7.3 GA1. The Community Edition comes bundled with a basic version of Commerce, while the Enterprise Edition comes with a full featured Enterprise Commerce. Both CE and Enterprise versions are available as Docker images and downloadable bundles:

| Installation Method                                                                                                       | Purpose                                                                                                                     |
| :------------------------------------------------------------------------------------------------------------------------ | :-------------------------------------------------------------------------------------------------------------------------- |
| [Docker image](https://learn.liferay.com/w/dxp/getting-started/starting-with-a-docker-image#get-started-with-liferay)     | Getting started with a Docker image is the fastest way to begin touring Liferay Commerce                                    |
| [Bundle](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/installing-a-liferay-tomcat-bundle) | Liferay Commerce pre-bundled with an application server. The most common way to get started running a Liferay installation. |

Liferay Portal bundles and images require no additional, Commerce-specific installation steps. Basic Commerce features come activated and can be used immediately on startup.

In DXP installations, both basic and enterprise Commerce modules are deactivated by default and require activation for use. Once both DXP and Commerce licenses are deployed and validated, all Commerce modules are started and become immediately available; no server restart is required. See [Activating Liferay Commerce Enterprise](./installation-and-upgrades/activating-liferay-commerce-enterprise.md) to learn more.

## Maintaining Liferay Commerce

Periodic maintenance updates and product upgrades are available to ensure and enhance the quality of your experience with Liferay Commerce. See the following articles to learn more:

* [Maintenance Versions](./installation-and-upgrades/maintenance-versions.md)
* [Upgrading Liferay Commerce](./installation-and-upgrades/upgrading-liferay-commerce.md)