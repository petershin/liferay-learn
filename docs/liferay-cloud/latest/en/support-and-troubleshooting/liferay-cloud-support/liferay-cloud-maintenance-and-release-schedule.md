---
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay SaaS
- Liferay PaaS
uuid: 24b34437-7273-4570-b799-de0f3086cd9a
---
# Liferay Cloud Maintenance and Release Schedule

Liferay SaaS and PaaS both have a weekly maintenance and release schedule. Liferay Cloud uses a transparent and predictable release cadence to ensure that customers can rely on a stable and dependable infrastructure for their cloud projects.

## Liferay DXP Maintenance Windows

Liferay SaaS instances have weekly DXP maintenance windows. The maintenance window depends on the customer's *deployment region* and lasts for *4 hours*. These maintenance windows include updates to the instance's database and Liferay DXP instance. *One or two short downtimes are expected each week during this window*. These maintenance windows *cannot* be changed or delayed per request.

Liferay strives to test updates in advance on a copy of customer databases to avoid issues and verify the update's quality. Customers should establish a predefined test plan with Liferay that covers important business use cases, so these can be included when testing each update's quality. If the testing is successful, the update applies to both production and non-production instances.

In Liferay PaaS, maintaining and updating Liferay DXP is the customer's responsibility. See [Liferay PaaS Shared Activities](./liferay-paas-shared-activities.md) for more information.

## Liferay Cloud Platform Maintenance Windows

The Liferay Cloud platform has two release windows per week: **Tuesday** and **Thursday**, from 8 AM to 8 PM PST. Any exceptions or updates outside of these windows is communicated with customers *at least 14 days in advance*.

Most scheduled releases are completed with no downtime or outage for customer applications or Liferay Cloud's interface. However, larger updates or changes can cause downtime.

For transparency's sake, releases are broken into *Major*, *Minor*, and *Patch* types. Here are the the risks of downtime for Liferay Cloud and customer systems for each type.

| **Release Type** | **Liferay Cloud Console** | **Liferay Cloud API** | **Customer Applications** |
| :--------------- | :-----------------------: | :-------------------: | :-----------------------: |
| **Patch**        | Low                       | Low                   | Low                       |
| **Minor**        | Low                       | Low                   | Medium                    |
| **Major**        | Medium                    | Medium                | High                      |

Here is the regular maintenance schedule for each type of update:

* **Patch updates** are applied on an ad-hoc basis in any release window (Tuesdays or Thursdays, between 8 AM to 8 PM PST)

* **Minor releases** are scheduled *monthly* (on the last Tuesday of the month).

* **Major releases** are scheduled *quarterly* (on the last Tuesday of March, June, September, and December).

## Emergency Maintenance Updates

If strictly necessary, Liferay can install critical zero-day security updates or emergency fixes for reliability at any time without prior notice. Liferay is committed to maintaining uptime for customer environments as a top priority when mitigating security or reliability issues.

## Additional Information

* [Liferay Cloud Support Overview](../liferay-cloud-support.md)
