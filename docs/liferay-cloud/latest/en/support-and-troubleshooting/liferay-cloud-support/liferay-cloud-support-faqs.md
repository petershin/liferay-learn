---
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
- Liferay SaaS
uuid: 7fab317c-cefc-49e9-a9ad-f2bb87ef602b
---
# Liferay Cloud Support FAQs

Here are the answers to common questions pertaining to Liferay Cloud Support.

## Why isn't Liferay Cloud open source?

Liferay is an open-source company at heart, with open-source projects including Liferay Portal CE. 

However, Liferay Cloud is not an open-source product, because of the high requirements for data security and protection, and the general nature of cloud software.

## Where can I find information on service disruptions, outages, or the status of the API or Liferay Cloud's infrastructure services?

The [Liferay Cloud Status page](https://status.liferay.cloud) includes information about the status of various services, the Liferay Cloud API, and each region's status. You can also find the history of past incidents and service outages.

## What's the difference between an "incident" and an "outage"?

An incident is an issue or problem that affects the Liferay Cloud platform or Liferay DXP and impedes customer use.

An outage is specifically when Liferay Cloud services are inaccessible or not functioning.

## Where can I find information about security alerts and vulnerabilities?

Check the [Security Advisories page](https://help.liferay.com/hc/en-us/articles/360018875952-Security-Advisories) to learn about security alerts and vulnerabilities.

## Should I give the Liferay Cloud team advance notice of any performance or penetration testing on a Liferay PaaS environment? If so, how?

When you perform performance or penetration testing on your Liferay Cloud environment, it can appear to Liferay that there is an attack on the environment, which could require intervention to protect it. To prevent Liferay interfering with your testing, notify Liferay Cloud of your testing window in advance.

See [Performance/Penetration Test Advanced Notice](https://help.liferay.com/hc/en-us/articles/4407536203661-Liferay-Experience-Cloud-Self-Managed-PaaS-Performance-Penetration-Test-Advanced-Notice) for more information.

## How are third-party technologies supported? How should I report issues with third-party services?

In most cases, Liferay is *not* responsible for incidents involving third-party technologies (though you can still [ask on a Support ticket](../liferay-cloud-support.md#opening-a-support-ticket)). See [Third-Party Technology Support](https://help.liferay.com/hc/en-us/articles/360015768152-Third-Party-Technology-Defects-Optimizations-and-Configurations) for more information.

## Does Liferay support custom images or services? What are the limits?

Liferay Cloud supports all official Liferay images, services, and features provided by Liferay Cloud that run on this platform. However, Liferay Cloud generally cannot provide support for custom images or services. See [Custom Image Support](https://help.liferay.com/hc/en-us/articles/360015768132-Customizations) for more information.

## How is auto-scaling charged?

Auto-scaling incurs an additional charge per hour, based on how many additional instances are used. See [How Auto-Scaling is Charged](../../manage-and-optimize/auto-scaling.md#how-auto-scaling-is-charged) for more information.
