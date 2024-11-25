---
toc:
  - ./configuring-dependencies/finding-artifacts.md
  - ./configuring-dependencies/specifying-dependencies.md
  - ./configuring-dependencies/resolving-third-party-library-package-dependencies.md
  - ../../reference/jars-excluded-from-wabs.md
uuid: 345be6d8-c027-480c-b7cb-751f4d0ff8d2
taxonomy-category-names:
- Development and Tooling
- Frameworks
- Liferay Self-Hosted
- Liferay PaaS
---
# Configuring Dependencies

Liferay provides a container where modules can publish and consume functionality through their Java packages. Modules can leverage packages from other modules or traditional libraries by configuring them as dependencies. Here you'll learn how to find artifacts (modules or libraries) and configure dependencies on them.

- [Finding Artifacts](./configuring-dependencies/finding-artifacts.md) explains how to use the Application Manager, Gogo Shell, and Liferay reference documentation to find artifacts deployed on Liferay and available in repositories.

- [Specifying Dependencies](./configuring-dependencies/specifying-dependencies.md) shows how to reference artifacts in module projects in Liferay Workspace. You'll learn how to determine if Liferay already exports packages from an artifact and how to configure such artifacts as compile-time dependencies.

- [Resolving Third-Party Library Package Dependencies](./configuring-dependencies/resolving-third-party-library-package-dependencies.md) provides a workflow for using packages that are only available in traditional library JARs (JARs that aren't OSGi modules). Transitive dependencies are minimized so you can resolve dependencies quicker and prevent bloating your project with unnecessary JARs.

Your first step is to find the artifacts you need.
