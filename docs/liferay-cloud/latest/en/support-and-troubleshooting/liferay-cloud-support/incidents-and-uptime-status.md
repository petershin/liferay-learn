---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: c3b2abe5-9059-452a-83fb-a6a05403c698
---
# Incidents and Uptime Status

Liferay is committed to providing a cloud platform that runs smoothly and reliably. However, when incidents occur in your Liferay PaaS environment, Liferay Cloud Support strives to resolve them and communicate as quickly to you as possible. The response times may vary with the severity level of the reported incident, and Liferay Cloud Support cannot guarantee resolution times. 

Incident resolutions may consist of a fix, workaround, new service release, or alternative solutions if needed, at the Liferay Cloud team's discretion.

## Incident Escalation Path

When you report an incident to Liferay Support, the team uses a ticket to track the incident and communication with you. Here are the steps normally used to resolve these incidents.

### Initial Response

Liferay Support provides an initial notification to confirm the incident is received and the team is investigating the root issue. Customer Support staff may request more information to better understand the incident.

### Investigation

Liferay Support investigates the root cause of the incident and attempts to reproduce the issue based on the information provided. If the issue is difficult to reproduce or requires more involvement, staff may involve additional parties to help investigate and replicate the issue.

Once the incident is confirmed and reproduced by Liferay staff, work begins on a solution.

### Mitigation

Liferay Support attempts to mitigate reported issues while they are ongoing. For example, Liferay Support can provide additional resources, insights into the incident, or workaround solutions.

### Fix Delivery

Liferay Support delivers any fix and instructions to apply it via the Support ticket. After the fix is delivered, the ticket is marked as "Solved" once you verify the issue is resolved in your own environment, or after no response is received after an appropriate amount of time.

Liferay Support automatically closes tickets 28 days after they are marked as solved.

### Follow-Up

While an incident is ongoing, Liferay Support provides regular updates and check-ins to notify you about progress toward a solution or fix, including any possible workarounds or mitigation.

## Liferay Cloud's Live Update Status

For real-time updates on Liferay Cloud's status, subscribe to the [Liferay Cloud status page](https://status.liferay.cloud). Click *Subscribe to Updates* and select your preferred type of notification.

## Uptime Commitment

**Here are Liferay Cloud Support's uptime commitments as general standards. However, the full details of Liferay's commitments are subject to your legal agreement with Liferay.**

Liferay Cloud is committed to keeping customer projects with Monthly Infrastructure Availability (MIA) of 99.95% or greater. Where "DT" (downtime) is the total minutes of unplanned downtime in a calendar month, MIA is calculated like this:

```
MIA = 100 - ((DT/43800) * 100)
```

This means that Liferay's standard is to keep unplanned downtime per month at *less than 22 minutes*.

Liferay notifies customers of planned downtime at least 14 days in advance, including the reason for the outage, the expected length of the downtime, and contact information for any questions or follow-up.

## Severity Levels

Liferay Cloud defines the severity of issues according to these levels. Service Level Agreements (SLAs) for the Liferay Cloud Support team to respond are based on the issue's severity level. **This is an overview of the standard severity levels, but the details are subject to your legal agreement with Liferay.**

| **Severity Level**        | **Summary**                                                                                         | **Response Time SLA** |
| :------------------------ | :-------------------------------------------------------------------------------------------------- | :-------------------: |
| **Severity 1 ("High")**   | Production environment is severely impacted or shut down.                                           | 1 clock hour          |
| **Severity 2 ("Normal")** | Any environment is running but experiencing limitations, instability, or periodic interruptions.    | 2 business hours      |
| **Severity 3 ("Low")**    | Any environment is running and fully functional, but there are errors that do not impact usability. | 1 business day        |

**Severity 1 ("High") incidents**: A severity 1 incident means that

1. The production environment on Liferay Cloud is completely shut down or severely impacted,
1. The customer's production environment system (for the purposes of Liferay software) is severely impacted or completely shut down,
1. System operations or "mission-critical" applications are inoperable, or
1. "Mission-critical" applications are experiencing repeated, material system interruptions that effectively make its applications inoperable.

Liferay Support works on severity 1 incidents 24 hours a day and 7 days a week. However, Liferay reserves the right to lower an incident's severity level to match actual business impact (if applicable) when Support team members are not available to work during those hours, until they are able to work on the incident on a 24/7 basis.

**Severity 2 ("Normal") incidents**: A severity 2 incident means that

1. Any of the customer's environments on Liferay Cloud functions with limited capabilities, or is unstable with periodic interruptions,
1. The customer's system (for the purposes of Liferay software) is functioning with limited capabilities,
1. The customer's system (for the purposes of Liferay software) is unstable with periodic interruptions, or
1. "Mission-critical" applications are not inoperable, but are experiencing material, periodic interruptions.

**Severity 3 ("Low") incidents**: A severity 3 incident means that

1. Any of the customer's environments on Liferay Cloud is fully functional, but is experiencing errors that do not impact its usability, or
1. The customer's system (for the purposes of Liferay software) is fully functional, but is experiencing errors that do not impact its usability.
