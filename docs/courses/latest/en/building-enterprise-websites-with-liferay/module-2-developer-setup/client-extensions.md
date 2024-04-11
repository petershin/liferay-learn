---
uuid: 6bab07ab-da1a-4238-ac47-eb4183f4fdb9
---
# Client Extensions

Client Extensions are the recommended way to customize and extend Liferay. You can deploy client extensions to any Liferay environment, whether it's Liferay SaaS, Liferay PaaS, or Liferay Self-Hosted. While other extensions like OSGi modules or themes modify or add functionality directly to Liferay, client extensions interface only with Liferay's APIs, which makes them more flexible and easier to deploy after version changes.

<!--IMAGE: diagram of how Client Extensions interface with Liferay-->

You can use your Liferay Workspace to develop and deploy your own client extensions, which you will explore further in [Module 10 - Building Applications](../module-10-building-applications.md).

## Types of Client Extensions

There are four types of Liferay client extensions:

1. **Batch** client extensions provide data entities to your Liferay instance, such as object or workflow definitions.

1. **Frontend** client extensions provide (typically static) resources to display on specific pages.

1. **Microservice** client extensions provide API endpoints that can be triggered from within Liferay to run functions outside of Liferay.

1. **Configuration** client extensions provide specific configurations to change functionality within your Liferay instance. For example, you can use an OAuth user agent client extension to authenticate other client extensions.

## Client Extension Projects

Within your Liferay Workspace, you can implement a client extension project under `[workspace-root]/client-extensions`. In this project directory, the `client-extension.yaml` file defines the project's extensions. Building the project will produce a deployable `*.zip` archive called a Liferay Universal File Format Archive (LUFFA).

Client extensions can be grouped in a single project and deployed together as a unit. You can only group client extensions together in these ways:

- Client extensions of the same type
- Configuration client extensions with batch client extensions
- Configuration client extensions with frontend client extensions
- Configuration client extensions with microservice client extensions

<!--IMAGE: diagram showing valid groupings for client extensions may be helpful here-->

Client extension projects are built with Gradle and deployed with the Liferay Cloud CLI, which you installed in the previous lesson, [Liferay Workspace](./liferay-workspace.md).

Congratulations! You've completed Module 2 - Developer Setup.

Up Next: [Module 3 - Deploying Liferay](../module-3-deploying-liferay.md)

## Additional Resources

[Client Extensions](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions)
