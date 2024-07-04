---
toc:
  - ./pages/paths.md
  - ./pages/pages-reference.md
taxonomy-category-names:
- Sites
- Site Analytics
- Traffic and Path Analysis
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
uuid: b8f8dc79-ca5e-45c8-821f-c52adf5c2e91
---
# Pages

Analytics Cloud does the following for pages:

- Registers and tracks pages for analysis the first time the Analytics Cloud client detects a Page interaction.
- Queries pages on a schedule for up-to-date data.
- Reports on pages with the metrics described here.

To view analytics on a specific page,

1. Click *Sites* in the left navigation menu. Click the *Pages* tab. A listing of your site's pages appears.

   To download this list of site pages as a CSV file, click *Download Reports*. See [Downloading Reports](../reference/downloading-reports.md) to learn more.

1. Select a page from the list to see detailed analytics.

## Data Time Periods

All Page data in Analytics Cloud appears for a specified time period. The time period selector recalculates the metrics for the selected time period. You must specify a time period to view the metrics. The default is 30 days, but this is configurable. The following time periods are available:

**Last 24 hours:** Displays data generated over the last 24 hours.

**Last 7 days:** Displays data generated for the previous seven full days (the current day is excluded), in daily increments.

**Last 30 days (default):** Displays data generated for the previous 30 full days (the current day is excluded), in weekly increments.

**Last 90 days:** Displays data generated for the previous 90 full days (the current day is excluded), in 15 day increments.

**More Preset Periods:** Shows additional time periods: Yesterday, Last 28 days, Last 180 days, Last Year.

**Custom Range:** Select a start date and end date of your choice.

## Visitor Behavior

The Overview tab of a Page's metrics has several data presentations. The first chart, called Visitor Behavior, contains these metrics:

- Unique Visitors
- Views
- Bounce Rate
- Time on Page
- Entrances
- Exit Rate

!!! note
    The Views metric updates immediately Other metrics update after the user's session ends (i.e. 30 minutes of inactivity) or at the end of the day (i.e. 23:59).

Select the time period for the data displayed. Select *Compare to Previous* to see a second comparison line of the previous time period.

![Trends can be identified over selected periods of time.](./pages/images/01.png)

To download this dashboard view as a PDF file, click *Download Reports*. See [Downloading Reports](../reference/downloading-reports.md) to learn more.

### Unique Visitors

Useful with the time period filter, Page Visitors is the number of visitors that accessed a Page in a given period of time.

A unique visitor has a unique IP address in Analytics Cloud. Therefore, if the same person views the Page from a different device, it's logged as two unique visitors.

### Views

Useful with the time period filter, View is the number of views for a page in a given period of time. It's not the same as the number of visitors, because it doesn't try to count only unique IP addresses. Over the last 30 days, one visitor (IP address) could come back to the page 100 times. That means there are 100 page views, but only one visitor (assuming she used the same machine to access the page each time). However, a unique view isn't logged for a single user unless at least 30 minutes of inactivity on the Page passes before the user interacts with the Page again.

Note, Liferay DXP uses the same URL for a site page regardless of the chosen language. To have Analytics Cloud track each language as a distinct site page, [enable localized URLs](../troubleshooting/connecting-data-sources.md#enabling-localized-urls-for-site-pages).

### Bounce Rate

Bounce Rate is the percentage of visitors to the Page that navigated away from the site without any page interaction (including scrolling on the page) after the initial page load. It's calculated as a daily rate (percentage per day), and the daily rate trend line appears over the selected time period.

### Time on Page

Time on Page calculates the average time spent on a Page for all the Views each day. It's displayed for the selected time period.

This metric is calculated like this for each 24 hour period:

```
(view-1-time + view-2-time + ...) / total-number-views
```

### Entrances

*Entrances* is the number visitors who arrived at your Site from the page (as opposed to those who started on a different page and clicked through to the page).

### Exit Rate

Exit Rate is the percentage of visitors who interacted with the page (such as scrolling or clicking) and then left the site.

## Audience

The Audience report uses charts to present information about the audience interaction with the Page. It answers these questions:

- How many users are interacting with my content?
- Of these users, how many are known or anonymous?
- Of the known users who interacted with my content, how many belong to Analytics Cloud Segments?
- Of the users in Segments, what are the top 15 segments?
- Here are the charts in the Audience report:

**Visitors:** A doughnut chart presents the percentage of total unique visitors who are known or anonymous. The center of the chart shows the total number of unique visitors. Tooltips on each chart section show the number of users for that section (e.g, the number of known or anonymous users).

!!! note
    Individuals are considered known when their email addresses are matched at login with user data synced with Analytics Cloud. When new users register on your site, it may take up to two hours for their data to sync with Analytics Cloud and appear as known individuals.

**Segmented Viewers:** A donut chart presents the percentage of known individuals who belong or do not belong to one or more Analytics Cloud Segments. The center of the chart shows the total number of known individuals. Tooltips on each chart section show the number of users for that section (e.g, the number of users belonging to one or more Segments).

**Viewer Segments:** A bar chart shows the percentage of known individuals that comprise each Segment. The chart shows a bar for each of the top five Segments, and then aggregates the remaining Segments into the last bar. A tooltip on the last bar shows the values for each of the remaining Segments.

![Quickly identify and segment users of your site.](./pages/images/02.png)

## Views by Location

The map in the Views by Location panel shows the number of views by country in the selected time period.

![User locations can be seen by viewing the location panel map.](./pages/images/03.png)

## Views by Technology

View a stacked bar graph of the Page's views by operating system (grouped by device type) in the default tab. Hover over each bar to see the detailed breakdown of data.

![Users are segmented by operating system and device type.](pages/images/04.png)

Click Web Browser to see a doughnut chart displaying up to the top eight web browsers over the selected time period. If applicable, remaining web browsers are aggregated in the ninth doughnut segment.

![Learn how many users are distributed across different browser agents.](./pages/images/05.png)

After all those fundamental metrics, you're really getting to know your pages. But there's some interesting page data you haven't seen. Discover how people came to the page in the first place. Learn about [Path Analytics](./pages/paths.md) next.

## Related Topics

- [Understanding Pages](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/understanding-pages)