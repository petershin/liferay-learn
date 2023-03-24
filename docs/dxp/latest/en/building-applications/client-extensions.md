---
toc:
  - ./client-extensions/working-with-client-extensions.md
  - ./client-extensions/front-end-client-extensions.md
  - ./client-extensions/microservice-client-extensions.md
  - ./client-extensions/configuration-client-extensions.md
uuid: 33141e0f-9fc0-4bcb-ae34-536c157e0198
---
# Client Extensions

```{toctree}
:maxdepth: 4

client-extensions/working-with-client-extensions.md
client-extensions/front-end-client-extensions.md
client-extensions/microservice-client-extensions.md
client-extensions/configuration-client-extensions.md
```

{bdg-secondary}`Available Liferay 7.4 U45+/GA45+`

Client extensions extend Liferay without using OSGi modules. You can deploy client extensions to any Liferay environment, whether you host it yourself or on Liferay Experience Cloud. They are also the primary way to customize Liferay with Liferay Experience Cloud, together with built-in configurations like [Liferay objects](./objects.md).

While other Liferay extensions like [OSGi modules](../liferay-internals/fundamentals/module-projects.md) or [themes](../site-building/site-appearance/themes/introduction-to-themes.md) modify or add functionality to Liferay itself, client extensions interface only with Liferay's APIs. This loose coupling makes client extensions more flexible and easier to apply to environments after an upgrade, since they depend only on APIs, which rarely change between versions. You can also create client extensions using whatever programming languages or technologies you wish, because your client extensions run outside of Liferay and integrate with objects, with no extra code required to connect them.

![Client extensions provide the key customization capabilities needed to meet specific business requirements, without modifying Liferay itself.](./client-extensions/images/01.png)

With client extensions, you can

* Apply [custom JavaScript or CSS](#front-end-client-extensions), while avoiding dependencies on Liferay's code
* Embed applications hosted remotely into a [custom element](./client-extensions/front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) on a Liferay page
* Apply the same configurations or objects to multiple environments, by [converting them into client extensions](#configuration-client-extensions)
* Call custom services or [functions](#microservice-client-extensions) running outside of Liferay (e.g., a REST endpoint), using the programming languages or technologies of your choice

## Types of Client Extensions

You use [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md) to develop and deploy Client extensions. Client extensions communicate with Liferay via [headless APIs](../headless-delivery/using-liferay-as-a-headless-platform.md).

These are the classifications of client extensions:

* [Front-end client extensions](#front-end-client-extensions)
* [Microservice client extensions](#microservice-client-extensions)
* [Configuration client extensions](#configuration-client-extensions)
* [Batch client extensions](#batch-client-extensions)

### Front-end Client Extensions

Front-end client extensions provide resources to display on specific pages. Theme resources or custom HTML elements can now be provided in client extensions. Most front-end client extensions provide *static resources* to your Liferay instance.

See [Front-end Client Extensions](./client-extensions/front-end-client-extensions.md) for more information on the specific types.

### Microservice Client Extensions

Microservice client extensions provide API endpoints to trigger within Liferay (e.g., object or workflow actions). Once those action events call your API, you can run any function you want outside of Liferay as a separate *microservice*.

See [Microservice Client Extensions](./client-extensions/microservice-client-extensions.md) for more information on the specific types.

### Configuration Client Extensions

Configuration client extensions provide specific configurations to change functionality within your Liferay instance.

They can be used together with other client extensions, such as [microservice client extensions](#microservice-client-extensions). For example, you can use an OAuth user agent client extension to authenticate client extensions that work with user-triggered action events.

See [Configuration Client Extensions](./client-extensions/configuration-client-extensions.md) for more information on the specific types.

### Batch Client Extensions

Batch client extensions provide data entities to your Liferay instance. From Object Definition and Workflow Definition all the way to initilizing an entire site. The data is first exported using the Batch Engine Framework (hence the name.) Any entities supported by the Batch Engine are supported in batch client extensions.

See [Batch Client Extensions](./client-extensions/batch-client-extensions.md) for more information on this specific type.

## Additional Information

* [Working with Client Extensions](./client-extensions/working-with-client-extensions.md)
* [Front-end Client Extensions](./client-extensions/front-end-client-extensions.md)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)
