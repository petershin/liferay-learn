---
uuid: 9bf15d62-c0a2-48af-9cb6-9197fca3b82c
---
# Identity Management Options

As you continue to set up Liferay, it is important to understand the features available in Liferay that serve as gatekeepers. At a high-level, you want to allow authorized users into Liferay, while keeping unauthorized users out. You do this by using Liferay's different identity management tools. Once users are allowed in, they will also be associated with different roles and permissions, a topic that will be covered in the next module.

## Standard Username and Password

The simplest gatekeeper for Liferay is the standard username and password. [Add and manage users](https://learn.liferay.com/w/dxp/users-and-permissions/users/adding-and-managing-users) right from the Liferay UI. As an administrator, set passwords for users. Or have users create their own passwords.

Customize your [password policy](https://learn.liferay.com/w/dxp/users-and-permissions/roles-and-permissions/configuring-a-password-policy) to encourage strong passwords. For example, set a requirement for password complexity or length. You can also set user passwords to expire at regular intervals. Set additional [user authentication settings](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/virtual-instances/user-authentication) such as email verification.

## Multi-factor Authentication

Increase login security for Liferay with the use of multi-factor authentication (MFA). In addition to a password, with MFA, a user is required to provide Liferay with a separate verification. By default, Liferay offers different MFA options:

* Email-based one-time password (OTP)
* IP address checker
* Time-based one-time password (OTP)
* Fast Identity Online (FIDO) password

Note, to enable these different MFA options, MFA must first be checked `enabled` in your instance settings. See our documentation about [multi-factor authentication](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication) to learn more.

### Email-Based One-Time Password

Liferay can be configured to send [email-based one-time passwords](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/using-multi-factor-authentication). When a user attempts to log in, a one-time passcode is sent to the user by email. Simply enable it in instance settings and set up the configuration.

![Enable email-based one-time passwords.](./identity-management-options/images/01.png)

!!! note
   For this feature, Liferay must be [configured with your email service provider](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/setting-up-liferay/configuring-mail).

### IP Address Checker

The [IP Address checker](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/multi-factor-authentication-checkers#ip-address-mfa-checker) is a tool to set which IP addresses are authorized to log in to Liferay. This is particularly useful when Liferay is being used by users who are on the same trusted network. 

### Time-Based One-Time Password

A time-based one-time password checker is also available to use with Liferay. When this is enabled, Liferay provides a QR code to be scanned with a time-based password app like [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2).

Once a user scans the QR code, the time-based password app will continuously generate a one-time passcode to input upon login. When a passcode is input, Liferay checks the time-based code to authenticate the user.

### Fast Identity Online Password

Liferay supports the use of the [Fast Identity Online 2 (FIDO2)](https://fidoalliance.org/fido2/) standard. Users can utilize their FIDO2 compliant device for authentication. For example, a biometric device like a laptop's fingerprint reader or a USB key such as a YubiKey.

After enabling the feature, users can register their FIDO2 devices and start using their device for user authentication. See [enabling FIDO2](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication/fast-identity-online-2) to learn more.

Next: [Configuring SSO](./configuring-sso-and-idp.md)
