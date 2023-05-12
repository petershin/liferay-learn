---
uuid: b9f37076-eb4e-4bb1-9a5c-5d3f0ddd8365
---
# Styling Widgets with Widget Templates

You can use widget templates to customize the appearance and functionality of out-of-the-box widgets, such as the *Asset Publisher* and *Media Gallery* widgets.

## Creating a Widget Template

1. From the *Site Menu* ![Site Menu](../../../images/icon-product-menu.png), click *Design* &rarr; *Templates*.

1. Go to the *Widget Templates* tab.

   ![Access the Widget Templates page from the Templates application.](./styling-widgets-with-widget-templates/images/01.png)

1. Click *Add* (![Add Button](../../../images/icon-add.png)) and select a widget for the template (e.g., Asset Publisher).

   ![The Widget Template creation page provides controls to easily add fields or variables to use.](./styling-widgets-with-widget-templates/images/02.png)

1. Add a name for your widget template.

1. Enter your FreeMarker script into the template editor. You can use the Elements side panel ( ![Elements](../../../images/icon-list-ul.png) ) to add fields, variables, and utilities to your template. Alternatively, you can type `${` to see field suggestions.

   ```{note}
   For Liferay DXP/Portal 7.4+, widget templates only support FreeMarker. Velocity is no longer supported.
   ```

1. Click *Save*.

This creates a new widget template, which you can apply to the corresponding type of widget on a page.

## Applying a Widget Template

1. Click the *Actions* button (![Actions Button](../../../images/icon-actions.png)) for the appropriate widget, then click *Configuration.*

1. Find the Display Template drop-down menu and select the desired template.

   ![Select your widget template from the Display Template drop-down menu in the corresponding widget's configuration.](./styling-widgets-with-widget-templates/images/03.png)

   ```{note}
   This drop-down menu is on the default tab, Setup, for most widgets. For the Asset Publisher widget, this setting is under the Display Settings tab.
   ```

1. Click *Save*.

   ![After you save your widget's configuration to use your widget template, it uses your template for its display.](./styling-widgets-with-widget-templates/images/04.png)

The widget now uses the custom template. By using more advanced widget template scripts, you can further enhance the capabilities of your widgets.

## Related Topics

* [Creating a Widget Template](../../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/creating-a-widget-template.md)
* [Configuring Widget Look and Feel](../../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/configuring-widget-look-and-feel.md)
