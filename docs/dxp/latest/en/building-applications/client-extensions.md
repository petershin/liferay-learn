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

Client extensions are a way to extend Liferay without using OSGi modules. You can deploy client extensions to any Liferay environment, whether you host it yourself or on Liferay Experience Cloud. They are also the primary way of customizing Liferay with Liferay Experience Cloud, together with built-in configurations like [Liferay objects](./objects.md).

While other types of Liferay extensions, such as [OSGi modules](../liferay-internals/fundamentals/module-projects.md) or [themes](../site-building/site-appearance/themes/introduction-to-themes.md), are powerful tools for customizing Liferay itself, client extensions avoid directly using or customizing Liferay code. This makes client extensions more robust and easier to apply to environments after an upgrade, since they do not depend on any specific version of Liferay. You can also develop using whatever programming languages or technologies are most familiar to you, because your client extensions run outside of Liferay and integrate with objects, with no extra code required to connect them.

![Client extensions provide the key customization capabilities needed to meet specific business requirements, without needing to modify Liferay itself.](./client-extensions/images/01.png)

With client extensions, you can

* Apply [custom JavaScript or CSS](#front-end-client-extensions) to your pages without needing to rely on any specific code in Liferay
* Embed applications hosted remotely into a [custom element](./client-extensions/front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) on a page in Liferay
* Simplify your process to apply programmatically the same configurations or objects to multiple environments, by [converting them into client extensions](#configuration-client-extensions)
* Call custom services or [functions](#microservice-client-extensions) running outside of Liferay, such as a REST endpoint, using the programming languages or technologies of your choice

## Types of Client Extensions

Client extensions integrate with [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md), so that you can use the available tools there to quickly develop and deploy them. Client extensions communicate with Liferay via [headless APIs](../headless-delivery/using-liferay-as-a-headless-platform.md).

Client extensions are broken into these technologies:

* [Front-end client extensions](#front-end-client-extensions)
* [Microservice client extensions](#microservice-client-extensions)
* [Configuration client extensions](#configuration-client-extensions)

### Front-end Client Extensions

Front-end client extensions provide your Liferay instance with resources that are displayed on specific pages. These include similar resources to those provided in [Liferay themes](link), or custom HTML elements. Most front-end client extensions provide *static resources* that are made available in your Liferay instance.

See [Front-end Client Extensions](./client-extensions/front-end-client-extensions.md) for more information on the specific types.

### Microservice Client Extensions

Microservice client extensions provide API endpoints that you can link various triggers within Liferay to, such as object or workflow actions. Once those action events call your API, you can run any function you want outside of Liferay as a separate *microservice*.

See [Microservice Client Extensions](./client-extensions/microservice-client-extensions.md) for more information on the specific types.

### Configuration Client Extensions

Configuration client extensions provide specific configurations that can change functionality within your Liferay instance.

They can also be used together with other client extensions, such as [microservice client extensions](#microservice-client-extensions). For example, use can use an OAuth user agent client extension to authenticate other client extensions to work with user-triggered action events from within Liferay.

See [Configuration Client Extensions](./client-extensions/configuration-client-extensions.md) for more information on the specific types.

## Additional Information

* [Working with Client Extensions](./client-extensions/working-with-client-extensions.md)
* [Front-end Client Extensions](./client-extensions/front-end-client-extensions.md)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)
