## Managing Content HTTP Headers

Liferay provides an extra layer of security that detects and mitigates certain types of attacks, like Cross-Site Scripting (XSS) and data injection attacks with the Content Security Policy (CSP). The site’s administrator enables it, and the user will receive headers on each HTTP request, which their browsers will interpret and enforce.

# Adding Content Security Policy Headers

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *System Settings* &rarr; *Security* &rarr; *Content Security Policy* .

![Content Security Policy Page.](./managing-content-http-headers/images/01.png)

Once you are on the page, you have several options to work with to develop your Security Policy. You also may notice that you need to enable it by checking the box. Here are the following options that you have at your disposal:

**Content Security Policy** - Here, you can specify the Content-Security-Policy HTTP header value. A unique nonce will be generated for link, script, and style tags for every request. Use this value in your policy by including the placeholder [$NONCE$], which will be automatically replaced with the generated nonce.

**Excluded Paths** - You can add or remove *Excluded Paths* as you please. Content Security Policy will not apply to paths that start with the specified excluded paths.

When finished, click Save.

!!!{note}
Content Security Police works best with SPA disabled. It is possible to disable it by accessing the `portal-ext.properties` and adding `javascript.single.page.application.enabled=false`.
!!!

!!!{note}
Instance level CSP headers will be applied to site-wide configuration panels and common pages (e.g., 404 page), providing consistent security measures across the instance.
!!!









