---
uuid: b93373b0-493b-4aa6-96f1-4809d4ea5567
---
# API Builder

{bdg-secondary}Liferay DXP 2023.Q4+/Portal 7.4 GA96+
{bdg-link-primary}`[Beta Feature](../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

```{important}
The API builder is a beta feature that currently only supports Liferay objects. API endpoints currently support retrieving collections of entities.
```

The API builder makes it easy for you to create custom API applications in Liferay. Create API schemas and endpoints that meet your exact needs.

To enable the API builder,

1. Navigate to _Global Menu_ (![Global Menu](../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_.

1. Click _Feature Flags_ under _Platform_.

1. Select _Beta_ in the left navigation. Toggle _API Builder_ on. The API builder is now enabled.

## Understanding API Applications

Each custom API application can house multiple endpoints and schemas. This is similar to Liferay's out-of-the-box API applications. For example, the `headless-admin-user` API application houses endpoints for `accounts`, `organizations`, `roles`, `user-accounts`, etc. 

To manage your custom API applications, navigate to _Global Menu_ (![Global Menu](../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _API Builder_. See a list of your custom API applications. The title, URL, description, last update, and status appear for each API application.

![See a list of your custom API applications.](./api-builder/images/01.png)

To create a new API application, click _Add_ (![Add icon](../images/icon-add.png)) and enter your details.

To edit or delete an application, click _Options_ (![Options icon](../images/icon-options.png)) and click _Edit_ or _Delete_. Note, an API application that has a draft status can be used only after it is published. Once published, the generated APIs have the same set of features as Liferay's out-of-the-box APIs (i.e. pagination, filtering, sorting, etc.)

## Understanding Schemas

API schemas specify what entities are returned (or received) by your API. To manage schemas, click into one of your custom API applications and click the _Schemas_ tab. See a list of your custom schemas. The name, description, and last update are shown for each schema.

![See a list of your custom schemas](./api-builder/images/02.png)

To create a new schema, click _Add_ (![Add icon](../images/icon-add.png)) and enter your details. Then click the new schema's _Properties_ tab and select the entities you want included. Select from the various entities that are available from your [Liferay object](../building-applications/objects/creating-and-managing-objects.md). If the object has [object relationships](../building-applications/objects/creating-and-managing-objects/relationships.md), the entities from those objects can be selected also. 

Note, an object's property names can be renamed to suit your needs. For example, for the `student` object in the screenshot, change `First Name` to `Given Name`.

![Select the entities you want included in your schema.](./api-builder/images/03.png)

To edit or delete a schema, click _Options_ (![Options icon](../images/icon-options.png)) and click _Edit_ or _Delete_.

## Understanding Endpoints

API endpoints are the specific URL locations that accept requests. To manage endpoints, click into one of your custom API applications and click the _Endpoints_ tab to see a list of your custom endpoints. The method, URL path, description, and last update are shown for each endpoint.

To create a new endpoint, click _Add_ (![Add icon](../images/icon-add.png)) and enter your details. Endpoints can be scoped for instance or site. Select the scope based on your object's scope. Click the _Configuration_ tab to configure the endpoint. Select a schema to use with the endpoint.

![Select the configuration tab to configure the endpoint.](./api-builder/images/04.png)

JSON filtering can be incorporated into the endpoint. For example, `filter=lastName eq 'Smith'` could be used to filter the endpoint for entries that contain a last name Smith. 

JSON sorting can also be incorporated. For example `sort=firstName:asc` could be used to sort the entries alphabetically by first name.

See [API query parameters](./consuming-apis/api-query-parameters.md) to learn more about filtering and sorting.

To edit or delete an endpoint, click _Options_ (![Options icon](../images/icon-options.png)) and click _Edit_ or _Delete_.

## Next Steps

* [Building a Sample API Application](./api-builder/building-a-sample-api-application.md)
