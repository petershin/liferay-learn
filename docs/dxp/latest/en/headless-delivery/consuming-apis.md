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

Liferay's REST APIs comply with the OpenAPI standard, providing automated tools for generating documentation, client libraries, and testing, making the experience of working with APIs simple and practical. The APIs are documented through Liferay's API Explorer, offering detailed information on endpoints and their usage.

![Accessing Liferay's API Explorer](./consuming-apis/images/01.png)

## Consuming GraphQL APIs

Liferay fully supports GraphQL APIs, and you can search these APIs directly through the API explorer, which provides an organized view of available queries, mutations, and schemas.

![Seeing the GraphQL client](./consuming-apis/images/02.png)

Unlike REST APIs, where you often get a lot of data (over-fetching), GraphQL allows users to request only the specific fields they need from a given object or resource, even using similar methods to call its services.

## Data Migration Center

Liferay's Data Migration Center is a tool designed to streamline the transfer of data between Liferay instances. Whether you're upgrading systems, consolidating environments, or migrating data to a new platform, this feature simplifies the process. By exporting and importing object definitions and entries, organizations can move content, configurations, and user data without manual intervention. This automation reduces errors, saves time, and ensures data integrity.

## Batch Engine API - Importing and Exporting data

Liferay’s Headless Batch Engine provides REST APIs to import and export data. These APIs are transfer in various formats (CSV, JSON, XLSX), carrying a large dataset. Additionally, some APIs offer options for filtering data during export. For advanced users, customization through code is available for importing and exporting processes.

With Batch Engines, you can transfer large volumes of data between different systems or Liferay instances, integrate Liferay with other systems by importing data from external sources or exporting data for use in other applications and export data in formats suitable for reporting and analysis.

## Using External Reference Codes

By using *External Reference Codes* (ERCs), you have easy data synchronization and mapping between different systems. By using a common reference point, data can be transferred and updated consistently across platforms. During data migration processes, ERCs can be used to track and match records before and after the migration, trace the history of data changes, and track previous data.

When interacting with external systems or databases through APIs, ERCs can serve as unique identifiers for records, facilitating data synchronization and mapping.
