---
uuid: c262be43-4185-4715-adee-64f9e2d2141d
---

# Understanding Service Access Policies

Use the service access policy tool to set which web services have public access. You can view a list of the default policies. Follow the steps below to add a new policy. See [setting service access policies](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies) to learn more.

```{warning}
The example below is for demonstration purposes only. Granting access to these services make them public facing and typically should be paired with authentication.
```

1. Make an API request without passing any credentials. 

   ```bash
   curl "localhost:8080/o/headless-admin-user/v1.0/my-user-account"
   ```

   Note, that a forbidden error response is returned.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Service Access Policy_.

1.  Click _Add_ (![Add icon](../../images/icon-add.png)).

1. Configure the new policy as follows:

   * Enter `MY_USER_ACCOUNT_GUEST_ACCESS` as the name.
   * Toggle the enabled switch on.
   * Toggle the default switch on.
   * Enter `My User Account Guest Access` as the title.
   * Enter `com.liferay.headless.admin.user.internal.resource.v1_0.UserAccountResourceImpl` as the service class.
   * Enter `getMyUserAccount` as the method name.
   * Click _Save_.

1. Make the same API request.

   ```bash
   curl "localhost:8080/o/headless-admin-user/v1.0/my-user-account"
   ```

   Liferay now returns the user account info of the guest user. Allow or deny access in this way for other services.

Next: [Cross-Origin Resource Sharing](./cross-origin-resource-sharing.md)

## Relevant Concepts

[Setting Service Access Policies](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies)
