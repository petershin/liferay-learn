---
uuid: 18e152d9-6956-4ca1-a343-f0b541947eb0
taxonomy-category-names:
- Development and Tooling
- Core Frameworks
- Liferay Self-Hosted
- Liferay PaaS
---
# Adding A Language

Liferay currently supports about 50 languages out-of-the-box. [Translation](https://translate.liferay.com/) is complete for many of these languages and some are still in the translation process. Each language has its own [language properties file](https://github.com/liferay/liferay-portal/tree/master/modules/apps/portal-language/portal-language-lang/src/main/resources/content) containing keys for its language. But there are more than [6000](https://www.linguisticsociety.org/content/how-many-languages-are-there-world) languages in the world. If you must add an additional language, here's how.

## Adding A New Language

By default, the [`portal.properties`](https://github.com/liferay/liferay-portal/blob/41ac354cd0aa3f9d851a37a6a62d8167f81a2bce/portal-impl/src/portal.properties#L2930) file specifies all languages available in Liferay. To add a new language that is not specified,

1. Take note of the [ISO 639-1 standard code](http://www.loc.gov/standards/iso639-2/php/code_list.php) for your language (e.g. the ISO code for Amharic would be `am`).

1. Take note of the [ISO 3166-1 alpha-2 two-letter country code](https://www.iso.org/iso-3166-country-codes.html) for your language. (e.g. the ISO code for Ethiopia would be `ET`).

1. Modify and replace the `web.xml` file found in your Liferay installation: `[LIFERAY_HOME]/tomcat<version>/webapps/ROOT/WEB-INF/`. Add your new language under the `<web-resource-name`> section. For example,

    ```xml
    <url-pattern>/am/c/portal/protected</url-pattern>
    <url-pattern>/am-ET/c/portal/protected</url-pattern>
    <url-pattern>/am_ET/c/portal/protected</url-pattern>
    ```

1. Modify and replace the `shielded-container-web.xml` file found in your Liferay installation: `[LIFERAY_HOME]/tomcat<version>/webapps/ROOT/WEB-INF/`. Add your new language under the `<servlet-mapping`> section. For example,

    ```xml
    <servlet-mapping>
      <servlet-name>I18n Servlet</servlet-name>
      <url-pattern>/am/*</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
      <servlet-name>I18n Servlet</servlet-name>
      <url-pattern>/am-ET/*</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
      <servlet-name>I18n Servlet</servlet-name>
      <url-pattern>/am_ET/*</url-pattern>
    </servlet-mapping>
    ```

1. Create your `language.properties` file for your language and use the ISO code in your file name. For example `Language_am.properties` for Amharic:

    ```properties
    create-account=መለያ መፍጠር
    email-address=የ ኢሜል አድራሻ
    forgot-password=መክፈቻ ቁልፉን ረሳኽው
    home=መነሻ ገጽ
    password=ፕስወርድ
    powered-by-x=በ {0} የተጎላበተ
    remember-me=አስታወስከኝ
    search=የፍለጋ አሞሌ
    sign-in=ስግን እን
    ```

1. Create a language module with the `language.properties` file you created and deploy the module to your Liferay installation. See [Overriding Global Language Translations](../../../liferay-internals/extending-liferay/overriding-global-language-translations.md) to see a sample project and specific instructions on creating this module.

1. Create or modify your `portal-ext.properties` file in your installation's [Liferay Home](../../../installation-and-upgrades/reference/liferay-home.md) folder. Note, this file overrides the enabled default locales defined in the `portal.properties` file. Therefore list all the languages you plan to use in the `portal-ext.properties` file. Define both `locales` and `locales.enabled`. For example:

    ```properties
    locales=am_ET,ar_SA,fa_IR,en_US,zh_CN,ja_JP
    locales.enabled=am_ET,ar_SA,fa_IR,en_US,zh_CN,ja_JP
    ```

1. Once the module is deployed, navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Localization*. Verify and move the new language to the current languages. Click *Save*.

    ![Save your new language to the list of current languages.](./adding-a-language/images/01.png)

1. Change your default language to the new language and click *Save*. The new language is now used by the Liferay instance.

    ![Select and use the new language for your Liferay instance.](./adding-a-language/images/02.png)

## Adding a Flag Icon

Liferay's out-of-the-box languages come with flag icons that show up on the language selector. To add a flag icon for your new language, use a [theme sprite map client extension](#adding-a-flag-icon-to-user-pages-using-a-theme-sprite-map-client-extension) or a [classic theme](#adding-a-flag-icon-to-user-pages-using-a-classic-theme) for user pages and an [admin theme](#adding-a-flag-icon-to-admin-pages-using-an-admin-theme) for admin pages. For this example, use the Ethiopian flag:

```html
<symbol id="am-et" viewBox="0 0 1200 600">
    <path fill="#da121a" d="M0 0H1200V600H0z"/>
    <path fill="#fcdd09" d="M0 0H1200V400H0z"/>
    <path fill="#078930" d="M0 0H1200V200H0z"/>
    <g transform="matrix(1.6666667,0,0,1.6666667,600,300)">
        <circle r="120" fill="#0f47af"/>
        <g id="a">
            <path d="m 0,-96 -4.205849,12.944272 17.347494,53.390097 H -9.987258 l -2.599358,8 h 74.162668 l 11.011056,-8 H 21.553343 Z" fill="#fcdd09"/>
            <path d="M 0,44 V 96" transform="rotate(-144)" stroke="#fcdd09" stroke-width="4"/>
        </g>
        <use xlink:href="#a" transform="rotate(72)" width="100%" height="100%"/>
        <use xlink:href="#a" transform="rotate(144)" width="100%" height="100%"/>
        <use xlink:href="#a" transform="rotate(-144)" width="100%" height="100%"/>
        <use xlink:href="#a" transform="rotate(-72)" width="100%" height="100%"/>
    </g>
</symbol>
```

### Adding a Flag Icon to Admin Pages Using an Admin Theme

1. Create a theme using Liferay's [theme generator](https://github.com/liferay/liferay-frontend-projects/tree/master/projects/js-themes-toolkit/packages/generator-liferay-theme).

1. Modify `src/images/clay/icons.svg` and add your flag's svg inside a `<symbol>`. The id should be your language code.

1. Update `package.json` to use the appropriate version of each dependency.

1. Modify `src/WEB-INF/liferay-look-and-feel.xml` to make this an admin theme. Follow the example in the [liferay-portal repository](https://github.com/liferay/liferay-portal/blob/master/modules/apps/frontend-theme/frontend-theme-admin/src/WEB-INF/liferay-look-and-feel.xml).

1. Run `gulp deploy` on your root module directory. Admin themes are applied automatically.

1. Refresh your page to apply the new changes.

### Adding a Flag Icon to User Pages Using a Theme Sprite Map Client Extension

1. Create a theme sprite map client extension like the one in [Using a Theme Sprite Map Client Extension](../../customizing-liferays-look-and-feel/using-a-theme-spritemap-client-extension.md).

1. In your `spritemap.svg`, add your flag's svg inside a `<symbol>`. The id should be your language code.

1. Deploy your client extension to Liferay.

1. Create a new Blank Page and add a Language Selector fragment. Your language has no flag icon.

    ![The created language has no flag](./adding-a-language/images/03.png)

1. Add your client extension and publish the page. Your flag should now be visible on the Language Selector.

    ![The Language Selector show the icon from your client extension](./adding-a-language/images/03.png)

You must use this client extension on every page you want your flag to be visible or you could use it in a Page Template. For more information on Theme Sprite Map Client Extensions, see [Using a Theme Sprite Map Client Extension](../../customizing-liferays-look-and-feel/using-a-theme-spritemap-client-extension.md)

### Adding a Flag Icon to User Pages Using a Classic Theme

1. Create a theme using Liferay's [theme generator](https://github.com/liferay/liferay-frontend-projects/tree/master/projects/js-themes-toolkit/packages/generator-liferay-theme).

1. Modify `src/images/clay/icons.svg` and add your flag's svg inside a `<symbol>`. The id should be your language code.

1. Update `package.json` to use the appropriate version of each dependency.

1. Modify `src/WEB-INF/liferay-look-and-feel.xml` to make this an admin theme. Follow the example in the [liferay-portal repository](https://github.com/liferay/liferay-portal/blob/master/modules/apps/frontend-theme/frontend-theme-classic/src/WEB-INF/liferay-look-and-feel.xml).

1. Run `gulp deploy` on your root module directory. Admin themes are applied automatically.

1. Refresh your page to apply the new changes.

## Related Topics
- [Site Localization](../../../site-building/site-settings/site-localization.md)
- [Using a Theme Sprite Map Client Extension](../../customizing-liferays-look-and-feel/using-a-theme-spritemap-client-extension.md)
- [Setting Up an Environment and Creating a Theme](../../customizing-liferays-look-and-feel/themes/theme-development/setting-up-an-environment-and-creating-a-theme.md)