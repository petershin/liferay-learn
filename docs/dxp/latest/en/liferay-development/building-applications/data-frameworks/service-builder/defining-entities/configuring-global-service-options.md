---
uuid: 4073b2f5-ecb6-44d9-80e1-5e4cabf8ce91
taxonomy-category-names:
- Development and Tooling
- Data Frameworks
- Liferay Self-Hosted
- Liferay PaaS
---

# Configuring Global Service Options

A service's global options apply to all its entities. Here are the options:

-   [Dependency Injector](#dependency-injector)
-   [Package path](#package-path)
-   [Multiversion concurrency control](#multiversion-concurrency-control-mvcc)
-   [Namespace options](#namespace-options)
-   [Author](#author)

## Dependency Injector

The default dependency injector is OSGi Declarative Services. This makes Service Builder work consistently as other modules do. Before DXP/Portal 7.2, Service Builder used Spring dependency injection. The only difference is how you inject the services when you use them. Both injector settings are shown below. See _Dependency Injection_ in [Core Frameworks](../../../../core-frameworks.md) for more information.

Declarative Services Dependency Injector:

```xml
<service-builder dependency-injector="ds">
```

Spring Dependency Injector:

```xml
<service-builder dependency-injector="spring">
```

When a project is created using the [Service Builder template](../../../../tooling/blade-cli/generating-projects-with-blade-cli.md#creating-a-project), the Declarative Services dependency injector and its dependencies are configured for the project by default. To use the Spring dependency injector instead, create the project using [Blade CLI](../../../../tooling/blade-cli/generating-projects-with-blade-cli.md)'s Service Builder template and the `--dependency-injector spring` option.

!!! note
Before Liferay DXP/Portal 7.2, Spring was the sole dependency injector. The services were Spring beans. Liferay's Spring bean framework accommodates Spring beans referencing each other: for example, Spring bean A has a Spring bean B field and vice versa. When using Spring as the dependency injector, the Service Builder generates base services that include local service and persistence fields for all entities defined in the service.xml. This causes circular references. Since OSGi Declarative Services doesn't accommodate circular references, the Service Builder doesn't create these fields in the base classes when DS is the dependency injector. For more details, see [Understanding and Extending Generated Classes](../service-builder-basics/understanding-and-extending-generated-classes.md).

## Package Path

The package path specifies the package where the service and persistence classes are generated. For example, here's the package path for Guestbook:

```xml
<service-builder dependency-injector="ds"
        package-path="com.acme.guestbook">
```

The package path above ensures that the `*-api` module's service classes are generated in the `com.acme.guestbook` package. The persistence classes are generated in a package of the same name in the `*-service` module. For more details on the generated classes, see [Understanding and Extending Generated Classes](../service-builder-basics/understanding-and-extending-generated-classes.md).

## Multiversion Concurrency Control (MVCC)

The `service-builder` element's `mvcc-enabled` attribute is `false` by default. Setting `mvcc-enabled="true"` enables [multiversion concurrency control](https://en.wikipedia.org/wiki/Multiversion_concurrency_control) (MVCC) for all of the entities. In systems, concurrent updates are common. Without MVCC, people may read or overwrite data from an invalid state without realizing it. With MVCC, each modification is made upon a given base version number. When the Hibernate persistence layer receives the update, it generates an `update` SQL statement that uses a `where` clause to make sure the current data version is the version you expect.

If the current data version

-   **matches the expected version**, your data operation is based on up-to-date data and is accepted.

-   **doesn't match the expected version**, the data you're operating on is outdated. DXP/Portal rejects your data operation and throws an exception, which you can catch to help the user handle the exception (e.g., suggest retrying the operation).

Enable MVCC for all your services by setting `mvcc-enabled="true"` in your `<service-builder/>` element. When invoking service entity updates (e.g., `fooService.update(object)`), make sure to do so in transactions. Expose rejected transactions in the UI for the user to handle.

```xml
<service-builder dependency-injector="ds"
        package-path="com.acme.guestbook"
        mvcc-enabled="true">
```

## Namespace Options

Service Builder names the database tables using the service namespace. For example, _GB_ could serve as the namespace for a Guestbook application service.

```xml
<service-builder dependency-injector="ds"
   package-path="com.acme.guestbook"
   mvcc-enabled="true">
    <namespace>GB</namespace>
    <author>Liferay</author>
```

Service Builder uses the namespace in the following SQL scripts it generates in your `src/main/resources/sql` folder:

-   `indexes.sql`
-   `sequences.sql`
-   `tables.sql`

!!! note
The generated SQL script folder location is configurable. For example, if you're using Gradle, you can define the `sqlDir` setting in the project's Gradle `build.gradle` file like the `databaseNameMaxLength` setting is applied in the examples below.

Service Builder uses the SQL scripts to create database tables for all the entities the `service.xml` defines. The database table names have the namespace pre-pended when they are created. Since the example namespace value is `GB`, the database table names created for the entities start with `GB__` as their prefix. Each Service Builder project's namespace must be unique. Separate plugins should use separate namespaces and should not use a namespace already used by Liferay entities (such as `Users` or `Groups`). Check the table names in Liferay's database to see the namespaces already in use.

Assign namespace values carefully. Some databases have strong restrictions on database table and column name lengths. The Service Builder [Gradle plugin](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/sdk/gradle-plugins-service-builder) parameter `databaseNameMaxLength` sets the maximum length you can use for your table and column names. Here are paraphrased examples of setting `databaseNameMaxLength` in build files:

**Gradle `build.gradle`**

```groovy
buildService {
    ...
    databaseNameMaxLength = 64
    ...
}
```

## Author

As the last piece of global information, enter your name as the service's _author_ in your `service.xml` file. Service Builder adds `@author` annotations with the specified name to all the Java classes and interfaces it generates. Save your `service.xml` file. Next, you'll add entities for your services.

```xml
<service-builder dependency-injector="ds"
   package-path="com.acme.guestbook"
   mvcc-enabled="true">
    <namespace>GB</namespace>
    <author>Liferay</author>
```

## Related Topics

-   [Core Frameworks](../../../../core-frameworks.md)
-   [Understanding and Extending Generated Classes](../service-builder-basics/understanding-and-extending-generated-classes.md)
