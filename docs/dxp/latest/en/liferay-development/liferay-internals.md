---
toc:
  - ./liferay-internals/fundamentals.md
  - ./liferay-internals/architecture.md
  - ./liferay-internals/extending-liferay.md
  - ./liferay-internals/contributing-to-liferay-development.md
  - ./liferay-internals/reference.md
uuid: 5327e4a8-4287-4894-9c5e-b4e28d88ba4f
taxonomy-category-names:
- Development and Tooling
- Frameworks
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Liferay Internals

Liferay is a complex open-source platform built on several key technologies and architectural principles. Liferay is written mostly in Java and built on the OSGi framework, which provides a modular architecture for developing and deploying software. Through OSGi, each module is developed and deployed independently. This means you can install, update, or remove different modules/components independently and dynamically. Liferay uses a relational database to store its data. It has its own data model and abstraction layer to interact with the database. For more information on how Liferay uses OSGi, see [Fundamentals](./liferay-internals/fundamentals.md).

## Architecture

  Liferay's architecture features a robust core that manages portal operations and configurations. The service layer handles essential functions such as content management, user roles, and system integration through modular, reusable services. The user interface (UI) uses portlets for dynamic content and functionality, customizable themes and layouts for visual design, and a framework called Clay that provides a consistent experience language. Together, these components create a flexible, scalable platform suited for various enterprise applications, ensuring seamless integration and user experience. For more information, see [Architecture](./liferay-internals/architecture.md).

## Extending Liferay

Liferay code is highly customizable. If your project requires a new feature to be added or a change in the behavior of a component in the portal, you can adapt the code to your needs. For more information on how to add, override, or modify services and languages, see [Extending Liferay](./liferay-internals/extending-liferay.md).

## Contributing to Liferay Development

Liferay Portal is open-source and publicly available on [GitHub](https://github.com/liferay/liferay-portal). This means that you can contribute to the code and help improve Liferay. For information on how to develop code for Liferay to fix bugs and contribute new features, see [Contributing to Liferay Development](./liferay-internals/contributing-to-liferay-development.md).