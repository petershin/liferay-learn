---
taxonomy-category-names:
- Sites
- Localization
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: ce0a8b5e-a09a-49bf-98c5-47ff980b6a7c
---

# Site Localization

!!! note
    If you are setting up your Liferay installation for the first time, we recommend reviewing [Initial Instance Localization](../../installation-and-upgrades/setting-up-liferay/initial-instance-localization.md) first.

## Configuring Site Languages

You can set your Site's default language. You can also define a Site's enabled languages:

1. Go to *[Site Settings](./site-settings-ui-reference.md#language)* &rarr; *Localization*.

   ![In the site settings, click on Localization.](./site-localization/images/01.png)

1. Click *Define a custom default language and additional available languages for this site*.

   ![Click on Define a custom default language and additional available languages for this site.](./site-localization/images/02.png)

1. You can change the default language to any language in the list.

1. You can also choose which additional languages are enabled or disabled.

   ![Choose which additional languages are enabled](./site-localization/images/03.png)

1. Use the left and right arrow buttons to disable or enable additional languages respectively.

1. Click the *Save* button to save any changes.

## Modifying Localizable Site Fields

Some fields have an appended language flag button. These fields can be translated into other languages.

![Localizable fields are marked with a language flag.](./site-localization/images/04.png)

1. Click the language flag beside the field.

   ![Click the language flag next to the localizable field to enter a new value.](./site-localization/images/05.png)

1. Enter the new value in the selected language. The default value appears beneath the field for reference.

   ![Enter the new value for the selected language.](./site-localization/images/06.png)

Liferay automatically saves the translation for each language and displays the translated value when that language is selected for the instance. If a translation for the field is not provided, the default instance language's value for that field appears.

## Related Topics

- [Localization](../../system-administration/configuring-liferay/virtual-instances/localization.md)
- [Changing Translations with Language Override](../../system-administration/configuring-liferay/changing-translations-with-language-override.md)
- [Adding a Language](../../liferay-development/liferay-internals/extending-liferay/customizing-localization/adding-a-language.md)