---
uuid: 451a029f-4b51-4f0b-ad9f-5cc5b61b1321
taxonomy-category-names:
- Cloud
- Analytics Cloud Administration
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Multi-Factor Authentication

Multi-factor authentication (MFA) is required for all Analytics Cloud users. This additional layer of security helps to protect users from cyberattacks such as phishing and man-in-the-middle (MITM) attacks.

## Setting up Multi-Factor Authentication

1. Login to [analytics.liferay.com](https://analytics.liferay.com) with your [liferay.com](https://www.liferay.com) account email address.

    ![Log into Liferay with your user account.](./multi-factor-authentication/images/01.png)

1. Choose from one of the five MFA options. For example, select *SMS Authentication* to receive a code by text message. 

    ![Choose your MFA option.](./multi-factor-authentication/images/02.png)

   Note, if you choose to change to a different authentication type after setup, please [contact support](#help-with-mfa).

1. Click the *Send Code* button and wait to receive your code. Note, you may need to check your spam folder if using the *Email Authentication* option.

    ![Select a authentication option and click send code.](./multi-factor-authentication/images/03.png)

1. Input the verification code and click the *Verify* button. Click the *Re-send code* button if you fail to receive the verification code.

    ![Input and verify received code.](./multi-factor-authentication/images/04.png)

1. Check the box if you choose to prevent MFA from expiring for the next 30 days.

    ![Check the box if you want the MFA to not expire for 30 days.](./multi-factor-authentication/images/06.png)

1. Click *Finish* to complete the authentication process.

    ![Click the Finish button to finish the process.](./multi-factor-authentication/images/05.png)

1. Upon authentication, the Analytics Cloud start page appears. From here, you can [Connect Liferay DXP to Analytics Cloud](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md).

## Help with MFA

Secure login is a critical feature to protect our users and customer data. If you encounter an issue with MFA, we're here to help. 

Contact support through [help.liferay.com](https://help.liferay.com/).
