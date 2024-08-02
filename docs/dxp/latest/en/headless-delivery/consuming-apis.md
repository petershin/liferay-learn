---
toc:
  - ./consuming-apis/consuming-rest-services.md
  - ./consuming-apis/consuming-graphql-apis.md
  - ./consuming-apis/data-migration-center.md
  - ./consuming-apis/api-query-parameters.md
  - ./consuming-apis/batch-engine-api-basics-importing-data.md
  - ./consuming-apis/batch-engine-api-basics-exporting-data.md
  - ./consuming-apis/making-unauthenticated-requests.md
  - ./consuming-apis/using-external-reference-codes.md
  - ./consuming-apis/api-headers-reference.md
uuid: 31e2f6fc-5394-4d53-bc3d-d098eda6adb5
taxonomy-category-names:
- Platform
- Multi-Channel Experiences (Headless Delivery)
- API Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Consuming APIs

APIs, or Application Programming Interfaces, serve as the bridge between different software applications, allowing them to communicate and exchange data. By consuming external APIs, developers can use existing functionality and data sources to upgrade their applications without building everything from scratch.

## Consuming REST Services

Liferay provides a full REST API framework for interacting with platform functionality. You can access and manipulate data, create custom integrations, and build complete applications.

<!-- The below text is too detailed. For an intro, you have to remain at a high level. So here, instead of detailing steps (which are in the documentation), you'd describe how Liferay's REST APIs are OpenAPI compliant (see https://swagger.io/specification/) and how they're fully documented via Liferay's API explorer (and provide a screenshot). -Rich -->

A user has can call a service in many ways:

**Identify the service URL**: Liferay DXP REST service has a specific URL that the user must use in a request.

**Authentication**: Calling a service by *Authentication* guarantee that only authorized users or applications can access and manipulate data. An example is *OAuth 2.0*, that uses access tokens and authorizations codes.

**Data format**: Defines how information is structured and represented when exchanged between systems via REST APIs. Some common data formats are *JSON*, *XML* and *YAML*.

**HTTP methods**: The type of request the user make (GET, POST, PUT, DELETE) depends on the operation that's being performed (retrieving data, creating data, updating data, or deleting data).

## Consuming GraphQL APIs

<!-- 
I can see that you took the first sentence below from https://graphql.org. Never do that; that's plagiarism. I understand why this happened: this is a developer topic, and it's not something you should be writing an intro for, because you don't have the requisite knowledge. 

In any case, we don't want to explain what GraphQL is; it's not our product. We just want to say we have GraphQL APIs. Say at a high level the same kinds of things I've asked for in the REST section above: that Liferay fully supports GraphQL APIs, and that they're discoverable in the API explorer (and provide a screenshot). -Rich -->

GraphQL is a query language for APIs and a runtime for fulfilling those queries with your existing data. It provides a complete description of the data that is available, and it gives users the power to ask for exactly what they need without receiving redundant information.

Unlike REST APIs, where you often get a lot of data (over-fetching), GraphQL allows users to request only the specific fields they need from a given object or resource, even using similar methods to call its services.

## Data Migration Center

<!-- Here, you're not being detailed enough. You're mentioning the functions inside Data Migration Center. Instead, you should be firing the reader's imagination on what this could be used for. Leave the functions for the documentation. -Rich -->

Liferay provides a *Data Migration Center* to move object entries between installations. You can *Export Objects Definitions*, *Import Objects Definitions*, *Export Object Entries* and *Import Object Entries*.

## Batch Engine API - Importing and Exporting data

<!-- Again, this is the intro. The text below doesn't answer the question "What would I use this for?" That's what you need to provide. -Rich -->

Liferay’s Headless Batch Engine provides REST APIs to import and export data. These APIs are transfer in various formats (CSV, JSON, XLSX), carrying a large dataset. Additionally, some APIs offer options for filtering data during export. For advanced users, customization through code is available for importing and exporting processes.

<!-- The section below should be removed; the topic is self-explanatory for developers and doesn't need to be mentioned in the intro. -Rich -->

## Unauthenticated Requests

*Unauthenticated Requests* provide a gateway for public access to specific data and functionalities in a system. While offering convenience and accessibility, they also demand stringent security measures to protect sensitive information by *Relaxing API Restrictions via Service Access Policy*.

## Using External Reference Codes

By using *External Reference Codes* (ERCs), you have easy data synchronization and mapping between different systems. By using a common reference point, data can be transferred and updated consistently across platforms. During data migration processes, ERCs can be used to track and match records before and after the migration, trace the history of data changes, and track previous data.

When interacting with external systems or databases through APIs, ERCs can serve as unique identifiers for records, facilitating data synchronization and mapping.

<!-- You don't need to mention reference documentation in an intro. The section below can be removed. -Rich -->

## API Headers Reference

API headers are essential components of HTTP requests that provide metadata about the request and the expected response. These header fields communicate information between the client and server, influencing how the request is processed and the format of the response. 

The following API headers are frequently used:

**Authorization**: Specifies the credentials for authenticating the request (e.g., Bearer token, Basic Auth).

**Content-Type**: Indicates the media type of the request body (e.g., application/json, application/xml).

**Accept-Languages**: Usually the client's preferred natural languages.

**X-Accept-All-Languages**: Indicates client accepts all languages (non-standard).

**Cookie**: Sends cookie information to the server.
