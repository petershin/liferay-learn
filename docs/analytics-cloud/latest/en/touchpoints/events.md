---
toc:
  - ./events/tracking-events.md
  - ./events/events-descriptions.md
taxonomy-category-names:
- Content Management System
- Asset Analytics
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
uuid: 72bea17d-f076-44b9-aa36-e243c89e83f0
---

# Events

As individuals visit and interact with your site, Analytics Cloud tracks these events. Many of these events that take place on your Liferay DXP instance are set up to be tracked out-of-the-box. You can also [define and track custom events](./events/tracking-events.md) by adding code snippets to your site. Use the events analysis tool to analyze and filter events based on different attributes. To analyze an event,

1. Navigate to *Touchpoints* &rarr; *Events*.

1. Click the *Create Analysis* button to start a new event analysis. Or view an existing analysis by clicking on its name. Use the search bar to find a specific analysis.

1. In the Analyze row, click the *Add* icon (![Add](../images/icon-add.png)) and select an event to analyze. Or use the search bar to find a specific event.

   ![Select an event to analyze.](./events/images/01.png)

   The Default events are already tracked by Analytics Cloud. The Custom events are events that you have defined and set up. See [Definitions for Events](../workspace-data/definitions.md) to learn more.

   Hover over a specific event in the drop-down list to see the event's description. Click the *Pencil* icon (![Pencil](../images/icon-edit.png)) to edit the description.

1. In the Breakdown row, click *Add* (![Add](../images/icon-plus.png)) and select breakdown attributes.

   ![Select breakdowns for your event.](./events/images/02.png)

1. In the Filter row, click *Add* (![Add](../images/icon-plus.png)) and select attributes to further filter the event.

1. The default time period is set to Last 30 days. Click the drop-down arrow to change to a different time period. Place a check on *Compare to Previous* to compare the event data with a previous time period.

   ![Select a different time period or compare to previous data.](./events/images/03.png)

   There are three tabs (Total, Unique, and Average) to view the breakdown of the event. The Total tab shows the total number of events triggered by all users. The Unique tab shows the total number of unique users who triggered the event. The Average tab shows the average number of events per user.

1. To remove a filter, breakdown, or analysis, click Close (![Close](../images/icon-close.png)) next to the property you wish to change. Then make new selections.

1. To save the event analysis for future viewing, give it a name and click *Save Analysis*. The analysis is made available in the event analysis tool for future viewing.

## Breakdowns and Filters

You can select up to three attributes in the Breakdown row and as many as you need in the Filter row. There are two types of attributes to choose from: [event attributes](../workspace-data/definitions.md#event-attributes) and [individual attributes](../workspace-data/definitions.md#individuals). Each type of event is made of global attributes which are used for every type of event and attributes unique to itself. You can use the event's attributes and the attributes of the individuals that triggered the event for your analysis. The drop-down list shows all available attributes that can be used for filtering. The events analysis tool gives the flexibility to filter by attributes that are both related or unrelated to the events and breakdowns selected.

Hover over a specific attribute in the drop-down list to see the attribute's description and data typecast. Click *Edit* (![Pencil](../images/icon-edit.png)) to edit the description or data typecast. Analytics Cloud automatically tries to detect and cast the datatype based on the first data collected for that attribute. Data is cast as boolean, date, duration, number, or string. The data typecast determines the parameters available for filtering the analysis. For example, selecting an attribute that has a date typecast has filtering options such as a before or after time period. Date, duration, and number typecasts also have a grouping feature to group the data by a set number. For example, a date typecast enables grouping the data by day, month, or year.

![For date, duration, and number, select how to group the data.](./events/images/04.png)

## Related Topics

- [Definitions](../workspace-data/definitions.md)