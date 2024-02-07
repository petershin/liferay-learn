# Enabling GDPR Compliance for Cookies

You can ensure GDPR compliance for you cookies using Liferay's configuration interface. To do this,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), and navigate to *Control Panel* &rarr; *System Settings* &rarr; *Plataform* &rarr; *Cookies*.

   ![Ensure GDPR compliance for your cookies through the configuration interface.](./enabling-gdpr-compliance-for-cookies/images/01.png)

   There are two checkboxes here: *Enabled* and *Explicit Cookie Consent Mode*. The explicit cookie consent mode, though enabled by default, doesn't work if the enabled checkbox is unchecked.

1. To set your handling preference, check the *Enabled* checkbox. With the *Explicit Cookie Consent Mode* checked, no cookies are set until the user explicitly agrees to cookie usages. If unchecked, all cookies are set until the user opts out of them.

1. Click *Update*.

   ![The default cookie banner appears at the bottom of the page.](./enabling-gdpr-compliance-for-cookies/images/02.png)

1. Two new options appear in the left menu: *Banner* and *Consent Panel*.

   ![Two new options appear in the left menu.](./enabling-gdpr-compliance-for-cookies/images/03.png)

   !!! note

       This applies the configuration to all sites. If you want to configure cookie settings for a specific site, go to *Control Panel* &rarr; *Instance Settings* &rarr; *Plataform* &rarr; *Cookies*.

1. Go to the *Banner* tab to find customizable options for the cookie banner.

   ![Find customizable options for your cookie banner under the Banner tab.](./enabling-gdpr-compliance-for-cookies/images/04.png)

   - **Content**: Add the information included in your cookie policy, like the types of cookies used, their purposes, how users can manage or disable cookies, and any other relevant information regarding data collection, tracking, and user privacy.

   - **Privacy Policy Link**: Add a link to your site's privacy policy page.

   - **Link Display Text**: Specify the text that appears as the link to the privacy policy page.

   - **Include "Decline All" Button**: Check this option to add a *Decline All* button on the cookie banner.

1. Click *Save*.

1. Go to the *Consent Panel* tab to find customizable options for the consent panel.

   ![Find customizable options for the consent panel under the Consent Panel tab.](./enabling-gdpr-compliance-for-cookies/images/05.png)

   - **Title**: Add your a title to your consent panel.

   - **Description**: Add a general overview about the usage of cookies on your site.

   - **Cookie Policy Link**: Add a link to your site's cookie policy page.

   - **Link Display Text**: Specify the text that appears as the link to the cookie policy page.

   - **Strictly Necessary Cookies Description**: Add details about the cookies that are necessary for the proper functioning of your site.

   - **Functional Cookies Description**: Add details about cookies that provide enhanced functionality and personalization. You can check the *Prechecked* checkbox to enable this when the user opens the consent panel.

   - **Performance Cookies Description**: Add details about performance cookies and how they measure and improve the overall performance of the website by counting visits, traffic sources, and page popularity while maintaining full data privacy. You can check the *Prechecked* checkbox to enable this when the user opens the consent panel.

   - **Personalization Cookies Description**: Add details about how cookies personalize the user experience by building a profile of the users and showing relevant ads. By not allowing personalization cookies, users may receive less targeted advertising. You can check the *Prechecked* checkbox to enable this when the user opens the consent panel.

1. Click *Save*.