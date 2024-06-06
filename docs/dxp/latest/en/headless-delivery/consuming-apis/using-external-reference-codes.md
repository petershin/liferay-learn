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

## Related Topics

- [Consuming APIs](../consuming-apis.md)
- [Managing Objects With Headless APIs](../../liferay-development/objects/creating-and-managing-objects/managing-objects-with-headless-apis.md)