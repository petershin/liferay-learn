# The Liferay Product Offering

**At a Glance**

* Liferay develops a single Product - Liferay DXP 7.4
* There are three Product Deployment Offerings - Liferay Experience Cloud (LXC) [SaSS], Liferay Experience Cloud - Self Managed [PaaS], or DXP - Self Hosted
* How to identify which Product Deployment Offering is right for your Prospect 

## Background

* Liferay's Product is Liferay DXP.
* Liferay DXP contains three main capability sets, the core Digital Experience Platform, Commerce, and Analytics
* The details of each capability set are covered in a later module. 
* **All** features are now available to customers with a current subscription to Liferay DXP.  
* The deployment approach chosen does not impact the features that are provided.

![The Liferay Product line.](the-liferay-product/images/01.png)

## Supporting Every Deployment Approach

* Liferay's Product Deployment Offerings allow customers to choose the approach that fits their requirements.
* Liferay Experience Cloud provides a Software-as-a-Service (SaaS) deployment model.
* Liferay Experience Cloud Self-Managed provides a Platform-as-a-Service (PaaS) deplpoyment model.
* Liferay DXP Self-Hosted allows a customer to choose exactly how and where they host their Liferay DXP implemenation.
* This flexibility of deployment is an important differentiator over many of our Competitors, who may not offer anything other than a SaaS deployment option.

```{note}
Although the deplpoyment method for Liferay Experience Cloud is SaaS, this is not a turnkey-application.  
It is the full Digital Experience Platform, on top of which our customers, partners and GS build the tailored solutions our customers need to solve their business problems.
```

![Liferay's Product Deployment Offerings](the-liferay-product/images/02.png)

As we review each of the deployment approaches, we would like to draw particular attention to the day-to-day activities that are required. Each of these activities has a value, however it is only really delivering the actual business application that is high-value. Some of the lower value activites meanwhile can be quite time-consuming and difficult.  These activities are the responsibility of either Liferay, or the Customer, and each deployment approach assigns these differently.

### DXP Self-Hosted

Traditionally, this is how Liferay DXP has been sold. Customers download a Liferay DXP bundle, or a Liferay DXP Docker Image, and then  are responsible for everything else.

It should not be underestimated how much work is required here. The customer must deploy enough Liferay instances to support their expected peak usage load, must design load-balancing if more than one instance is required, select the infrastructure, how and where that is deployed - on premise, in a private cloud, in a public cloud, they must select the platform sofware like the Database Server.

Then they must maintain that infrastructure, and the platform software, plus patch and upgrade DXP.

Finally they must build their solution on DXP.

![Liferay DXP Infrastructure](the-liferay-product/images/03.png)

**Low Value Activities**

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Products | &#10004; |  |
| Subscription (Support, Warranty, Indemnity, etc) | &#10004; | |
| Infrastructure (Uptime w/ SLA) |  | &#10004; |
| Application Uptime SLA |  | &#10004; |
| Platform Services (Database, Search, etc) |  | &#10004; |
| Architecture and High Availability |  | &#10004; |
| Upgrades |  | &#10004; |
| Weekly Updates |  | &#10004; |
| Patches, Security Hotfixes |  | &#10004; |
| Software Troubleshooting |  | &#10004; |
| Security Scanning / SAST / DAST |  | &#10004; |

**High Value Activities**

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Application Delivery |  | &#10004; |

### Liferay Experience Cloud Self-Managed

Liferay Experience CLoud Self-Managed (formerly DXP Cloud) is our Platform-as-a-Service offering. Liferay provides the Software itself, and also the infrastructure, all of the Platform Services, and so on.

Plus, with Liferay Experience Cloud Self-Managed there are predefined offers that include things like Backup, VPN services and so on.  Further to this these scale via OOTB HA, auto-scaling capabilities, auto-failover capabilities, and provide load balancing.  These activities are very important, but they can be hard and/or expensive to implement.

![Services provided by Liferay Experience Cloud Self Managed.](the-liferay-product/images/04.png)

Liferay also provides an Infrastructure Uptime SLA of 99.95%, does regular updates to the platform services, provides the full DevSecOps CI/CD pipeline with build management and so on.

But, there are still some time-consuming and relatively low-value activities that are the Customer’s responsibility - like Updates, Patches, Upgrades and finally the high-value Application Delivery work.

**Low Value Activities**

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Products | &#10004; |  |
| Subscription (Support, Warranty, Indemnity, etc) | &#10004; |  |
| Infrastructure (Uptime w/ SLA) | &#10004; |  |
| Application Uptime SLA | &#10004; |  |
| Platform Services (Database, Search, etc) | &#10004; |  |
| Architecture and High Availability | &#10004; |  |
| Upgrades |  | &#10004; |
| Weekly Updates |  | &#10004; |
| Patches, Security Hotfixes |  | &#10004; |
| Software Troubleshooting |  | &#10004; |
| Security Scanning / SAST / DAST |  | &#10004; |

**High Value Activities**

| Responsibility | Liferay | Customer |
| --- | --- | --- |
| Application Delivery |  | &#10004; |

### Liferay Experience Cloud

The final product deployment offering is Liferay Experience Cloud. This is a Saas offering which allows customers to focus on what really matters - creating, launching, and maintaining business applications.

With Liferay Experience Coud SaaS, Liferay is providing and managing all of the infrastructure, and all of the low-value activities needed to maintain Liferay DXP.  Liferay is applying product Updates on a weekly basis, testing these against customers' data, and doing SAST and DAST security scanning.

What is important to note is that although the deployment model is SaaS, this is not a turnkey-application.  Customers have a full Liferay DXP instance to use, with all of the out-of-the-box capabilities DXP provides, and they can build their custom applications on top of that base. Further to this they can continue to work with Partners and Liferay's Global Services organization to help them build those applications.

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

## Additional Information

* [Liferay Overview](liferay-overview)
