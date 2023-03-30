# The Liferay Product

**At a Glance**

* Liferay develops and sells a single product (Liferay DXP 7.4)
* Liferay offers the product in three different deployment paradigms (Liferay Experience Cloud (LXC) [SaSS], LXC - Self Managed [PaaS], or LXC - Self Hosted)
* How Solutions fit in
* Tips for teams who are not ready to move to LXC SaaS

## Background

* Liferay has historically packaged, priced, sold, and deployed separately branded products: Liferay DXP, Commerce, and Analytics Cloud.
* The product line has been condensed and all of the capabilities of the aforementioned products are now available in a single product: Liferay DXP 7.4
  * **All** features are now available to customers with current subscriptions to Liferay DXP 7.4

![The simplified Liferay Product line.](the-liferay-product/images/01.png)

```{note}
For customers with current Liferay DXP 7.4 subscriptions:
Some analytics capabilities associated with the *formerly* separate product "Analytics Cloud" must still be accessed on a separate cloud-based instance, while commerce capabilities are available directly in Liferay DXP 7.4.
```

## Liferay Deployment Approaches

Liferay DXP 7.4 is offered to customers in three different and flexible approaches for customers:

* DXP - Self-Hosted
* LXC - Self-Managed (PaaS)
* Liferay Experience Cloud (LXC) (SaaS)

As we progressively review each of the deployment approaches, we would like to draw particular attention to relative value activities like managing infrastructure has to a customer's business needs. One of the defining value propositions for LXC is that it eliminates low value activities like managing infrastructure so that customers can focus on delivering their business applications. 

```{important}
While LXC (SaaS) effectively offers Liferay DXP 7.4, it should *not* be considered a fully turn-key application.
```

### DXP Self-Hosted

Traditionally, this is how Liferay DXP has been sold. In this context, customers are responsible for setting, deploying, and managing their infrastructure, along with their solution built on DXP.

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Products | &#10004; |  |
| Subscription (Support, Warranty, Indemnity, etc) | &#10004; |  |

**Low Customer Value Activities**

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Infrastructure (Uptime w/ SLA) |  | &#10004; |
| Application Uptime SLA |  | &#10004; |
| Platform Services (Database, Search, etc) |  | &#10004; |
| Architecture and High Availability |  | &#10004; |
| Upgrades |  | &#10004; |
| Weekly Updates |  | &#10004; |
| Patches, Security Hotfixes |  | &#10004; |
| Software Troubleshooting |  | &#10004; |
| Security Scanning / SAST / DAST |  | &#10004; |

**High Customer Value Activities**

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Application Delivery |  | &#10004; |

### LXC Self-Managed

LXC-SM (formerly DXP Cloud) is DXP as a PaaS. For this deployment approach, Liferay provides the framework and tools for customers to manage their DXP on the cloud.

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Products | &#10004; |  |
| Subscription (Support, Warranty, Indemnity, etc) | &#10004; |  |
| Infrastructure (Uptime w/ SLA) | &#10004; |  |
| Application Uptime SLA | &#10004; |  |
| Platform Services (Database, Search, etc) | &#10004; |  |
| Architecture and High Availability | &#10004; |  |

**Low Customer Value Activities**

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Upgrades |  | &#10004; |
| Weekly Updates |  | &#10004; |
| Patches, Security Hotfixes |  | &#10004; |
| Software Troubleshooting |  | &#10004; |
| Security Scanning / SAST / DAST |  | &#10004; |

**High Customer Value Activities**

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Application Delivery |  | &#10004; |

### Liferay Experience Cloud

Finally, LXC provides significant value and simplicity for customers. DXP is hosted and managed on the cloud by Liferay.

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Products | &#10004; |  |
| Subscription (Support, Warranty, Indemnity, etc) | &#10004; |  |
| Infrastructure (Uptime w/ SLA) | &#10004; |  |
| Application Uptime SLA | &#10004; |  |
| Platform Services (Database, Search, etc) | &#10004; |  |
| Architecture and High Availability | &#10004; |  |
| Upgrades | &#10004; |  |
| Weekly Updates | &#10004; |  |
| Patches, Security Hotfixes | &#10004; |  |
| Software Troubleshooting | &#10004; |  |
| Security Scanning / SAST / DAST | &#10004; |  |

**High Customer Value Activities**

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Application Delivery |  | &#10004; |

```{important}
It is still expected that customers work with Partners and Global Services to solve their business problems on LXC.
```

## A New Development Paradigm for LXC

One of the key benefits for customers who adopt LXC are LXC's **Weekly Updates**. These updates come out every week and fix known issues and add new features. These updates are automatically and transparently applied to all LXC customers on a weekly basis. To enable this approach, customers and teams developing for LXC must shift their development approach from traditional core customizations to use of new Low-Code and Client Extensions available.

Formerly with Liferay, customizations required the deployment of OSGi Modules, Theme .wars, and/or the development of portlets.

![The old Liferay development paradigm.](the-liferay-product/images/02.png)

Liferay DXP 7.4 now supports new ways of extending Liferay without deploying code: [Client Extensions](../../../../../dxp/latest/en/building-applications/client-extensions.md). Using Client Extensions, you can add new capabilities and override native Liferay functions -- without modifying the core of the product.

![The new Liferay DXP 7.4 development paradigm with an emphasis on low-code and Client Extensions.](the-liferay-product/images/03.png)

Shifting development paradigms to this new methodology provides many benefits:

* Improves TCO
* Reduces upgrade risks
* Provides greater flexibility

```{important}
Low-Code features and Client Extensions are available for all deployment models, are **required** for LXC, and are highly recommended for LXC-SM and DXP Self-Hosted.
```

### Common Concerns for Client Extensions and Low-Code Maturity

As of January 2023, Liferay recognizes that Client Extensions cover ~60% of customization needs. We're aggressively working towards ensuring that by September 2023, Client Extensions can cover ~80% of customization needs.

## Solutions and the Solution Marketplace

Liferay develops the core product, Liferay DXP 7.4. We make this product available through the three different product offerings we have already discussed. Finally, Solutions describe what is *implemented* when a customer has purchased a product offering.

![Liferay solutions and their relationship to Liferay's Product and product offerings.](the-liferay-product/images/04.png)

There are many different solutions that can be built and many of these will only be accelerated over time through the use of Site Templates and Accelerators that will be available on the Solution Marketplace!

## Tips for Customers Not Ready for LXC

Here are some common situations for customers who may be reluctant to move to LXC:

* Current implementation requires many different traditional customizations
* Restricted from moving to a SaaS
* Lack of familiarity with Liferay DXP 7.4 or the new development paradigm
* Concerns around stability and completeness of the new architecture

In any of these circumstances, we strongly recommend that teams get up to speed on 7.4 to take advantage of new features, simpler development approaches, and reducing risk to upcoming EOL timelines.

### Customers With Many Customizations

For this situation we recommend:

* Getting current and learning the new architecture and approach
* EOL is coming for 7.1, 7.2, and 7.3
* Developing customizations following the new approach is much less likely to be affected by product changes compared to the use of OSGi modules

For customers who are currently self-hosted, consider using LXC-Self-Managed as a stepping stone to LXC. On LXC-SM all customizations (except for EXT plugins) are available with 7.4.

### Customers Restricted From Moving to SaaS

We recommend:

* Digging into why with a customer. Are there legislative or industrial regulations prohibiting them, or is the rationale purely behavioral?
* Many traditionally conservative industries (Finance, Government) are embracing SaaS
* Talk to the Liferay team about your situation

Regardless, we recommend that all users strive to get current on 7.4 and exploring a migration to LXC-SM which can offer many of the benefits of LXC SaaS.

### Lack of Familiarity With the Low-Code and Client Extensions

Content from Liferay is regularly coming out to make it easier to get started

* New and Updated content covering Client Extensions and Low-Code features is regularly updated on learn.liferay.com
* A full Liferay Application Developer training program covering Low-Code and Client Extensions is being developed and coming in Q2 2023
* Liferay Circles of Success are interactive webinars that regularly highlight new and improved features on 7.4, including low-code and client extensions development options

### Concerns Around Stability and Completeness of the New Architecture

* Stay informed! New capabilities are being developed and released every week. Keep talking to us to find out if your issues have been resolved.
* Use our online resources at learn.liferay.com to start learning and working with 7.4
* Keep the feedback coming! Your feedback is crucial to helping shape the platform and in building success for our customers
Footer
© 2023 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
