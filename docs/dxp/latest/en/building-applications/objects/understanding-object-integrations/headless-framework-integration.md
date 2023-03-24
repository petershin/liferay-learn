---
uuid: 8db76b2e-6b09-488e-9e76-82d23b028cca
---
# Headless Framework Integration

{bdg-secondary}`Available Liferay DXP/Portal 7.4+`

When you publish a custom object definition, Liferay automatically generates default [REST APIs](../../../headless-delivery/consuming-apis/consuming-rest-services.md) for interacting with the object and its data. These APIs vary depending on the object's scope (i.e., company or site). If the definition includes relationships or standalone actions, Liferay also generates endpoints for calling them.

The path for these headless services follows the `c/[pluralobjectlabel]` naming pattern (e.g., `/o/c/timeoffrequests`). You can view and test available object APIs via the Liferay API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`). They appear under *REST Applications*.

![Each object appears under REST Applications.](./headless-framework-integration/images/01.png)

While the object is active, you can use these APIs to perform basic CRUD operations, run complex queries using [aggregation terms](../objects-tutorials/using-apis/using-aggregation-terms-with-rest-apis.md) and [nested fields](../objects-tutorials/using-apis/using-nested-fields-with-rest-apis.md), trigger standalone actions, manage entry relationships, and more. See [Using APIs](../objects-tutorials/using-apis.md) for object API tutorials.

## Default Company-Scoped REST APIs

These REST APIs are available for all company-scoped objects. For the Java methods, replace `ObjectName` with the name of your object.

| HTTP Method | HTTP Endpoint                       | Java Method                     | Description                                                                                                  |
|:------------|:------------------------------------|:--------------------------------|:-------------------------------------------------------------------------------------------------------------|
| DELETE      | `/by-external-reference-code/{erc}` | `deleteByExternalReferenceCode` | Deletes the specified entry and returns a 204 if the operation succeeds                                      |
| GET         | `/by-external-reference-code/{erc}` | `getByExternalReferenceCode`    | Returns details for the specified entry                                                                      |
| PATCH       | `/by-external-reference-code/{erc}` | `patchByExternalReferenceCode`  | Updates the specified entry; only fields included in the API call are changed                                |
| PUT         | `/by-external-reference-code/{erc}` | `putByExternalReferenceCode`    | Replaces the specified entry's details with those provided in the API call                                   |
| GET         | `/`                                 | `getObjectNamePage`             | Returns a complete list of entries in a Liferay instance; you can paginate, filter, search, and sort results |
| POST        | `/`                                 | `postObjectName`                | Creates a new entry using the details provided in the API call                                               |
| DELETE      | `/batch`                            | `deleteObjectNameBatch`         | Deletes multiple entries and returns a 204 if the operation succeeds                                         |
| POST        | `/batch`                            | `postObjectNameBatch`           | Creates multiple entries using the details provided in the API call                                          |
| PUT         | `/batch`                            | `putObjectNameBatch`            | Replaces multiple entries using the details provided in the API call                                         |
| DELETE      | `/{entryId}`                        | `deleteObjectName`              | Deletes the specified entry and returns a 204 if the operation succeeds                                      |
| GET         | `/{entryId}`                        | `getObjectName`                 | Returns details for the specified entry                                                                      |
| PATCH       | `/{entryId}`                        | `patchObjectName`               | Updates the specified entry; only fields included in the API call are changed                                |
| PUT         | `/{entryId}`                        | `putObjectName`                 | Replaces the specified entry's details with those provided in the API call                                   |

```{note}
Batch operations are only available for company-scoped objects.
```

## Default Site-Scoped REST APIs

These REST APIs are available for all site-scoped objects. For the Java methods, replace `ObjectName` with the name of your object.

| HTTP Method | HTTP Endpoint                                         | Java Method                                  | Description                                                                                                   |
|:------------|:------------------------------------------------------|:---------------------------------------------|:--------------------------------------------------------------------------------------------------------------|
| DELETE      | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `deleteScopeScopeKeyByExternalReferenceCode` | Deletes the specified entry and returns a 204 if the operation succeeds                                       |
| GET         | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `getScopeScopeKeyByExternalReferenceCode`    | Returns details for the specified entry                                                                       |
| PATCH       | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `patchScopeScopeKeyByExternalReferenceCode`  | Updates the specified entry; only fields included in the API call are changed                                 |
| PUT         | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `putScopeScopeKeyByExternalReferenceCode`    | Replaces the specified entry's details with those provided in the API call                                    |
| GET         | `/scopes/{scopeKey}`                                  | `getScopeScopeKeyPage`                       | Returns a complete list of entries in the specified scope; you can paginate, filter, search, and sort results |
| POST        | `/scopes/{scopeKey}`                                  | `postScopeScopeKey`                          | Creates a new entry in the specified scope using the details provided in the API call                         |
| DELETE      | `/{entryId}`                                          | `deleteObjectName`                           | Deletes the specified entry and returns a 204 if the operation succeeds                                       |
| GET         | `/{entryId}`                                          | `getObjectName`                              | Returns details for the specified entry                                                                       |
| PATCH       | `/{entryId}`                                          | `patchObjectName`                            | Updates the specified entry; only fields included in the API call are changed                                 |
| PUT         | `/{entryId}`                                          | `putObjectName`                              | Replaces the specified entry's details with those provided in the API call                                    |

```{note}
For the `scopeKey`, use the proper identifier for the desired data scope (e.g., site ID, user role).
```

## Relationship REST APIs

<!--TASK: {bdg-secondary}`Available Liferay 7.4 U__+/GA__+` -->

When you define one-to-many and many-to-many relationships between objects, Liferay generates endpoints for querying and managing entry relationships. This includes a GET endpoint for returning related object entries, PUT endpoints for relating entries, and a DELETE endpoint for disassociating related entries. See [Using Relationship APIs](../objects-tutorials/using-apis/using-relationship-rest-apis.md) for more information.

For the HTTP endpoints, replace `relationshipName` with the name of your relationship (e.g., `userToTicket`). The Java method for each relationship API follows this naming pattern: method + current object + relationship name + related object (e.g., `getTicketUserToTicketUserPage`, `deleteTicketUserToTicketUser`).

| HTTP Method | HTTP Endpoint                                                     | Description                                                                 |
|:------------|:------------------------------------------------------------------|:----------------------------------------------------------------------------|
| GET         | `/{entryId}/relationshipName`                                     | Returns all entries related to the specified entry through the relationship |
| PUT         | `/{entryId}/relationshipName/{relatedEntryId}`                    | Uses the relationship to relate the specified object entries                |
| PUT         | `/by-external-reference-code/{erc}/relationshipName/{relatedERC}` | Uses the relationship to relate the specified object entries                |
| DELETE      | `/{entryId}/relationshipName/{relatedEntryId}`                    | Disassociates the specified object entries                                  |

For site-scoped objects, the ERC endpoint includes the `/scope/{scopeKey}` prefix (e.g., `/scope/{scopeKey}/by-external-reference-code/{erc}/relationshipName/{relatedERC}`). External reference code endpoints are not available for system objects.

```{tip}
In addition to the dedicated relationship APIs, you can use the `nestedFields` query parameter with the object's other GET APIs to return an entry with its related entries. When using this parameter, you must provide the name of the relationship you want to include in the output (e.g., `nestedFields=ticketAssignee`). See [Using Nested Fields with REST APIs](../objects-tutorials/using-apis/using-nested-fields-with-rest-apis.md) for more information and an introductory tutorial.
```

## Standalone Action REST APIs

{bdg-secondary}`Available Liferay 7.4 U60+/GA60+`

When you define standalone actions for a published object, Liferay generates two endpoints for triggering the action. One uses the entry's ID and the other uses the entry's external reference code (ERC). Calling either API triggers the action for the specified entry. See [Using Manual Actions](../creating-and-managing-objects/actions/using-manual-actions.md) for more information.

| HTTP Method | HTTP Endpoint                                                 | Java Method               |
|:------------|:--------------------------------------------------------------|:--------------------------|
| PUT         | `/by-external-reference-code/{erc}/object-actions/actionName` | `putObjectNameActionName` |
| PUT         | `/{entryId}/object-actions/actionName`                        | `putObjectNameActionName` |

For site-scoped objects, the ERC endpoint includes the `/scope/{scopeKey}` prefix (e.g., `/scopes/{scopeKey}/by-external-reference-code/{erc}/object-actions/actionName`). External reference code endpoints are not available for system objects.

<!--TASK: uncomment when GraphQL APIs are better supported, 
## GraphQL APIs

With the GraphQL APIs, you can both query and mutate object data. All APIs for custom objects are listed under `c` in Liferay's GraphQL schema. You can use Liferay's integrated Graph*i*QL IDE to search object schemas, draft queries, run requests, and more. To access it, go to Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`) and click *GraphQL*.

![Use Liferay's GraphiQL explorer to search object schemas and run your requests.](./headless-framework-integration/images/02.png)

See [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) for more information.
-->

## Additional Information

* [Consuming REST Services](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
* [Using APIs](../objects-tutorials/using-apis.md)
<!--TASK: * [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) -->
