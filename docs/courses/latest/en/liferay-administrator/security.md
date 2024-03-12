---
toc:
- ./security/authentication.md
- ./security/securing-web-services.md
- ./security/authorizing-and-single-sign-on.md
- ./security/managing-antisamy.md
uuid: b3acd179-59d4-4676-956e-4dbd5ce5519a
---
# Security

Liferay's philosophy is "secure by default." That means a default installation's configuration is secure right away. There are, however, many ways to tune the security closer to your needs. These ways come in several categories: 

- Authentication
- Securing Web Services
- Single Sign-On
- AntiSamy

You can tune each of these categories to better match your organization's design, rather than just sticking with the default. Here, you'll configure a Liferay installation to match Clarity Vision Solutions' needs. 

First, you'll configure how users log onto the system. Then you'll tune the authentication verifiers configured by default. After that, you'll enable multi-factor authentication. 

Once you've configured authentication, you'll move on to securing the web services. You'll tune the service access policies that ship with the product, and you'll enable cross-origin resource sharing (CORS) for images in Documents and Media. 

After that, you'll look at single sign-on and configure security assertion markup language (SAML) so users can use Liferay to sign into multiple systems. Finally, you'll configure app authorization with OAuth 2. 

The last feature you'll configure is an [AntiSamy](https://owasp.org/www-project-antisamy) sanitizer to protect the installation from users attempting to inject JavaScript code in places where only HTML or CSS are allowed. 

These topics give you a tour through many of Liferay's security features. To learn more, be sure to review the [security documentation](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay) on Liferay Learn. 

Ready?

[Let's Go!](./security/authentication.md)
