---
uuid: fc207835-2243-4f2b-858f-67cfff5a1b3f
---
# Commerce Roles Reference

Liferay includes four [out-of-the-box roles](#out-of-the-box-roles) for Commerce: Account Administrator, Account Member, Buyer, and Order Manager. While these roles are configured to model some common roles, you can create additional account roles or modify the out-of-the-box ones to better suit your use case. Some [common custom roles](#custom-roles) include Catalog Manager, Inventory Manager, Shipment Manager, Instance Order Manager, and Discount Manager.

```{note}
For Liferay 7.3.x and earlier Commerce versions, [Sales Agent](#sales-agent) is also included as an out-of-the-box role.
```

## Viewing Permissions

Follow these steps to view and manage permissions associated with a Commerce role:

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), click on the *Control Panel* tab, and go to *Users* &rarr; *Roles*.

   ![Click on Roles in the Control Panel.](./commerce-roles-reference/images/01.png)

1. Click on the desired role:

   * *Account Administrator* (Account Role)
   * *Account Member* (Account Role)
   * Buyer (Account Role)
   * Order Manager (Account Role)

   ```{note}
   In Liferay 7.3 and earlier versions, the Account Administrator is a Site Role, and the Account Member role is not a default role. 
   ```

1. Click on the *Define Permissions* tab.

   From here, you can view a summary of all application and resource permissions assigned to the role.

   You can also remove or add permissions.

   ![Click on the Define Permissions tab to view and manage role permissions.](./commerce-roles-reference/images/02.png)

## Out-of-the-Box Roles

The following roles are automatically added to your DXP instance during Commerce activation. They are included alongside default DXP roles and can be modified if desired. See [Defining Role Permissions](https://learn.liferay.com/dxp/latest/en/users-and-permissions/roles-and-permissions/defining-role-permissions.html) for more information.

### Account Administrator

> Account Role

Account Administrators are super users of their account. They can approve or reject orders when there is a [Buyer Order Approval](../../order-management/order-workflows/enabling-or-disabling-order-workflows.md#enabling-workflow) workflow enabled and oversee the Order Managers and Buyers of their Account. They can modify their Account, invite or add users to it, and assign roles to other Account members. Account Administrators cannot create or delete Accounts. This permission is reserved for instance administrators.

The following Account permissions affect the Account Administrator's ability to modify accounts in a B2B setting, while the Open Carts permissions affect the administrator's ability to modify orders regardless of the store type.

| Permissions                                                          | Description                                                                                                |
| :------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------- |
| Accounts > Account: Add Account Entry                                | Ability to add Account entries                                                                             |
| Accounts > Account Entry: Manage Users                               | Ability to manage Account users                                                                            |
| Accounts > Account Entry: Update                                     | Ability to modify Account entries                                                                          |
| Accounts > Account Entry: View                                       | Ability to view an Account                                                                                 |
| Accounts > Account Entry: View Users                                 | Ability to view Account users                                                                              |
| Accounts > Commerce Account: Manage Addresses                        | Ability to add a new billing, a shipping, or a combined address to an Account                              |
| Accounts > Commerce Account: Manage Members                          | Ability to invite Users and Organizations to an Account; also ability to edit their details                |
| Accounts > Commerce Account: Update                                  | Ability to modify an Account                                                                               |
| Accounts > Commerce Account: View                                    | Ability to view an Account                                                                                 |
| Accounts > Commerce Account: View Addresses                          | Ability to view all addresses associated with an Account                                                   |
| Accounts > Commerce Account: View Members                            | Ability to view all members in an Account                                                                  |
| Open Carts > Commerce Order: Add Order                               | Ability to add an Order to a buyer's Account                                                               |
| Open Carts > Commerce Order: Approve Open Orders                     | Ability to approve Orders when workflow is enabled                                                         |
| Open Carts > Commerce Order: Check Out Open Orders                   | Ability to complete the checkout process for Orders                                                        |
| Open Carts > Commerce Order: Delete Orders                           | Ability to delete Orders                                                                                   |
| Open Carts > Commerce Order: Manage Orders                           | Ability to change Order details, such as mailing and billing addresses; ability to add a note to the Order |
| Open Carts > Commerce Order: View Open Orders                        | Ability to view all open Orders                                                                            |
| Open Carts > Commerce Order: View Orders                             | Ability to view Orders regardless of status                                                                |
| Open Carts > Commerce Orders: Manage Commerce Order Payment Methods  | Ability to manage payment methods of an Order                                                              |
| Open Carts > Commerce Orders: Manage Commerce Order Shipping Options | Ability to manage shipping options of an Order                                                             |
| Open Carts > Commerce Orders: Manage Order Delivery Terms            | Ability to manage the Delivery Terms of an Order                                                           |
| Open Carts > Commerce Orders: Manage Order Payment Terms             | Ability to manage the Payment Terms of an Order                                                            |
| Open Carts > Commerce Orders: View Billing Address                   | Ability to view the billing address of an Order                                                            |
| Accounts > Account Entry: View Account Roles                         | Ability to view Account Roles                                                                              |
| Accounts > Account Entry: View Addresses                             | Ability to view addresses of the Account                                                                   |
| Accounts > Account Entry: Manage Addresses                           | Ability to manage addresses of the Account                                                                 |
| Accounts > Account Entry: View Organizations                         | Ability to view organizations in the Account                                                               |

### Account Member

> Account Role (included in Liferay 7.4+)

This role is automatically assigned to all users within an account and grants basic view permissions.

| Permission                     | Description                |
| :----------------------------- | :------------------------- |
| Accounts > Account Entry: View | Ability to view an Account |

### Buyer

> Account Role

A buyer can make purchases on behalf of the Account they are handling. When there's a Buyer Order Approval workflow in place, they must submit the Order to the Order Manager who decides whether to approve it or not. A buyer can also view and check out Orders from another buyer of the same Account.

The following Accounts permissions pertain to the Buyer's ability to view and manage addresses, while the Open Carts permissions pertain to the buyer’s ability to view, create, and check out orders, and also view and manage other order attributes.

| Permissions                                                          | Description                                         |
| :------------------------------------------------------------------- | :-------------------------------------------------- |
| Open Carts > Commerce Order: Add Order                               | Ability to add an Order to a buyer's Account        |
| Open Carts > Commerce Order: Checkout Open Orders                    | Ability to complete the checkout process for Orders |
| Open Carts > Commerce Order: View Open Orders                        | Ability to view open Orders                         |
| Open Carts > Commerce Order: View Orders                             | Ability to view Orders regardless of status         |
| Accounts > Account Entry: Manage Addresses                           | Ability to manage the addresses of an Account       |
| Accounts > Account Entry: View Addresses                             | Ability to view the addresses of an Account         |
| Open Carts > Commerce Orders: Manage Commerce Order Payment Methods  | Ability to manage the payment methods of an Order   |
| Open Carts > Commerce Orders: Manage Commerce Order Shipping Options | Ability to manage the shipping options of an Order  |
| Open Carts > Commerce Orders: Manage Order Delivery Terms            | Ability to manage the Delivery Terms of an Order    |
| Open Carts > Commerce Orders: Manage Order Payment Terms             | Ability to manage the Payment Terms of an Order     |
| Open Carts > Commerce Orders: View Billing Address                   | Ability to view the billing address of an Order     |

### Order Manager

> Account Role

You can use this role to oversee all the purchases made in the Account. If a Buyer Order Approval workflow is in place, the Order Manager gets a request from the Buyer to approve a purchase. This role grants users all the permissions of Buyers and allows them to also manage, delete, and approve orders in a specific Site.

| Permissions                                                          | Description                                                                                                |
| :------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------- |
| Open Carts > Commerce Order: Add Order                               | Ability to add an Order to a buyer's Account                                                               |
| Open Carts > Commerce Order: Approve Open Orders                     | Ability to approve Orders when workflow is enabled                                                         |
| Open Carts > Commerce Order: Check Out Open Orders                   | Ability to complete the checkout process for Orders                                                        |
| Open Carts > Commerce Order: Delete Orders                           | Ability to delete Orders                                                                                   |
| Open Carts > Commerce Order: Manage Orders                           | Ability to change Order details, such as mailing and billing addresses; ability to add a note to the Order |
| Open Carts > Commerce Order: View Open Orders                        | Ability to view all open Orders                                                                            |
| Open Carts > Commerce Order: View Orders                             | Ability to view Orders regardless of status                                                                |
| Open Carts > Commerce Orders: Manage Commerce Order Payment Methods  | Ability to manage the payment methods of an Order                                                          |
| Open Carts > Commerce Orders: Manage Commerce Order Shipping Options | Ability to manage an Order’s shipping options                                                              |
| Open Carts > Commerce Orders: Manage Order Delivery Terms            | Ability to manage the Delivery Terms of an Order                                                           |
| Open Carts > Commerce Orders: Manage Order Payment Terms             | Ability to manage the Payment Terms of an Order                                                            |
| Open Carts > Commerce Orders: View Billing Address                   | Ability to view the billing address of an Order                                                            |

## Roles created by Site Initializers - Minium and Speedwell

### Sales Agent

The Sales Agent is a regular role in Liferay and assignees are able to manage any account assigned to the role without granting administrative permissions. You can find it under the *Regular Roles* tab.

| Permissions                                                       | Description                                                                          |
| :---------------------------------------------------------------- | :----------------------------------------------------------------------------------- |
| Accounts > Account Entry: Manage Organizations                    | Ability to add or remove organizations                                               |
| Accounts > Account Entry: Manage Users                            | Ability to add or remove user§s                                                      |
| Open Carts > Commerce Order: Add Order                            | Ability to add an order to the account that the agent's organization is a member of. |
| Open Carts > Commerce Order: Check Out Open Orders                | Ability to complete the checkout process for orders                                  |
| Open Carts > Commerce Order: View Open Orders                     | Ability to view all open orders                                                      |
| Users and Organizations > Organization: Manage Available Accounts | Ability to manage accounts that the sales agent's organization is a member of.       |

### Discount Manager

> Regular Role

The Discount Manager role grants permissions to create, update, and delete Discounts in Liferay Commerce. Since Commerce Discounts can target different parts of an order and use different eligibility rules, there are a lot of possible permission configurations for a Discount Manager.

| Permissions                                                 | Description                                                      |
| :---------------------------------------------------------- | :--------------------------------------------------------------- |
| Catalogs > Commerce Catalog: View                           | Ability to view catalogs                                         |
| Portal: View Control Panel Menu                             | Ability to access the Global Menu                                |
| Price Lists: Access in Control Panel                        | Ability to access the Price Lists application in the Global Menu |
| Price Lists > Commerce Price List: Delete                   | Ability to delete price list entries                             |
| Price Lists > Commerce Price List: Update                   | Ability to modify price list entries                             |
| Price Lists > Commerce Price List: View                     | Ability to view price list entries                               |
| Price Lists > Commerce Price Lists: Add Commerce Price List | Ability to add price list entries                                |
| Promotions: Access in Control Panel                         | Ability to access to Promotions application in the Global Menu   |

### Category Manager

The category manager role grants permissions to create categories and vocabularies in Liferay. The category manager can also access and manage product catalogs.

> Regular Role

| Permissions                                                 | Description                                                               |
| :---------------------------------------------------------- | :------------------------------------------------------------------------ |
| Catalogs: Access in Control Panel                           | Ability to access the Catalogs application in the Global Menu             |
| Catalogs > Commerce Catalog: Update                         | Ability to update product catalogs                                        |
| Catalogs > Commerce Catalog: View                           | Ability to view product catalogs                                          |
| Catalogs > Commerce Catalogs: Add Commerce Catalog          | Ability to add new product catalogs                                       |
| Categories: Access in Site and Asset Library administration | Ability to access categories in the Site and Asset Library administration |
| Categories: View                                            | Ability to view categories                                                |
| Categories > Asset Categories: Add Category                 | Ability to add categories                                                 |
| Categories > Asset Categories: Add Vocabulary               | Ability to add vocabularies                                               |
| Portal: View Control Panel Menu                             | Ability to access the Global Menu                                         |
| Products: Access in Control Panel                           | Ability to access the Products application in the Global Menu             |

### Operations Manager

> Regular Role

The operations manager role grants permissions to manage accounts of an account group, inventory, shipments, and orders.

| Permissions                                                  | Description                                                                                                |
| :----------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------- |
| Account Groups > Commerce Accounts: Manage All Accounts      | Ability to manage accounts of an account group                                                             |
| Inventory: Access in Control Panel                           | Ability to access the Inventory application in the Global Menu                                             |
| Open Carts > Commerce Orders: Manage Order Delivery Terms    | Ability to manage the delivery terms of an order                                                           |
| Open Carts > Commerce Orders: Manage Order Payment Terms     | Ability to manage the payment terms of an order                                                            |
| Open Carts > Commerce Orders: Manage Orders                  | Ability to change order details, such as mailing and billing addresses; ability to add a note to the order |
| Orders: Access in Control Panel                              | Ability to access the Orders application in the Global Menu                                                |
| Portal: View Control Panel Menu                              | Ability to access the Global Menu                                                                          |
| Shipments: Access in Control Panel                           | Ability to access the Shipments application in the Global Menu                                             |
| Shipments > Commerce Shipments: Manage Shipments             | Ability to access and modify shipments entities                                                            |
| Subscriptions: Access in Control Panel                       | Ability to access the subscriptions application in the Global Menu                                         |
| Subscriptions > Commerce Subscriptions: Manage Subscriptions | Ability to access and modify subscriptions                                                                 |
| Warehouses > Commerce Inventories: Manage Inventory          | Ability to access and modify inventory linked to a warehouse                                               |

### Punch Out

> Site Role

| Permissions                                         | Description                                         |
| :-------------------------------------------------- | :-------------------------------------------------- |
| Open Carts > Commerce Orders: Check Out Open Orders | Ability to complete the checkout process for Orders |
| Open Carts > Commerce Orders: View Open Orders      | Ability to view all open Orders                     |

## Custom Roles

The following list includes common custom roles you may want to create for your own Commerce instance. These roles can be created in the same way as other DXP roles. See [Creating and Managing Roles](https://learn.liferay.com/dxp/latest/en/users-and-permissions/roles-and-permissions/creating-and-managing-roles.html) and [Defining Role Permissions](https://learn.liferay.com/dxp/latest/en/users-and-permissions/roles-and-permissions/defining-role-permissions.html) for more information

### Catalog Manager

> Regular Role

The Catalog Manager role grants permissions to access, create, edit, and manage Products within a specific Catalog. This role is useful in multiple Catalog scenarios, where different vendors or company teams manage different Products in separate Catalogs. Catalog Managers cannot manage inventory. For this responsibility, see [Inventory Manager](#inventory-manager)

| Permissions                                         | Description                                                   |
| :-------------------------------------------------- | :------------------------------------------------------------ |
| Catalogs: Access in Control Panel                   | Ability to access the Catalogs application in the Global Menu |
| Catalogs: View                                      | Ability to view the Catalogs application                      |
| Currencies > Commerce Currencies: Manage Currencies | Ability to manage currencies                                  |
| Portal: View Control Panel Menu                     | Ability to access the Global Menu                             |
| Products: Access in Control Panel                   | Ability to access the Products application in the Global Menu |
| Products: View                                      | Ability to view the Products application                      |

In addition to the above permissions, you must also assign *View* and *Update* permissions for the individual Catalogs you want the role will manage.

To do this, open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), click on the *Commerce* tab, and go to *Product Management* &rarr; *Catalog*. Then, click on the *Actions* button (![Actions Button](../../images/icon-actions.png)) for the desired Catalog, and select *Permissions*. Use the check boxes to assign the role *View* and *Update* permissions.

```{note}
If you'd like your Catalog Manager to manage Products within a Catalog without the ability to modify the Catalog itself, remove the `Catalogs: Access in Control Panel` and `Catalogs: View` permissions.
```

### Inventory Manager

> Regular Role

The Inventory Manager role allows users to view and manage inventory in all Warehouses. Users with the role can add incoming shipments, update inventory levels, transfer between Warehouses, and view the changelog.

| Permissions                                         | Description                                                           |
| :-------------------------------------------------- | :-------------------------------------------------------------------- |
| Inventory: Access in Control Panel                  | Ability to access the Inventory application in the Control Panel      |
| Inventory: View                                     | Ability to view the Inventory application                             |
| Warehouses > Commerce Inventories: Manage Inventory | Ability to access and modify Inventory entities linked to a Warehouse |
| Portal: View Control Panel Menu                     | Ability to access the Global Menu                                     |

### Instance Order Manager

> Regular Role

The Order Manager role grants users the necessary permissions for managing orders across multiple Channels and is not limited to a single Site.

| Permissions                                                | Description                                                                                                |
| :--------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------- |
| Open Carts > Commerce Order: Add Order                     | Ability to add an Order to a buyer's Account                                                               |
| Open Carts > Commerce Order: Approve Open Orders           | Ability to approve Orders when workflow is enabled                                                         |
| Open Carts > Commerce Order: Check Out Open Orders         | Ability to complete the checkout process for Orders                                                        |
| Open Carts > Commerce Order: Delete Orders                 | Ability to delete Orders                                                                                   |
| Open Carts > Commerce Order: Manage Order Notes            | Ability to change general Order notes                                                                      |
| Open Carts > Commerce Order: Manage Order Restricted Notes | Ability to change restricted Order notes                                                                   |
| Open Carts > Commerce Order: Manage Orders                 | Ability to change Order details, such as mailing and billing addresses; ability to add a note to the Order |
| Open Carts > Commerce Order: View Open Orders              | Ability to view all open Orders                                                                            |
| Open Carts > Commerce Order: View Orders                   | Ability to view Orders regardless of status                                                                |
| Orders: Access in Control Panel                            | Ability to access the Orders application in the Global Menu                                                |
| Orders: Permissions                                        | Ability to view and modify permissions for the Orders application                                          |
| Orders: View                                               | Ability to view the Orders application                                                                     |
| Account Groups > Commerce Accounts: Manage All Accounts    | Necessary to access the Account Groups application                                                         |
| Portal: View Control Panel Menu                            | Ability to access the Global Menu                                                                          |

### Shipments Manager

> Regular Role

The Shipment Manager role allows a user to process shipments. This includes the ability to add shipping details, shipping dates, add items to the shipment and update shipment status. In Commerce 3.0+ and Liferay 7.3+, users create shipments via the Orders application. If you only want the Shipment Manager to fill and process the shipment, then the following permissions are sufficient. Otherwise, you may want to add additional [Order Manager](#order-manager-regular-role) permissions.

| Permissions                                             | Description                                                           |
| :------------------------------------------------------ | :-------------------------------------------------------------------- |
| Open Carts > Commerce Order: View Orders                | Ability to view Orders regardless of status                           |
| Account Groups > Commerce Accounts: Manage All Accounts | Necessary to access the Account Groups application                    |
| Warehouses > Commerce Inventories: Manage Inventory     | Ability to access and modify Inventory entities linked to a Warehouse |
| Manage Shipments                                        | Ability to access and modify Shipment entities                        |
| Portal: View Control Panel Menu                         | Ability to access the Global Menu                                     |
| Shipments: Access in Control Panel                      | Ability to access the Shipments application in the Global Menu        |
| Shipments: View                                         | Ability to view the Shipments application                             |
| Shipments > Commerce Warehouse: View                    | Ability to view Warehouse entities                                    |

## Liferay 7.3 and Earlier

### Sales Agent

> Regular Role

The Sales Agent is a regular role in Liferay Commerce and assignees are able to manage any account assigned to the role without granting administrative permissions. Because it is a regular role, it is found in the *Regular Roles* tab.

![View default Sales Agent permissions in the Define Permissions tab.](./commerce-roles-reference/images/06.png)

| Permissions               | Description                                                    |
| :------------------------ | :------------------------------------------------------------- |
| Manage Organizations      | Ability to add or remove organizations                         |
| Manage Available Accounts | Ability to manage Accounts that the sales agent is a member of |

## Related Topics

* [Understanding Roles and Permissions](https://learn.liferay.com/dxp/latest/en/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.html)
* [Order Management Permissions Reference](./order-management-permissions.md)
* [Inventory Management Permissions Reference](./inventory-management-permissions.md)
* [Pricing Permissions Reference](./pricing-permissions.md)
* [Product Management Permissions Reference](./product-management-permissions.md)
* [Store Management Permissions Reference](./store-management-permissions.md)
* [Settings Permissions Reference](./settings-permissions.md)
