---
uuid: 54d8d407-1f2d-4f9c-bae5-3329cdeda0a0
---
# Configuring Content Security Policy Headers

Modern browsers use [Content Security Policy](https://content-security-policy.com) HTTP response headers to enhance web pages' security to mitigate certain types of attacks (like Cross-Site Scripting or data injection). You can enable CSP on Liferay to send the configured headers on each HTTP request. 

CSP policies have many options. It is best to understand your users' needs and come up with a policy to suit their requirements. For an example of a browser implementation of Content Security Policies, read [Mozilla's implementation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy) for more information.

## Configuring a Sample Content Security Policy

<!-- This goes way too fast into the example. You haven't discussed the concept of the two different kinds of policies (Directives and Values) and how Liferay supports them. You were also supposed to have two examples, one for directives, and one for values; it looks like there's only one example here where you've combined the two concepts without telling the reader what you're doing. This doesn't help anybody understand the feature and how to use it. Please revise accordingly -Rich -->

Imagine one of your company servers responsible for serving all the scripts to your website is compromised. This can lead to possible attacks like injection of malicious scripts to different web pages within your site. Using CSP, you can disable loading scripts if it originates from the compromised server. To do this,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *System Settings* &rarr; *Security* &rarr; *Content Security Policy*.

   ![Configuring a content security policy.](./configuring-content-security-policy-headers/images/01.png)

1. To enable CSP headers, check the *Enabled* checkbox. You can enter your policy in the *Content Security Policy* input field and specify a number of paths to exclude.

   * **Content Security Policy** - Specify the content security policy to enforce. The value entered here appears as the value for the `Content-Security-Policy` HTTP header. You can add a [nonce](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy#nonce-) by using the placeholder `'[$NONCE$]'` in your content security policy. The placeholder gets replaced with a generated nonce for the tags you specify.

   * **Excluded Paths** - Paths that start with the value added here are excluded from the content security policy. You can add multiple paths to exclude by clicking the ![Add Setting icon](../../../images/icon-add-setting.png) button or remove them using the ![Remove Setting icon](../../../images/icon-remove-setting.png) button.

1. Enter the following policy in the *Content Security Policy* input field.

   ```bash
   default-src 'self'; script-src 'self' https://trusted-cdn.example.com '[$NONCE$]'; style-src 'self' https://trusted-cdn.example.com '[$NONCE$]'; object-src 'none'; base-uri 'self';
   ```

1. Click *Update*.

!!! note
    This applies the configuration to all sites for all instances. If you want to configure CSP headers for all sites of a specific instance, go to *Control Panel* &rarr; *Instance Settings* &rarr; *Security* &rarr; *Content Security Policy*. If you want to configure CSP headers for a specific site, open the site menu and go to *Configuration* &rarr; *Site Settings* &rarr; *Security* &rarr; *Content Security Policy*.

This sample content security policy only allows resources to load from the same origin `self` and from the trusted content delivery network `https://trusted-cdn.example.com`. It also includes the nonce `'[$NONCE$]'` for scripts and stylesheets to secure their integrity and prevent unauthorized script execution.

![The CSP header appears in every HTTP request.](./configuring-content-security-policy-headers/images/02.png)

The `object-src 'none'` entry instructs the browser to prevent loading any HTML `<object>` elements. The `base-url 'self'` entry instructs the browser to only allow loading resources from the same origin as the document.

!!! note
    Content Security Police works best with SPA disabled. To disable it, add `javascript.single.page.application.enabled=false` to your [portal-ext.properties file](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/reference/portal-properties.html).
    Site level configuration panel and common pages (such as the 404 page) belong to the instance, so it uses the instance level CSP headers.
