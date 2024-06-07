---
uuid: 13b4382c-a959-4239-adae-d5a356000004
taxonomy-category-names:
- Platform
- Multi-Channel Experiences (Headless Delivery)
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Using External Reference Codes

{bdg-secondary}Liferay DXP/Portal 7.4+

Many of Liferay's headless API endpoints support an external reference code (ERC). The ERC field is useful in wide range of scenarios. For example, when migrating content into Liferay, you could keep the unique reference IDs from another system in the ERC field. Or use ERCs to have human-readable keys for your site content. For example, Liferay assigns a unique ID for each created blog post, but you could assign human readable keys for easier reference.

Each ERC must be unique, and the same ERC cannot be used with another entity in the same scope. For example, a blog post and a document on the same site cannot have the same ERC. If you try, you'll get a `duplicate entry` error.

## Blog Post ERC Example

Create and access a blog post with an ERC.

1. Note your [site's ID](./consuming-rest-services.md#identify-the-site-containing-the-data).

1. Run the following curl command to create a new blog post. Replace `{siteId}` with your site's ID.

   ```bash
   curl \
   	-H "Content-Type: application/json" \
   	-X POST \
   	"http://localhost:8080/o/headless-delivery/v1.0/sites/{siteId}/blog-postings" \
   	-d "{\"articleBody\": \"Foo\", \"externalReferenceCode\": \"blog_post_able\", \"headline\": \"Able\"}" \
   	-u "test@liferay.com:learn"
   ```

   The output shows a new blog post was created:

   ```bash
   ...
     "alternativeHeadline" : "",
     "articleBody" : "Foo",
     "creator" : {
       "additionalName" : "",
       "contentType" : "UserAccount",
       "familyName" : "Test",
       "givenName" : "Test",
       "id" : 20123,
       "name" : "Test Test"
     },
     "customFields" : [ ],
     "dateCreated" : "2023-09-21T21:21:48Z",
     "dateModified" : "2023-09-21T21:21:48Z",
     "datePublished" : "2023-09-21T21:21:00Z",
     "description" : "Foo",
     "encodingFormat" : "text/html",
     "externalReferenceCode" : "blog_post_able",
     "friendlyUrlPath" : "able",
     "headline" : "Able",
     "id" : 42617,
     "keywords" : [ ],
     "numberOfComments" : 0,
     "relatedContents" : [ ],
     "renderedContents" : [ ],
     "siteId" : 20119,
     "taxonomyCategoryBriefs" : [ ]
   ...
      ```

1. This blog post can now be referenced by its ID or its ERC. For example, fetch the blog post by its ID:

   ```bash
   curl \
   	"http://localhost:8080/o/headless-delivery/v1.0/blog-postings/42617" \
   	-u "test@liferay.com:learn"
   ```

   Or, fetch the blog post by its ERC:

   ```bash
   curl \
   	"http://localhost:8080/o/headless-delivery/v1.0/sites/20119/blog-postings/by-external-reference-code/blog_post_able" \
   	-u "test@liferay.com:learn"
   ```

   Note, this GET method for blog posts by ERC requires the site ID (e.g. `20119`) and the ERC (e.g. `blog_post_able`).

Check out the [API Explorer](../using-liferay-as-a-headless-platform.md#ways-to-connect) to see the different API endpoints that support external reference codes.

## ERC Behavior in API Endpoints

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA126+`

Slashes (`/`) are accepted in your ERCs. However, when dealing with APIs that include ERCs in their endpoint URL paths, it's important to understand how they are interpreted to avoid incorrect parsing and unexpected behavior in the API calls. Here are some observations to help understand the use of slashes in ERCs:

- In general, you can use slashes or escape them as `%252F`.

   For example. If the ERC is `a/b`, you can use it like `"http://localhost:8080/o/c/objectDefinition/by-external-reference-code/a/b"` or `"http://localhost:8080/o/c/objectDefinition/by-external-reference-code/a%252Fb"`.

- Slashes must be escaped `%252F` whenever they can cause confusion or be misinterpreted as path delimiters in URLs. This misinterpretation can lead to incorrect parsing and unexpected behavior in the API calls.

   For example, in the object relationship PUT endpoint (`http://localhost:8080/o/c/tests/[currentERC]/relationship/[relatedERC]`), failing to escape slashes in the `relatedERC` value can cause the endpoint to misinterpret the path segments.

   Check the table below for different examples. Under `currentERC` and `relatedERC` there are examples of ERCs. The Result column indicates whether the URL is interpreted correctly. Misinterpretation occurs when the `currentERC` includes the relationship's name because of how the slash was parsed.

   | `currentERC` | `relatedERC` |  Result  |
   | :----------- | :----------- | :------: |
   | `a/b`        | `c`          | &#10004; |
   | `a%252Fb`    | `c`          | &#10004; |
   | `a`          | `c/d`        | &#10060; |
   | `a`          | `c%252Fd`    | &#10004; |
   | `a/b`        | `c/d`        | &#10060; |
   | `a%252Fb`    | `c%252Fd`    | &#10004; |
   | `a%252Fb`    | `c/d`        | &#10060; |
   | `a/b`        | `c%252Fd`    | &#10004; |

## Related Topics

- [Consuming APIs](../consuming-apis.md)
- [Managing Objects With Headless APIs](../../liferay-development/objects/creating-and-managing-objects/managing-objects-with-headless-apis.md)