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

Release notes on the [Liferay Cloud Announcements](https://help.liferay.com/hc/en-us/categories/360001192512) page include each breaking change's initial announcement.

## Changes to the Web Server Service

### Web Server Version 6.0.0

- **What Changed**: The container now runs as the `nginx` user, which does not have root-level access. This affects scripts or configurations that require root permissions, which are no longer allowed. Additionally, the `nginx.pid` file is moved from `/var/run/` to `/tmp/`, HAProxy listens on port `8081` instead of `81`, and server blocks listen on port `8080` instead of `80`.

- **Why**: This change prevents possible security issues by limiting the web server container's user to only the necessary permissions. The `nginx.pid` file is moved to ensure continued access with reduced permissions. The HAProxy and server block ports changed because non-root users cannot listen on ports below a specific range by default.

- **Actions Needed**: Update your web server scripts and configurations to ensure they run correctly without root-level access. If you override `nginx.conf`, make sure it does not have a user declaration (since it's no longer required and may disrupt the service), and update all references to the `nginx.pid` file's location. If you've customized logic involving interaction with HAProxy (e.g., in `liferay.conf` or `nginx.conf`), replace any reference to port `81` with `8081`. If you have a custom server block, include a listen directive:

  ```
  listen 80;
  ```