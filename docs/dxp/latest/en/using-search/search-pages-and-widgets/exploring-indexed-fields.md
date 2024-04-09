---
uuid: 845f8b22-fb9a-4d64-981b-51d542224c47
---
# Exploring Indexed Fields

Liferay's search widgets are customizable, and sometimes this requires exploring the fields of search documents or inspecting the mappings that determine how fields are indexed and searched.

MASH-UP SCREENSHOT OF MAPPINGS UI, DOCUMENT SRC, BLUEPRINTS PREVIEW, MAYBE SEARCH INSIGHTS


| Widget | Relevant Configurations | Requirement | Where to Look |
| :--- | :--- | :--- | :--- |
| Custom Facet | Aggregation Field | Finding `keyword` fields | Document Source<br>Field Mappings
| Sort Widget | Field | Finding sortable fields<br>Discovering sortable variant fields or sub-fields | Document Source<br>Field Mappings |
| Custom Filter | Field<br>Query | Finding the proper field types for a given query<br>Seeing result scores to tune boosting | Document Source<br>Field Mappings<br>Search Insights Response String |
| Search Blueprints | Various element and blueprint configurations | Finding the proper field types for a given query<br>Seeing result scores to tune boosting | Blueprint Preview<br>Field Mappings |


## Viewing the Document Source

## Inspecting the Mappings

To use the Custom Facet, you must know which non-analyzed keyword field to use in the configuration. 

!!! tip
    The Custom Facet uses keyword fields, but some `text` and `icu_collation_keyword` fields in Liferay are mapped with `keyword` sub-fields and are usable in the Custom Facet. [Accessing Sub-Fields](#accessing-sub-fields) and the example below on [creating facets for Custom Fields](#accessing-custom-fields).

To browse the entire list of available fields, inspect the field mappings from *Control Panel* &rarr; *Configuration* &rarr; *Search* (click the *Field Mappings* tab). Here you'll see numerous indexes. Liferay's main content is indexed into the [company index](../../search-administration-and-tuning/elasticsearch-indexes-reference.md), which is named `liferay-[company id]` (e.g., `liferay-10819726314237`).

When you find the field, note its type and if it has sub-fields. Some fields are mapped as `text` fields to enable full text search or as `icu_collation` fields to enable sorting, but given a sub-field of type `keyword` for using in aggregations (i.e., facets).

### Discovering Sub-Fields

 Elasticsearch can index [multi-fields](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/multi-fields.html), adding sub-field mappings to the main field. Some `text` and `icu_collation_keyword` fields in Liferay are mapped with `keyword` sub-fields and are usable in the Custom Facet. 

To use sub-fields in the Custom Facet, use dot notation (e.g., `fieldName.sub_field_name`). Examples include `assetTagNames.raw` and `title_en_US_sortable.keyword_lowercase`. Some [nested fields](#accessing-nested-fields) are mapped this way.

!!! warning
    You can see sub-fields when you view the mappings in Liferay, but they are not present in the document source. Therefore, you cannot find these fields using the [Display Results in Document Form setting](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) in Search Results.

### Using the Search Engine's API

Alternatively, use your search engine's API to browse the mappings. You can access Elasticsearch's field mappings from your terminal using cURL to call the [Get Mapping API](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/indices-get-mapping.html):

 ```bash
curl -X GET "localhost:9200/_mapping?pretty"
 ```

!!! tip
    [Kibana's](../../liferay-enterprise-search/monitoring-elasticsearch.md) Dev Tools console is more convenient for making Elasticsearch API calls than cURL.

Solr uses the [ListFields API](https://lucene.apache.org/solr/guide/6_6/schema-api.html#SchemaAPI-ListFields):

```bash
curl http://localhost:8983/solr/liferay/schema/
```

Here's a snippet of output from the Elasticsearch example:

```json
"ddmStructureKey": {
  "store": true,
  "type": "keyword"
},
"ddmTemplateKey": {
  "store": true,
  "type": "keyword"
},
"defaultLanguageId": {
  "store": true,
  "type": "keyword"
},
"description": {
  "store": true,
  "term_vector": "with_positions_offsets",
  "type": "text"
},
"discussion": {
  "store": true,
  "type": "keyword"
},
```

## Accessing Custom Fields 

When you create a [Custom Field](./../../../system-administration/configuring-liferay/adding-custom-fields.md) with the setting _Searchable as Keyword_ enabled, the custom field is indexed with the backing asset (Blogs Entries, for example). After reindexing it's also applied to existing entries. The field itself is a text field, named like `expando__keyword__custom_fields__Enabled` (if you name the field _Enabled_ in the Custom Fields UI), but it contains a nested field mapping for creating a separate `raw` keyword field. 

To use the raw field in the Custom Facet, append `.raw` to the Custom Field name in the _Aggregation Field_:

`expando__keyword__custom_fields__Enabled.raw`
 
Here's the query you can run in Kibana to inspect the text field's mapping (replace the Company Id---`20097`---in the index name parameter):

```bash 
GET /liferay-20097/_mapping/field/expando__keyword__custom_fields__Enabled
```

JSON is returned: 

```json
{
  "liferay-20097" : {
    "mappings" : {
      "expando__keyword__custom_fields__Enabled" : {
        "full_name" : "expando__keyword__custom_fields__Enabled",
        "mapping" : {
          "expando__keyword__custom_fields__Enabled" : {
            "type" : "text",
            "store" : true,
            "fields" : {
              "raw" : {
                "type" : "keyword"
              }
            },
            "analyzer" : "keyword_lowercase"
          }
        }
      }
    }
  }
}
```

To see all the raw fields, query the index for `*.raw` fields:

```bash 
GET /liferay-20097/_mapping/field/*.raw
```

Setting a custom field to searchable means that the value of the field is indexed when the entity is modified or when a reindex is triggered. Only `java.lang.String` fields can be made searchable.

## Accessing Nested Fields

Object definition fields and web content structure fields are indexed as nested fields in Elasticsearch.

For Liferay 7.4 U72/GA72+, you can use these fields in a Custom Facet widget's Aggregation Field configuration. To do this, enter these elements separated by periods:

* Parent field

* Name of the field that holds the field name

* Name of the field that holds the value

This example references an object field:

```
nestedFieldArray.lastAccessed.value_date
```

This example references a web content structure field:

```
ddmFieldArray.ddm__keyword__40806__Textb5mx_en_US.ddmFieldValueKeyword_en_US_String_sortable.keyword_lowercase
```

### Using Object Definition Fields in the Custom Facet

{bdg-secondary}`7.4 U72+/GA72+`

To find [object definition](../../../liferay-development/objects.md) fields in existing documents in the index, use the [Display Results in Document Form](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) setting in the Search Results widget.

The document has a `nestedFieldArray` field with nested content:

```json
"nestedFieldArray" : [
   {
     "fieldName" : "lastAcessed",
     "valueFieldName" : "value_date",
     "value_date" : "20230502000000"
   },
   {
     "fieldName" : "immunityType",
     "valueFieldName" : "value_keyword",
     "value_keyword" : "diplomatic"
   },
   {
     "fieldName" : "randomNumber",
     "valueFieldName" : "value_integer",
     "value_integer" : "19"
   }
],
```

To use an object field in a Custom Facet widget's Aggregation Field configuration, specify the parent field (e.g., `nestedFieldArray`), the name of the field that holds the field name (e.g., `fieldName`), and the name of the field that holds the value (e.g., `value_date`). Use this pattern: `nestedFieldArray.[fieldName].[valueFieldName]`.

For example, you can sort by the `lastAccessed` date field in the nested array above by entering `nestedFieldArray.lastAccessed.value_date`.

### Using Web Content Structure Fields in the Custom Facet

To find [nested web content structure (DDM) fields](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) in existing documents in the index, use the [Display Results in Document Form](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) setting in the Search Results widget.

The document has a `ddmFieldArray` field with nested content:

```json
 "ddmFieldArray" : [
    {
      "ddmFieldName" : "ddm__keyword__40806__Textb5mx_en_US",
      "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
      "ddmFieldValueKeyword_en_US_String_sortable" : "some text has been entered",
      "ddmFieldValueKeyword_en_US" : "some text has been entered"
    },
    {
      "ddmFieldName" : "ddm__keyword__40806__Selectjdw0_en_US",
      "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
      "ddmFieldValueKeyword_en_US_String_sortable" : "option 3",
      "ddmFieldValueKeyword_en_US" : "value 3"
    },
    {
      "ddmFieldName" : "ddm__keyword__40806__Boolean15cg_en_US",
      "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
      "ddmFieldValueKeyword_en_US" : "true",
      "ddmFieldValueKeyword_en_US_String_sortable" : "true"
    }
  ],
```

To use one of these fields in a Custom Facet, enter the `ddmFieldName` value (e.g., `ddm__keyword__40806__Testb5mx_en_US`) in the widget's Aggregation Field.

Depending on your version, [nested field storage for DDM fields](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) may be enabled by default for Elasticsearch:

| Liferay Version  | Nested Field Enabled by Default |
| :--------------- | :------- |
| 7.4 all updates  | &#10004; |
| 7.3 all updates  | &#10004; |
| DXP 7.2 SP3/FP8+ | &#10008; |

To change the behavior, use the _Enable Legacy Dynamic Data Mapping Index Fields_ setting in System Settings &rarr; Dynamic Data Mapping Indexer.

## Related Topics

* [Searching for Content](../../getting-started/searching-for-content.md)
* [Search Administration](../../search-administration-and-tuning/search-administration.md)
* [Using the Custom Filter Widget](../search-results/using-the-custom-filter-widget.md)
