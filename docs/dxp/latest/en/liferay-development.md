---
toc:
  - ./liferay-development/customizing-liferays-look-and-feel.md
  - ./liferay-development/integrating-external-applications.md
  - ./liferay-development/configuration-as-code.md
  - ./liferay-development/integrating-microservices.md
  - ./liferay-development/importing-exporting-data.md
  - ./liferay-development/building-applications.md
  - ./liferay-development/objects.md
  - ./liferay-development/client-extensions.md
  - ./liferay-development/tooling.md
  - ./headless-delivery/apis-with-rest-builder.md
  - ./liferay-development/core-frameworks.md
  - ./liferay-development/liferay-internals.md
  - ./liferay-development/data-sets.md
  - ./liferay-development/marketplace.md
  - ./liferay-development/reference.md
  - ./liferay-development/reference/app-builder.md
uuid: c7a717b4-ea54-4ca6-a16a-51f3e0f47d24
taxonomy-category-names:
- Development and Tooling
- Developer Tools
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Liferay Development

Liferay's development platform makes developers faster and more efficient by providing a baseline set of features to build upon. Rather than start from scratch, you can start instead with what Liferay provides and build on top of it. Development on Liferay comprises two main strategies: 

1. Customizing look and feel and existing functionality

1. Developing full-blown applications that take advantage of Liferay's user management, security, and other features

Most people want to do some amount of both those things. How you go about it depends on how you're deploying Liferay and what you're building. You should start with Liferay's low/no code options, that use such technology as [headless APIs](./headless-delivery/consuming-apis.md), [Objects](liferay-development/objects.md), and various kinds of [Client Extensions](./liferay-development/client-extensions.md). These are preferred because they're compatible in both Liferay Cloud and self-hosted scenarios, and they make upgrading easier by integrating only with public APIs that are unlikely to change. 

If, however, you must make a customization or build an application that cannot be done with those technologies, and you're self-hosted or on Liferay PaaS, you can follow a traditional development model by deploying code to Liferay itself to extend its functionality, customize its look and feel, or build an entirely new application. In this scenario, upgrades can be more challenging, as you have access to internal, Java-based Liferay APIs that could change from version to version. 

Whatever decision you make, Liferay's platform supports the developer and makes it easier and faster to get your application done. From point-and-click tools to CLI utilities, from a full-blown IDE to creating an object-based application in your browser, from headless APIs integrating with front-end frameworks to deployable applications based on Java standards, Liferay empowers developers of all stripes to create sites that look, feel, and perform exactly the way they want them to. 

Beyond that, Liferay also has a [Marketplace](./liferay-development/marketplace.md) of applications and customizations made available to anyone who wants to download them. Is your application or customization useful beyond your own organization? Consider publishing it on Marketplace and make it more widely available! 

To get started, check out the boxes below. For applications, you may want to start with [Objects](liferay-development/objects.md) and [Client Extensions](./liferay-development/client-extensions.md). For customization, read [Customizing Liferay's Look and Feel](./liferay-development/customizing-liferays-look-and-feel.md).