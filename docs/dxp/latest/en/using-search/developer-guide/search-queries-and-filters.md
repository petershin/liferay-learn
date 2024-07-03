---
taxonomy-category-names:
- Search
- Liferay PaaS
- Liferay SaaS
- Java Development
uuid: 637981f4-8656-4b49-9926-18823840bdf9
---
# Search Queries and Filters

To get sensible results from the [search engine](../installing-and-upgrading-a-search-engine/installing-a-search-engine.md), you must provide a sensible query. Liferay's query APIs are found in the `portal-search-api` module. There aren't separate APIs for filters and queries. To filter instead of querying, construct the query (e.g., `fooQuery`) and add it to the search request, specifying it as a filter using the `SearchRequestBuilder.postFilterQuery(fooQuery)` method.
*Filters* ask a yes or no question for every search document and do not calculate relevance. A filter might ask _is the status field equal to staging or live?_

*Queries* ask the same yes or no question compute how well a document matches the specified criteria. This is the concept of [relevance scoring](https://www.elastic.co/guide/en/elasticsearch/guide/current/scoring-theory.html). A query might ask _Does the document's content field field contain the words "Liferay", "Content", or "Management", and how relevant is the content of the document to the searched keywords?_

Here you can deploy, test, and inspect a [Gogo Shell command](../../liferay-internals/fundamentals/using-the-gogo-shell/gogo-shell-commands.md) that queries the [company index](../search-administration-and-tuning/elasticsearch-indexes-reference.md).

## Deploy A Gogo Shell Command with Custom Search Queries

```{include} /_snippets/run-liferay-portal.md
```

Then, download the project and complete some prerequisites:

1. Download and unzip the liferay-b9f3 project:

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/using-search/developer-guide/liferay-b9f3.zip -O
   ```

   ```bash
   unzip liferay-b9f3.zip
   ```

1. From the module root, build and deploy.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
       This command is the same as copying the deployed jars to `/opt/liferay/osgi/modules` on the Docker container.

1. Confirm the deployment in the Liferay Docker container console.

    ```bash
    STARTED com.acme.b9f3.impl_1.0.0 [1775]
    ```

1. The B9F3 sample includes a shell script you can run to load documents and content into Liferay. First retrieve the default site's ID and the global site's ID from the running Liferay instance. Open a browser and load <http://localhost:8080>.

1. In the default site, open *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) &rarr; *Configuration* &rarr; *Site Settings*.

1. Go to *Site Configuration* and record the Site ID.

1. Go to the Global site. Click *Site Selector* (![Site Selector](../../images/icon-compass.png)) &rarr; *Available Sites* &rarr; *Global*.

1. Find and record the Site ID for the Global site.

1. To load a document into Liferay, go to `liferay-b9f3/curl`. 

1. Run the shell script with the site IDs as arguments:

    ```bash
    ./populate_b9f3.sh [default site ID] [global site ID]
    ```

    For example,

    ```bash
    ./populate_b9f3.sh 20116 20119
    ```

    The script adds these resources:

    <!-- Could make this a table with the folder ID -->
    - Web Content:
        - Able Content
        - Able Content Folder
            - Able Content 

    - Document and Media:
        - Able Document
        - Able Document Folder
            - Able Document 

## Test the B9F3 Search Queries

1. On the locally running Liferay's home page, enter _able_ into the search bar:


    Six results appear.

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)), navigate to *Control Panel* &rarr; *Gogo Shell*.

<!--Captcha makes this annoying--new approach? Something with headless? A search service with an OSGi config UI? -->
1. Enter _b9f3:search able_ and answer the CAPTCHA challenge.

1. Click _Execute_. 

   ![You can execute the search query from the Gogo shell.](./search-queries-and-filters/images/01.png)

1. Four results appear, all of them root content. Anything nested inside the created folders does not have a `folderId` of `0`, and is not returned. However, the folders themselves are returned, because they are contained in the root folder, and given a `folderId` of `0`.

!!! tip
    The root folder in the Documents and Media and Web Content applications have a `folderId` of `0`. You can check the indexed folder ID of each search result by enabling _Display Results in Document Form_ in the Search Results widget. See [Inspecting Search Engine Documents](../search-pages-and-widgets/search-results/configuring-the-search-results-widget.md#inspecting-search-engine-documents) for more information. 

## Understanding the B9F3 Search Queries

Initialize a `SearchRequestBuilder`. You can use this object to construct the search request you'll later execute.

```java
SearchRequestBuilder searchRequestBuilder =
    _searchRequestBuilderFactory.builder();
```
```{literalinclude} ./search-queries-and-filters/resources/liferay-b9f3.zip/b9f3-impl/src/main/java/com/acme/b9f3/internal/osgi/commands/B9F3OSGiCommands.java
   :dedent: 2
   :language: java
   :lines: 32-33
```

Next, populate the `SearchContext` within the request. This sets the entry class names to search and the company ID of the instance to search within. It also sets the keywords to search. These keywords are entered by the user at search time.

<!-- Is this still true? I had this in the 7.2 docs. -->
!!! note
    You must either set keywords into the search context or enable empty search in the request builder with `searchRequestBuilder.emptySearchEnabled(true);`.

```java
		searchRequestBuilder.withSearchContext(
			searchContext -> {
				searchContext.setCompanyId(_portal.getDefaultCompanyId());
				searchContext.setEntryClassNames(
					new String[] {
						"com.liferay.document.library.kernel.model.DLFileEntry",
						"com.liferay.document.library.kernel.model.DLFolder",
						"com.liferay.journal.model.JournalArticle",
						"com.liferay.journal.model.JournalFolder"
					});
				searchContext.setKeywords(keywords);
			});
            ```
```{literalinclude} ./search-queries-and-filters/resources/liferay-b9f3.zip/b9f3-impl/src/main/java/com/acme/b9f3/internal/osgi/commands/B9F3OSGiCommands.java
   :dedent: 2
   :language: java
   :lines: 35-46
```


Now fashion the query clauses. This example nests two MUST query clauses inside a boolean query: one clause is a term query for matching the `folderId` field to the value `0`, and the other is for performing a full text match query of the user's search keywords to the localized title field.

```java
		BooleanQuery booleanQuery = _queries.booleanQuery();

		booleanQuery.addMustQueryClauses(
			_queries.term(Field.FOLDER_ID, "0"),
			_queries.match(
				StringBundler.concat(
					"localized_", Field.TITLE, StringPool.UNDERLINE,
					LocaleUtil.US),
				keywords));
```
```{literalinclude} ./search-queries-and-filters/resources/liferay-b9f3.zip/b9f3-impl/src/main/java/com/acme/b9f3/internal/osgi/commands/B9F3OSGiCommands.java
   :dedent: 2
   :language: java
   :lines: 48-56
```

Add the boolean query with its nested clauses to the request, execute the request, then process the response as needed. This just prints the document's `uid` field and its score.

```java
		SearchRequest searchRequest = searchRequestBuilder.query(
			booleanQuery
		).build();

		SearchResponse searchResponse = _searcher.search(searchRequest);

		SearchHits searchHits = searchResponse.getSearchHits();

		for (SearchHit searchHit : searchHits.getSearchHits()) {
			Document document = searchHit.getDocument();

			String uid = document.getString(Field.UID);

			System.out.println(
				StringBundler.concat(
					"Document ", uid, " has a score of ",
					searchHit.getScore()));
		}
```

```{literalinclude} ./search-queries-and-filters/resources/liferay-b9f3.zip/b9f3-impl/src/main/java/com/acme/b9f3/internal/osgi/commands/B9F3OSGiCommands.java
   :dedent: 2
   :language: java
   :lines: 58-75
```

These are the Liferay services referenced in the B9F3 code:

```java
@Reference
private Portal _portal;

@Reference
private Queries _queries;

@Reference
private RoleLocalService _roleLocalService;

@Reference
private Searcher _searcher;

@Reference
private SearchRequestBuilderFactory _searchRequestBuilderFactory;

@Reference
private UserLocalService _userLocalService;
```
```{literalinclude} ./search-queries-and-filters/resources/liferay-b9f3.zip/b9f3-impl/src/main/java/com/acme/b9f3/internal/osgi/commands/B9F3OSGiCommands.java
   :dedent: 1
   :language: java
   :lines: 78-95
```

## Implementing Nested Queries

To create queries for object fields, web content structure fields, or document metadata sets, you must query the field according to its nested structure using a [nested query](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-nested-query.html). Inside the query, specify the path (e.g., `ddmFieldArray` for web content and document metadata sets, `nestedFieldArray` for objects) and create a boolean query with two clauses that use dot notation: one clause matches the field name, and the other matches the value (e.g., the user's keywords).


### Querying Web Content Structure Fields 

Web content structures and documents and media metadata sets are indexed similarly. A web content structure field is indexed like this:


```
{
   ddmFieldName=ddm__text__35174__Text25689566_en_US,
   ddmFieldValueText_en_US_String_sortable=able text,
   ddmValueFieldName=ddmFieldValueText_en_US,
   ddmFieldValueText_en_US=Able text
}
```

In Elasticsearch's query syntax you might create a query like this for the field: 

```json
{
  "nested": {
    "path": "ddmFieldArray",
    "query": {
      "bool": {
        "must": [
          {
            "match": {
              "ddmFieldArray.ddmFieldName": "ddm__text__35174__Text25689566_en_US"
            }
          },
          {
            "match": {
              "ddmFieldArray.ddmFieldValueText_en_US": "${keywords}"
            }
          }
        ]
      }
    }
  }
}
```

You can create the same query in Liferay's Java search API:

```java
BooleanQuery booleanQuery = queries.booleanQuery();

MatchQuery fieldNameQuery = queries.match("ddmFieldArray.ddmFieldName", "ddm__text__35174__Text25689566_en_US");

MatchQuery fieldValueQuery = queries.match("ddmFieldArray.ddmFieldValueKeyword_en_US", keywords);

booleanQuery.addMustQueryClauses(fieldNameQuery, fieldValueQuery);

NestedQuery nestedQuery = queries.nested("ddmFieldArray", booleanQuery);
```

### Querying Object Fields

An object's text field is indexed like this:

```
[
   {
      fieldName=fooText,
      value_en_US=Able Text,
      valueFieldName=value_en_US
   },
   {
      fieldName=fooText,
      value_keyword_lowercase=Able Text,
      valueFieldName=value_keyword_lowercase
   }
]
```

In Elasticsearch's query syntax you might create a query like this for the field: 

```json
{
  "nested": {
    "path": "nestedFieldArray",
    "query": {
      "bool": {
        "must": [
          {
            "match": {
              "nestedFieldArray.fieldName": "fooText"
            }
          },
          {
            "match": {
              "nestedFieldArray.value_en_US": "${keywords}"
            }
          }
        ]
      }
    }
  }
}
```

You can create the same query in Liferay's Java search API:

```java
BooleanQuery booleanQuery = queries.booleanQuery();

MatchQuery fieldNameQuery = queries.match("nestedFieldArray.fieldName", "fooText");

MatchQuery fieldValueQuery = queries.match("nestedFieldArray.value_en_US", keywords);

booleanQuery.addMustQueryClauses(fieldNameQuery, fieldValueQuery);

NestedQuery nestedQuery = queries.nested("nestedFieldArray", booleanQuery);
```

## Filtering

There's no separate API for filtering. Construct the query as usual and add it to the search request, specifying it as a filter using the `SearchRequestBuilder.postFilterQuery(fooQuery)` method.

For example, you can change the B9F3 code to first filter the documents with the `folderId` of `0` and then perform the match query on the keywords and title field:

<!-- First Approach: -->
```java
TermQuery termQuery = _queries.term(Field.FOLDER_ID, "0");

searchRequestBuiler.postFilterQuery(termQuery);

MatchQuery matchQuery = _queries.match(
    StringBundler.concat(
        "localized_", Field.TITLE, StringPool.UNDERLINE,
            LocaleUtil.US), keywords);

searchRequestBuilder.query(matchQuery);

SearchRequest searchRequest = searchRequestBuilder.build();
```
<!-- Second Approach: -->
```java
BooleanQuery booleanQuery = _queries.booleanQuery();

booleanQuery.addFilterQueryClauses(
    _queries.term(Field.FOLDER_ID, "0"));

booleanQuery.addMustQueryClauses(
    _queries.match(
        StringBundler.concat(
            "localized_", Field.TITLE, StringPool.UNDERLINE,
            LocaleUtil.US),
        keywords));

SearchRequest searchRequest = searchRequestBuilder.query(
   booleanQuery
).build();
```

## Related Topics

- [Search Headless API](search-headless-apis.md)
- [Search Blueprints](../liferay-enterprise-search/search-experiences/search-blueprints.md)
