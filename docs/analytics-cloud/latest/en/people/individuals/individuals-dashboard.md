---
uuid: 37ef6012-3c3a-4c1e-9c6e-aee0a893784d
taxonomy-category-names:
- Sites
- Users and Account Analysis
- Personalization
- User Interests and Content Recommendations
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Individuals Dashboard

The Individuals dashboard provides a broad range of analytics data about your visitors and how they interact with your Site.

To view the dashboard,

1. Click *Individuals* in the People section of the menu.

1. Click the *Overview* tab (this tab is selected by default when you click Individuals).

The Individuals dashboard contains the following panels:

- [Current Totals](#current-totals)
- [Enriched Profiles](#enriched-profiles)
- [Active Individuals](#active-individuals)
- [Interests](#interests)
- [Breakdown](#breakdown)

To download this dashboard view as a PDF file, click *Download Reports*. See [Downloading Reports](../../reference/downloading-reports.md) to learn more.

## Current Totals

The Current Totals panel presents the total number of individuals, known and anonymous, that have been tracked by Analytics Cloud.

![The Current Totals panel presents total numbers for visitors to your Site.](./individuals-dashboard/images/01.png)

!!! note
    Individuals are considered known when their email addresses are matched at login with user data synced with Analytics Cloud. When new users register on your site, it may take up to two hours for their data to sync with Analytics Cloud and appear as known individuals.

The panel also displays a percentage change in total numbers compared to the previous 30 days.

## Enriched Profiles

The Enriched Profiles panel presents the total number of individuals that have been enriched within the last 30 days.

![The Enriched Profiles panel presents the total number of individuals who have been enriched.](./individuals-dashboard/images/02.png)

An individual is considered enriched any time an attribute is associated with that individual; for example, when you [sync contact data from DXP](../../getting-started/connecting-liferay-dxp-to-analytics-cloud.md).

## Active Individuals

The Active Individuals panel presents information on both known and anonymous individuals who interacted with your Site in the selected period.

![The Active Individuals panel presents a chart of individuals over time who have interacted with the Site.](./individuals-dashboard/images/03.png)

Choose to visualize the data based on day, week or month. The data can be filtered by ranges of time: Last 24 hours, Last 7 days, Last 30 days, Last 90 days. Click *More Preset Periods* to reveal additional time ranges. Click *Custom Range* to filter by a start date and end date of your choice.

## Interests

The Interests panel presents the top 5 most popular topics.

![The Interests panel presents a chart of popular topics.](./individuals-dashboard/images/04.png)

The percentage of total individuals for interests shows what percent of individuals are interested in a specific topic. Theses topics are derived from the title, description, and keyword tags of your pages' HTML.

To view the full list of interest topics, click *View All Interests* in the panel. Alternatively, click the Interests tab at the top of the page.

To learn more about interests see [Understanding Interests](./understanding-interests.md).

## Breakdown

The Breakdown panel presents distribution information based on selected attributes of individuals. These attributes are available:

- `additionalName`: middle name
- `birthDate`: birth date
- `Email`: email address
- `familyName`: family name
- `givenName`: given name
- `jobTitle`: job title
- `languageId`: preferred language
- `modifiedDate`: last modified date
- `screenName`: screen name

![The Breakdown panel presents distribution information based on selected attributes.](./individuals-dashboard/images/05.png)

To add a new breakdown,

1. Click the plus sign at the top right of the panel.

1. Use the drop-down menu to select an attribute.

1. Input a name for the breakdown and click *Save*.

To view the breakdown of additional attributes, click *Explore Breakdown*. Alternatively, click the *Distribution* tab at the top of the page.

## Related Topics

- [Users](https://learn.liferay.com/web/guest/w/dxp/users-and-permissions/users)
- [Segments](../segments.md)