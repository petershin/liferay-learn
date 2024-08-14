---
uuid: 4b93d54a-064d-4536-af1a-6d0e92876f5c
---
# Working with the Headless Platform

<!--TASK: Rename; Reconsider article's focus-->

<!--TASk: Add Headless Diagram-->

Headless APIs offer significant advantages for modern application development. By decoupling the frontend and the backend, they enable seamless content delivery across various platforms while allowing developers to choose their preferred technologies. Using headless APIs can simplify development with standardized interfaces, enhance security through OAuth2 adoption, and ultimately accelerate time-to-market for digital products.

You can leverage Liferay's headless APIs in many use cases to deliver or receive content across various platforms. Examples include

- Migrating data from legacy systems
- Building custom web or mobile applications
- Building custom client extensions to interact with or extend Liferay DXP
- Creating automated processes such as batch user uploads or approval workflows
- Interfacing between Liferay and external systems such as Salesforce or SAP
- Integrating AI models for advanced content analysis and generation

## Exploring Liferay's APIs

Headless API endpoints are available for nearly every Liferay resource (e.g. blogs, documents & media, web content, users, etc.). There are some simple ways to get started exploring them.

### API Explorer

The API Explorer is an integrated application inside Liferay that displays all available headless REST API endpoints and provides the ability to call them through the user interface. APIs are grouped by category into several drop-down menus containing sets of endpoints. For each of these endpoints, the API Explorer displays the request URL, the corresponding method in the application, the possible parameters for the API call (both required and optional), and schemas for the request and response bodies. 

![View and execute Liferay's headless API endpoints in the API Explorer.](./working-with-the-headless-platform/images/01.png)

Once you've supplied the required parameters and data for an endpoint, you can click *Execute* to submit the request. The response code, headers, and body appear on the page in JSON or XML where you can copy or download the response. The API Explorer provides an intuitive way to explore APIs and understand how they work in a secure environment as you use them to implement your custom solutions.

### cURL

Client URL (cURL) is a simple command line tool for transferring data, most commonly with REST API calls. You can use cURL to call Liferay services with both basic authorization (not recommended for production environments) and OAuth 2.0.

- Call a service with basic authorization by passing your login credentials in the request with the *username:password* format. For example,

    ```bash
    curl \
        "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" \
        -u "test@liferay.com:learn"
    ```
- Call a service with OAuth 2.0 by passing the access token for the corresponding application in the request. Ensure the application is registered to use OAuth 2.0. For example,

    ```bash
    curl \
        "http://localhost:8080/o/headless-delivery/v1.0/sites/20122/blog-postings/" \
        -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159"
    ```

### Postman

Postman is a popular application for API testing. You can use its GUI to create and save various API calls for exploring Liferay's endpoints. Additionally, you can organize API tests with workspaces and folder, collaborate on tests with other users, and store request and response artifacts for future testing. 

<!--TASK: Consider making this point more generic, "Using Third Party Services"-->

## Creating Custom APIs

Liferay not only provides ways to interact with its out-of-the-box headless APIs, but also empowers you to define your own API endpoints.

<!-- The ability to create and customize APIs is a critical feature for organizations building integrated solutions with Liferay. -->

### REST Builder

Rest Builder is a code generation tool that uses the OpenAPI specification. REST Builder consumes OpenAPI profiles and generates the scaffolding (endpoints, parsing, XML, filtering, and multipart support) you define. You can deploy custom REST Builder APIs and then test them in API Explorer.

However, since REST Builder requires deploying OSGi modules, this method is not available on Liferay SaaS. Furthermore, for Liferay PaaS and Self Hosted, you should only use REST Builder when you must align with external systems or you need APIs that combine data from multiple sources. In many cases, you can use Liferay Objects with API Builder and client extensions to satisfy requirements.

<!--TASK: Add Section on Liferay Objects and how you can create headless endpoints. Then, in the following section, Clarify that the API Builder works with Objects. -->

### API Builder

Liferay's API Builder is a UI-based approach to API creation that simplifies the creation of custom API applications for object definitions. With it, you can

* Define and manage the API schema and endpoint via the user-friendly interface.
* Specify input parameters, retrieve type, scope, path, description, and schema.
* Apply filtering or sorting to the endpoint.
* Retrieve collections of entities or single elements.
* Test via Liferay's API Explorer.

See [API Builder](https://learn.liferay.com/w/dxp/headless-delivery/api-builder) to learn more.

![Use the API Builder to create custom APIs right from the UI.](./working-with-the-headless-platform/images/02.png)

Fortunately, Liferay's out-of-the-box APIs satisfy Clarity's business needs. Next, let's learn about how Clarity can leverage these APIs securely.

<!--TASK: Add Conclusion-->

Up Next: [Headless Security](./headless-security.md)
