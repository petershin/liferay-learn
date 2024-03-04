---
uuid: 54d8d407-1f2d-4f9c-bae5-3329cdeda0a0
taxonomy-category-names:
- Security
- Service Access Policies
- Liferay Self-Hosted
- Liferay PaaS
---
# Configuring Content Security Policy Headers

Modern browsers use [Content Security Policy](https://content-security-policy.com) HTTP response headers to enhance web pages' security to mitigate certain types of attacks (like Cross-Site Scripting or data injection). You can enable CSP on Liferay to send the configured headers on each HTTP request. 

CSP policies have many options. It is best to understand your users' needs and come up with a policy to suit their requirements. For an example of a browser implementation of Content Security Policies, read [Mozilla's implementation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy) for more information.

## Content Security Policy Directives and Values

Content Security Policy can be separated in 2 distinct kinds: *Directives CSP* and *Values CSP*. They both can be used to form a robust security frameworks that helps protect web applications against a variety of threats, however, they operate differently from each other:

* Directives in CSP -  It acts as commands that specify the types of content allowed to be loaded on a web page and from where it can be sourced. These directives serve as the blueprint for the security policy and include instructions for resources like scripts, stylesheets, images, fonts, and so on. Directives establish the boundaries and restrictions that dictates the behavior of web content.

Imagine one of your company servers responsible for serving all the scripts to your website is compromised. This can lead to possible attacks like injection of malicious scripts to different web pages within your site. Using CSP directives, you can disable loading scripts if it originates from the compromised server.

* Values in CSP - Values complement directives by defining the specific origins or sources from which the permitted content can be loaded. They provide granular control over the origins allowed for each type of resource specified by the directives. Specifying values restricts the loading of resources to only those from approved origins, increasing the security of the web application.

Let's say your website allows users to upload images to their profiles. However, you want to make sure that these images are served only from a specific, trusted domain to avoid the risk of malicious content being served. With Value CSP, you can restrict image sources to only those originating from your trusted image server by implementing them to your directives.

## Configuration Reference for Content Security Policy

While working with CSP, you have access to different directives and values. They are commands that specify the rules and restrictions for loading different types of resources on a web page, allowing you to define security guidelines that browsers should apply while rendering the page.

| Directive         | Description                                                                                                             | Example                                                                     |
| :---------------- | :---------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------- |
| `connect-src`     | Defines valid sources for network connections like XMLHttpRequest and EventSource.                                      | self' https://api.example.com                                               |
| `base-uri`        | Specifies the base URL for relative URLs in the document. It restricts the URLs that can be used in a <base> element.   | self' https://example.com                                                   |
| `img-src`         | Specifies valid sources for images.                                                                                     | self' data: https://www.example.                                            |
| `connect-src`     | Defines valid sources for network connections like XMLHttpRequest and EventSource.                                      | self' https://api.example.com                                               |
| `script-src`      | Defines valid sources for JavaScript.                                                                                   | self' https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js     |
| `strict-dynamic`  | Allows a script to execute if it is loaded using a trusted script-src, even if inline scripts are disallowed by policy. | strict-dynamic'                                                             |
| `script-src-attr` | Allows inline event handlers and javascript: URLs in HTML event attributes.                                             | Allows inline event handlers and javascript: URLs in HTML event attributes. |
| `style-src`       | Specifies valid sources for CSS                                                                                         | self' https://fonts.googleapis.com/css2?family=Roboto                       |
|                   |                                                                                                                         |                                                                             |

In Content Security Policy, `'self'` is a value example that refers to the origin from which the protected document is being served. The origin consists of the combination of the protocol (such as HTTP or HTTPS), the domain, and the port number.
Another useful example of an value is `'none'`, that has the function of blocking all content from being loaded for the specified directive. Returning to the example above, let's imagine that you now do not any image to be uploaded. You could use the value `'none'` to restrict any images from being loaded from any source by adding it to your directive:

 ```bash
   img-src 'none';
   ```

## Configuring a Sample Content Security Policy

Let's get back to the examples above and see them working in practice.

### Configuring CSP Directives

You have a problem with the security of your company servers.  To avoid any kind of attacks, you can do the following:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *System Settings* &rarr; *Security* &rarr; *Content Security Policy*.

   ![Configuring a content security policy.](./configuring-content-security-policy-headers/images/01.png)

1. To enable CSP headers, check the *Enabled* checkbox. You can enter your policy in the *Content Security Policy* input field and specify a number of paths to exclude.

   * **Content Security Policy** - Specify the content security policy to enforce. The value entered here appears as the value for the `Content-Security-Policy` HTTP header. You can add a [nonce](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy#nonce-) by using the placeholder `'[$NONCE$]'` in your content security policy. The placeholder gets replaced with a generated nonce for the tags you specify.

   * **Excluded Paths** - Paths that start with the value added here are excluded from the content security policy. You can add multiple paths to exclude by clicking the ![Add Setting icon](../../../images/icon-add-setting.png) button or remove them using the ![Remove Setting icon](../../../images/icon-remove-setting.png) button.

1. Enter the following policy in the *Content Security Policy* input field.

   ```bash
   default-src 'self'; script-src 'self' https://trusted-cdn.example.com '[$NONCE$]'; style-src 'self' https://trusted-cdn.example.com '[$NONCE$]'; object-src 'none'; base-uri 'self';
   ```

  This sample content security policy only allows resources to load from the same origin `self` and from the trusted content delivery network `https://trusted-cdn.example.com`. It also includes the nonce `'[$NONCE$]'` for scripts and stylesheets to secure their integrity and prevent unauthorized script execution.

  ![The CSP header appears in every HTTP request.](./configuring-content-security-policy-headers/images/02.png)

  The `object-src 'none'` value instructs the browser to prevent loading any HTML `<object>` elements. The `base-url 'self'` value instructs the browser to only allow loading resources from the same origin as the document.

1. Click *Update*.
   
!!! note
    This applies the configuration to all sites for all instances. If you want to configure CSP headers for all sites of a specific instance, go to *Control Panel* &rarr; *Instance Settings* &rarr; *Security* &rarr; *Content Security Policy*. If you want to configure CSP headers for a specific site, open the site menu and go to *Configuration* &rarr; *Site Settings* &rarr; *Security* &rarr; *Content Security Policy*.

## Current Limitations of CSP

### Content Security Policy Constraints in Webpack Bundling
<!-- The explanation itself from the draft is very confusing to me, and I do not master the subject fully, so this is the best I can do. Please, elaborate as you please. 
--Gabriel. -->
It is required to add `unsafe-eval` to Liferay's policy due to the webpack bundling settings `liferay.js`. The browser does not allow the evaluation of strings as *JavaScript* by default, so the code is being refused execution. By using `unsafe-eval`, it will be possible the use of dynamic code evaluation mechanisms like the `Function(\"return this\")()` constructor.

### Styles for HTML and Script Styling 
<!--Same goes to the comment above.
--Gabriel. -->
It is required to enable `unsafe-inline` for styles, since Liferay works with several `style` attributes inside HTML elements, and also as some style additions to head part by scripts.

### Inline Event Listeners

It is required to add `script-src-attr 'self' 'unsafe-inline';` since Content Security Policy treats *Event Listeners* as scripts.

### CSP Rules for CKEditor Integration

*CKEditor 4* functionalities may enter in conflict with CSP restrictions, so it is required to change the rule to `script-src ‘self' 'unsafe-inline' 'unsafe-eval';` or add `/group/guest/~/control_panel/manage` as excluded paths. Be aware that *7.3 CKEditor* is the only supported  *WYSIWYG* (What You See Is What You Get) editor, but Liferay uses *CKEditor 4* which cannot be used without unsafe-inline ‘https://csplite.com/csp/test347/#nonce_dynamic‘.

!!! note
    Content Security Police works best with SPA disabled. To disable it, add `javascript.single.page.application.enabled=false` to your [portal-ext.properties file](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/reference/portal-properties.html).
    Site level configuration panel and common pages (such as the 404 page) belong to the instance, so it uses the instance level CSP headers.

## Related Topics

- [Securing Web Services](../securing-web-services/setting-service-access-policies.md)\
- [Setting Up CORS](../securing-web-services/setting-up-cors.md)
- [Using Authentication Verifiers](../securing-web-services/using-authentication-verifiers.md)

