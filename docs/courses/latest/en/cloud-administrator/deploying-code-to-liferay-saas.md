---
toc:
  - ./deploying-code-to-liferay-saas/deploying-and-managing-a-microservice-client-extension-project.md
  - ./deploying-code-to-liferay-saas/troubleshooting-a-microservice-in-the-cloud-console.md
uuid: 819aa6d5-2b61-4438-b0dc-b848e6a25c87
---

# Deploying Code to Liferay SaaS

Now that you've accessed and started using the Cloud console, you're ready to deploy a client extension project to your Liferay SaaS instance.

```{note}
This module requires a Liferay SaaS instance. If you only have a project on Liferay PaaS, skip ahead to [Cloud Configuration](./cloud-configuration.md).
```

With Liferay SaaS, you don't need to worry about configuring or maintaining the infrastructure outside of Liferay, so you can simply focus on using the tools within Liferay DXP to build and manage your sites. However, when Liferay's out-of-the-box tools aren't enough, you can use client extensions.

[Client extensions](https://learn.liferay.com/w/dxp/building-applications/client-extensions) are the comprehensive means of extending Liferay SaaS. You can deploy client extensions to [import batch data](https://learn.liferay.com/w/dxp/building-applications/client-extensions/batch-client-extensions), host [static front-end resources for your site](https://learn.liferay.com/w/dxp/building-applications/client-extensions/front-end-client-extensions), or even [integrate with custom microservices running in the cloud](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions). Your code and resources don't rely on any of Liferay's code, and you can focus on whatever you're trying to create.

Delectable Bonsai's developers want to build a new way to collect and keep track of customer feedback using Liferay's [objects](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects). In this module, you'll get acquainted with deploying client extensions by testing, modifying, and troubleshooting changes to an [object action client extension](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions/object-action-yaml-configuration-reference) to implement a simple counter in a microservice.

[Let's Go!](./deploying-code-to-liferay-saas/deploying-and-managing-a-microservice-client-extension-project.md)
