---
uuid: efb7e684-d539-4e93-b6c8-6d64b4f53fd7
taxonomy-category-names:
- Platform
- DXP Configuration
- Liferay Self-Hosted
- Liferay PaaS
---
# Localization

To access the Localization settings, Open the Control Panel and navigate to *Configuration* &rarr; *Instance Settings*, and select the *Localization* category under the *PLATFORM* section. Here, you can choose the default language for your sites.

![Configure the default language and the time zone for the instance scope.](./localization/images/01.png)

Use the left and right arrow buttons to move a language from Current (configured and active) to Available (not active, but can be configured) and back, depending on your needs. Use the up and down arrow buttons to sort the Current languages in the order you want them.

## Locale Prepend Friendly URL Style

Here, you can choose if and how locale acronyms should be pre-pended to the URLs in your site.

**Locale is not automatically prepended to a URL.**: Each URL could potentially point to many different languages. For example, the URL `http://localhost:8080/web/guest/home` could be viewed by users in English and Japanese.

**Locale is automatically prepended to a URL when the requested locale is not the default locale.**: Each URL points to one language, and the locale acronym is omitted for the default instance language. For example, the URL `http://localhost:8080/web/guest/home` points to the default language. The URL `http://localhost:8080/zh/web/guest/home` and `http://localhost:8080/zh_CN/web/guest/home` both point to the Chinese language.

**Locale is automatically prepended to every URL.**: Each URL points to one language, and the locale acronym is present for all languages including the default language. For example, if the default language is English, the URL `http://localhost:8080/web/guest/home` redirects to `http://localhost:8080/en/web/guest/home`.

**Locale is automatically prepended to a URL when the requested locale is not the default user locale.**: Each URL points to one language, and the locale acronym is omitted for the default user language. In the case of guest users, the behavior is the same as *Locale is automatically prepended to a URL when the requested locale is not the default locale*.

## Time Zone

Use the selector to choose the time zone for the instance.

## Language Selector

In the Language Selector tab, you can:

- Configure the Language Selector widget's [default display](../../../site-building/creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/setting-a-default-widget-template.md)

- Enable or disable the current locale from the list of available languages to choose from.

- Choose the default list of available languages. Write the language codes in a comma-separated list.

## Related Topics

- [Initial Instance Localization](../../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md)
- [Site Localization](../../../site-building/site-settings/site-localization.md)
- [Changing Translations with Language Override](../changing-translations-with-language-override.md)