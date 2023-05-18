---
uuid: 38f72d34-99ad-4e11-b28e-bf41850ee7c7
---
# Application Development

Liferay provides out-of-the-box features for building dynamic digital experiences on a unified platform. It also provides extensive tools for building custom solutions that enhance and adapt the platform to meet your business needs. Using objects, headless APIs, client extensions, and fragments, you can build and integrate custom applications seamlessly with Liferay's core features.

## Overview

This course covers the development paradigm for extending Liferay 7.4+. While lessons will focus on Liferay Experience Cloud (LXC), this content is applicable for LXC Self-Managed and Liferay DXP Self-Hosted as well.

```{note}
<!--Previously, application development involved deploying OSGi modules to modify and extend the core Liferay platform directly. While this method remains valid for Self-Managed and Self-Hosted options, it is not available for LXC. The 7.4+ development paradigm avoids making any changes to Liferay's core and does not deploy OSGI modules and portlets.-->
```

Here, we'll continue the story of Delectable Bonsai, a fictional B2B producer of maple syrup products that supplies distributors across the globe. Due to recent growth, Delectable Bonsai needs two custom solutions to streamline business processes and better serve customers:

1. A Distributor Application flow for receiving and approving distributors in a B2B context

1. A Ticketing System for customers to report issues and open requests

This course consists of four modules. The first three develop the Distributor Application using Liferay's low-code features. The fourth and final module uses more advanced features/client extensions<!--w/c--> to develop the Ticketing System.

By the end of this course, you'll create an onboarding flow that takes users from submitting an application to a new business account once approved.

<!-- 
```{note}
While the first three modules depend on Liferay's low-code capabilities, the fourth module uses Java and Javascript to build custom microservices and frontend elements.This course also provides code for making REST API calls. To use them, you must set up OAuth2 for your instance.
```
-->

## Learning Objectives

By the end of this course, you will know how to

* Use Liferay Objects to define and manage custom data structures that leverage Liferay's core frameworks, including headless APIs, permissions, and more.
* Use Liferay's page builder features to design experiences for creating and displaying object entries.
* Use microservice client extensions to provide back-end functionality to your solutions.
* Use front-end client extensions to build dynamic user experiences that integrate with object APIs.
* Promote custom applications from UAT/DEV to PRD environments.

The first step is modeling data structures for our applications. Ready?

[Let's Go!](./application-development/modeling-data-structures.md)
