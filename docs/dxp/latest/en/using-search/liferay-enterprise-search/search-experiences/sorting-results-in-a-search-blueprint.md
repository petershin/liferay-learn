# Sorting Results in a Search Blueprint

Add a [sort configuration](./search-blueprints-configuration-reference.md#sort-configuration) to a search blueprint to control the order of search results. Go to the Global Menu &rarr; Applications &rarr; Blueprints. Add a new blueprint or open an existing one, then click the _Configuration_ tab. Enter your JSON into the Sort Configuration text area.

![Enter JSON to sort a blueprint's results.](./sorting-results-in-a-search-blueprint/images/01.png)

```{important}
* Do not use both the [Sort widget](../../search-pages-and-widgets/search-results/sorting-search-results.md) and a search blueprint to configure sorting on a search page. Consistent behavior cannot be guaranteed.

* The examples here are simple. A robust sort configuration must consider all scenarios, such as what happens when a search result document does not contain the sort field. In that case, use the [`missing`](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/sort-search-results.html#_missing_values) parameter to configure the sort behavior.

   See [Elasticsearch's sorting documentation](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/sort-search-results.html) for more details.
```

## Example 1: Sorting by Title

A sort configuration is a JSON object with a `sorts` array defining the fields to sort by, either in ascending (`asc`) or descending (`desc`) order.

```json
{
   "sorts": [
      {
         "localized_title_en_US_sortable": "asc"
      }
   ]
}
```

```{tip}
* A search document can contain similarly named field variations, especially for localized text fields. Use a localized and sortable field such as `localized_title_en_US_sortable`. Check the document of each entity to find its available fields. For example, `title_sortable` is a common field, but the same entity may also contain `localized_title_en_US_sortable`.

* To see a document's fields, click _Preview_ in the blueprint's toolbar, execute a search, and expand the fields for the result.
```

## Example 2: Sorting by a Structure Field

Web Content Structure fields are indexed as nested fields in the search engine document. 

When viewing the document, you can see the nested properties in the `ddmFieldArray`:

```json
"ddmFieldArray" : [
          {
            "ddmFieldName" : "ddm__keyword__30805__department_en_US",
            "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
            "ddmFieldValueKeyword_en_US" : "true",
            "ddmFieldValueKeyword_en_US_String_sortable" : "true"
          }
```

```{tip}
To view the document with its nested fields, 

1. Enable fetching the document `_source`. Click the blueprint's _Configuration_ tab, then enter this JSON into the Advanced Configuration box:

    ```json
    {
       "source": {
          "fetchSource": true
       }
    }
    ```

1. Now click _Preview_ in the toolbar, search for the result with the nested field, and expand its fields. 
```

For a nested field, the sort configuration's field declaration is more complicated:

```json
{
   "sorts": [
      {
         "ddmFieldArray.ddmFieldValueKeyword_en_US_String_sortable": {
            "nested": {
               "nested_path": "ddmFieldArray",
               "nested_filter": {
                  "term": {
                     "ddmFieldArray.ddmFieldName": {
                        "value": "ddm__keyword__30805__department_en_US"
                     }
                  }
               }
            },
            "order": "asc"
         }
      }
   ]
}
```

## Example 3: Sorting by an Objects Field

Object entry fields are indexed as nested fields in the search engine document. 

When viewing the document, you can see the nested properties of an Object in the `nestedFieldArray`:

```json
"nestedFieldArray" : [
            {
              "fieldName": "total",
              "valueFieldName": "value_integer",
              "value_integer": "8"
            }
```

```{tip}
To view the document with its nested fields, 

1. Enable fetching the document `_source`. Click the blueprint's _Configuration_ tab, then enter this JSON into the Advanced Configuration box:

    ```json
    {
       "source": {
          "fetchSource": true
       }
    }
    ```

1. Now click _Preview_ in the toolbar, search for the result with the nested field, and expand its fields. 
```

Example configuration:

```json
{
   "sorts": [
      {
         "nestedFieldArray.value_integer": {
            "nested": {
               "nested_path": "nestedFieldArray",
               "nested_filter": {
                  "term": {
                     "nestedFieldArray.fieldName": "total"
                  }
               }
            },
            "order": "desc"
         }
      }
   ]
} 
```

## Additional Information

- [Search Blueprints Configuration Reference](search-blueprints-configuration-reference.md)
- [Sorting Search Results](../../search-pages-and-widgets/search-results/sorting-search-results.md)
