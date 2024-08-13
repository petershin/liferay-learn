---
uuid: 4b93d54a-064d-4536-af1a-6d0e92876f5c
---
# Working with the Headless Platform

Headless APIs offer significant advantages for modern application development. By decoupling the front-end and the back-end, they allow for seamless content delivery across various platforms while still allowing developers to choose their preferred technologies. Headless APIs simplify development with standardized interfaces, enhance security through OAuth2 adoption, and ultimately accelerate time-to-market for digital products.

Liferay's headless APIs can be leveraged in various situations to deliver or receive content across various platforms. For example:

- Providing services for many of Liferay's key functions (e.g. site building, content authoring, managing users and permissions)
- Building custom web or mobile applications
- Migrating data from legacy systems
- Building custom client extensions to interact with Liferay DXP
- Creating automated processes such as batch user uploads or approval workflows
- Interfacing between Liferay and external systems such as Salesforce or SAP

<!-- Not sure if we want to mention the use of AI with headless APIs -->

## Exploring Liferay's APIs

Headless API endpoints are available for almost all of Liferay's resources (e.g. blogs, documents & media, web content, users, etc.). There are some simple ways to get started in exploring them.

### API Explorer

The API Explorer is an integrated application inside Liferay that shows you all available headless REST API endpoints and gives you the ability to call them through the user interface. APIs are grouped by category into several drop-down menus containing sets of endpoints. For each of these endpoints, the API Explorer shows the request URL, the corresponding method in the application, the possible parameters for the API call (both required and optional), and schemas for the request and response bodies. 

![See the various headless API endpoints in the API Explorer.](./working-with-the-headless-platform/images/01.png)

Once you have supplied the required parameters and data for a given endpoint, you can click *Execute* to submit the request. The resulting response code, response headers, and response body are displayed on the page in JSON or XML and made available for download. The API Explorer provides you with an intuitive way to explore APIs and understand how they work in a secure environment as you use them to implement your custom solutions.

### cURL

Client URL (cURL) is a simple command line tool used to transfer data, most commonly with REST API calls. You can use cURL to call Liferay services with both basic authorization (not recommended for production environments) and OAuth 2.0.

- Call a service with basic authorization by passing your login credentials in the request with the *username:password* format. For example:

    ```bash
    curl \
        "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" \
        -u "test@liferay.com:learn"
    ```
- Call a service with OAuth 2.0 by passing the access token for the corresponding application in the request. The application must be registered to use OAuth 2.0 as described in the previous article. For example:

    ```bash
    curl \
        "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" \
        -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159"
    ```

### Postman

Postman is a popular API testing application that provides a graphical interface that makes testing easier, especially for those who are less technical. You can create and save various API calls for exploring the different endpoints. Organize API tests with workspaces and folder, collaborate on tests with other users, and store request and response artifacts for future testing. 

## Creating Custom APIs

Liferay not only provides you with options to interact with its out-of-the-box headless APIs, but also gives you the option to create your own API endpoints. 

### REST Builder

Rest Builder is a code generation tool that uses the OpenAPI specification. REST Builder consumes OpenAPI profiles and generates the scaffolding (endpoints, parsing, XML, filtering, and multipart support) you define. Custom APIs built with REST Builder can be deployed and tested in the API Explorer.

Use REST Builder to build custom APIs when you have specific needs to align with external systems or you need APIs that combine data from different sources. You can also use REST Builder in tandem with Liferay's Service Builder to create custom business entities for your organization. However, we no longer recommend this approach, as this use case is better served by Liferay Objects, which you will learn about in [Module 10: Building Applications](../module-10-building-applications.md). 

Furthermore, because REST Builder requires the deployment of OSGi modules, it is not available with Liferay SaaS, which is Clarity's chosen deployment option. Fortunately, Clarity's business needs are satisfied by Liferay's out-of-the-box APIs. While Clarity doesn't need to create custom headless endpoints at this time, it is an option they want to explore and keep handy for the future. As REST Builder is not a viable option, Clarity might consider using one of Liferay's beta features: API Builder.

### API Builder

The ability to create and customize APIs is a critical feature for organizations like Clarity to build integrated solutions with Liferay. Liferay's API Builder is a UI-based approach that makes it easy for you to create custom API application. Like REST Builder, code is automatically generated, thereby simplifying the development process.

![Use the API Builder to create custom APIs right from the UI.](./working-with-the-headless-platform/images/02.png)

With the API Builder, you can:

* Define and manage the API schema and endpoint all from the user-friendly interface.
* Specify input parameters, retrieve type, scope, path, description, and schema.
* Apply filtering or sorting to the endpoint
* Retrieve collections of entities or single elements.
* Test via Liferay's API Explorer.

See [API Builder](https://learn.liferay.com/w/dxp/headless-delivery/api-builder) to learn more.

Up Next: [Headless Security](./headless-security.md)
