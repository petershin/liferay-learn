---
uuid: 5dd686af-6ef7-43f3-960e-7630d26ded8a
taxonomy-category-names:
- Sites
- Site Analytics
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Metrics Description

See the description of various metrics used by Analytics Cloud and how they are calculated.

Index:
- [A/B Testing - Estimated Time to Declare Winner](./metrics-description.md#ab-testing---estimated-time-to-declare-winner)
- [A/B Testing - Improvement](./metrics-description.md#ab-testing---improvement)
- [A/B Testing - Probability to Win](./metrics-description.md#ab-testing---probability-to-win)
- [Acquisitions - Percentage of Sessions](./metrics-description.md#acquisitions---percentage-of-sessions)
- [Active Individuals](./metrics-description.md#active-individuals)
- [Anonymous Individuals](./metrics-description.md#anonymous-individuals)
- [Audience - Downloaded Segments](./metrics-description.md#audience---downloaded-segments)
- [Audience - Downloads](./metrics-description.md#audience---downloads)
- [Audience - Segmented Downloads](./metrics-description.md#audience---segmented-downloads)
- [Audience - Segmented Submissions](./metrics-description.md#audience---submissions)
- [Audience - Segmented Viewers](./metrics-description.md#audience---segmented-viewers)
- [Audience - Segmented Views](./metrics-description.md#audience---segmented-views)
- [Audience - Submissions](./metrics-description.md#audience---submissions)
- [Audience - Submitter Segments](./metrics-description.md#audience---submitter-segments)
- [Audience - Viewer Segments](./metrics-description.md#audience---viewer-segments)
- [Audience - Views](./metrics-description.md#audience---views)
- [Audience - Visitors](./metrics-description.md#audience---visitors)
- [Bounce Rate](./metrics-description.md#bounce-rate)
- [Clicks](./metrics-description.md#clicks)
- [Comments](./metrics-description.md#comments)
- [Downloads](./metrics-description.md#downloads)
- [Entrances](./metrics-description.md#entrances)
- [Exit Rate](./metrics-description.md#exit-rate)
- [Forms - Abandonment](./metrics-description.md#forms---abandonment)
- [Interests - Percent of Active Members]()
- [Interests - Percentage of Sessions](./metrics-description.md#interests---percentage-of-sessions)
- [Interests - Percentage of Total Individuals](./metrics-description.md#interests---percentage-of-total-individuals)
- [Known Individuals](./metrics-description.md#known-individuals)
- [Preview](./metrics-description.md#preview)
- [Reading Time](./metrics-description.md#reading-time)
- [Search - Percentage of Sessions](./metrics-description.md#search---percentage-of-sessions)
- [Session Duration](./metrics-description.md#session-duration)
- [Sessions by Location](./metrics-description.md#sessions-by-location)
- [Sessions by Technology](./metrics-description.md#sessions-by-technology)
- [Sessions per Visitor](./metrics-description.md#sessions-per-visitor)
- [Submissions](./metrics-description.md#submissions)
- [Time on Page](./metrics-description.md#time-on-page)
- [Total Individuals or Unique Visitors](./metrics-description.md#total-individuals-or-unique-visitors)
- [Views](./metrics-description.md#views)
- [Visitors by Day and Time](./metrics-description.md#visitors-by-day-and-time)

## A/B Testing - Estimated Time to Declare Winner

This is the duration the A/B test must run to determine a winner. Note, this is only available for a bounce rate-type A/B test.

## A/B Testing - Improvement

This shows the relative improvement from the control. For example, a control may have had a 15% retention rate, but the variant had a 16% retention rate. The improvement is calculated as

```
((16 - 15) / 15) * 100 = ~6.67% improvement.
```

This metric is also known as lift.

## A/B Testing - Probability to Win

This is a prediction in percentage that a variant beats the control.

## Acquisitions - Percentage of Sessions

This shows the breakdown in percentage of the top traffic sources of how visitors arrive to your site. A session is considered a new session if 30 minutes of inactivity passed since the previous session, or it's the start of a new day (i.e. past midnight). For a given time range, the rate is calculated as

```
(The acquisition traffic source) ÷ (The total number of sessions) * 100
```

## Active Individuals

This is the total number of visitors who interacted with your site within the selected time range.

## Anonymous Individuals

This is the total number of visitors who are identified by a unique `userId` (i.e. user ID) but are not associated with an email address. Every visitor to your site is assigned a new `userId`, except for an individual who logs in with an email address. Visitors who have previously logged in are associated with the `userId` they were previously assigned.

## Audience - Downloaded Segments

This is the top segments who downloaded the document or media. Each bar in the chart shows the total number of individuals part of that segment that downloaded the document or media. The bar also gives a value of what percent of the known individuals who downloaded the document or media are part of that segment. For a given time range, the percentage is calculated as

```
(The number of individuals that are part of that segment who downloaded the document or media) ÷ (The total number of known individuals who downloaded that document or media) * 100
```

## Audience - Downloads

This is the total number of visitors who downloaded the document or media in the given time range. A percentage breakdown is shown of anonymous individuals and known individuals.

## Audience - Segmented Downloads

This is the total number of known individuals who downloaded the document or media in the given time range. A percentage breakdown is shown of segmented and unsegmented individuals.

## Audience - Segmented Submissions

This is the total number of known individuals who submitted the form in the given time range. A percentage breakdown is shown of segmented and unsegmented individuals.

## Audience - Segmented Viewers

This is the total number of known individuals who viewed the page in the given time range. A percentage breakdown is shown of segmented and unsegmented individuals.

## Audience - Segmented Views

This is the total number of known individuals who viewed the asset in the given time range. A percentage breakdown is shown of segmented and unsegmented individuals.

## Audience - Submissions

This is the total number of visitors who submitted the form in a given time range. A percentage breakdown is shown of anonymous individuals and known individuals.

## Audience - Submitter Segments

These are the top segments who submitted the form. Each bar in the chart shows the total number of individuals that submitted the form who are part of that segment. The bar also gives a value of what percent of the known individuals who submitted the form are part of that segment. For a given time range, the percentage is calculated as

```
(The number of individuals that are part of that segment who submitted the form) ÷ (The total number of known individuals who submitted the form) * 100
```

## Audience - Viewer Segments

These are the top segments who viewed the page or asset. Each bar in the chart shows the total number of individuals that viewed the page or asset who are part of that segment. The bar also gives a value of what percent of the known individuals who viewed that page or asset are part of that segment.

For a given time range, the percentage is calculated as

```
(The number of individuals that are part of that segment who viewed the page or asset) ÷ (The total number of known individuals who viewed the page or asset) * 100
```

## Audience - Views

This is the total number of visitors who viewed the asset in the given time range. A percentage breakdown is shown of anonymous individuals and known individuals.

## Audience - Visitors

This is the total number of visitors who visited the page in the given time range. A percentage breakdown is shown of anonymous individuals and known individuals.

## Bounce Rate

The bounce rate shows the percentage of sessions in which an individual visits a page on your site but has no further interactions before the session ends. A session is considered a new session if 30 minutes of inactivity passed since the previous session, or it's the start of a new day (i.e. past midnight). For a given time range, the rate is calculated as

```
(Total number of bounced sessions) ÷ (The total number of sessions) * 100
```

## Clicks

This is the total number of clicks on an A/B test, web content, or custom asset in a given time range.

## Comments

This is the total number of comments posted on a blog or document and media in a given time range.

## Downloads

This is the total number of downloads of a document and media or custom asset in a given time range.

## Entrances

Entrances show the most common pages that visitors view first upon entering your site and the number of entrances for each.

## Exit Rate

This is the percentage of visitors who interacted with the page (such as scrolling or clicking) and then left the site. It does not include bounce rate. For a given time range, the rate is calculated as

```
(Total number of sessions of the page in which visitors left the site) ÷ (The total number of sessions of the page) * 100
```

## Forms - Abandonment

Abandonment is the percentage rate of individuals who left a form without submitting it. For a given time range, the rate is calculated as

```
(Total number of individuals who viewed a form without submitting) ÷ (The total number of individuals who viewed the form) * 100
```

## Interests - Percentage of Active Members

The percentage of active members for interests shows what percent of the active members in a segment is interested in that interest topic. Members of a segment are considered active if they have interacted with your site within the last thirty days. The rate is calculated as

```
(The total number of active segment members who were interested in that topic) ÷ (The total number of active segment members) * 100
```

## Interests - Percentage of Sessions

The percentage of sessions for interests shows what percent of sessions contained that interest topic in the given time range. A session is considered a new session if 30 minutes of inactivity passed since the previous session, or it's the start of a new day (i.e. past midnight). For a given time range, the rate is calculated as

```
(Total number of sessions that contained that interest topic) ÷ (The total number of sessions) * 100
```

## Interests - Percentage of Total Individuals

The percentage of total individuals for interests shows what percent of individuals are interested in a specific topic. For a given time range, the rate is calculated as

```
(Total number of individuals interested in that interest topic) ÷ (The total number of individuals) * 100
```

## Known Individuals

This is the total number of visitors who are identified by a unique `userId` (i.e. user ID) and are associated with an email address. Visitors who have previously logged in are associated with the `userId` they were previously assigned.

## Preview

This is the number of times a document or media was previewed in a given time range.

## Reading Time

Reading time is the average time spent on a blog entry. For a given time range, the rate is calculated as

```
(Total time spent on the blog entry across all views) ÷ (The total number of views) * 100
```

## Search - Percentage of Sessions

The percentage of sessions for search shows what percent of searches contained that search query term in the given time range. A session is considered a new session if 30 minutes of inactivity passed since the previous session, or it's the start of a new day (i.e. past midnight). For a given time range, the rate is calculated as

```
(Total number of sessions that contained that search query term) ÷ (The total number of sessions) * 100
```

## Session Duration

This is the length of time an average session lasts. A session is considered a new session if 30 minutes of inactivity passed since the previous session, or it's the start of a new day (i.e. past midnight).

## Sessions by Location

Sessions by location shows the top countries from which visitors access your site. The top five countries appear along with the percentage value they represent across all sessions. The remaining countries not in the top five are combined as a single percentage value. A session is considered a new session if 30 minutes of inactivity passed since the previous session, or it's the start of a new day (i.e. past midnight).

## Sessions by Technology

Sessions by technology shows the devices, operating systems, and browsers used to visit your site. A breakdown by session percentages appears for different device types, different operating system types, and different browser types. A session is considered a new session if 30 minutes of inactivity passed since the previous session or it's the start of a new day (i.e. past midnight).

## Sessions per Visitor

This is an average of the number of sessions for each unique visitor. A single visitor can open multiple sessions. A session is considered a new session if 30 minutes of inactivity passed since the previous session or it's the start of a new day (i.e. past midnight). For a given time range, the rate is calculated as

```
(Total number of sessions across all visitors) ÷ (The total number of visitors) * 100
```

## Submissions

Submissions is the total number of forms submitted in a given time range.

## Time on Page

Time on page is the average time spent on that page. For a given time range, the rate is calculated as

```
(Total time spent on the page across all views) ÷ (The total number of views) * 100
```

## Total Individuals or Unique Visitors

This is the total number of individuals identified by a unique `userId` (i.e. user ID).

Visitors to your site are assigned a unique `userId`. When visitors log in with their email address, their analytics data continues to be associated with this `userId`. If visitors previously logged in and were already assigned a `userId`, the analytics data is associated with this previously assigned `userId` instead.

A new `userId` is assigned if visitors use a different browser, log in with a different email address, or clear their browser cookies.

## Views

Views is the total number of views of a page or asset in a given time range.

## Visitors by Day and Time

This is the total number of unique visitors for the 24 hours of each day of the week in a given time range. Tooltips for each cell show the number of visitors for that day and time.