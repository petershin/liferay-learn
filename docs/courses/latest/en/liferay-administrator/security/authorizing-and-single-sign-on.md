---
toc: 
    - ./authorizing-and-single-sign-on/authenticating-with-saml.md
    - ./authorizing-and-single-sign-on/authorizing-with-oauth2.md
uuid: 0aba9fed-1dee-4bd0-a57a-fd8200e72c35
---

# Authorizing and Single Sign-On

Authentication and authorization are like the two sides of a coin. Authentication ensures that credentials given match credentials stored in the system. Authorization grants access to resources given authentication that's already happened. Here, you'll learn about ways Liferay offers to authenticate users given credentials coming from another system, and you'll learn about how Liferay uses [OAuth 2](https://oauth.net/2/) to authorize access to resources on behalf of users. 

Liferay offers many enterprise options for single sign-on, such as old school token-based for legacy systems, Open AM, CAS, OpenID Connect, Kerberos, and Security Assertion Markup Language (SAML). Delectable Bonsai, as most organizations, doesn't use them all, so the focus here is on SAML. You can learn about all the other options in the [documentation](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso). 

Liferay can also grant access to resources given the token exchange protocol offered by industry-standard OAuth 2.0. Here you'll learn how to configure OAuth 2 profiles to grant access to your resources stored in Liferay, for users using anything from a web client, to a mobile app, or a headless microservice. 

Begin by [authenticating with SAML](./authorizing-and-single-sign-on/authenticating-with-saml.md)
