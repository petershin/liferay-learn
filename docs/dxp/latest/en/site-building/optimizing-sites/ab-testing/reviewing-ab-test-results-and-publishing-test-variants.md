---
taxonomy-category-names:
- Personalization
- A/B Testing
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 7a310b3a-7526-46a2-92a2-6bddd422593b
---
# Reviewing A/B Test Results and Publishing Test Variants

When the A/B Test finishes, you can find the test results in Analytics Cloud and Liferay DXP. Analytics Cloud declares a winner when the *Confidence Level Required* is achieved during the duration of the test. To understand how to configure the Confidence Level Required for your test, see [Creating A/B Tests](./creating-ab-tests.md).

```{tip}
You receive a [notification in Liferay](../../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md) when the A/B Test finishes.
```

To review the A/B Test results and publish your variant,

1. Go to the Content Page where the A/B Test is running.

1. In the Control Menu, click the *A/B Testing* flask icon (![A/B Test icon](../../../images/icon-ab-testing.png)). 

1. If you have other Experiences for the Content Page, select the *Experience*.

1. Review the test results under the *Active Test* section:

   * *Winner Declared*: The confidence level requirement was met.
   * *No Winner*: The confidence level requirement was not met for the duration of the test.

   ![Review A/B Test Results from the A/B Test panel](reviewing-ab-test-results-and-publishing-test-variants/images/01.png)

1. From the Variants section, you can

   * *Publish* the variant, which is highlighted with the check mark.
   * *Discard Test*, to ignore the A/B Test recommendations and keep the current Content Page.

     ![You can publish the winning Variant or discard the A/B Test results.](reviewing-ab-test-results-and-publishing-test-variants/images/02.png)

   ```{note}
   When you publish the A/B Test variant, the variant becomes active for all users visiting the Content Page.
   ```

You can click the *View Data in Analytics Cloud* button from the A/B Tests panel to go to the Analytics Cloud dashboard and view other test statistics. For more information, see [A/B Testing Analytics](https://learn.liferay.com/w/analytics-cloud/optimization/a-b-testing).

## Related Topics

* [A/B Testing](./ab-testing.md)
* [Creating A/B Tests](./creating-ab-tests.md)
* [Verifying A/B Test Requirements](./verifying-ab-test-requirements.md)
* [Running and Monitoring A/B Tests](./running-and-monitoring-ab-tests)
