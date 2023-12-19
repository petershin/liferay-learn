---
uuid: 265c45d4-e918-4861-987c-9be309ef35bd
---
# Filtering by Stored Fields to Limit the Response Size

By default, Liferay requests all [stored fields](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/mapping-store.html) from Elasticsearch. Stored fields are specified in the mappings:

```json
"userId": {
   "store": true,
   "type": "keyword"
},
```

Usually, returning all stored fields is innocuous, but in some cases an overly large response can result in ERROR messages from Elasticsearch:

```bash
ERROR [http-nio-8080-exec-335][ElasticsearchIndexSearcher:165] java.lang.RuntimeException: java.io.IOException: entity content is too long [117672846] for the configured buffer limit [104857600]
```

The response can become too large for various reasons, including 
Some reasons for a too large response include 

* The search query matched A lot of matches to the search query

* Documents matching the query are large

* Many of the fields in matching documents contain translations

<!-- How is that different from large documents? If this always a function of document number and document size? -->

One way to reduce the response size of searches, or to improve performance generally, is to filter the stored fields. For this you must [create a Search Blueprint](./creating-and-managing-search-blueprints.md) with JSON like the following in the [Advanced Configuration](search-blueprints-configuration-reference.md#advanced-configuration) field:

```json
{
   "source": {
      "fetchSource": false
   },
   "stored_fields": [
      "userId"
   ]
}
```

This configuration communicates two things:

1. Do not include the source field in the response.
1. Return  just the `userId` field.

!!! note
   If you inspect the response or use the _View Results in Document Form_ setting in the Search Results widget, you will notice that more fields returned than those declared in `stored_fields`. Liferay's search framework automatically adds fields needed for Liferay to function properly, such as `entryClassName`, `entryClassPK`, and `companyId`.

## Example: Limiting the Fields Returned in the Search Response

IF you have a system with lots of X, your search response could become too large, resulting in errors from Elasticsearch. Limiting the fields returned can help alleviate the issue.

1. Open the Global Menu (![Global Menu](../../../../images/icon-applications-menu.png)) &rarr; Applications &rarr; Blueprints (Search Experiences).

1. Click _Add_ (![Add](../../../../images/icon-add.png)).

1. Name the blueprint _Filter Stored Fields_.

1. Open the blueprint's [_Preview_](./creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar) screen, and search for _test_.

1. Expand the document preview for the Test Test user and observe that the document contains many fields:

   SCREENSHOT BEFORE CONFIGURATION

1. Click _Configuration_.

1. Replace the contents of the Advanced Configuration field with

   ```json
   {
      "source": {
         "fetchSource": false
      },
      "stored_fields": [
         "userId"
      ]
   }
   ```
1. Open the blueprint's [_Preview_](./creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar) screen, and search for _test_.

1. Expand the document preview for the Test Test user and observe that the document contains only the fields you specified and a few added by Liferay's search framework:

   SCREENSHOT OF DOCUMENT AFTER





END CONTENT

Below here is just notes and stuff copied form tickets/slack threads, to be deleted before forwarding for publication

From https://issues.liferay.com/browse/LPS-194271

https://liferay.slack.com/archives/CKY6GP7BL/p1691553279611099

https://liferay.slack.com/archives/CKY6GP7BL/p1692788966461369

By default Liferay search sets the stored_field to "*" in the search request, meaning that all the fields marked in mappings as store: true will be returned.

If:


… a search response size explosion will highly likely be encountered at some point of the paging because Liferay always retrieves all the documents from 0 to the page number * page size. 

While being able to filter the stored fields to be returned doesn't solve the practically linear search response size increase as a function of result page number (with the same delta), it can essentially help in reducing the search response size and getting rid of the errors related to too big response entity on Elastic's side. Filtering stored fields will also make the search generally faster everywhere where used.

For more information about stored fields, see https://www.elastic.co/guide/en/elasticsearch/reference/7.17/mapping-store.html

Testing
Create a Blueprint

Configure the advanced configuration as follows:

{
	"source": {
		"fetchSource": false
	},
	"stored_fields": [
		"userId"
	]
}

Go to Blueprint preview and search with “test”

Open the “Document Fields” in a result item

Only the following fields should be present:

(assetSearchSummary)
(assetTitle)
companyId
entryClassName
entryClassPK
userId

Notice: stored fields cannot be reseted completely. System always adds entryClassName, entryClassPK and companyId to be returned

Mention any fields that might be returend by our framework, as in https://liferay.atlassian.net/browse/LPS-194271?focusedCommentId=2445811


Mention this note from Petteri:

Setting the stored_fields to an empty array strips all the, sometimes tons of fields out of the response while standard search page still renders correctly.

Tibor adds that we should instruct the reader to test the blueprint thoroughly before putting into production.


With configuration
```json
{
	"source": {
		"fetchSource": false
	},
	"stored_fields": [
		"userId"
	]
}
```

You get this:
Test Test

entryClassName
com.liferay.portal.kernel.model.User

DOCUMENT FIELDS
assetTitle
Test Test
companyId
20095
entryClassName
com.liferay.portal.kernel.model.User
entryClassPK
20123
userId
20123


With configuration 
```json
{
	"source": {
		"fetchSource": false
	}
}
```

The whole document seems to be returned (same as no configuration at all)

With configuration
```json
{
	"stored_fields": [
		"userId"
	]
} 
```

You get this:

Test Test

entryClassName
com.liferay.portal.kernel.model.User
DOCUMENT FIELDS
assetTitle
Test Test
companyId
20095
entryClassName
com.liferay.portal.kernel.model.User
entryClassPK
20123
userId
20123
