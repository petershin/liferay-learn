---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Reference
- Liferay PaaS
uuid: 82bcaf14-42ec-400b-ad60-d5be361e2d20
---
# Understanding Service Stack Versions

The Liferay Cloud service stack represents the major version of all of the services in your Liferay Cloud environment. Each individual service may have a different minor version, but they all share the service stack version (e.g., version 5.x.x). New service stack versions generally introduce a variety of new features (such as the addition of ModSecurity and changes to the backup service in [version 5.x.x](./liferay-cloud-version-5-changes.md)).

The version of the Liferay Cloud service stack itself is indicated by the major version of your services' Docker images. This version is the last number that appears in the Docker image name.

For example, see this Docker image name for the `liferay` service:

```
liferaycloud/liferay-dxp:7.4-5.8.0
```

The version of this image is `5.8.0`. This indicates that the service stack for this environment is at version 5.x.x.

Any Liferay Cloud environment displays the version of its services' Docker images in various locations. You can check the service stack version of your environment by examining the number at the end of the displayed image name in any of these locations -- including the environment's _Overview_ or _Services_ pages, or each individual service's page.

![The first page you see after navigating to an environment is one page that shows you the version of your services.](./understanding-service-stack-versions/images/01.png)

## Verifying the Service Stack Version from the Repository

The version of each service is defined in the `image` property, within each service's `LCP.json` file, contained in the folder named after the service. For example, see this section of an `LCP.json` file for the `database` service:

```json
{
   "kind": "Deployment",
   "id": "database",
   "image": "liferaycloud/database:5.0.0",
}
```

In this example, the `image` property's value has a name ending in `5.0.0`, indicating that the service stack is at version 5.x.x.

!!! tip
    Upgrading your service stack to version `5.x.x` is recommended for access to the latest improvements.

## Related Topics

- [Liferay Cloud Project Changes in Version 5](./liferay-cloud-version-5-changes.md)
- [Liferay Cloud Project Changes in Version 4](./liferay-cloud-project-changes-in-version-4.md)
