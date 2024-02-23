---
toc:
  - ./using-client-extensions/using-the-checkout-step-client-extension.md
  - ./using-client-extensions/checkout-step-client-extension-reference.md
uuid: e44189a8-c0c0-4416-9c57-d8623b290637
taxonomy-category-names:
- Commerce
- Client Extensions
- Development and Tooling
- Developer Tools
- Java Development
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using Client Extensions

{bdg-secondary}`Liferay DXP 2024.Q1+/Portal 7.4 GA112+`

Using client extensions, you can extend Liferay without using OSGi modules. Deploy them to any Liferay environment, whether you host it yourself or on Liferay Cloud. They are also the primary way to customize Liferay with Liferay Cloud, together with built-in configurations like [Liferay objects](https://learn.liferay.com/w/dxp/building-applications/objects).

A client extension interfaces with Liferay's APIs. This loose coupling makes client extensions more flexible and easier to apply to environments after an upgrade, since they depend only on APIs, which rarely change between versions. You can also create client extensions using whatever programming languages or technologies you wish, because your client extensions run outside of Liferay with no extra code required to connect them.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Using the Checkout Step Client Extension
:link: ./using-client-extensions/using-the-checkout-step-client-extension.md
:::

:::{grid-item-card}  Checkout Step Client Extension Reference
:link: ./using-client-extensions/checkout-step-client-extension-reference.md
:::
::::
