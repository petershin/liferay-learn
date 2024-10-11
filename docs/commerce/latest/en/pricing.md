---
toc:
  - ./pricing/pricing-engine-overview.md
  - ./pricing/setting-a-products-base-price.md
  - ./pricing/creating-a-price-list.md
  - ./pricing/adding-products-to-a-price-list.md
  - ./pricing/using-price-tiers.md
  - ./pricing/using-gross-and-net-price-types.md
  - ./pricing/using-price-modifiers.md
  - ./pricing/promoting-products.md
  - ./pricing/configuring-taxes.md
  - ./pricing/pricing-configuration-reference.md
  - ./pricing/developer-guide.md
uuid: 5db48935-57e8-437b-b655-486f0aecbdea
taxonomy-category-names:
- Commerce
- Pricing
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Pricing

Liferay provides a robust pricing system to fine-tune product prices. You can define multiple price entries for a single product SKU and determine which accounts, account groups, and channels are eligible to receive each price. If multiple price entities exist for the same SKU, the pricing engine calculates which entities should be used for each customer in the channel.

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal GA98+` If you have a [unit of measure](./product-management/creating-and-managing-products/products/units-of-measure.md) configured for the SKU, you can define multiple price entries for each unit of measure and determine the same eligibility criteria as with regular SKUs.