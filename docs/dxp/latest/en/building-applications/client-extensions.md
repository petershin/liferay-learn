# Introduction to Client Extensions

Client extensions are a flexible and specially tailored means of extending or adding functionality to Liferay. You can deploy your client extensions to any Liferay environment, whether you are hosting it yourself or on Liferay Experience Cloud, without having to make any changes to your code. They are also the main way of extending Liferay functionality with Liferay Experience Cloud.

While other types of Liferay extensions, such as [OSGi modules](../liferay-internals/fundamentals/module-projects.md) or [themes](../site-building/site-appearance/themes/introduction-to-themes.md), are powerful tools for customizing Liferay itself, client extensions avoid directly using or customizing Liferay code. This makes client extensions more robust and simpler to apply to environments after an upgrade, since they do not depend on any specific version of the code.

With client extensions, you can:

* Apply [custom JavaScript or CSS](#browser-based-client-extensions) to your pages without needing to rely on any specific code in Liferay
* Embed applications hosted remotely into a [custom element](link to custom element tutorial) on a page in Liferay
* Simplify your process to programmatically apply the same configurations to multiple environments, by [converting them into client extensions](#configuration-as-code)
* Call [custom services](#custom-service-client-extensions) or [functions](#lambda-client-extensions) running outside of Liferay and using any programming languages or technologies of your choice for [ any tasks ]

<!-- Add some sort of diagram maybe, to show the critical distinction between client extensions and other forms of extensions? I'm not sure the existing diagrams we have currently really demonstrate this (but also not sure if there is a clearer way to do so) -->

## Types of Client Extensions

Client extensions integrate with the [Liferay workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md), so that you can use the available tools there to quickly develop and deploy them. Client extensions communicate with Liferay via [headless APIs](../headless-delivery/using-liferay-as-a-headless-platform.md).

These types of client extensions are available for extending Liferay's appearance and functionality:

* [Browser-Based Client Extensions](#browser-based-client-extensions)
* [Configuration as Code](#configuration-as-code)
* [Scheduler Client Extensions](#scheduler-client-extensions)
* [Data Connector Client Extensions](#data-connector-client-extensions)
* [Lambda Client Extensions](#lambda-client-extensions)
* [Custom Service Client Extensions](#custom-service-client-extensions)

### Browser-Based Client Extensions

Browser-based client extensions are hosted on a CDN when they are deployed. Examples of browser-based client extensions include a specific CSS layout, a click-to-chat feature, or a custom shopping cart display.

* **JavaScript**: JavaScript client extensions can apply globally or within a specific theme.

* **CSS**: CSS client extensions can apply globally or within a specific theme.

* **Favicon**: Client extensions can deploy a favicon for a specific theme.

### Configuration as Code

```{warning}
Configuration client extensions are currently a **beta feature** in Liferay 7.4. They are available to use, but the features available may be temporarily limited.
```

Configurations in Liferay can also be used as a type of client extension. In Liferay 7.4, configurations (as well as custom data models) can be easily exported and imported into other environments as client extensions. This allows you to simplify the process of configuring multiple environments at once, implementing them as a client extension and deploying to any applicable environemnts in a simplified workflow, without needing a script or custom code to push the changes.

<!-- Why are we also lumping in data models and APIs under "configurations" in this type? Are they also actually types of configurations? -->

### Scheduler Client Extensions

```{warning}
Scheduler client extensions are currently a **beta feature** in Liferay 7.4. They are available to use, but the features available may be temporarily limited.
```

Scheduler client extensions allow you to configure jobs to execute on scheduled intervals, that you can configure with flexible Cron expressions. You can deploy custom code with it to run on these intervals, or to synchronize data with Liferay using [data connector client extensions](#data-connector-client-extensions) or external APIs, such as [Salesforce](https://www.salesforce.com).

<!-- If you are using a scheduler client extension (not necessarily with a data connector), then what is the difference between using this and a lambda client extension? Is the code execution different somehow? Does the scheduler type have more flexibility than objects for the schedules? -->

### Data Connector Client Extensions

```{warning}
Data connector client extensions are currently a **beta feature** in Liferay 7.4. They are available to use, but the features available may be temporarily limited.
```

Use data connector client extensions to import data into Liferay. These are in the forms of [Liferay objects](./objects.md). These are generally used in conjunction with [scheduler client extensions](#scheduler-client-extensions) to synchronize data on regular, scheduled intervals.

<!-- Is this different from deploying object configurations, i.e. "configurations as code"? Not much information available on this type. -->

### Lambda Client Extensions

```{warning}
Lambda client extensions are currently a **beta feature** in Liferay 7.4. They are available to use, but the features available may be temporarily limited.
```

You can use lambda client extensions for special needs that require executing custom code. These client extensions execute custom code outside of Liferay. This allows you to implement custom solutions for specialized functions without needing to implement an OSGi module or model listener.

Liferay triggers the execution of this code via [objects](./objects.md); with a lambda client extension deployed, you can create objects that call on your client extension's function as an available action, and customize the triggers as needed. In Liferay Experience Cloud, although the code is executed outside of Liferay, the code is executed alongside Liferay in the same environment, eliminating the need for your own server for it.

<!-- How will this work for local or self-hosted environments? -->

### Custom Service Client Extensions

For even more complex use cases, you can use a client extension that works as its own service in Liferay Experience Cloud. You supply your own code, and then deploy it to run as a service that functions within the Cloud's network, with its own virtual server allocated to it. Being hosted in the same Cloud network allows your own service access to your other services while also benefiting from the Cloud's built-in security features.

Deploying custom services gives you much more power to implement customizations that benefit from behaving as a separate service. For example, you could implement your own authentication server, or a custom application written in a completely different language that interfaces with Liferay using its [headless APIs](../headless-delivery/using-liferay-as-a-headless-platform.md). Custom services are also useful for integrating separate applications that involve interfacing with users.

<!-- Is there any functional difference between a "custom service client extension" and what customers are already able to do with custom services on LXC SM? Is there a meaningful distinction to client extensions being termed "microservices"? To that end, is it safe to directly link to our existing documentation on custom services now if so, or is there any more work to be done on its presentation as a client extension? -->

## Deploying Client Extensions

Client Extensions provide a consistent development experience across different platforms for Liferay, using the [Liferay workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md). You can develop extensions in a project for one environment and then easily deploy them to any other environment, regardless of how you are using Liferay.

The only difference is how you deploy your extensions once they are ready, which depends on how you use Liferay:

* **Liferay Experience Cloud**: Deploy client extensions to Liferay Experience Cloud using the [CLI Tool](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line-tool.html)'s `lcp deploy` command, specifying the environment to deploy to.

* **Liferay Experience Cloud (Self-Managed)**: If you manage your own Liferay Cloud environments, then deploy your client extensions along with any other customizations in a CI Build, following the [Liferay Cloud development workflow](https://learn.liferay.com/dxp-cloud/latest/en/build-and-deploy/deploying-changes-via-the-dxp-cloud-console.html).

* **Liferay DXP (Self-Hosted)**: If you use your own hosting solution, then you can deploy your client extensions using similar tools for deploying other kinds of customizations, such as `gradle deploy`.

<!-- TODO: link to an article going over the general development workflow/experience for more detail -->

## Additional Information

* [Deploying Your First Client Extension](link)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)
