---
uuid: cbfba79e-2410-4806-9e7e-874ff733da3b
---
# Payment Integration Client Extension Reference

## Payment Integration Client Extension YAML Reference

| Field                                    | Value                                                                             | Description                                                                      |
| :--------------------------------------- | :-------------------------------------------------------------------------------- | :------------------------------------------------------------------------------- |
| `key`                                    | `liferay-sample-commerce-payment-integration`                                     | Specifies the unique key for the payment integration client extension.           |
| `name`                                   | `Liferay Sample Commerce Payment Integration`                                     | Specifies the name of the payment integration client extension.                  |
| `oAuth2ApplicationExternalReferenceCode` | `liferay-sample-commerce-shipping-engine-oauth-application-user-agent`            | Specifies the unique reference code of the OAuth 2 agent.                        |
| `shippingEngineTypeSettings`             | `key1:value1`<br>`key2:value2`<br>`key3:value3`<br>`key4:value4`<br>`key5:value5` | Specifies key-value pairs that appear in the shipping engine's configuration UI. |
| `type`                                   | `commercePaymentIntegration`                                                      | Specifies the type of the client extension.                                      |
| `paymentIntegrationType`                 | `3`                                                                               | Specifies the type of the payment integration.                                   |

## Payment Integration Types Reference

| Type                          | Value |
| :---------------------------- | :---- |
| TYPE_INTERNAL_ONLINE_STANDARD | 0     |
| TYPE_INTERNAL_ONLINE_REDIRECT | 1     |
| TYPE_INTERNAL_OFFLINE         | 2     |
| TYPE_FUNCTION_ONLINE_STANDARD | 3     |
| TYPE_FUNCTION_ONLINE_REDIRECT | 4     |
| TYPE_FUNCTION_OFFLINE         | 5     |

See [CommercePaymentIntegrationConstants](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-payment-api/src/main/java/com/liferay/commerce/payment/constants/CommercePaymentIntegrationConstants.java) for more information.

## Payment Integration Status Reference

| Value | Status            | Description                                                   |
|:------|:------------------|:--------------------------------------------------------------|
| 2     | STATUS_AUTHORIZED | Payment provider authorizes the payment                       |
| 8     | STATUS_CANCELLED  | Payment gets canceled by the buyer                            |
| 0     | STATUS_COMPLETED  | Transaction is complete and the merchant receives the payment |
| 4     | STATUS_FAILED     | Transaction fails for reasons other than cancellation         |
| 1     | STATUS_PENDING    | Specifies the creation of a refund that’s not submitted yet   |
| 17    | STATUS_REFUNDED   | Refund submission is complete                                 |
| 18    | STATUS_CREATED    | Specifies the addition of a new payment entry                 |

See [CommercePaymentEntryConstants](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/constants/CommercePaymentEntryConstants.java) for more information on the constants. See [Status Reference](../../payment-management/payments-reference.md#status-reference) for more information on the payments life cycle.
