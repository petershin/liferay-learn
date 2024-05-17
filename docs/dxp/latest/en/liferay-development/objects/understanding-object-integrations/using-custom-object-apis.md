---
toc:
  - ./using-custom-object-apis/object-api-basics.md
  - ./using-custom-object-apis/using-batch-apis.md
  - ./using-custom-object-apis/using-relationship-rest-apis.md
  - ./using-custom-object-apis/using-nestedfields-to-query-related-entries.md
  - ./using-custom-object-apis/using-nestedfields-to-audit-entry-history.md
  - ./using-custom-object-apis/using-aggregation-terms-with-rest-apis.md
  - ./using-custom-object-apis/using-object-apis-with-base64-formatted-files.md
uuid: 8db76b2e-6b09-488e-9e76-82d23b028cca
taxonomy-category-names:
- Integration
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Using Custom Object APIs

{bdg-secondary}`Liferay 7.4+`

When you publish a custom object definition, Liferay generates default [REST APIs](../../../headless-delivery/consuming-apis/consuming-rest-services.md) for interacting with the object and its data. These APIs vary depending on the object's scope (i.e., company or site). If the definition includes relationships or standalone actions, Liferay also generates endpoints for calling them.

The path for these headless services follows the `c/[pluralobjectlabel]` naming pattern (e.g., `/o/c/timeoffrequests`). You can view and test available object APIs via the Liferay API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`). Click *REST Applications* to see a drop-down list of APIs.

![Each object appears under REST Applications.](./using-custom-object-apis/images/01.png)

While the object is active, you can use these APIs to perform basic CRUD operations, run complex queries using [aggregation terms](./using-custom-object-apis/using-aggregation-terms-with-rest-apis.md) and [nested fields](./using-custom-object-apis/using-nestedfields-to-query-related-entries.md), trigger standalone actions, manage entry relationships, and more.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Object API Basics
:link: ./using-custom-object-apis/object-api-basics.md
:::

:::{grid-item-card} Using Batch APIs
:link: ./using-custom-object-apis/using-batch-apis.md
:::

:::{grid-item-card} Using Relationship REST APIs
:link: ./using-custom-object-apis/using-relationship-rest-apis.md
:::

:::{grid-item-card} Using nestedFields to Query Related Entries
:link: ./using-custom-object-apis/using-nestedfields-to-query-related-entries.md
:::

:::{grid-item-card} Using nestedFields to Audit Entry History
:link: ./using-custom-object-apis/using-nestedfields-to-audit-entry-history.md
:::

:::{grid-item-card} Using Aggregation Terms with REST APIs
:link: ./using-custom-object-apis/using-aggregation-terms-with-rest-apis.md
:::

:::{grid-item-card} Using Object APIs With Base64 Formatted Files
:link: ./using-custom-object-apis/using-object-apis-with-base64-formatted-files.md
:::
::::

## Default Company-Scoped REST APIs

Default REST APIs are available for all company-scoped objects.

| HTTP Method | HTTP Endpoint                       | Description                                                                                                  |
|:------------|:------------------------------------|:-------------------------------------------------------------------------------------------------------------|
| DELETE      | `/by-external-reference-code/{erc}` | Deletes the specified entry and returns a 204 if the operation succeeds                                      |
| GET         | `/by-external-reference-code/{erc}` | Returns details for the specified entry                                                                      |
| PATCH       | `/by-external-reference-code/{erc}` | Updates the specified entry; only fields included in the API call are changed                                |
| PUT         | `/by-external-reference-code/{erc}` | Replaces the specified entry's details with those provided in the API call                                   |
| GET         | `/`                                 | Returns a complete list of entries in a Liferay instance; you can paginate, filter, search, and sort results |
| POST        | `/`                                 | Creates a new entry using the details provided in the API call                                               |
| DELETE      | `/batch`                            | Deletes multiple entries and returns a 204 if the operation succeeds                                         |
| POST        | `/batch`                            | Creates multiple entries using the details provided in the API call                                          |
| PUT         | `/batch`                            | Replaces multiple entries using the details provided in the API call                                         |
| DELETE      | `/{entryId}`                        | Deletes the specified entry and returns a 204 if the operation succeeds                                      |
| GET         | `/{entryId}`                        | Returns details for the specified entry                                                                      |
| PATCH       | `/{entryId}`                        | Updates the specified entry; only fields included in the API call are changed                                |
| PUT         | `/{entryId}`                        | Replaces the specified entry's details with those provided in the API call                                   |

!!! note
    Batch operations are only available for company-scoped objects.

## Default Site-Scoped REST APIs

Default REST APIs are available for all site-scoped objects.

| HTTP Method | HTTP Endpoint                                         | Description                                                                                                   |
|:------------|:------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------|
| DELETE      | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | Deletes the specified entry and returns a 204 if the operation succeeds                                       |
| GET         | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | Returns details for the specified entry                                                                       |
| PATCH       | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | Updates the specified entry; only fields included in the API call are changed                                 |
| PUT         | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | Replaces the specified entry's details with those provided in the API call                                    |
| GET         | `/scopes/{scopeKey}`                                  | Returns a complete list of entries in the specified scope; you can paginate, filter, search, and sort results |
| POST        | `/scopes/{scopeKey}`                                  | Creates a new entry in the specified scope using the details provided in the API call                         |
| DELETE      | `/{entryId}`                                          | Deletes the specified entry and returns a 204 if the operation succeeds                                       |
| GET         | `/{entryId}`                                          | Returns details for the specified entry                                                                       |
| PATCH       | `/{entryId}`                                          | Updates the specified entry; only fields included in the API call are changed                                 |
| PUT         | `/{entryId}`                                          | Replaces the specified entry's details with those provided in the API call                                    |

!!! note
    For the `scopeKey`, use the proper identifier for the desired data scope (e.g., site ID or user role).

## Relationship REST APIs

{bdg-secondary}`Liferay 7.4 U70+/GA70+`

When you define one-to-many and many-to-many relationships between objects, Liferay generates endpoints for querying and managing entry relationships. This includes a GET endpoint for returning related object entries, PUT endpoints for relating entries, and a DELETE endpoint for disassociating related entries. See [Using Relationship APIs](./using-custom-object-apis/using-relationship-rest-apis.md) for more information.

For the HTTP endpoints, replace `relationshipName` with the name of your relationship (e.g., `userToTicket`).

| HTTP Method | HTTP Endpoint                                                     | Description                                                                 |
|:------------|:------------------------------------------------------------------|:----------------------------------------------------------------------------|
| GET         | `/{entryId}/relationshipName`                                     | Returns all entries related to the specified entry through the relationship |
| PUT         | `/{entryId}/relationshipName/{relatedEntryId}`                    | Uses the relationship to relate the specified object entries                |
| PUT         | `/by-external-reference-code/{erc}/relationshipName/{relatedERC}` | Uses the relationship to relate the specified object entries                |
| DELETE      | `/{entryId}/relationshipName/{relatedEntryId}`                    | Disassociates the specified object entries                                  |

For site-scoped objects, the ERC endpoint includes the `/scope/{scopeKey}` prefix (e.g., `/scope/{scopeKey}/by-external-reference-code/{erc}/relationshipName/{relatedERC}`). External reference code endpoints are not available for system objects.

!!! tip
    In addition to the dedicated relationship APIs, you can use the `nestedFields` query parameter with the object's other GET APIs to return an entry with its related entries. When using this parameter, you must provide the name of the relationship you want to include in the output (e.g., `nestedFields=ticketAssignee`). See [Using nestedFields to Query Related Entries](./using-custom-object-apis/using-nestedfields-to-query-related-entries.md) for more information and an introductory tutorial.

## Standalone Action REST APIs

{bdg-secondary}`Liferay 7.4 U60+/GA60+`

When you define standalone actions for a published object, Liferay generates two endpoints for triggering the action on an entry. One uses the entry's ID and the other uses the entry's external reference code (ERC). See [Using Manual Actions](../creating-and-managing-objects/actions/using-manual-actions.md) for more information.

| HTTP Method | HTTP Endpoint                                                 |
|:------------|:--------------------------------------------------------------|
| PUT         | `/by-external-reference-code/{erc}/object-actions/actionName` |
| PUT         | `/{entryId}/object-actions/actionName`                        |

For site-scoped objects, the ERC endpoint includes the `/scope/{scopeKey}` prefix (e.g., `/scopes/{scopeKey}/by-external-reference-code/{erc}/object-actions/actionName`).

## GraphQL APIs

With the GraphQL APIs, you can both query and mutate object data. All APIs for custom objects are listed under `c` in Liferay's GraphQL schema. You can use Liferay's integrated Graph*i*QL IDE to search object schemas, draft queries, run requests, and more. To access it, go to Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`) and click *GraphQL*.

![Use Liferay's GraphiQL explorer to search object schemas and run your requests.](./using-custom-object-apis/images/02.png)

See [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) for more information.

## Related Topics

- [Consuming REST Services](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
- [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md)
