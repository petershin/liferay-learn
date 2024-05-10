---
taxonomy-category-names:
- Personalization
- Static and Dynamic User Segments
- Upgrade
- Liferay Self-Hosted
- Liferay PaaS
uuid: 28ec84a2-e8ed-4564-84eb-d8289a5c1139
---
# Manually Migrating from Audience Targeting

Due to the similarities between Audience Targeting user segments and Liferay 7.2+ Segments, most of your configuration is automatically transferred into Liferay Segmentation during the upgrade (see [Migrating User Segments](./migrating-user-segments.md) for more information.) However, some Audience Targeting rules do not have a direct equivalent in Liferay 7.2+ Segmentation. You can find the recommended solution for each rule type here.

## User Attribute Rules

Some User Attributes, like Gender or Age, do not have a direct equivalent in Liferay 7.2+. User Attributes retrieved from external sources like Facebook also do not have a replacement. To replace these, you must [create a custom user field](../../../system-administration/configuring-liferay/adding-custom-fields.md) and use that to define your new Segment.

## Session Rules

For Session attributes that do not have a direct equivalent, use a URL field for the current URL or a previously visited URL on your site as criteria. For more advanced session tracking needs, use a Cookie.

## Behavior Rules

Starting with Liferay 7.2+, behavior-based rules are managed using Analytics Cloud. For more information, see the [Analytics Cloud documentation](https://learn.liferay.com/w/analytics-cloud/people/segments/segments).

## Migrating Custom Rules

Before migrating to Liferay 7.2+, evaluate any Audience Targeting custom rules with consideration to newer Liferay Segmentation functionality. Start by checking how the [Liferay Segments' properties](../segmentation/segments-editor-ui-reference.md) can replace your Audience Targeting custom rules.

If you need to re-implement a rule entirely, follow the information in [Creating and Managing User Segments](../segmentation/creating-and-managing-user-segments.md).

## Migrating Display Properties

With Audience Targeting, you could display personalized content using the User Segment Content Display or an Asset Publisher personalization. The method you use to personalize content with Audience Targeting determines the way to personalize this content in Liferay Segmentation.

| Audience Targeting Method       | Liferay Segmentation Method                                                                                                                                           |
| :------------------------------ | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| User Segment Content Display    | [Manual Content Sets or Collections](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md#creating-a-manual-collection) |
| Asset Publisher Personalization | [Dynamic Content Sets](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md#creating-a-dynamic-collection)              |

!!! note
    For users on Liferay 7.2, Collections are referred to as [Content Sets](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md#liferay-dxp-7-2).

Whether you use Content Sets or Collections, you can personalize the content using [Personalized Variations](../experience-personalization/personalizing-collections.md).

In addition, the [Content Page personalization](../../../site-building/personalizing-site-experience/experience-personalization/content-page-personalization.md) feature may fulfill a use case that you were previously solving with one of the Audience Targeting methods.

## Related Topics

- [Adding Custom Fields](../../../system-administration/configuring-liferay/adding-custom-fields.md)
- [Segments Editor UI Reference](../segmentation/segments-editor-ui-reference.md)
- [Creating Collections](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md)
- [Analytics Cloud Segments](https://learn.liferay.com/w/analytics-cloud/people/segments/segments)