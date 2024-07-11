---
uuid: 902440c2-2660-44bf-ae5a-71f48dbd32d3
taxonomy-category-names:
- Development and Tooling
- Frameworks
- Liferay Self-Hosted
- Liferay PaaS
---
# Exporting Packages

In OSGi, packages are private by default. You must explicitly exporting a package so other modules can [import](./importing-packages.md) and use them.

Here's how to export packages:

1. Open your `bnd.bnd` file.

1. Add the `Export-Package:` header if you haven't already added it.

1. List the package names after the `Export-Package:` header.

    ```groovy
    Export-Package: com.liferay.petra.io,com.liferay.petra.io.unsync
    ```

[Workspace](../../liferay-development/tooling/liferay-workspace.md)-based projects created using [Blade CLI](../../liferay-development/tooling/blade-cli/generating-projects-with-blade-cli.md) or Liferay Developer Studio have [Bnd](http://bnd.bndtools.org/). Bnd propagates OSGi headers from the `bnd.bnd` file to the module JAR `META-INF/MANIFEST.MF` file.

!!! important
    Don't export the same package in multiple JARs. Exporting the same package from different modules leads to "split package" issues with unpredictable side effects.

Bnd makes a module's exported packages *substitutable*. That is, Bnd substitutes your module's exported package with a compatible package of the same name, but potentially different version, that's exported from a different module. Bnd enables this by automatically making your module import every package it exports. In this way, the module can work on its own, but can also work in conjunction with modules that provide a different (compatible) version, or even the same version, of the package. A package from another module might provide better "wiring" opportunities with other modules. [Peter Kriens' blog post](http://blog.osgi.org/2007/04/importance-of-exporting-nd-importing.html) explains substitutable exports.

Now you can share your module's terrific packages!

## Related Topics

- [Configuring Dependencies](./configuring-dependencies.md)
- [Semantic Versioning](./semantic-versioning.md)
- [Liferay Workspace](../../liferay-development/tooling/liferay-workspace.md)
- [Blade CLI](../../liferay-development/tooling/blade-cli.md)
