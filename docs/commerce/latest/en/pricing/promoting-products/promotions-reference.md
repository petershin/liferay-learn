---
uuid: f3403be8-b40e-40dd-abd1-612452b9b7cd
---
# Promotions Reference

| **Field**         | **Description**                                                                                                                                                                                     |
| :---------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Name              | Name of the promotion                                                                                                                                                                               |
| Catalog           | Catalog attached to the promotion. The promotion does not apply to products outside the selected Catalog.                                                                                           |
| Currency          | Currency attached to the promotion. If buyers use a different currency in their Channels, the promotion price is converted to that currency.                                                       |
| Priority          | The promotion that has precedence when there are multiple promotions present. The higher the priority value, the higher the precedence (2 greater than 1 greater than 0).    |
| Parent Price List | Select a price list here to base the promotion on that list. Whenever an SKU does not appear in the Promotion list, the Parent Price List is checked for the promotion price.                           |
| Price Type        | Select between net price or gross price. Net price is the price before addition of taxes and gross price is the price after addition of taxes. The promotion is applied on the price selected here. |

## Price Modifiers Reference

| **Field** | **Description**                                                                                                                                                                            |
| :-------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Name      | Name of the price modifier                                                                                                                                                                 |
| Target    | Target for applying the modifier (*Catalog*/*Categories*/*Product Groups*/*Products*)                                                                                                      |
| Modifier  | Type of modifier (*Percentage*/*Replace*/*Fixed Amount*)                                                                                                                                   |
| Amount    | Amount by which to modify                                                                                                                                                                  |
| Priority  | Priority that decides which modifier has precedence when there are multiple modifiers present. The higher the priority value, the higher the precedence (2 greater than 1 greater than 0). |

## Additional Information

* [Introduction to Promotions](./introduction-to-promotions.md)
* [Using the Promotion Base List](./using-the-promotion-base-list.md)
* [Creating a Promotion](./creating-a-promotion.md)
