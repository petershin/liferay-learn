---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: 27515ec7-8ccf-47a2-8d05-2c42298aecf1
---
# Support Access

Support Access is an optional setting that expedites troubleshooting by giving Liferay engineers direct access to a Liferay Cloud project environment. Liferay Cloud administrators can enable or disable Support Access for individual project environments.

When Support Access is enabled, Liferay Support engineers have read access to the following information:

- Project console
- Service logs
- Control Panel settings
- The region where the Liferay Cloud services are hosted
- Team members and their associated roles
- Members' activities

!!! note
    Support Access **does not** allow Liferay support engineers to deploy assets or perform write actions in your project.

## Changing the Support Access Setting

Support access is enabled by default in each environment, but administrators can disable it at any time.

Follow these steps to change the Support Access setting:

1. Navigate to *Settings* &rarr; *Access*.
1. Set the toggle switch to your desired setting (*Enabled* or *Disabled*).

![Administrators can enable or disable Support Access.](./support-access/images/01.png)

## Monitoring Changes to Support Access

Any change to Support Access registers a new activity that lists who made that change and when. These activities appear in *Activities* &rarr; *General*.

![The general activities panel shows any changes to Support Access.](./support-access/images/02.png)

Liferay Cloud also sends an email to all team members when the Support Access setting changes.

![An email lets everyone know when the Support Access setting changes.](./support-access/images/03.png)

## Related Topics

- [Troubleshooting Tools and Resources](../troubleshooting-tools-and-resources.md)
- [Help Center](https://help.liferay.com/hc/en-us)
- [Log Management](../troubleshooting-tools-and-resources/reading-liferay-cloud-service-logs.md)
