---
toc:
  - ./configuring-payment-methods/managing-payment-methods.md
  - ./configuring-payment-methods/adyen.md
  - ./configuring-payment-methods/authorize-net.md
  - ./configuring-payment-methods/mercanet.md
  - ./configuring-payment-methods/money-orders.md
  - ./configuring-payment-methods/paypal.md
  - ./configuring-payment-methods/stripe.md
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

Payments are processed through a payment method. There are three types of payment methods:

**Offline**: Liferay does not process the payment.

**Online Standard**: Liferay processes the payment entirely. This option is not available out-of-the-box but you can add additional methods using the [payment integration](../developer-guide/using-client-extensions/using-the-payment-integration-client-extension.md) client extension or the [payment method](../developer-guide/sales/implementing-a-new-payment-method.md) extension point.

**Online Redirect**: Liferay passes information to a third-party payment processor, redirecting the buyer to the processor's website to complete payment.

Liferay ships with four payment methods. Money order is an offline method. Authorize.net, Mercanet, and PayPal redirect buyers to a third-party website.

By default, Liferay Commerce does **not** store customer payment information. If you want to enable recurring payments or a faster checkout experience, please use a third-party payment processor to manage sensitive customer payment information. If you are required to store customer payment information, it is **highly recommended** that you implement [PCI DSS](https://www.pcisecuritystandards.org) compliant practices and policies.
