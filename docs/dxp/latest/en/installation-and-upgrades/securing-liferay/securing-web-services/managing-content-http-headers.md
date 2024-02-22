---
uuid: 54d8d407-1f2d-4f9c-bae5-3329cdeda0a0
---

# Managing Content HTTP Headers

Liferay provides an extra layer of security that detects and mitigates certain types of attacks, like Cross-Site Scripting (XSS) and data injection attacks with the Content Security Policy (CSP). The site’s administrator enables it, and the user receives headers on each HTTP request, which their browsers interprets and enforces. There are several options to set as CPS policy, and it may be adjusted to the user's needs. See more in [Content Security Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy).

## Adding Content Security Policy Headers

Imagine a fast-growing e-commerce company that relies on its server to serve all the scripts necessary for its online storefront. One day, the server is compromised, potentially leading to the injection of malicious scripts into the company's web pages. By configuring the CSP, they can disable the loading of any scripts originating from the compromised server. Here is how then can implement a CSP to mitigate the impact of the security breach:

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *System Settings* &rarr; *Security* &rarr; *Content Security Policy* .

![Viewing Content Security Policy Page.](./managing-content-http-headers/images/01.png)

1. Once you are on the page, you have several options to work with to develop your Security Policy. You also may notice that you need to enable it by checking the box. Here are the following options that you have at your disposal:

**Content Security Policy** - Here, you can specify the Content-Security-Policy HTTP header value. A unique nonce will be generated for link, script, and style tags for every request. Use this value in your policy by including the placeholder [$NONCE$], which will be automatically replaced with the generated nonce.

**Excluded Paths** - You can add or remove *Excluded Paths* as you please. Content Security Policy will not apply to paths that start with the specified excluded paths.

The company would use the *Content Security Policy* panel to insert the CSP header:

```bash
Content-Security-Policy: default-src 'self'; script-src 'self' https://trusted-cdn.example.com 'nonce-$NONCE$'; style-src 'self' https://trusted-cdn.example.com 'nonce-$NONCE$'; object-src 'none'; base-uri 'self';

```
On this example, the header allows resources to be loaded only from the same origin `self` and from the trusted content delivery network `https://trusted-cdn.example.com`. Is also includes the nonce [$NONCE$] for scripts and stylesheets to secure their integrity and prevent unauthorized script execution. Also, it specifies that no objects should be loaded `object-src 'none` and makes sure that the base URI to be the same origin `base-uri 'self`.

1. After filling the CSP panel, check the *Enable* box.

1. When finished, click Save.

!!! {note}
Content Security Police works best with SPA disabled. It is possible to disable it by accessing the `portal-ext.properties` and adding `javascript.single.page.application.enabled=false`. Also, instance level CSP headers will be applied to site-wide configuration panels and common pages (e.g., 404 page), providing consistent security measures across the instance.
!!!