---
toc:
  - ./guest-checkout/enabling-guest-checkout.md
uuid: 727ed491-ddd5-4fd5-ac54-b3f62d24e227
taxonomy-category-names:
- Commerce
- Storefronts
- Order Processing
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Guest Checkout

Guest checkout allows users to submit orders without a registered account on the site. You can enable guest checkout on a per-[channel](./channels.md) basis. See [Enabling Guest Checkout](./guest-checkout/enabling-guest-checkout.md) to learn more.

After enabling guest checkout, guest users must enter an email address during the checkout process. Then, users are prompted to log in, create an account, or continue as a guest. Guest users that add items to the cart and then later sign in before checking out, have their items automatically carried over to their account's cart.

## Processing a Guest Order

Guest orders are processed the same as any other order. See [Processing an Order](../order-management/orders/processing-an-order.md) for more information.

!!! note
    Guests do not share order histories with other authenticated users, even if they have the same email addresses.
