---
toc:
  - ./client-extensions/working-with-client-extensions.md
  - ./client-extensions/packaging-client-extensions.md
uuid: 33141e0f-9fc0-4bcb-ae34-536c157e0198
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---

# Client Extensions

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay SaaS`
{bdg-warning}`Liferay PaaS`

{bdg-secondary}`Liferay 7.4`

When you want to extend Liferay, either by modifying its look and feel or by calling functions outside of Liferay, you should use a client extension (CX). Client extensions extend Liferay without having to deploy code directly to Liferay. You can deploy client extensions to any Liferay environment, whether you host it yourself or on Liferay Cloud. They are also the primary way to customize Liferay with Liferay Cloud, together with built-in configurations like [Liferay objects](./objects.md).

While other Liferay extensions like [OSGi modules](../liferay-internals/fundamentals/module-projects.md) or [themes](./customizing-liferays-look-and-feel/themes.md) modify or add functionality to Liferay itself, client extensions interface only with Liferay's APIs. This loose coupling makes client extensions more flexible and easier to apply to environments after an upgrade, since they depend only on APIs that rarely change between versions. You can also create client extensions using whatever programming languages or technologies you wish, because your client extensions run outside of Liferay and integrate with objects, with no extra code required to connect them.

![Client extensions provide the key customization capabilities needed to meet specific business requirements, without modifying Liferay itself.](./client-extensions/images/01.png)

With client extensions, you can

* Apply [custom JavaScript or CSS](#frontend-client-extensions), while avoiding dependencies on Liferay's code
* Embed applications hosted remotely into a [custom element](./integrating-external-applications.md) on a Liferay page
* Apply the same configurations or objects to multiple environments, by [converting them into client extensions](#configuration-client-extensions)
* Call custom services or [functions](#microservice-client-extensions) running outside of Liferay (e.g., a REST endpoint), using the programming languages or technologies of your choice

## Types of Client Extensions

You use [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md) to develop and deploy Client extensions. Client extensions communicate with Liferay via [headless APIs](../headless-delivery/using-liferay-as-a-headless-platform.md).

These are the classifications of client extensions:

* [Frontend client extensions](#frontend-client-extensions)
* [Batch client extensions](#batch-client-extensions)
* [Configuration client extensions](#configuration-client-extensions)
* [Microservice client extensions](#microservice-client-extensions)
* [Batch client extensions](#batch-client-extensions)

### Frontend Client Extensions

Frontend client extensions provide resources to display on specific pages. Theme resources or custom HTML elements can now be provided in client extensions. Most frontend client extensions provide *static resources* to your Liferay instance.

See [Customizing Liferay's Look and Feel](./customizing-liferays-look-and-feel.md) for more information on the specific types.

### Configuration Client Extensions

Configuration client extensions provide specific configurations to change functionality within your Liferay instance.

They can be used together with other client extensions, such as [microservice client extensions](#microservice-client-extensions). For example, you can use an OAuth user agent client extension to authenticate client extensions that work with user-triggered action events.

See [Configuration As Code](./configuration-as-code.md) for more information on the specific types.

### Microservice Client Extensions

Microservice client extensions provide API endpoints to trigger within Liferay (e.g., object or workflow actions). Once those action events call your API, you can run any function you want outside of Liferay as a separate *microservice*.

See [Integrating Microservices](./integrating-microservices.md) for more information on the specific types.

### Batch Client Extensions

{bdg-link-primary}`[Dev Feature](../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags)`

Batch client extensions provide data entities to your Liferay instance, such as [object definitions](./objects/creating-and-managing-objects/exporting-and-importing-object-definitions.md) or [workflow definitions](../process-automation/workflow/introduction-to-workflow.md). Create batch client extensions by exporting data via the [batch engine framework](../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md).

See [Importing and Exporting Data](./importing-exporting-data.md) for more information on this specific type.

## Where to Go From Here

To get a soft, step-by-step tour of how to write client extensions, follow the learning path below, which starts you off with the easiest client extension to implement, and then moves on from there. 

1. [Modifying the Favico](./customizing-liferays-look-and-feel/using-a-theme-favicon-client-extension.md)
1. [Adding CSS](./customizing-liferays-look-and-feel/using-a-css-client-extension.md)
1. [Modifying a Theme](./customizing-liferays-look-and-feel/using-a-theme-css-client-extension.md)
1. [Adding an iFrame](./integrating-external-applications/using-an-iframe-client-extension.md)
1. [Creating a Basic Custom Element](./integrating-external-applications/creating-a-basic-custom-element.md)
1. [Routes with Custom Elements](./integrating-external-applications/using-routes-with-custom-elements.md)

When finished with that, you may want to see how to create a full-blown application using objects and client extensions: 

1. [Building a Time Off Requester](./building-applications/building-a-time-off-requester.md) 
1. [Building a Ticketing Application](./building-applications/building-a-custom-ticketing-system.md)

## Related Topics

* [Working with Client Extensions](./client-extensions/working-with-client-extensions.md)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)
