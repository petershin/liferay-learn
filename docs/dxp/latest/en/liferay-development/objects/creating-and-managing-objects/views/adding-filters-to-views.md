---
uuid: a86d41a7-27d7-48a2-8ef2-5969338ddb94
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Adding Filters to Views

{bdg-secondary}`Liferay 7.4 U49+/GA49+`

When designing a custom view, you can determine which fields appear as filter facets. Also, you can set default filters that apply automatically to the view table whenever users visit the object's application page.

Follow these steps:

1. Begin editing the desired view and go to the *Filters* tab.

1. Click *Add* (![Add Button](../../../../images/icon-add.png)).

1. Select a *field* to filter by.

   You can select Workflow Status, Creation Date, Modified Date, picklist fields, or relationship fields.

1. Select a filter type: *Include* or *Exclude*. This determines whether the default filter includes or excludes entries with the following values.

1. (Optional) Enter field values to use as a default filter.

   ![Select a field, filter type, and default values.](./adding-filters-to-views/images/01.png)

1. Click *Save*.

1. Repeat the above process to add additional field filters to the view.

   ![Add multiple field filters to the view.](./adding-filters-to-views/images/02.png)

1. Click *Save*.

Once saved, users can filter object entries using the added fields, and default filters are applied automatically.

![Users can filter entries using the added fields.](./adding-filters-to-views/images/03.png)

## Related Topics

* [Views](../views.md)
* [Designing Object Views](./designing-object-views.md)
