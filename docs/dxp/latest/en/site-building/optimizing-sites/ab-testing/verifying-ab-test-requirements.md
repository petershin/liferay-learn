---
taxonomy-category-names:
  - Personalization
  - A/B Testing
  - Liferay Self-Hosted
  - Liferay PaaS
  - Liferay SaaS
uuid: 7d675204-2a69-4cb9-b315-cfaad4ad9c4f
---

# Verifying A/B Test Requirements

Before running A/B Testing on your Content pages, you must verify these requirements are met:

- Liferay DXP is connected to Analytics Cloud. Fore information on how to set up this connection, see [Connecting your Liferay DXP site to Analytics Cloud](https://learn.liferay.com/w/analytics-cloud/getting-started/connecting-liferay-dxp-to-analytics-cloud).

- Your page is a [Content Page](../../creating-pages/understanding-pages.md). Widget Pages do not support Experiences for different Segments.
- The Content Page you intend to test is published.
- You have the _Update_ permission in the Content Page.

  ![Selecting the Site in the Liferay DXP configuration for Analytics Cloud](verifying-ab-test-requirements/images/01.png)

  ```{note}
  When setting up the connection to Analytics Cloud, you must select the Site containing the content you want to test. Click *Control Panel* → *Configuration* → *Instance Settings* → *Analytics Cloud* → *Analytics Cloud Connection*.
  ```

To verify or configure the _Update_ permission,

1. Go to _Site Administrator_ &rarr; _Site Builder_ &rarr; _Pages_.
1. Click the Actions menu (![Action Menu](../../../images/icon-actions.png)) next to the Content Page and Select _Permissions_.
1. Check or verify the _Update_ permission box for the Role that must have access to the Content Page.
1. Click _Save_.

## Related Information

- [A/B Testing](./ab-testing.md)
- [Creating A/B Tests](./creating-ab-tests.md)
- [Running and Monitoring A/B Tests](./running-and-monitoring-ab-tests)
- [Reviewing A/B Test Results and Publishing Test Variants](./reviewing-ab-test-results-and-publishing-test-variants.md)
