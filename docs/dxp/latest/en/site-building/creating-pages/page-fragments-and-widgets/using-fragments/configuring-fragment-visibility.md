---
taxonomy-category-names:
- Sites
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 5d8d254a-1f19-450c-9b59-2c0b677888ae
---

# Configuring Fragment Visibility

{bdg-secondary}`Liferay DXP/Portal 7.4+`

[Fragments](../using-fragments.md) can be used to assemble [content pages](../../using-content-pages.md) with a variety of layouts and information. Starting with Liferay DXP 7.4, you can configure a fragment's visibility based on a user's screen size. For instance, a fragment can be hidden for a page rendered from a computer while visible from the same page on a smartphone.

You configure the fragment visibility for each screen size from the [content page editor](../../using-content-pages/content-page-editor-ui-reference.md), using the viewport controls on the top of the page editor.

![Configure the fragment's visibility on your content page using the viewports control.](./configuring-fragment-visibility/images/01.png)

## Understanding Fragment Visibility and Styles Inheritance

The fragment's visibility and styles you apply to a viewport on the left-hand side are applied to all the viewports on the right-hand side, unless you specify different styles for one of the right-hand side viewports. For example, if you hide a fragment on the Desktop viewport, the fragment is also hidden on all other viewports. This table summarizes this configuration:

| Viewport            | Visible? | Fragment Visibility Setting |
| :------------------ | :------- | :-------------------------- |
| Desktop (A)         | No       | Hidden                      |
| Tablet (B)          | No       | Default / Inherited         |
| Landscape Phone (C) | No       | Default / Inherited         |
| Portrait Phone (D)  | No       | Default / Inherited         |

![Viewport on the right side inherit the configuration from viewports in the left side.](./configuring-fragment-visibility/images/02.png)

From this setup, if you now make the fragment visible on the Landscape Phone (for example), the fragment stays visible on that viewport and the Portrait Phone viewport. This table summarizes the new configuration:

| Viewport            | Visible? | Fragment Visibility Setting |
| :------------------ | :------- | :-------------------------- |
| Desktop (A)         | No       | Hidden                      |
| Tablet (B)          | No       | Default / Inherited         |
| Landscape Phone (C) | Yes      | Visible                     |
| Portrait Phone (D)  | Yes      | Default / Inherited         |

In this example, the fragment is hidden on a computer, but visible when using a smartphone.

## Content Page Editor Viewports Behavior

This table summarizes each viewport's behavior:

| Viewport        | Description                                                                                                                                                                                                   |
| :-------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Desktop         | The default viewport. The fragment styles and visibility you define here apply to all other viewports, unless you specify another style or visibility in another viewport.                                    |
| Tablet          | The viewport for tablet-size screens. The fragment styles and visibility you define here apply to the phone viewports, unless you specify a style or visibility in the landscape or portrait phone viewports. |
| Landscape Phone | The fragment styles and visibility you define on this viewport apply to portrait phone viewport as well, unless you specify another style or visibility in the portrait phone viewport.                       |
| Portrait Phone  | This viewport inherits the style and visibility changes you make in any other viewports, unless you specify another style or visibility here.                                                                 |

## Changing Fragment Visibility

You can change the fragment visibility on your content pages in three ways:

1. From the content page editor sidebar, under the *Browser* (![Browser](../../../../images/icon-browser.png)) &rarr; *Page Elements* area, click *Hide* (![Hide](../../../../images/icon-hide.png)) or *Unhide* (![Unhide](../../../../images/icon-preview.png)) next to the page fragment.

   ![Change the fragment's visibility from the Page Elements area in the content page editor sidebar.](./configuring-fragment-visibility/images/03.gif)

1. From the content page editor sidebar, under the *Browser* (![Browser](../../../../images/icon-browser.png)) &rarr; *Styles* area, check or uncheck the *Hide Fragment* box:

   ![Change the fragment's visibility from the Browser/Styles area in the content page editor sidebar.](./configuring-fragment-visibility/images/04.gif)

1. From the fragment's Actions menu (![Actions](../../../../images/icon-widget-options.png)), select *Hide Fragment* (![Hide Fragment](../../../../images/icon-hide.png)).

   ![Change the fragment's visibility from the fragment's Actions menu.](./configuring-fragment-visibility/images/05.gif)

!!! tip
    To restore a hidden fragment, from the Browser Page Elements area, click the *Unhide* (![Unhide](../../../../images/icon-preview.png)) control next to the page fragment.

## Example: Using Fragment Visibility

Consider this example. Your insurance company wants to promote a new mobile app customers can use to manage their insurance policies. You want to promote this app when users access your page from a smartphone. In this case, you can create a promotional banner for your new smartphone app and make this banner visible only on the smartphone viewports:

1. From the default desktop viewport, add a new fragment with your promotional text for the smartphone app.

1. Hide the fragment with your promotional text. The fragment is now hidden in all viewports.

1. Click the *Landscape Phone* viewport. Changes on this viewport affect the portrait phone viewport as well.

1. [Change the fragment visibility](#changing-fragment-visibility) to unhide your promotional text in the Phone viewports.

1. Click on the different viewports to see the effect. The promotional text is now available in the landscape phone and portrait phone viewports only.

The following video illustrates this example:

![Changing a fragment's visibility for a specific viewport in the content page editor.](./configuring-fragment-visibility/images/06.gif)

To restore the default viewport visibility, click on the viewport and click the *Restore Default* (![Restore Default](../../../../images/icon-restore.png)) button under the fragment Styles area:

![Restore the default viewport fragment visibility using the Restore Default button.](./configuring-fragment-visibility/images/07.png)

## Related Information

- [Managing Fragments](./managing-fragments.md)
- [Saving Fragment Compositions](../using-fragments/saving-fragment-compositions.md)
- [Default Fragments Reference](../using-fragments/default-fragments-reference.md)
