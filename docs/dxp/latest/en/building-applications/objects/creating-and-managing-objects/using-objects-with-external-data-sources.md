---
uuid: f1b85ce0-bfb0-4abd-bf57-534edda1d5f0
---
# Using Objects with External Data Sources

{bdg-link-primary}`[Beta Feature](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

Liferay Objects provides low-code capabilities for modeling data structures and implementing business logic integrated with Liferay DXP. Using this framework, you can create user experiences with custom workflows, validations, notifications, and more.

By default, object definitions create tables in Liferay's database for storing entry data. However, you can configure your object to function as a proxy, using it to store and retrieve data from an external data source, like Salesforce.

Rather than duplicating and syncing data between systems, the proxy storage type uses a single data source outside Liferay. This can help reduce data inconsistencies and conflicts between systems. Alternative approaches to this problem can involve costly and complex custom solutions. By using proxy objects, you can leverage Liferay's low-code features to more easily provide consistent user experiences while streamlining touch points and simplifying data management.

In proxy objects, fields are mapped to existing columns in an external system's database, so data operations directly create or update the asset in the external system. For example, when users create an object entry, Liferay performs a POST API call to the external system's APIs and only adds the data to that system's database.

```{important}
Since this data does no persist in Liferay's database, some limitations are placed on proxy objects:

* Users cannot add field [validations](./validations.md)

* Users cannot add object [relationships](./relationships.md)

* Users cannot [index](../../../using-search/search-administration-and-tuning/search-administration.md#index-actions) its data through Liferay

Besides these limitations, proxy objects share the same platform integrations as standard objects. See [Understanding Object Integrations](../understanding-object-integrations.md) for more information.
```

## Interacting with Proxy Object Data in Liferay

Like standard object definitions, you can use proxy object data in Liferay DXP to create dynamic user experiences. Once defined, these objects are integrated with Liferay's core frameworks, so you can access and display data from proxy objects using Liferay's page builder features.

Examples include creating display plays for object data, displaying data in collection displays, and mapping entry values to fragment elements.

## Supported Connectors for Proxy Objects

Currently, Liferay includes a [beta](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) connector to Salesforce for proxy objects. With it, you can integrate your proxy object with [custom Salesforce objects](https://help.salesforce.com/s/), using Salesforce as an external storage system. While integrated, the Liferay object's data is only stored in Salesforce, though users can view and access data in Liferay.

To use this feature, enable the Proxy Object (LPS-135430) feature flag.

## Related Topics

* [Understanding Object Integrations](../understanding-object-integrations.md)
* [Creating Objects](./creating-objects.md)
