# Application Development

Liferay provides out-of-the-box features for building dynamic digital experiences on a unified platform. It also provides extensive tools for building custom solutions that enhance and adapt the platform to meet your business needs. Using objects, headless APIs, client extensions, and fragments, you can build and integrate custom applications seamlessly with Liferay's core features.

## Overview

This course covers the development paradigm for extending Liferay 7.4+. While lessons will focus on in Liferay Experience Cloud (LXC). This content is also applicable to LXC Self-Managed and Liferay DXP Self-Hosted.

```{note}
<!--Previously, application development involved deploying OSGi modules to modify and extend the core Liferay platform directly. While this method remains valid for Self-Managed and Self-Hosted options, it is not available for LXC.-->
```

Here, we'll continue the story of Delectable Bonsai, a fictional B2B producer of maple syrup products that supplies distributors across the globe. Due to recent growth, Delectable Bonsai needs two custom applications to streamline business processes and better serve customers:

1. A Distributor Application for receiving and approving distributors in a B2B context

1. A Ticketing System for customers to report issues and open requests

This course is organized into four modules. The first three develop the Distributor Application using only out-of-the-box features. The fourth and final module develops the Ticketing System using more advanced development capabilities.

## Learning Objectives

By the end of this course, you will know how to

* Use Liferay Objects to define and manage custom data structures that leverage Liferay's core frameworks, including headless APIs, permissions, and more.
* Use microservice client extensions to provide back-end functionality to your solutions.
* Use front-end client extensions to build dynamic user experiences that integrate with object APIs.
* Use Liferay's page builder features to design experiences for creating and displaying object entries.
* Promote custom applications from UAT/DEV to PRD environments.

The first step is modeling data structures for our applications. Ready?

[Let's Go!](./application-development/modeling-data-structures.md)
