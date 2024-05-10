---
taxonomy-category-names:
- Personalization
- A/B Testing
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 5d977089-f1b2-4b3d-b2a5-c5b2a02c21ab
---
# Running and Monitoring A/B Tests

You can configure these parameters when you run the A/B Test:

**Traffic Split:** The percentage of visitors randomly split between the original and the variant when visiting the page. Visitors are randomly split between the original and the variant and always see the same page until the A/B Test finishes.

**Confidence Level Required:** Represents the accuracy of your test. The higher the required confidence level, the longer it takes to declare the winner.

The *Estimated Time to Declare Winner* provides an estimation of the test duration. This estimation is based on the Traffic Split and Confidence Level Required configurations, as well as on the estimated page traffic (based on the traffic history provided by Analytics Cloud).

![A/B Test Run Configurations are tunable to your requirements.](running-and-monitoring-ab-tests/images/01.png)

After you create the test, review the test status by clicking *A/B Testing* (![A/B Test icon](../../../images/icon-ab-testing.png)).

Liferay DXP only shows your test's status and the winner when the test finishes. You can manage the other aspects of your A/B Test in Analytics Cloud. For more information, see [A/B Testing](https://learn.liferay.com/w/analytics-cloud/optimization/a-b-testing) in the Analytics Cloud documentation.

When the A/B Test finishes, you can review the test results and publish the preferred variant. For more information, read [Reviewing A/B Test Results and Publishing Test Variants](./reviewing-ab-test-results-and-publishing-test-variants.md).

## Running the A/B Test

```{note}
Before running a test, you must create an A/B Test. For more information, read [Creating A/B Tests](./creating-ab-tests.md).
```

1. Go to the Content Page where you want to run the A/B Test
1. In the Control Menu, click the *A/B Testing* button (![A/B Test icon](../../../images/icon-ab-testing.png)).
1. If you have other Experiences for the Content Page, select the Experience.
1. Under the *Active Test* section, click *Review and Run Test*.
1. Optionally, configure the *Traffic Split* and *Confidence Level Required* settings for your test.
1. Click *Run* and then click *OK*.

You can cancel a running test at any time by clicking *Terminate Test*. To delete an A/B Test, you must terminate the test first.

## Related Topics

- [A/B Testing](./ab-testing.md)
- [Verifying A/B Test Requirements](./verifying-ab-test-requirements.md)
- [Running and Monitoring A/B Tests](./running-and-monitoring-ab-tests)
- [Reviewing A/B Test Results and Publishing Test Variants](./reviewing-ab-test-results-and-publishing-test-variants.md)
