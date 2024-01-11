---
uuid: f62e6011-c743-4c1d-829d-f9c724cdc394
taxonomy-category-names:
- Content Management System
- Content Performance
- Liferay Self-Hosted
- Liferay PaaS
---

# Liferay Performance Use Cases with Glowroot

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA100+`

Use [Glowroot](https://glowroot.org/) to diagnose and inform you on making performance improvements to your Liferay installation. Here are a few examples of possible use cases.

## Returning Large Collections

You might identify some slow transactions as you monitor the Transactions tab in Glowroot. For example, you notice a transaction for `blog-postings` to take a very long time (i.e. thirty seconds).

A quick fix for this problem would be to customize the `pageSize` to return a smaller number of postings per transaction. Or apply a filter to return only specific blog postings for the transaction. Use Glowroot to compare the response times of different transactions.

## Optimizing Custom Facets

Liferay supports [custom facets](../../using-search/search-pages-and-widgets/search-facets/custom-facet.md) so you can optimize search for your site.

With custom facets, you may notice a slowdown in your page's response time as you add multiple facet items. Use Glowroot to inspect the transactions and optimize the search responses. For example, the slowdown might be caused by returning the item count. You might conclude that removing the count calculation call improves performance and decreases load times.
