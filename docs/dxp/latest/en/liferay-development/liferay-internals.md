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

Liferay is a complex open-source platform built on several key technologies and architectural principles. Liferay is written mostly in Java and built on the OSGi framework, which provides a modular architecture for developing and deploying software. Through OSGi, each module is developed and deployed independently. This means you can install, update, or remove different modules/components independently and dynamically. Liferay uses a relational database to store its data. It has its own data model and abstraction layer to interact with the database.