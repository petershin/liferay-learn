---
uuid: 6bab07ab-da1a-4238-ac47-eb4183f4fdb9
---
# Client Extensions

<!--TASK: Add Abstract-->

Liferay provides extensive out-of-the-box features for building custom solutions, including low-code capabilities that empower users to implement data structures, define complex business logic, and design user interfaces without writing code. While these features offer a high degree of flexibility, there may be times when you need to go beyond OOTB features to customize or extend the Liferay DXP to meet your unique requirements. For these circumstances, Liferay provides [client extensions](https://learn.liferay.com/w/dxp/liferay-development/client-extensions).

Client extensions are the go to solution for extending Liferay DXP, whether that's modifying its look and feel or adding custom functions. Essentially, client extensions are platform customizations that live outside the Liferay portal container. Unlike [OSGi plugins](../liferay-internals/fundamentals/module-projects.md) and [themes](./customizing-liferays-look-and-feel/themes.md) that modify or add functionality to Liferay itself, client extensions interface only with Liferay's APIs. This loose coupling makes them more flexible and easier to apply to environments after an upgrade, since they depend only on APIs that rarely change between versions. You can also create client extensions using whatever programming languages or technologies you wish, because they run outside of Liferay and integrate with objects, with no extra code required to connect them.

You can deploy client extensions to any Liferay environment, including Liferay SaaS, Liferay PaaS, and Liferay Self-Hosted.

<!--IMAGE: diagram of how Client Extensions interface with Liferay-->

Now let’s take a look at the kinds of client extensions that are currently available.

## Types of Client Extensions

There are four types of Liferay client extensions you can create:

* **Batch**: Batch client extensions provide data entities to your Liferay instance using headless batch endpoints, such as object and workflow definitions.

* **Frontend**: Frontend client extensions provide resources that affect Liferay's presentation layer. This includes custom CSS, JS, web components referencing external applications, and more.

* **Microservice**: Microservice client extensions are external applications that execute business logic in response to events in your Liferay instance. Examples include custom workflow actions, notifications, object actions, and validations.

* **Configuration**: Configuration client extensions set instance settings. For example, you can use an OAuth user agent client extension to authenticate other client extensions.

## Client Extension Projects

Within your Liferay Workspace, you can create client extension projects. These projects reside in the `[workspace-root]/client-extensions` folder. Each extension has its own sub-folder and includes a `client-extension.yaml` file that defines the project's extensions. Building projects with Gradle produces deployable `*.zip` archives called Liferay Universal File Format Archives (LUFFA).

You can group some client extensions in a single project and deploy them together as a unit. Here are the compatible combinations:

* Client extensions of the same type
* Configuration client extensions with batch client extensions
* Configuration client extensions with frontend client extensions
* Configuration client extensions with microservice client extensions

<!--IMAGE: diagram showing valid groupings for client extensions may be helpful here-->

The Clarity workspace for this training includes four client extension projects:

* `liferay-clarity-theme-favicon`
* `liferay-clarity-theme-css`
* `liferay-clarity-etc-spring-boot`
* `liferay-clarity-batch`

You'll use these client extensions throughout the course.

## Client Extensions vs Traditional OSGi Plugins

Traditionally, extending Liferay relies on creating and deploying custom OSGi plugins. These plugins are written in Java and can interact with Liferay's core services. While this method provides a powerful and comprehensive way to extend Liferay's functionalities, it has notable drawbacks.

* **Specialized Resources**: OSGi plugins require developers with Liferay expertise to build them safely and properly, which limits the pool of developer resources.

* **Increased Development Time**: Since they involve intricate Java development, OSGi plugins increase the time for delivering solutions.

* **Higher Risk of Breaking Changes**: Since they run within Liferay and can modify its core, OSGi plugins are susceptible to breaking changes in Liferay's APIs as updates are applied to the solution.

* **Deployment Restrictions**: Liferay SaaS does not support the deployment of custom OSGi plugins; they are only viable for Liferay Self-Hosted and Liferay PaaS deployments.

Generally speaking, OSGi plugins should only be used if your requirements are not satisfied by out-of-the-box features or client extensions. Client extensions provide a far more flexible development model and avoid drawbacks associated with traditional OSGi plugins. By separating customizations from the Liferay core, client extensions simplify updates and free you to build solutions using your preferred technologies or deployment strategy. These are just some of the benefits of this development model.

* **Simplified Upgrades and Maintenance**: Since client extension maintenance events are decoupled from Liferay, they won’t break when upgrading or updating Liferay and deployments can happen in any window. Also, since they are self-contained, one buggy extension won't effect the entire server.

* **Improved Stability**: Since they don't modify Liferay's core and us versioned headless APIs for integration, client extensions reduce the risk of breaking changes.

* **Reduced Learning Curve**: Client extensions reduce the need for specialized Liferay knowledge and empower developers to use their preferred technologies and frameworks.

* **Accelerated Development**: Due to their independence and flexibility, developers can enhance and iterate on client extensions much faster than OSGI Plugins.

* **Platform Deployment Support**: Client extensions support all of Liferay's deployment models (i.e., Self-Hosted, Liferay PaaS, and Liferay SaaS).

Client extensions should be your first choice when extending or customizing Liferay beyond its out-of-the-box capabilities. OSGi plugins should only be used for cases where Client Extensions cannot meet the needs of a business.

## Conclusion

Congratulations! You've completed Module 2: Developer Setup. Throughout this module, you set up a Liferay developer environment and explored the benefits of Liferay workspaces and client extensions.

In the next module, you'll learn about Liferay's deployment models.

Next Up: [Module 3: Deploying Liferay](../module-3-deploying-liferay.md)
