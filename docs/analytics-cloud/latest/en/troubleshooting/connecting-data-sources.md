---
uuid: 83679f16-fcde-44fb-8f26-138e6743f4fe
taxonomy-category-names:
- Cloud
- Analytics Cloud Administration
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Connecting Data Sources

Misconfigured environments or data sources can prevent or disrupt access to Liferay DXP data sources. Here's how to troubleshoot DXP data source issues.

## No Network Access to Analytics Cloud

Ensure that the DXP installation has internet access to our Analytic Cloud server by adding the following URLs to an allow list:

- `https://analytics.liferay.com`
- `https://osbasahpublisher-{regionKey}.lfr.cloud`
- `https://osbasahbackend-{regionKey}.lfr.cloud`
- `https://analytics-js-cdn.liferay.com`

!!! note
    The {regionKey} is based on the initial selection during workspace setup (i.e. ac-southamericaeast1, ac-europewest2, ac-europewest3, ac-uswest1, or ac-asiasouth1).

!!! important
    For some use cases, such as analyzing corporate intranet usage, your visitors’ browsers are also behind a firewall. In this scenario, you must ensure that the corporate office network also allows outbound access for the above URLs.

## Validating the Connection to Analytics Cloud

Here are some useful tips to help you validate that data is being sent to Analytics Cloud.

### Analytics Events

Analytics events are sent directly from the client's browser. To validate data is being sent to Analytics Cloud, perform the following steps:

1. Visit one of the pages of your DXP website that is being tracked.
1. Open the browser inspector and go to the Network tab.
1. Filter the network tab by XHR.
1. Refresh the page.
1. Verify that you see a request starting with `osbasahpublisher`. The request should look something similar to the screenshot below:

    ![Validating the connection to Analytics Cloud.](connecting-data-sources/images/01.png)

    If you are able to see this request that means your website is sending analytics data to your Analytics Cloud workspace. Check the request payload and verify that there is a variable called `channelId`.

### Contacts Data

DXP sends contact information of your logged in users to Analytics Cloud as individual profile data. This data is sent directly from the DXP server.

To verify that contacts data are being sent, check the DXP server logs for the messages similar to the following:

```
INFO  [liferay/analytics_messages_processor-1][AddAnalyticsMessagesMessageListener:70] Added 500 analytics messages

INFO  [liferay/analytics_messages_processor-1][AddAnalyticsMessagesMessageListener:70] Added 500 analytics messages

INFO  [liferay/scheduler_dispatch-3][SendAnalyticsMessagesMessageListener:149] Sent 100 analytics messages

INFO  [liferay/scheduler_dispatch-3][SendAnalyticsMessagesMessageListener:164] Deleted 100 analytics messages
```

If you see these server logs, then your contact data are being sent successfully to AC.

## Data Processing Time

Once the data arrives at Analytics Cloud, it takes additional time to process, before appearing in the workspace dashboard.

For Analytics events, you should be able to see visitors metric in the 24 hours filter in the Site Dashboard within 10 to 15 minutes.

![Analytics Data coming in over a period of time.](connecting-data-sources/images/02.png)

Other session-related data, such as session duration and bounce rate, must wait until the visitor session ends. Visitor sessions are considered over when there are 30 minutes of inactivity, or at 00:00:00 UTC -- whichever comes first.

Individual Profiles take longer to process and become available over time.

## Unsupported Version

**Error Message:** `Unsupported version. This method of connection does not support the data source Liferay version. Make sure you are connecting to Liferay 7.0/7.1 instance or try a different method of connection.`

!!! important
    Your Liferay DXP installation must meet the following fix pack minimum requirements:

    - 7.4 2024.Q1+
    - 7.3 U30+ (hotfix required)

**Resolution:**

1. Make sure to [connect with a Liferay DXP 7.3 or 7.4 instance].

1. Follow the steps for [adding a Liferay DXP data source](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md).

1. If the error persists, make sure JSON web services are enabled on your DXP instance. They're enabled by default. If you disabled them using a [portal property](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JSON) setting json.web.service.enabled=false (e.g., set in a [portal-ext.properties file](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/reference/portal-properties.html)), delete the setting or set the property value to true.

## Logged In Users Showing Up Anonymous

When [Syncing Contacts](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md), Analytics Cloud depends on user records existing within Liferay DXP. Therefore if you are using [SSO](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso) or [LDAP](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory), make sure to import or map all your users to Liferay DXP before syncing contacts with Analytics Cloud.

## Syncing Users Taking a Long Time

Liferay DXP's batch engine is used for syncing users. Increase the batch size if syncing a large number of users. In Liferay DXP, navigate to *Global Menu* &rarr; *Instance Settings* &rarr; *Batch Engine*. Set the *Export Batch Size* and *Import Batch Size* to `1000`.

![Increase batch size in Liferay DXP.](./connecting-data-sources/images/03.png)

## Enabling Localized URLs for Site Pages

By default, Liferay DXP uses the same URL for a site page regardless of the chosen language. Enable localized URLs for Analytics Cloud to track each language as a distinct site page.

1. In Liferay DXP, navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Content & Data* &rarr; *Pages*.

1. Click *SEO* in the left navigation.

   ![Select use localized URL under the canonical URL selection.](./connecting-data-sources/images/04.png)

1. Click the drop-down menu under canonical URL and select *Use Localized URL*. Click *Save*.