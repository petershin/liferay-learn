---
uuid: bf9620b2-1186-4911-ae84-94fc61108462
---
# Pricing Configuration Reference

You can change the default discovery logic and other parameters of the pricing engine through system settings. To access these settings, open the *Global Menu* (![Applications Menu icon](../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *System Settings* &rarr; *Pricing*. The following settings are available:

* Pricing Calculation Key
* Price List Discovery Method
* Promotion Discovery Method
* Tax Display
* Discount Application Strategy

## Pricing Calculation Key

The default pricing calculation key is `v2.0`. This uses version two of the Commerce pricing engine. If you want to use the older Commerce pricing engine, replace this with the value `v1.0` and click *Save*. Read [Pricing Engine v1.0 Reference](./introduction-to-pricing.md#pricing-engine-v10-reference) for more information. 

## Price List Discvery Method

By default, price lists use priority for application to eligible accounts. You can change this by replacing `hierarchy` with `lowest`. This discovery method choses the price list with the lowest price among all eligible price lists. 

## Promotion Discvery Method

By default, promotion lists use priority for application to eligible accounts. You can change this by replacing `hierarchy` with `lowest`. This discovery method choses the promotion list with the lowest price among all eligible promotion lists. 

```{note}
You can use these discovery methods interchangeably. It is not mandatory to have the same value for both. For instance, you can set the price list discovery method as `lowest` and keep the promotion discovery method as `hierarchy` or vice-versa. 
```

## Tax Display

By default, you can view the tax included by setting the value to `0`. If you don't want to display this, set the value to `1`. Note that this doesn't exclude the calculation of tax, it just removes it from display. 

## Discount Application Strategy

There are two ways to apply discounts: `additive` and `chaining`. By default, discounts are chained. This means whenever there are multiple discounts, the subseuqnet discount gets calculated based on the value after applying the previous discount. When it's additive, multiple discounts are grouped together and applied all at once. See the illustration below to understand the difference. 