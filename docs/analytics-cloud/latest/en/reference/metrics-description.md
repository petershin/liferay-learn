---
uuid: 5dd686af-6ef7-43f3-960e-7630d26ded8a
---
# Metrics Description

See the description of various metrics used by Analytics Cloud and how they are calculated.

Index:
- [Acquisitions - Percentage of Sessions](./metrics-description.md#acquisitions---percentage-of-sessions)
- [Bounce Rate](./metrics-description.md#bounce-rate)
- [Entrances](./metrics-description.md#entrances)
- [Exit Rate](./metrics-description.md#exit-rate)
- [Interests - Percentage of Sessions](./metrics-description.md#interests---percentage-of-sessions)
- [Search - Percentage of Sessions](./metrics-description.md#search---percentage-of-sessions)
- [Session Duration](./metrics-description.md#session-duration)
- [Sessions by Location](./metrics-description.md#sessions-by-location)
- [Sessions by Technology](./metrics-description.md#sessions-by-technology)
- [Sessions per Visitor](./metrics-description.md#sessions-per-visitor)
- [Unique Visitors](./metrics-description.md#unique-visitors)
- [Visitors by Day and Time](./metrics-description.md#visitors-by-day-and-time)

## Acquisitions - Percentage of Sessions

The percentage of sessions for acquisitions shows the breakdown in percentage of the top traffic sources of how visitors arrive to your site. A session is considered a new session if there has been 30 minutes of inactivity since the previous session, or is the start of a new day (i.e. past midnight). For a given time range, the rate is calculated as,

```
(The acquisition traffic source) ÷ (The total number of sessions) * 100
```

## Bounce Rate

The bounce rate shows the percentage of sessions in which an individual visits a page on your site but has no further interactions before the session ends. A session is considered a new session if there has been 30 minutes of inactivity since the previous session, or is the start of a new day (i.e. past midnight). For a given time range, the rate is calculated as,

```
(Total number of bounced sessions) ÷ (The total number of sessions) * 100
```

## Entrances 

Entrances show the most common pages that visitors view first upon entering your site and the number of entrances for each.

## Exit Rate

The percentage of visitors who interacted with the page (such as scrolling or clicking) and then left the site. It does not include bounce rate. For a given time range, the rate is calculated as,

```
(Total number of sessions of the page in which visitors left the site) ÷ (The total number of sessions of the page) * 100
```

## Interests - Percentage of Sessions

The percentage of sessions for interests shows what percent of sessions contained that interest in the given time range. A session is considered a new session if there has been 30 minutes of inactivity since the previous session, or is the start of a new day (i.e. past midnight). For a given time range, the rate is calculated as,

```
(Total number of sessions of that contained that interest) ÷ (The total number of sessions) * 100
```

## Search - Percentage of Sessions

The percentage of sessions for search shows what percent of searches contained that search query term in the given time range. A session is considered a new session if there has been 30 minutes of inactivity since the previous session, or is the start of a new day (i.e. past midnight). For a given time range, the rate is calculated as,

```
(Total number of sessions of that contained that search query term) ÷ (The total number of sessions) * 100
```

## Session Duration

The length of time an average session lasts. A session is considered a new session if there has been 30 minutes of inactivity since the previous session, or is the start of a new day (i.e. past midnight).

## Sessions by Location

Sessions by location shows the top countries from which visitors access your site. The top five countries are listed along with their percentage value they represent across all sessions. The remaining countries that are not in the top five are combined as a single percentage value. A session is considered a new session if there has been 30 minutes of inactivity since the previous session, or is the start of a new day (i.e. past midnight).

## Sessions by Technology

Sessions by technology shows the devices, operating systems, and browsers used to visit your site. A breakdown by session percentages are shown for different device types, different operating system types, and different browser types. A session is considered a new session if there has been 30 minutes of inactivity since the previous session, or is the start of a new day (i.e. past midnight).

## Sessions per Visitor

An average of the number of sessions for each unique visitor. A single visitor can open multiple sessions. A session is considered a new session if there has been 30 minutes of inactivity since the previous session, or is the start of a new day (i.e. past midnight). For a given time range, the rate is calculated as,

```
(Total number of sessions across all visitors) ÷ (The total number of visitors) * 100
```

## Unique Visitors

This is the total number of individuals that are identified by a unique `userId` (i.e. user ID). 

A visitor to your site is assigned a unique `userId`. When the visitor logs in with their email, their analytics data will continue to be associated with this `userId`. If the visitor previously logged in and was already assigned a `userId`, the analytics data will be associated with this previously assigned `userId` instead.

A new `userId` is assigned if the visitor uses a different browser, logs in with a different email address, or clears their browser cookies. 

## Visitors by Day and Time

This is a calculation of the number of unique visitors for the 24 hours of each day of the week in a given time range. Tooltips for each cell show the number of visitors for that day and time.
