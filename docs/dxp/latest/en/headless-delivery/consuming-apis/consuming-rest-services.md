---
uuid: c6a4ba2a-1514-4f03-968f-5ac275b48d74
taxonomy-category-names:
- Platform
- Multi-Channel Experiences (Headless Delivery)
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Consuming REST Services

Liferay DXP contains REST services for most of its applications. These services are fully [OpenAPI](https://app.swaggerhub.com/apis/liferayinc/headless-delivery) compliant. Here, learn how to consume them. This takes only three steps:

1. Identify the service you wish to consume.

1. Identify the site containing the data you need.

1. Make the service call using credentials that have access to the data.

This example uses Docker image with a fresh install of Liferay DXP.

## Identify the Service to Consume

You need a running Liferay DXP to call its REST services.

```{include} /_snippets/run-liferay-portal.md
```

To view the various API endpoints, use your browser and access Liferay's API Explorer at `[server]:[port]/o/api`. For example, in your Docker instance, you can find them here:

```
http://localhost:8080/o/api
```

APIs are divided into several categories. This example uses the `BlogPosting` service to retrieve blog posts from the Blogs widget, but you can use this procedure with any of the published services.

1. Select the *Headless Delivery* category. This category contains the `BlogPosting` service. You can use the filter to search for services.

2. Click the *Show Schemas* button, and on the right side of the screen a list of all the schemas in this category appears.

3. Keep a browser tab open to the schema browser; when you want to PUT a `BlogPosting`, use its schema.

![The schema browser makes it convenient to find and call the service you want. ](./consuming-rest-services/images/01.png)

## Headless Action Keys

Each headless endpoint's methods have *headless action keys* that identify the methods independently from the URL. These action keys are useful for connecting to these methods from other applications, such as [data set view actions](../../liferay-development/data-sets/data-set-views/data-set-view-actions.md).

You can find the action keys for a specific endpoint via the [API Explorer](#identify-the-service-to-consume). For your chosen endpoint (e.g., user accounts), execute a GET method. The server response JSON includes an `actions` block in the body, including the action keys for each applicable method.

For example, here is a response showing the action keys for the `/o/headless-admin-user/` endpoint (with the `/v1.0/user-accounts/{userAccountId}` GET method):

![Execute a GET method for your chosen endpoint to get a response showing usable headless action keys.](./consuming-rest-services/images/02.png)

## REST Context Paths for Root Models

{bdg-secondary}`Liferay DXP 2024.Q3+/Portal 7.4 GA125+`

When working with object definitions related to modifiable system objects, the REST context path includes the root model’s path. This reflects the hierarchical relationship between models and helps organize API endpoints efficiently.

Note that some root models are grouped under a common namespace and must be preceded by a prefix representing that namespace. This prefix typically reflects the module or functional area of the system.

For example, the `APIApplication` root model is part of the [API Builder](../api-builder.md) component. All of its endpoints are found under the `headless-builder` prefix. Similarly, Commerce-related functionalities are under the `headless-commerce-admin` prefix.

You can find this information using [Liferay's API Explorer](#identify-the-service-to-consume). Click on *Rest Applications* (1) in the top-right corner. The REST applications appear with their corresponding paths, including prefixes if applicable (2). You can confirm the path under Servers (3).

![Use Liferay's API Explorer to find the information you need. ](./consuming-rest-services/images/03.png)

Example context paths:

-  With a prefix:

   `APIApplication` is the root model and `APIEndpoint` is its descendant, making the REST endpoints

   For `APIApplication`: `/headless-builder/application`.

   For `APIEndpoint`: `/headless-builder/applications/endpoints`.

-  Without a prefix:

   Some REST API endpoints are not grouped under a namespace and therefore don't use prefixes.

   For example, `CommerceReturn` is the root model and `CommerceReturnItem` is its descendant, making the REST endpoints

   For `CommerceReturn`: `/commerce-returns`.

   For `CommerceReturnItem`: `/commerce-returns/commerce-return/items`.

The table below lists modifiable system objects and their corresponding REST context paths. Use this information to understand how to construct REST context paths when working with modifiable system objects.

 | Object Definition            | REST Context Path                            |
 |------------------------------|----------------------------------------------|
 | `APIApplication`             | `/headless-builder/applications`             |
 | `APIEndpoint`                | `/headless-builder/endpoints`                |
 | `APIFilter`                  | `/headless-builder/filters`                  |
 | `APIProperty`                | `/headless-builder/properties`               |
 | `APISchema`                  | `/headless-builder/schemas`                  |
 | `APISort`                    | `/headless-builder/sorts`                    |
 | `Bookmark`                   | `/bookmarks`                                 |
 | `CommerceReturn`             | `/commerce-returns`                          |
 | `CommerceReturnItem`         | `/commerce-return-items`                     |
 | `FDSAction`                  | `/data-set-manager/actions`                  |
 | `FDSCardsSection`            | `/data-set-manager/cards-sections`           |
 | `FDSClientExtensionFilter`   | `/data-set-manager/client-extension-filters` |
 | `FDSDateFilter`              | `/data-set-manager/date-filters`             |
 | `FDSDynamicFilter`           | `/data-set-manager/dynamic-filters`          |
 | `FDSEntry`                   | `/data-set-manager/entries`                  |
 | `FDSField`                   | `/data-set-manager/fields`                   |
 | `FDSListSection`             | `/data-set-manager/list-sections`            |
 | `FDSSort`                    | `/data-set-manager/sorts`                    |
 | `FDSView`                    | `/data-set-manager/views`                    |
 | `FunctionalCookieEntry`      | `/functional-cookies-entries`                |
 | `NecessaryCookieEntry`       | `/necessary-cookies-entries`                 |
 | `PerformanceCookieEntry`     | `/performance-cookies-entries`               |
 | `PersonalizationCookieEntry` | `/personalization-cookies-entries`           |

## Identify the Site Containing the Data

Now you must find the default Site ID:

1. Open the Site menu (![Site menu](../../images/icon-menu.png)) and go to *Configuration* &rarr; *Site Settings*.

1. Under the Platform section, click *Site Configuration*. For Liferay DXP versions 7.3 and earlier, click the *General* tab.

1. Find the Site identifier under Site ID.

   ![Identify the Site Id under the Site Settings and Site Configuration option.](./consuming-rest-services/images/04.png)

## Make the Service Call Using Credentials with Access to the Data

Now you have everything needed to make the call. All web services must be accessed using credentials that grant access to the data you're requesting. The simplest method is Basic Auth, which passes credential data in the URL. Since this method is insecure, use it only during development. For production, your application should authorize users via [OAuth2](../using-oauth2.md).

The examples below use [cURL](https://curl.haxx.se).

### Calling a Service Using Basic Auth (During Development Only)

To call a service using Basic Auth, provide the credentials in the URL:

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" -u 'test@liferay.com:learn'
```

### Calling a Service Using OAuth2

For production, create an [OAuth2 application](../using-oauth2/creating-oauth2-applications.md) and use the OAuth2 process to get an authorization token. Once you have the token, provide it in the HTTP header:

```bash
curl -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159" http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings
```

## Getting and Posting Data

If you run the query above to get all blog postings, you see there aren't any:

```json
{
   "actions" : {
      "subscribe" : {
         "method" : "PUT",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/subscribe"
      },
      "unsubscribe" : {
         "method" : "PUT",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/unsubscribe"
      },
      "create" : {
         "method" : "POST",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings"
      }
   },
   "items" : [ ],
   "lastPage" : 1,
   "page" : 1,
   "pageSize" : 20,
   "totalCount" : 0
}
```

First, post a blog entry.

### Posting a Blog Entry

You can use the schema browser to learn how to post a blog entry.

![The schema for any service is published on your Liferay DXP instance.](./consuming-rest-services/images/05.png)

1. Go back to your browser tab containing the schema browser. On the right side, click the `BlogPosting` entry to display its schema (see above). This shows the whole data structure for a `BlogPosting`, but there are only two required fields:

   - `articleBody`
   - `headline`

1. Construct a simple JSON document to post a blog entry:

   ```json
   {
      "headline": "Test Blog Entry from REST Services",
      "articleBody": "This article was posted via REST services provided by Liferay DXP."
   }
   ```

1. Make the request:

   ```bash
   curl --header "Content-Type: application/json" --request POST --data '{ "headline": "Test Blog Entry from REST Services", "articleBody": "This article was posted via REST services provided by Liferay DXP." }' http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings -u test@liferay.com:learn
   ```

Liferay DXP returns the full JSON representation of your blog entry:

```json
{
   "actions" : {
      "get" : {
         "method" : "GET",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "replace" : {
         "method" : "PUT",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "update" : {
         "method" : "PATCH",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      },
      "delete" : {
         "method" : "DELETE",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
      }
   },
   "alternativeHeadline" : "",
   "articleBody" : "This article was posted via REST services provided by Liferay DXP.",
   "creator" : {
      "additionalName" : "",
      "contentType" : "UserAccount",
      "familyName" : "Test",
      "givenName" : "Test",
      "id" : 20125,
      "name" : "Test Test",
      "profileURL" : "/web/test"
   },
   "customFields" : [ ],
   "dateCreated" : "2020-03-06T18:02:26Z",
   "dateModified" : "2020-03-06T18:02:27Z",
   "datePublished" : "2020-03-06T18:02:00Z",
   "description" : "",
   "encodingFormat" : "text/html",
   "friendlyUrlPath" : "test-blog-entry-from-rest-services",
   "headline" : "Test Blog Entry from REST Services",
   "id" : 35215,
   "keywords" : [ ],
   "numberOfComments" : 0,
   "relatedContents" : [ ],
   "siteId" : 20122,
   "taxonomyCategories" : [ ]
}
```

### Getting All Blog Entries

Now you can repeat the first query you did to see that the blog entry you posted is there:

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" -u 'test@liferay.com:learn'
```

This returns a list of blog entries. The entry you added is the only one in the list:

```json
{
   "actions" : {
      "subscribe" : {
         "method" : "PUT",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/subscribe"
      },
      "unsubscribe" : {
         "method" : "PUT",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings/unsubscribe"
      },
      "create" : {
         "method" : "POST",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings"
      }
   },
   "items" : [ {
      "actions" : {
         "get" : {
         "method" : "GET",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
         },
         "replace" : {
         "method" : "PUT",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
         },
         "update" : {
         "method" : "PATCH",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
         },
         "delete" : {
         "method" : "DELETE",
         "href" : "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/{blogPostingId}"
         }
      },
      "alternativeHeadline" : "",
      "articleBody" : "This article was posted via REST services provided by Liferay DXP.",
      "creator" : {
         "additionalName" : "",
         "contentType" : "UserAccount",
         "familyName" : "Test",
         "givenName" : "Test",
         "id" : 20125,
         "name" : "Test Test",
         "profileURL" : "/web/test"
      },
      "customFields" : [ ],
      "dateCreated" : "2020-03-06T18:02:26Z",
      "dateModified" : "2020-03-06T18:02:27Z",
      "datePublished" : "2020-03-06T18:02:00Z",
      "description" : "",
      "encodingFormat" : "text/html",
      "friendlyUrlPath" : "test-blog-entry-from-rest-services",
      "headline" : "Test Blog Entry from REST Services",
      "id" : 35215,
      "keywords" : [ ],
      "numberOfComments" : 0,
      "relatedContents" : [ ],
      "siteId" : 20122,
      "taxonomyCategories" : [ ]
   } ],
   "lastPage" : 1,
   "page" : 1,
   "pageSize" : 20,
   "totalCount" : 1
}
```

### Getting a Single Blog Entry

Each time you've made a request, Liferay DXP has returned other possible endpoints. One of these is to get a single blog entry by its ID. If you know your entry's ID, you can retrieve it:

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

This returns the same blog entry.

### Deleting a Blog Entry

If you know its ID, you can also delete your blog entry:

```bash
curl -X DELETE "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

In this case, nothing is returned, but you can verify your entry is gone by requesting it as you did above:

```bash
curl "http://localhost:8080/o/headless-delivery/v1.0/blog-postings/35215" -u test@liferay.com:learn
```

Liferay DXP then returns this JSON document in response:

```json
{
  "status" : "NOT_FOUND",
  "title" : "No BlogsEntry exists with the primary key 35215"
}
```

Congratulations! You've now learned how to call Liferay DXP's REST services. Remember that the examples above use Basic Auth: for production, use OAuth2 to call services in a secure way.

## Related Topics

- [Consuming GraphQL APIs](./consuming-graphql-apis.md)
- [API Headers Reference](./api-headers-reference.md)
