---
uuid: d370ab5a-f863-4b48-b4c7-0bf953d0dd6a
---
# Upgrading Language Key Overrides

In Liferay DXP/Portal 7.4, Liferay module language keys were moved to the Liferay Portal Language module. Many keys were renamed. If you're overriding a renamed language key, you must update the key name in your module.

!!! note
    If you are upgrading a Language Key Hook Plugin, please follow [Upgrading Portlet Language Key Hooks](https://help.liferay.com/hc/en-us/articles/360029005272-Upgrading-Portlet-Language-Key-Hooks) first.

To upgrade language key overrides,

1. Check if any of the language keys have been renamed. See [Renamed Language Keys](../reference/renamed-language-keys.md).
1. For each language key that has been renamed, use the new key name in your language properties files.

## Related Topics

- [Overriding Global Language Translations with Language Properties](../../../liferay-internals/extending-liferay/customizing-localization/overriding-global-language-translations-with-language-properties.md)
- [Renamed Language Keys](../reference/renamed-language-keys.md)
- [Upgrading Custom Development](../upgrading-custom-development.md)