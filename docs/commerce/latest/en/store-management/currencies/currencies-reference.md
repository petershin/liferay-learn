---
uuid: 870af26f-34d4-4e72-8d86-8d392b0e257c
taxonomy-category-names:
- Commerce
- Storefronts
- Currencies
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Currencies Reference

Liferay comes with multiple currencies pre-configured for use out-of-the-box. Your store must have a primary currency enabled, to start processing orders.

To manage currencies, open the _Global Menu_ (![Applications Menu icon](../images/icon-applications-menu.png)) and navigate to _Commerce_ &rarr; _Currencies_.

![Adding a new currency](./currencies-reference/images/01.png)

| Field                        | Description                                                                                                                                                                                                                                                                                                                                                        |
| :--------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Name                         | Name of the currency                                                                                                                                                                                                                                                                                                                                               |
| Code                         | Currency's 3 letter [ISO code](https://www.currency-iso.org/en/home/tables/table-a1.html)                                                                                                                                                                                                                                                                          |
| Format Pattern               | Currency’s sign, the number of digits to come between commas, and which places are displayed. For example, in the format $###,##0.00 for US dollars, the places held by _0_ are always displayed (as 0 if no other digit is present) while the places held by _#_ are only displayed if occupied. A value of 0.01 in the above format would be displayed as $0.01. |
| Maximum Decimal Places       | Maximum number of digits to the right of the decimal point allowed                                                                                                                                                                                                                                                                                                 |
| Minimum Decimal Places       | Minimum number of digits to the right of the decimal point allowed                                                                                                                                                                                                                                                                                                 |
| Rounding Mode                | A type of [rounding mode](https://en.wikipedia.org/wiki/Rounding#Directed_rounding_to_an_integer) from the drop-down menu                                                                                                                                                                                                                                          |
| Primary                      | Toggle to designate whether this currency is the store's default currency                                                                                                                                                                                                                                                                                          |
| Exchange Rate with US Dollar | Currency's exchange rate compared with the store's primary currency; by default, USD is designated as the primary currency but can be [modified in the UI](../configuring-payment-methods/mercanet.md#set-eur-as-the-primary-store-currency).                                                                                                                      |
| Priority                     | Order in which the currency is displayed in the table; the higher the number, the further down it is displayed                                                                                                                                                                                                                                                     |
| Active                       | Toggle to activate this currency                                                                                                                                                                                                                                                                                                                                   |

## Related Topics

* [Currencies](../currencies.md)
* [Mercanet](../configuring-payment-methods/mercanet.md)
