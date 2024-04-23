---
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
uuid: 66ccffe0-4789-476d-bc5b-b024ee57b0af
---
# Breaking Changes

Breaking changes in the Cloud platform are changes that break or alter existing functionality of the platform's console, services, or infrastructure. These changes can impact the way your services, configurations, or customizations (like scripts or client extensions) function.

Here is a list of breaking changes by service. As the Cloud platform changes and improves, we try our best to minimize these disruptions, but sometimes they are unavoidable.

See the [Liferay Cloud Announcements](https://help.liferay.com/hc/en-us/categories/360001192512) page the release notes including each breaking change's initial announcement.

## Changes to the Web Server Service

### Web Server Version 6.0.0

* **What Changed**: The container now runs as the `nginx` user, which does not have root-level access. This affects any scripts or configurations that require root permissions, which are no longer allowed. Additionally, the `nginx.pid` file is moved from `/var/run/` to `/tmp/`.
* **Why**: This change prevents possible security issues by limiting the web server container's user to only the necessary permissions. The `nginx.pid` file is moved to ensure continued access with reduced permissions.
* **Actions Needed**: Update your web server scripts and configurations to ensure they run correctly without root-level access. If you override `nginx.conf`, make sure it does not have a user declaration (since it's no longer required and may disrupt the service), and update all references to the `nginx.pid` file's location.

