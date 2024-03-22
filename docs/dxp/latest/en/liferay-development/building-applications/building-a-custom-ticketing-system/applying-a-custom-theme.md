---
uuid: dfb6f148-1fa1-4b7e-af5d-26570af773e3
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Applying a Custom Theme

You can use different [front-end client extensions](../../customizing-liferays-look-and-feel.md) to customize the look and feel of your site. Specifically, [theme CSS type](../../customizing-liferays-look-and-feel.md#theme-css-client-extensions) client extension can be used as an alternative to [building custom themes](../../customizing-liferays-look-and-feel/themes.md).

Deploy the `liferay-ticket-theme-css` client extension.

1. Run the following command:

   ```bash
   ./gradlew :client-extensions:liferay-ticket-theme-css:deploy
   ```

1. In Liferay, select the _Product Menu_ (![Product Menu](../../../images/icon-product-menu.png)) and navigate to _Site Builder_ &rarr; _Pages_.

1. Click _Options_ (![Options icon](../../../images/icon-options.png)) in the top right next to the global menu and click _Configuration_.

1. Scroll down to the theme CSS client extension section and click _Add_ (![Add icon](../../../images/icon-plus.png)).

1. Select the Tickets Theme CSS that was deployed. 

   ![Select the ticket theme css client extension.](./applying-a-custom-theme/images/01.png)

1. Scroll to the bottom and click _Save_. In the product menu, click _Home_. The custom theme has been applied.

## Examine the Custom Theme CSS Code

The `assemble` block section of the `client-extension.yaml` file looks like this:

```yaml
assemble:
    - from: build/buildTheme/img
      into: static/img
```

This `liferay-ticket-theme-css` is a [theme CSS](../../customizing-liferays-look-and-feel.md#theme-css-client-extensions) type client extension. It is defined as follows:

```yaml
liferay-ticket-theme-css:
    clayURL: css/clay.css
    mainURL: css/main.css
    name: Tickets Theme CSS
    type: themeCSS
```

See [Theme CSS YAML Configuration Reference](../../customizing-liferays-look-and-feel/using-a-theme-css-client-extension/theme-css-yaml-configuration-reference.md) for an explanation of each property.

The theme's customizations appear in the two files in the `/src/css` folder.

The `_clay_variables.scss` file provides any CSS clay variables to be overwritten.

The `_custom.scss` file provides any CSS customizations.

See the [Clay CSS](https://clayui.com/docs/css/index.html) documentation to learn more about the variables and customization. And see [using a theme CSS client extension](../../customizing-liferays-look-and-feel/using-a-theme-css-client-extension.md) to see another client extension example.

Next: [Deploying the Custom Ticketing Application](./deploying-a-custom-application.md).

## Relevant Concepts

* [Introduction to Themes](../../customizing-liferays-look-and-feel/themes.md)
* [Front-end Client Extensions](../../customizing-liferays-look-and-feel.md)
