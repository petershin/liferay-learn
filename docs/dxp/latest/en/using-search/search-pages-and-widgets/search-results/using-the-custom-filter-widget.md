---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: ee4ef207-d58a-4840-af34-f74fb4a031dc
---
# Using the Custom Filter Widget

!!! note
    This feature works [only with Elasticsearch](../../installing-and-upgrading-a-search-engine/solr/solr-limitations.md).

With Custom Filters, you can contribute queries to the main search query, filtering search results to control what's returned in the Search Results widget. You can make the filter widgets visible or invisible and decide if they're changeable or immutable.

![Apply a custom filter to weed out certain search results.](./using-the-custom-filter-widget/images/03.png)

There are many use cases satisfied by incorporating Custom Filters into your search page.

For now, consider these basic usages:

| Use Case                                                                                                                                   | `Configuration` *(Value)*                                                                                                               |
| :----------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------- |
| **User Title Filter:** End Users directly manipulate the filter key to refine results to the one they were looking for, using the Title    |`Filter Field` *(title\_en\_US)* <br /> `Filter Value` *(podcast)* <br /> `Filter Query Type` *(Match)* <br /> `Occur Type` *(must_not)* |
| **Hard-Coded Filtering:** An administrative User configures the Search Page with filters that are invisible and unchangeable for end Users | ***Add to the above configuration*** <br /> `Invisible` *(True--checked)* <br /> `Immutable` *(True--checked)*                          |

Custom filters can do so many things, it's impossible to list them all. What follows is a widget configuration tour. You can see some example configurations in [Custom Filter Examples](./custom-filter-examples.md).

## Adding a Custom Filter

To explore all the options you have with the Custom Filter widget, you need one on the page:

1. Open the Add menu (![Add](../../../images/icon-add-widget.png)) for the page and expand the Widgets section.

1. From the Search section, drag a Custom Filter onto the page.

![A custom filter has no impact until it's configured.](./using-the-custom-filter-widget/images/01.png)

## Custom Filter Configuration

To begin filtering search results, open the widget's Options Menu (![Options](../../../images/icon-app-options.png)) and click *Configuration*.

**Filter Field (text):** Most often, filters operate on a specific field. Set the name of the indexed field to be filtered (for example, `title`). You won't need this if the Filter Query Type is set to a type that doesn't require a field, such as *Regexp*.

The Query String and Script queries do not require a Filter Field to be set. All other queries require at least one field.
<!--Note: Multi Match and Simple Query String take an array of fields according to the Elasticsearch docs, but our config doesn't seem to support it. -->

To find the fields present in the Liferay DXP index, use [the Field Mappings UI in the Control Panel](#finding-fields).

**Filter Value (text):** For most filters, you must enter a text value here that specifies the text to apply the filter on in the specified field (for example, set a *Match* query to the text *street* on the `title_en_US` field). Some Filter Query Types require special notation, as in the case of the [*Regexp*](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/query-dsl-regexp-query.html) query.

**Filter Query Type (select list):** Select the query type to filter results by. Available types include Bool, Date Range, Exists, Fuzzy, Match, Match Phrase, Match Phrase Prefix, Multi Match, Prefix, Query String, Regexp, Script, Simple Query String, Term, Wildcard.

To learn more about these queries, visit the [Elasticsearch documentation](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/query-dsl.html).

**Occur (select list):** Set the occurrence type for the query being contributed to the search. Options include Filter, must, must_not, and should.

To understand each type, see the [Elasticsearch documentation](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/query-dsl-bool-query.html).

**Query Name (text):** Set the name of the contributed query. This is unnecessary unless this filter acts as a parent query to another filter that contributes child clauses; in that case set this filter's Query Name as the child filter's Parent Query Name. This parent/child behavior is only available for filters of type Bool.

**Parent Query Name (text):** When contributing a child clause to a Bool query, set this to match the Query Name configured in the parent Custom Filter widget. Otherwise, leave it blank.

**Boost (number):** [Boost](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/query-dsl-term-query.html#term-field-params) the score of the results matching this query. Specify any whole or decimal number here that makes sense.

If you always want results matching this at the top, set the Boost value really high (e.g., *1000*).

**Custom Heading (text):** Enter the heading to display for this filter. If not set, the Filter Field's
value is displayed.

**Custom Parameter Name (text):** Specify a URL parameter name for the filter. If not set, the Filter Field's
value is used.

**Invisible (boolean):** If checked, the widget is invisible to regular users. The Filter Value from the configuration is applied by default, but users can still filter for other values via URL Parameter. You can prevent URL parameter filtering with the Immutable setting (see below).

**Immutable (boolean):** Enable this to ensure that the Filter Value cannot be changed by regular users. The widget becomes invisible to them *and* filter values set via URL parameters are not accepted. The Filter Value set in the widget configuration is applied at all times (unless it's disabled). Note that setting Immutable to true means that the Custom Parameter Name value is ignored.

**Disabled (boolean):** If checked, the query is ignored and doesn't participate in searches. This gives you a quick way to stop the filter but keep the configuration so it can be re-enabled later.

**Federated Search Key (text):** Enter the key of an alternate Search this widget is participating on. If it's set, be aware that the default index isn't searched at all. If not set, this widget participates on the default search.

Values in this field typically match the name of an application-defined index.

## Finding Fields

To find the fields you can filter by in the Custom Filter widget, users with the proper permissions can navigate to *Control Panel* &rarr; *Configuration* &rarr; *Search*. From there, open the Field Mappings tab and browse the mappings for the `liferay-[companyId]` index. Scroll to the [`properties`](https://www.elastic.co/guide/en/elasticsearch/reference/current/properties.html) section of the mapping.

![Browse the field mappings to find Liferay DXP's indexed fields.](./using-the-custom-filter-widget/images/04.png)

## Finding and Using Nested Fields

{bdg-secondary}`Available 7.2 FP10+, 7.3 FP1+, 7.4+`

Object definition and [web content structure](../../../liferay-development/liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) fields are indexed as nested fields in Elasticsearch. To filter by a nested field, you must add three Custom Filter widgets to the page. The first widget is for adding the [Elasticsearch `nested` query](https://www.elastic.co/guide/en/elasticsearch/reference/8.13/query-dsl-nested-query.html), while the other two are for defining child queries that match the nested field's name and value. When the final portal query is generated, the `nested` query wraps the child queries.

!!! important
    If you require custom filters on multiple nested fields in the same page, you must configure separate parameter names for each child query. See [Custom Filter Examples](./custom-filter-examples.md#boosting-matches-to-nested-fields) for an example.

To find nested fields in existing documents in the index, use the [Display Results in Document Form](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) setting in the Search Results widget.

For example, an object entry has a `nestedFieldArray` with nested fields:

```json
"nestedFieldArray" : [
   {
     "fieldName" : "lastAcessed",
     "valueFieldName" : "value_date",
     "value_date" : "20230502000000"
   }
],
```

Meanwhile, a web content article has a `ddmFieldArray` with nested fields:

```json
"ddmFieldArray" : [
   {
     "ddmFieldName" : "ddm__keyword__44012__Checkbox08350381_en_US",
     "ddmFieldValueKeyword_en_US" : "true",
     "ddmFieldValueKeyword_en_US_String_sortable" : "true",
     "ddmValueFieldName" : "ddmFieldValueKeyword_en_US"
   }
],
```

Depending on your version, [nested field storage for DDM fields](../../../liferay-development/liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) may be enabled by default for Elasticsearch:

| Liferay Version  | Nested Field Enabled by Default |
| :--------------- | :------------------------------ |
| 7.4 all updates  | &#10004;                        |
| 7.3 all updates  | &#10004;                        |
| DXP 7.2 SP3/FP8+ | &#10008;                        |

To change the behavior, use the *Enable Legacy Dynamic Data Mapping Index Fields* setting in System Settings &rarr; Dynamic Data Mapping Indexer.

See [Boosting Matches to Nested Fields](custom-filter-examples.md#boosting-matches-to-nested-fields) for an example showing the use of a web content structure field with the Custom Filter widget.

## Related Topics

- [Custom Filter Examples](./custom-filter-examples.md)
- [Result Rankings](../../search-administration-and-tuning/result-rankings.md)
- [Synonym Sets](../../search-administration-and-tuning/synonym-sets.md)
