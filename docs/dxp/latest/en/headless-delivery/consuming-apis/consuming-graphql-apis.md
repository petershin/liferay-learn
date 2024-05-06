---
uuid: 6591c565-168f-4ba3-8a17-a2145f238291
taxonomy-category-names:
- Platform
- Multi-Channel Experiences (Headless Delivery)
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Consuming GraphQL APIs

Liferay DXP contains [GraphQL](https://graphql.org) APIs for most of its applications. Here's how to consume them in three steps:

1. [Identify the API you wish to consume.](#identify-the-service-to-consume)

1. [Identify the site containing the data you need.](#identify-the-site-containing-the-data)

1. [Make the API call using credentials that have access to the data.](#make-the-service-call-using-credentials-with-access-to-the-data)

But first, you need a running Liferay DXP to call its GraphQL APIs.

```{include} /_snippets/run-liferay-portal.md
```

## Identify the Service to Consume

1. Liferay DXP's GraphQL APIs ara available at `http://[host]:[port]/o/graphql`.

   So, if you are running Liferay DXP locally on port `8080`, the URL for the GraphQL API is `http://localhost:8080/o/api`.

1. Click *GraphQL* at the top-right of the screen to open Liferay's [GraphiQL](https://github.com/graphql/graphiql) browser.

   ![Access Liferay's GraphiQL through the API Explorer.](./consuming-graphql-apis/images/01.png)

1. Click the *Docs* link below the button you just clicked. Now you can browse the API.

1. GraphQL separates read and write operations by calling the first a *query* and the second a *mutation*. Since the first thing you want to do is post a blog entry, click *mutation*. A list of the entire API appears.

   !!! important
       As of {bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+`, you can use versioned namespaced APIs to ensure that operations are unique, even if they share names with operations from other APIs. You can also distinguish between different versions by incorporating the version number into the namespace. See [Getting and Posting Data Using Versioned Namespaces](#getting-and-posting-data-using-versioned-apis) to learn more.

       While you can use both versioned and non-versioned GraphQL APIs, note that the non-versioned APIs are [deprecated](../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md) and will be removed in the future.

1. Use the search at the top or scroll down and find the call to `createSiteBlogPosting`:

   ```graphql
   createSiteBlogPosting(
      siteKey: String!
      blogPosting: InputBlogPosting
      ): BlogPosting
   ```

!!! note
    You can also discover your local installation's APIs by requesting the schema directly:

    `curl 'http://localhost:8080/o/graphql'  -H "Content-Type: application/json" --data '{"query":"query{ __schema{ queryType{ name fields{ name args{ name } description } } } }","variables":{}}'`

    This URL does not require authentication, but it's quite cumbersome to manage the returned schema. So, it's better to use the included GraphQL client.

![The included GraphQL client has a schema documentation browser.](./consuming-graphql-apis/images/02.png)

Since the API requires you to know the site containing the blog where the entry should be posted, you must find the site ID first.

## Identify the Site Containing the Data

1. Go to `http://localhost:8080`.

1. Open the *Global Menu* ![Global Menu](../../images/icon-applications-menu.png), click the *Control Panel* tab, and go to *Sites* &rarr; Sites.

1. Click the *Actions* button ![Actions Button](../../images/icon-actions.png) next to the Liferay site and choose *Go to Site Settings*.

1. Go to *Site Configuration*.

The Site ID appears at the top of the Details section. It's an integer, like `20122`.

## Make the Service Call using Credentials with Access to the Data

Now you have everything you need to make the call. All web services must be accessed using credentials that have access to the data you're requesting. The included GraphQL client authenticates using your browser. If you plan to write a standalone client, you should authorize users via [OAuth2](../using-oauth2.md).

!!! important
    During development, it's much easier to use Basic Auth, which passes credential data in the URL. Since this is insecure, *never use this method for production.*

### Calling a GraphQL API Using Basic Auth (During Development Only)

To call a service using Basic Auth, provide the credentials in the URL:

```bash
curl \
   http://localhost:8080/o/graphql \
   --data "{'query':'query {blogPostings(filter: \'\', page: 1, pageSize: 10, search: \'\', siteKey: \'20122\', sort: \'\'){ page  items{ id articleBody headline  creator{ name }}}}'}" \
   --header "content-type: application/json" \
   --request POST \
   --user test@liferay.com:learn \
```

### Calling a Service Using OAuth2

!!! note
    The use of GraphQL with OAuth2 is supported in Liferay DXP 7.4 U77+/Liferay Portal 7.4 GA77+

For production, create an [OAuth2 application](../using-oauth2/creating-oauth2-applications.md) and use the OAuth2 process to get an authorization token. Once you have the token, provide it in the HTTP header:

```bash
curl \
   http://localhost:8080/o/graphql \
   --data '{"query":"query {blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20122\", sort: \"\"){ page  items{ id articleBody headline  creator{ name }}}}"}' \
   --header "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159" \
   --header 'content-type: application/json' \
   --request POST \
```

## Getting and Posting Data

At the top left window of the GraphQL client, place this code, which retrieves all blog entries:

```graphql
query {
   blogPostings(
      filter: ""
      page: 1
      pageSize: 10
      search: ""
      siteKey: "20122"
      sort: ""
   ) {
      page
      items {
         id
         articleBody
         headline
         creator {
            name
         }
      }
   }
}
```

Click the play button to run it, and you'll see there aren't any blog entries:

```json
{"data":{"blogPostings":{"page":1,"items":[]}}}
```

Now you'll post a blog entry.

### Posting a Blog Entry

1. Make the request by visiting `http://localhost:8080/o/api` again. Click *GraphQL*.

1. Construct a JSON document containing the entry you wish to publish and place it into the Query Variables box at the lower left (1).

   ```json
   {
      "blog": {
         "articleBody": "This Blog entry was created by calling the GraphQL service!",
         "headline": "GraphQL Blog Entry"
      }
   }
   ```

1. Construct the GraphQL query based on the schema documentation and place it in the query area at the top left window of the GraphQL client (2).

   ```graphql
   mutation CreateBlog($blog: InputBlogPosting) {
      createSiteBlogPosting(blogPosting: $blog, siteKey: "20122") {
         headline
         articleBody
         id
         friendlyUrlPath
      }
   }
   ```

1. Run your query by clicking the play button at the top.

   The blog entry you added now appears in the GraphQL client's right pane (3).

Liferay DXP returns a JSON representation of your blog entry that contains the fields you requested in the mutation:

```json
{
   "data": {
      "createSiteBlogPosting": {
         "headline": "GraphQL Blog Entry",
         "articleBody": "This Blog entry was created by calling the GraphQL service!",
         "id": 32010,
         "friendlyUrlPath": "graphql-blog-entry-1"
      }
   }
}
```

![The JSON document goes into the Query Variables box and the mutation goes into the query area. As a result, the created blog entry information appears in the GraphQL client's right pane.](./consuming-graphql-apis/images/03.png)

!!! note
    You can make these requests with any web client, such as cURL:

    `curl --request POST --url http://localhost:8080/o/graphql -u test@liferay.com:learn --header 'content-type: application/json' --data '{"query":"mutation CreateBlog($blog: InputBlogPosting){   createSiteBlogPosting(blogPosting: $blog, siteKey: \"20122\" ) {    headline    articleBody    id    friendlyUrlPath  }    } ","variables":{"blog":{"articleBody":"This Blog entry was created by using cURL to call the GraphQL service!","headline":"cURL GraphQL Blog Entry"}},"operationName":"CreateBlog"}'`

### Getting All Blog Entries

Now you can repeat the first query you did:

```graphql
query {
   blogPostings(
      filter: ""
      page: 1
      pageSize: 10
      search: ""
      siteKey: "20122"
      sort: ""
   ) {
      page
      items {
         id
         articleBody
         headline
         creator {
            name
         }
      }
   }
}
```

Liferay DXP returns JSON containing the blog entry you posted:

```json
{
  "data": {
    "blogPostings": {
      "page": 1,
      "items": [
        {
          "id": 32010,
          "articleBody": "This Blog entry was created by calling the GraphQL service!",
          "headline": "GraphQL Blog Entry",
          "creator": {
            "name": "Test Test"
          }
        }
      ]
    }
  }
}
```

### Getting a Single Blog Entry

The API call from the GraphQL schema for getting a single Blog entry has only one parameter:

```
blogPosting(
   blogPostingId: Long
): BlogPosting
```

Since the query above revealed your Blog post's ID, you can retrieve just the post you want:

```graphql
query {
   blogPosting(blogPostingId: 32012) {
      id
      headline
      articleBody
   }
}
```

Paste this into the top left window of the client and click the *Play* button. It returns the same blog entry:

```json
{
   "data": {
      "blogPosting": {
         "id": 32012,
         "headline": "GraphQL Blog Entry",
         "articleBody": "This Blog entry was created by calling the GraphQL service!"
      }
   }
}
```

### Deleting a Blog Entry

Deleting a blog entry, like creating one, is a mutation. Its call is almost the same as getting a single blog entry:

```
deleteBlogPosting(
  blogPostingId: Long
): Boolean
```

Using the client, you can make the call like this:

```graphql
mutation {
   deleteBlogPosting(blogPostingId: 32012)
}
```

This call returns a Boolean in a JSON document denoting success or failure:

```json
{
   "data": {
      "deleteBlogPosting": true
   }
}
```

Congratulations! You've now learned how to call Liferay DXP's GraphQL services. Remember that the examples above use Basic Auth: for production, use OAuth2 to call services in a secure way.

## Getting and Posting Data Using Versioned APIs

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+` Use versioned namespaced GraphQL APIs to avoid naming conflicts between operations from different APIs, enhance readability and maintainability by clearly indicating the source and version of each API operation, and ensure that applications remain compatible with evolving APIs, reducing the risk of compatibility issues and the need for frequent updates.

The API calls work similarly to the ones in [Getting and Posting Data](#getting-and-posting-data). The only difference is the addition of a namespace.

So, instead of retrieving all blog entries like this:

```graphql
query {
  blogPostings(
    filter: ""
    page: 1
    pageSize: 10
    search: ""
    siteKey: "20122"
    sort: ""
  ) {
    page
    items {
      id
      articleBody
      headline
      creator {
        name
      }
    }
  }
}
```

You can add the `headlessDelivery_v1_0` namespace and write the query like this:

```graphql
query {
   headlessDelivery_v1_0 {
      blogPostings(
         filter: ""
         page: 1
         pageSize: 10
         search: ""
         siteKey: "20122"
         sort: ""
      ) {
         page
         items {
         id
         articleBody
         headline
         creator {
            name
         }
         }
      }
   }
}
```

Click the play button to run it, and you'll see there aren't any blog entries:

```json
{"data":{"blogPostings":{"page":1,"items":[]}}}
```

The same goes with posting, getting, and deleting blog entries.

Posting blog entries before:

   ```graphql
   mutation CreateBlog($blog: InputBlogPosting) {
      headlessDelivery_v1_0 {
         createSiteBlogPosting(blogPosting: $blog, siteKey: "20112") {
            headline
            articleBody
            id
            friendlyUrlPath
         }
      }
   }
   ```

Posting blog entries with a versioned API:

   ```graphql
   mutation CreateBlog($blog: InputBlogPosting) {
      createSiteBlogPosting(blogPosting: $blog, siteKey: "20122") {
         headline
         articleBody
         id
         friendlyUrlPath
      }
   }
   ```


### Getting All Blog Entries

Now you can repeat the first query you did:

```graphql
query {
   blogPostings(
      filter: ""
      page: 1
      pageSize: 10
      search: ""
      siteKey: "20122"
      sort: ""
   ) {
      page
      items {
         id
         articleBody
         headline
         creator {
            name
         }
      }
   }
}
```

Liferay DXP returns JSON containing the blog entry you posted:

```json
{
  "data": {
    "blogPostings": {
      "page": 1,
      "items": [
        {
          "id": 32010,
          "articleBody": "This Blog entry was created by calling the GraphQL service!",
          "headline": "GraphQL Blog Entry",
          "creator": {
            "name": "Test Test"
          }
        }
      ]
    }
  }
}
```

### Getting a Single Blog Entry

The API call from the GraphQL schema for getting a single Blog entry has only one parameter:

```
blogPosting(
   blogPostingId: Long
): BlogPosting
```

Since the query above revealed your Blog post's ID, you can retrieve just the post you want:

```graphql
query {
   blogPosting(blogPostingId: 32012) {
      id
      headline
      articleBody
   }
}
```

Paste this into the top left window of the client and click the *Play* button. It returns the same blog entry:

```json
{
   "data": {
      "blogPosting": {
         "id": 32012,
         "headline": "GraphQL Blog Entry",
         "articleBody": "This Blog entry was created by calling the GraphQL service!"
      }
   }
}
```

### Deleting a Blog Entry

Deleting a blog entry, like creating one, is a mutation. Its call is almost the same as getting a single blog entry:

```
deleteBlogPosting(
  blogPostingId: Long
): Boolean
```

Using the client, you can make the call like this:

```graphql
mutation {
   deleteBlogPosting(blogPostingId: 32012)
}
```

This call returns a Boolean in a JSON document denoting success or failure:

```json
{
   "data": {
      "deleteBlogPosting": true
   }
}
```

Congratulations! You've now learned how to call Liferay DXP's GraphQL services. Remember that the examples above use Basic Auth: for production, use OAuth2 to call services in a secure way.


## Related Topics

- [Consuming REST Services](./consuming-rest-services.md)
- [API Headers Reference](./api-headers-reference.md)