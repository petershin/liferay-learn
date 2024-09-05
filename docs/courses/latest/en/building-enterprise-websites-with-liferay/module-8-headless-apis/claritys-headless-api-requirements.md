---
uuid: 34c05341-ace7-439e-8708-50a4d7f12905
---
# Clarity's Headless API Requirements

Liferay provides a suite of headless APIs that enable RESTful interaction with Liferay DXP resources. A headless application separates the presentation layer from other functional components of a given software platform. This decoupling enables the use of backend services while implementing a user interface with any framework of your choosing. You can use headless APIs to consume Liferay content and perform the same kinds of actions that are available in the Liferay portal web interface. Headless APIs are also essential for translating data into a machine-readable format for other web applications, migrating data between systems, and other integration scenarios.

Liferay's headless APIs follow the OpenAPI specification that makes it easy to consume APIs with any application that can make web calls. These APIs respond with JSON content by default and also support XML natively. They provide a secure, versatile interface for transferring data securely between Liferay and external systems.

## Requirements

With this in mind, let's consider Clarity's specific headless API requirements. 

### Easy importing of legacy data and products

Clarity needs an easy way to import site content from their legacy system. The team does not want to resort to manually copying and entering data. Fortunately for them, most of Liferay's resources (e.g. blogs, documents and media, web content, etc.) have corresponding headless APIs that support batch import (as well as export). Clarity can also use headless APIs to import product data for their eyewear catalog. Clarity will have no problem importing legacy data and products.

### API building without expert Liferay knowledge

As Clarity gets up and running with Liferay, they hope to implement some custom applications that need headless APIs that are not out-of-the-box. They hope they don't need to tangle with Liferay code to create their own headless APIs. Fortunately, Liferay supports custom API building. Programmatic API building has been available for many versions of Liferay, but API building from the UI is now also available.

### Secure data transfer

While the headless APIs offer convenient access to and from Liferay's database, Clarity does not want this convenience to come at the expense of security. Fortunately, Liferay's headless platform comes with industry standard methods of authorization such as HTTPS and OAuth 2.0 for secure communication. 

## Conclusion

Great! You've learned about Clarity's headless API requirements. Now let's take a closer look at Liferay's headless platform.

Up Next: [Working with the Headless Platform](./working-with-the-headless-platform.md)
