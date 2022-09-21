---
toc:
- ./personalizing-site-experience/segmentation.md
- ./personalizing-site-experience/experience-personalization.md
- ./personalizing-site-experience/migration-from-audience-targeting.md
- ./personalizing-site-experience/enabling-automated-live-chat-systems.md
- ./personalizing-site-experience/developer-guide.md
---
# Personalizing Site Experience

```{toctree}
:maxdepth: 3

personalizing-site-experience/segmentation.md
personalizing-site-experience/experience-personalization.md
personalizing-site-experience/migration-from-audience-targeting.md
personalizing-site-experience/enabling-automated-live-chat-systems.md
personalizing-site-experience/developer-guide.md
```

Liferay DXP comes out of the box with powerful tools to understand and deliver personalized experiences. The first step to delivering a personalized experience is to start with collecting, or segmenting your users. [*User Segments*](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) are dynamically assigned [*Collections*](../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md). Instead of manually assigning Users to the Collection, Users are assigned to Segments based on shared attributes or behaviors (see [Personalizing Collections](./personalizing-site-experience/experience-personalization/personalizing-collections.md) for more information).

## Segmentation

Using the Segment Builder, you can group similar Users by user profile attributes, behavior, Site Role, and more.

![Build User Segments by checking for different User property values.](./personalizing-site-experience/images/01.png)

See [Creating and Managing a Segment](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) to get started.

```{note}
User Segments can also be used to assign Roles. See [Assigning Roles to User Segments](../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) for more information.
```

### Tracking Behavior of User Segments with Liferay Analytics Cloud

Supercharge your Segments by integrating your Liferay DXP instance with Liferay Analytics Cloud. Analytics Cloud integrates DXP with Salesforce(tm) and other data sources to provide even more ways to understand your user base.

Integration with Analytics Cloud provides in-depth, machine-learning powered, data analytics capabilities to help you understand user behavior and engagement for every page of your DXP Site. Analytics Cloud enables you to see user behavior and interaction with both standard and targeted content. See [Getting Analytics for User Segments](./personalizing-site-experience/segmentation/getting-analytics-for-user-segments.md) for more information.

![Site Metrics using Analytics Cloud.](./personalizing-site-experience/images/05.png)

## Personalization

Once you've [created User Segments](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md), you can begin tailoring Site experiences specific to a User Segment. Content Page Personalization and Content Set Personalization are two methods you can use to deliver personalized user experiences.

### Content Pages

Content Page Personalization dynamically changes the page layout and content based on who is viewing the page. You can create *Experiences* for any [Content Page](./creating-pages/using-content-pages.md) which provide different text, images, widgets, and even different layouts based on the User Segment criteria of the User viewing the page. See [Content Page Personalization](./personalizing-site-experience/experience-personalization/content-page-personalization.md) for more information.

![You can create unique experiences for different segments of Users.](./personalizing-site-experience/images/02.png)

### Collections

[Collections](../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md) organize and display content. [Collections Personalization](./personalizing-site-experience/experience-personalization/personalizing-collections.md) provides a selection of Collections based on User Segments. This means the Content Set that appears in a given context is determined by the [User Segment](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) criteria. For example, you could use a Collections to show "featured" articles at the top of a page. Then you could create User Segments containing users who should receive more specialized content, rather than the default. Those Segments would then see content personalized to their interest rather than the default. See [Personalizing Collections](./personalizing-site-experience/experience-personalization/personalizing-collections.md) for more information.

![You can personalize Content Sets to display assets for specific User Segments.](./personalizing-site-experience/images/03.png)

```{note}
Collections are named Content Sets in Liferay DXP 7.2.
```

### Previewing User Experiences

You can preview the different experiences that users can have on a page by clicking the *Simulation* button (![Simulation](../images/icon-simulation.png)) at the top of the page and selecting a User Segment from the *Segments* selection to preview the page as a member of that User Segment.

Viewing the perspective of a User Segment previews any personalizations for Content Pages or Content Sets for that User Segment.

![You can preview different experiences from the Preview Panel.](./personalizing-site-experience/images/04.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Segmentation
:link: ./personalizing-site-experience/segmentation.md
:::

:::{grid-item-card} Experience Personalization
:link: ./personalizing-site-experience/experience-personalization.md
:::

:::{grid-item-card} Migration from Audience Targeting
:link: ./personalizing-site-experience/migration-from-audience-targeting.md
:::

:::{grid-item-card} Enabling Automated Live Chat Systems
:link: ./personalizing-site-experience/enabling-automated-live-chat-systems.md
:::

:::{grid-item-card} Developer Guide
:link: ./personalizing-site-experience/developer-guide.md
:::
::::
