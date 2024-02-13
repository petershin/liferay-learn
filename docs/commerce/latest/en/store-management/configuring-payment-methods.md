---
toc:
  - ./configuring-payment-methods/managing-payment-methods.md
  - ./configuring-payment-methods/authorize-net.md
  - ./configuring-payment-methods/mercanet.md
  - ./configuring-payment-methods/money-orders.md
  - ./configuring-payment-methods/paypal.md
uuid: aa6382a0-494f-44f7-b444-5f01acd39f7e
taxonomy-category-names:
- Commerce
- Storefronts
- Payment
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Configuring Payment Methods

Payments are processed through a Payment Method. There are three types of payment methods:

**Offline**: Liferay Commerce does not process payment.

**Online Standard**: Payment is processed entirely by Liferay Commerce. This option is not available out-of-the-box but can be customized using the Payment Method extension point.

**Online Redirect**: Liferay Commerce passes information to a third-party payment processor, redirecting the buyer to the processor's website to complete payment.

Liferay Commerce ships with four payment methods. Money Order is an offline method. Authorize.net, Mercanet, and PayPal redirect buyers to a third-party website. Additional methods can be added using the Payment Method extension point.

By default, Liferay Commerce does **not** store customer payment information. Stores with requirements to allow for recurring payments or a faster checkout experience are recommended to use a third-party payment processor to manage sensitive customer payment information. If store administrators are required to store customer payment information, it is **highly recommended** that they implement [PCI DSS](https://www.pcisecuritystandards.org/) compliant practices and policies.

```{raw} html
:file: ../landingpage_template.html
```

```{raw} html
:file: configuring-payment-methods/landing.html
```
