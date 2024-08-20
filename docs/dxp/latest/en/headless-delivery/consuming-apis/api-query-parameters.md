---
uuid: 7b3a2c98-4dcc-4e82-814d-d50ba40070c5
taxonomy-category-names:
- Platform
- Multi-Channel Experiences (Headless Delivery)
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# API Query Parameters

Whether you consume [REST APIs](./consuming-rest-services.md) or [GraphQL APIs](./consuming-graphql-apis.md), different query parameters are available to help you filter the responses.

## Fields Parameter

Use this parameter to specify and return only the fields specified. For example, query the countries API to return only the two-letter country code and country name.

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
   countries {
      actions
      items {
         a2
         name
      }
      lastPage
      page
      pageSize
      totalCount
   }
}
```

The JSON response:

```json
{
   "actions": {},
   "facets": [],
   "items": [
      {
         "a2": "CD",
         "name": "democratic-republic-of-congo"
      },
      {
         "a2": "ML",
         "name": "mali"
      },
      {
         "a2": "BV",
         "name": "bouvet-island"
      },
      {
         "a2": "UY",
         "name": "uruguay"
      },
      {
         "a2": "SB",
         "name": "solomon-islands"
      },
      {
         "a2": "LT",
         "name": "lithuania"
      },
      {
         "a2": "LV",
         "name": "latvia"
      },
      {
         "a2": "KN",
         "name": "st-kitts"
      },
      {
         "a2": "MD",
         "name": "moldova"
      },
      {
         "a2": "IO",
         "name": "british-indian-ocean-territory"
      },
      {
         "a2": "NP",
         "name": "nepal"
      },
      {
         "a2": "SC",
         "name": "seychelles"
      },
      {
         "a2": "PH",
         "name": "philippines"
      },
      {
         "a2": "AO",
         "name": "angola"
      },
      {
         "a2": "MT",
         "name": "malta"
      },
      {
         "a2": "SL",
         "name": "sierra-leone"
      },
      {
         "a2": "PT",
         "name": "portugal"
      },
      {
         "a2": "GG",
         "name": "guernsey"
      },
      {
         "a2": "DM",
         "name": "dominica"
      },
      {
         "a2": "NF",
         "name": "norfolk-island"
      }
   ],
   "lastPage": 13,
   "page": 1,
   "pageSize": 20,
   "totalCount": 247
}
```

## Filter Parameter

You can use the `filter` parameter to filter the response for API endpoints. For example, you can filter blog postings by title (e.g. `headline eq 'Able'`).

Use the [API Explorer](./consuming-rest-services.md) to discover an API's parameters.

!!! note
    Only fields indexed as a keyword support filtering. To find content by text fields, use the [search](#search-parameter) parameter instead.

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-delivery/v1.0/sites/20121/blog-postings?fields=articleBody,headline&filter=headline%20eq%20%27Able%27" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
   blogPostings(filter: "headline eq 'Able'", siteKey: "20121") {
      page
      items {
         articleBody
         headline
      }
   }
}
```

The JSON response:

```json
"data": {
   "blogPostings": {
      "page": 1,
      "items": [
      {
         "articleBody": "<p>Able able able</p>",
         "headline": "Able"
      }
      ]
   }
}
```

Various operators can be used for filtering.

**Comparison Operators**

| Operator | Description         | Example                               |
| :------- | :------------------ | :------------------------------------ |
| `eq`     | Equal               | `addressLocality eq 'Redmond'`        |
| `eq`     | Equal null          | `addressLocality eq null`             |
| `ne`     | Not equal           | `addressLocality ne 'London'`         |
| `ne`     | Not null            | `addressLocality ne null`             |
| `gt`     | Greater than        | `price gt 20`                         |
| `ge`     | Great than or equal | `price ge 10`                         |
| `lt`     | Less than           | `dateCreated lt 2018-02-13T12:33:12Z` |
| `le`     | Less than or equal  | `dateCreated le 2012-05-29T09:13:28Z` |

**Logical Operators**

| Operator | Description | Example                         |
| :------- | :---------- | :------------------------------ |
| `and`    | Logical and | `price le 200 and price gt 3.5` |
| `or`     | Logical or  | `price le 3.5 or price gt 200`  |
| `not`    | Logical not | `not (price le 3.5)`            |

The `not` operator needs a space character after it.

**Grouping Operator**

| Operator | Description         | Example                                         |
| :------- | :------------------ | :---------------------------------------------- |
| `( )`    | Precedence grouping | `(price eq 5) or (addressLocality eq 'London')` |

**String Functions**

| Function     | Description | Example                               |
| :----------- | :---------- | :------------------------------------ |
| `contains`   | Contains    | `contains(title,'edmon')`             |
| `startswith` | Starts with | `startswith(addressLocality, 'Lond')` |

**Lambda Operators**

Lambda operators evaluate a boolean expression on a collection field (e.g, a resource's `keywords`). They must be prepended with a navigation path that identifies a collection.

| Lambda Operator | Description | Example                              |
| :-------------- | :---------- | :----------------------------------- |
| `any`           | Any         | `keywords/any(k:contains(k,'news'))` |

The `any` operator applies a boolean expression to each collection element and evaluates to `true` if the expression is true for any element.

**Operator Combinations and OData Syntax**

Syntax examples and other operator combinations are covered in the [OData standard reference](https://docs.oasis-open.org/odata/odata/v4.01/csprd06/part1-protocol/odata-v4.01-csprd06-part1-protocol.html#sec_BuiltinFilterOperations).

## Flatten Parameter

Use this parameter to retrieve items within a hierarchical structure, such as fetching parent user groups and their respective child user groups. For example, Raylife Global serves as the parent organization for various regional Raylife organizations.

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-admin-user/v1.0/organizations?fields=id,name&flatten=true" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
   organizations(flatten: true) {
      actions
      items {
         id
         name
      }
      lastPage
      page
      pageSize
      totalCount
   }
}
```

The JSON response:

```json
{
   "actions": {
      // Actions data...
   },
   "facets": [],
   "items": [
      {
         "id": "46367",
         "name": "Raylife APAC"
      },
      {
         "id": "46372",
         "name": "Raylife EMEA"
      },
      {
         "id": "46377",
         "name": "Raylife LATAM"
      },
      {
         "id": "46382",
         "name": "Raylife NA"
      },
      {
         "id": "46616",
         "name": "Raylife Global"
      }
   ],
   "lastPage": 1,
   "page": 1,
   "pageSize": 20,
   "totalCount": 5
}
```

## Page and Page Size Parameters

Use these parameters to specify which subset of items to return. The `page` parameter specifies which page to return out of all the pages available. The `pageSize` parameter specifies how many items you want per page. For example, query the countries API for a `pageSize=10` and `page=22` (i.e. the 22nd page of items).

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&page=22&pageSize=10" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
   countries(page: 22, pageSize: 10) {
      actions
      items {
         a2
         name
      }
      lastPage
      page
      pageSize
      totalCount
   }
}
```

The JSON response:

```json
{
   "actions": {},
   "facets": [],
   "items": [
      {
         "a2": "KG",
         "name": "kyrgyzstan"
      },
      {
         "a2": "RE",
         "name": "reunion-island"
      },
      {
         "a2": "CK",
         "name": "cook-islands"
      },
      {
         "a2": "ER",
         "name": "eritrea"
      },
      {
         "a2": "GE",
         "name": "georgia"
      },
      {
         "a2": "MW",
         "name": "malawi"
      },
      {
         "a2": "CO",
         "name": "colombia"
      },
      {
         "a2": "GW",
         "name": "guinea-bissau"
      },
      {
         "a2": "SN",
         "name": "senegal"
      },
      {
         "a2": "TW",
         "name": "taiwan"
      }
   ],
   "lastPage": 25,
   "page": 22,
   "pageSize": 10,
   "totalCount": 247
}
```

## Search Parameter

Use this parameter to filter items by a search term. For example, search the countries API for the search term `united`.

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&search=united" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
   countries(search: "united") {
      actions
      items {
         a2
         name
      }
      lastPage
      page
      pageSize
      totalCount
   }
}
```

The JSON response:

```json
{
   "actions": {},
   "facets": [],
   "items": [
      {
         "a2": "GB",
         "name": "united-kingdom"
      },
      {
         "a2": "US",
         "name": "united-states"
      },
      {
         "a2": "UM",
         "name": "united-states-minor-outlying-islands"
      },
      {
         "a2": "VI",
         "name": "united-states-virgin-islands"
      },
      {
         "a2": "AE",
         "name": "united-arab-emirates"
      }
   ],
   "lastPage": 1,
   "page": 1,
   "pageSize": 20,
   "totalCount": 5
}
```

## Sort Parameter

You can use the `sort` parameter to sort the response for API endpoints in ascending (`asc`) or descending (`desc`) order. Use the [API Explorer](./consuming-rest-services.md) to discover an API's parameters.

To sort by more than one parameter, separate parameter names by a comma and order them by priority. For example, to sort first by title and then by creation date, append `sort=title,dataCreated` to the request.

To specify a descending order for only one parameter, you must explicitly specify ascending sort order (`:asc`) for the other parameters. For example, `sort=headline:desc,dateCreated:asc`.

The examples below sort the countries API response by name in descending order.

### REST API Example

The cURL request:

```bash
curl \
	"http://localhost:8080/o/headless-admin-address/v1.0/countries?fields=a2,name&sort=name:desc" \
	-u "test@liferay.com:learn"
```

### GraphQL API Example

The GraphQL request:

```graphql
query {
   countries(sort: "name:desc") {
      actions
      items {
         a2
         name
      }
      lastPage
      page
      pageSize
      totalCount
   }
}
```

The JSON response:

```json
{
   "actions": {},
   "facets": [],
   "items": [
      {
         "a2": "ZW",
         "name": "zimbabwe"
      },
      {
         "a2": "ZM",
         "name": "zambia"
      },
      {
         "a2": "YE",
         "name": "yemen"
      },
      {
         "a2": "WS",
         "name": "western-samoa"
      },
      {
         "a2": "EH",
         "name": "western-sahara"
      },
      {
         "a2": "WF",
         "name": "wallis-futuna"
      },
      {
         "a2": "VN",
         "name": "vietnam"
      },
      {
         "a2": "VE",
         "name": "venezuela"
      },
      {
         "a2": "VA",
         "name": "vatican-city"
      },
      {
         "a2": "VU",
         "name": "vanuatu"
      },
      {
         "a2": "UZ",
         "name": "uzbekistan"
      },
      {
         "a2": "UY",
         "name": "uruguay"
      },
      {
         "a2": "VI",
         "name": "united-states-virgin-islands"
      },
      {
         "a2": "UM",
         "name": "united-states-minor-outlying-islands"
      },
      {
         "a2": "US",
         "name": "united-states"
      },
      {
         "a2": "GB",
         "name": "united-kingdom"
      },
      {
         "a2": "AE",
         "name": "united-arab-emirates"
      },
      {
         "a2": "UA",
         "name": "ukraine"
      },
      {
         "a2": "UG",
         "name": "uganda"
      },
      {
         "a2": "TV",
         "name": "tuvalu"
      }
   ],
   "lastPage": 13,
   "page": 1,
   "pageSize": 20,
   "totalCount": 247
}
```

### Sorting by Related Object Data

{bdg-secondary}`Liferay DXP 2024.Q3+/Portal 7.4 GA132+`

The Object API supports sorting entries using fields from related objects, enhancing flexibility in data retrieval.

This functionality is available for custom objects with one-to-many relationships and supports various field types, including Text, Long Text, Date, Date and Time, Integer, Long Integer, Decimal, Precision Decimal, Boolean, and Picklist.

System fields such as Author, Create Date, External Reference Code, ID, Modified Date, and Status are also supported.

The sorting syntax for related objects follows this pattern:

```
sort=relatedRelationship/fieldName:asc
```

You can also sort by fields from multiple related objects by chaining relationships:

```
sort=relatedRelationship1/relatedRelationship2/fieldName:desc
```

Suppose you have a custom object Student that has a one-to-many relationship with another custom object University. To sort students by the University Name in ascending order, you can use the following command:

```bash
curl \
	"http://localhost:8080/o/c/students?sort=universityEnrolled/universityName:asc" \
	--header "accept: application/json" \
	--user "test@liferay.com:learn"
```

In this command, `universityEnrolled` is the related relationship representing the university associated with each student. `universityName` is the field in the University object by which you want to sort the Student entries. `:asc` specifies that the sorting should be in ascending order.

The JSON response should look like this:

```json
{
...
    "taxonomyCategoryBriefs" : [ ],
    "universityEnrolledERC" : "029520e6-d34d-5140-9bc5-b81f5ae29f9d",
    "r_universityEnrolled_c_universityId" : 31963,
    "r_universityEnrolled_c_universityERC" : "029520e6-d34d-5140-9bc5-b81f5ae29f9d",
    "studentName" : "August"
...
    "taxonomyCategoryBriefs" : [ ],
    "universityEnrolledERC" : "62e78f42-1596-8f11-beb5-4b34e719b8a9",
    "r_universityEnrolled_c_universityId" : 31955,
    "r_universityEnrolled_c_universityERC" : "62e78f42-1596-8f11-beb5-4b34e719b8a9",
    "studentName" : "Nathaly"
...
    "taxonomyCategoryBriefs" : [ ],
    "universityEnrolledERC" : "62e78f42-1596-8f11-beb5-4b34e719b8a9",
    "r_universityEnrolled_c_universityId" : 31955,
    "r_universityEnrolled_c_universityERC" : "62e78f42-1596-8f11-beb5-4b34e719b8a9",
    "studentName" : "Luke"
...
    "taxonomyCategoryBriefs" : [ ],
    "universityEnrolledERC" : "d29da38c-1adf-4aba-1129-463d8f4e6b50",
    "r_universityEnrolled_c_universityId" : 31961,
    "r_universityEnrolled_c_universityERC" : "d29da38c-1adf-4aba-1129-463d8f4e6b50",
    "studentName" : "Peter"
...
    "taxonomyCategoryBriefs" : [ ],
    "universityEnrolledERC" : "d0ce2764-6804-8de8-ff9f-4b199867dc4f",
    "r_universityEnrolled_c_universityId" : 31957,
    "r_universityEnrolled_c_universityERC" : "d0ce2764-6804-8de8-ff9f-4b199867dc4f",
    "studentName" : "Larissa"
...
    "taxonomyCategoryBriefs" : [ ],
    "universityEnrolledERC" : "2ff3dc43-a871-8eed-6204-5c7ef0302e7a",
    "r_universityEnrolled_c_universityId" : 31959,
    "r_universityEnrolled_c_universityERC" : "2ff3dc43-a871-8eed-6204-5c7ef0302e7a",
    "studentName" : "Manu"
...
}
```

In this case, the `universityName` field is not included in the response. Instead, `r_universityEnrolled_c_universityId` is used to reference the universities. The corresponsing university IDs and names are as follows:

| universityId | universityName |
| :----------- | :------------- |
| 31963        | Caltech        |
| 31955        | Harvard        |
| 31961        | MIT            |
| 31957        | Oxford         |
| 31959        | Stanford       |

Given this mapping, the student entries are successfully returned in alphabetical order based on the associated university names.

## Related Topics

- [Consuming REST Services](./consuming-rest-services.md)
- [Consuming GraphQL APIs](./consuming-graphql-apis.md)
