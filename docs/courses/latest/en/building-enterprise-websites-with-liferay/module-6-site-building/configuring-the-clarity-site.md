---
uuid: bd76284b-3b05-4f26-93ca-8ae3eac7bb97
---
# Configuring the Clarity Site

With your local copy of Clarity's website up and running, it’s time to configure it! Clarity's public enterprise website aims to be accessible by all, engaging the full spectrum of their global audiences. This lesson covers critical settings like membership types, localization, and accessibility. By configuring these elements, you'll ensure Clarity's website is inclusive and user-friendly for everyone who visits.

![Configure the public enterprise website.](./configuring-the-clarity-site/images/01.png)

## Site Membership

Liferay provides three different types of site membership: open, restricted, and private. This configuration determines how freely users can join your site.

* Open: Users can join and leave the site whenever they want.

* Restricted: Users must request membership to join the site.

* Private: Site administrators must explicitly invite and add users for them to join the site.

<!--TASK: ![Determine the site’s membership type.]()-->

Should site membership be completely open, require review, or only allow users to join by the invitation of site administrators? Membership type provides the first level of security. With it, you can set a baseline for user access to site content, since you can restrict data access to only site members.

Since Clarity's website is a public enterprise website, it should be open and accessible to a wide audience. This way guests can become members to remain updated on Clarity’s products, sign up for events, submit distributor applications, and more. Hence Clarity should select the Open membership type, allowing users to join and leave freely.

## Localization

In addition to site membership, Clarity wants to explore how to reach their global audience. Liferay provides robust localization features for creating websites that speak the language of your users. From configuring available site languages to localizing site URLs, you can help ensure Clarity's messages resonate with their international visitors. By default, every site uses the languages enabled at the instance level, but Clarity wants to limit the languages available in their site.

<!--TASK: ![Manage available site languages.]()-->

## Virtual Host

Setting the virtual host connects a domain name (e.g., `www.helloworld.com`) to a site. This can be a full domain or a subdomain (e.g., `partners.helloworld.com`), so you can differentiate between multiple sites on the same Liferay DXP server. Before setting the virtual host in Liferay, you must contact your provider and set the DNS name to point to the IP address for your Liferay DXP instance.

<!--TASK: ![Set the site’s virtual hosts.]()-->

Clarity wants to set their site’s virtual host to `www.clarityvisionsolutions.com`. They also want to set a virtual host for Spanish (`www.solucionesdeclaridad.com`) to better engage their international audience.

## Accessibility

Site accessibility is essential for ensuring everyone can access and interact with your website. Liferay provides the accessibility menu to make it easier for users to enable some accessibility properties. Once enabled, users can access the menu by pressing Tab twice and then pressing Enter.

![Press Tab twice and hit Enter to access the accessibility menu.](./configuring-the-clarity-site/images/02.png)

Enabling the accessibility menu provides users access to these configurations,

* Underlined Links: Force underline effect for all links.

* Increased Text Spacing: Increase horizontal spacing between text characters.

* Expanded Text: Expand all truncated text.

* Reduced Motion: Stop all motion and animations.

Accessibility is a core principle that should be woven into the design and development of any public site. And just like Clarity offers premium eyewear for all, their website should be equally inclusive. Enabling the accessibility menu is a good start, but we'll revisit this topic throughout the course.

## Exercise: Configuring the Site

Now, let’s configure these site settings. While logged in as Walter Douglas,

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Configuration*, and select *Site Settings*.

1. Go to *Site Configuration* &rarr; *Details*.

1. Add this description:

   > Distribute Clarity, See Success: Join our network and offer your customers premium eyewear solutions backed by sustainable innovation and market expertise.

1. Set membership type to *Open*. This allows guests to freely become site members.

   ![Set the site’s membership type to Open.](./configuring-the-clarity-site/images/03.png)

1. Click *Save*.

1. Go to the *Site URL* tab.

1. Set the site’s virtual host for the default language to `www.clarityvisionsolutions.com`.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)) to add an extra virtual host for Spanish with the URL `www.solucionesdeclaridad.com`.

   ![Add a virtual host for Spanish.](./configuring-the-clarity-site/images/04.png)

1. Click *Save*.

1. Go to the *Site URL* tab.

1. Return to the *Site Settings* page and go to *Localization*.

1. Define custom languages for your site. For now, Clarity only wants to support English (United States), and Spanish (Spain) on their site. Use the left arrow button (![Left Arrow Button](../../images/icon-angle-left.png)) to move all other languages from the Current Column to the Available column.

   ![Define a custom language configuration.](./configuring-the-clarity-site/images/05.png)

1. Click *Save*.

1. Return to the *Site Settings* page and go to *Accessibility*.

1. Check the box to enable the accessibility menu.

   ![Enable the accessibility menu.](./configuring-the-clarity-site/images/06.png)

1. Click *Save*. Now users can press Tab twice and hit Enter to access the menu and configure their accessibility settings.

Together, these configurations help Clarity’s enterprise website fulfill its intended purpose: promoting their products to their international audience. Liferay provides many other site configurations, including cookie handling, session timeouts, and SEO. We’ll revisit these settings in this module, but for now, let’s move on to implementing Clarity’s site hierarchy.

## Conclusion

Congratulations! You’ve created and configured the Clarity site to ensure it is public and accessible to Clarity’s global audience. Next you’ll add pages to Clarity’s site.

Next Up: [Adding Pages to Clarity's Site](./adding-pages-to-claritys-site.md)
