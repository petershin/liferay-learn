---
taxonomy-category-names:
- Sites
- Themes
- Liferay Self-Hosted
- Liferay PaaS
uuid: 6e7086c0-033f-489e-815a-471dac938005
---
# Setting Up an Environment and Creating a Theme

Creating a theme is the first step in theme development. Once you have your own theme, you can deploy it to your Liferay DXP instance, and use it for [various site customizations](../../themes.md#developing-themes).

## Using the Liferay Theme Generator

Themes are created using the Liferay Theme Generator. Liferay DXP 7.3 uses version 10.x.x of the Theme Generator.

```{note}
Older versions of the Liferay Theme Generator can be used to generate themes for older versions of Liferay DXP. To create themes for DXP 7.0 or 7.1, install version 8.x.x of the Theme Generator.
```

### Installation

```{note}
Node and NPM are both required for developing themes with the Liferay Theme Generator. Check the [Node compatibility matrix](../../../tooling/reference/node-version-information.md) to ensure you have the correct versions of these installed for your Liferay version.
```

If you have not already done so, install the Liferay Theme Generator with this command:

```bash
npm install -g generator-liferay-theme@10.x.x
```

Install the Yeoman and gulp dependencies with this command:

```bash
npm install -g yo gulp
```

### Running the Liferay Theme Generator

Run the Liferay Theme Generator with these steps:

1. Run the Liferay Theme Generator using Yeoman:

    ```bash
    yo liferay-theme
    ```

    ```{important}
    You can add the name of a base theme to this command to use it as the basis for your new theme. For example, running `yo liferay-theme:classic` bases your new theme on DXP's Classic theme.
    ```
    <!-- Add link to an explanation of choosing (and changing) the base theme when available.-->

1. Type a name for your theme at the prompt. Press Enter to use the default, "My Liferay Theme".

    ```
    ? What would you like to call your theme? (My Liferay Theme)
    ```

1. Type an ID for your theme at the prompt. When the theme is generated, the ID determines the name of the folder where your theme is built. You can also press Enter to use a default ID based on the name.

    ```
    ? What id would you like to give to your theme? (my-liferay-theme)
    ```

1. Use the arrow keys to select the version of Liferay DXP to build the theme for at the prompt. You can generate a theme for 7.2 or 7.3 with version 10.x.x of the Liferay Theme Generator.

    ```
    ? Which version of Liferay is this theme for? (Use arrow keys)
    ❯ 7.3 
      7.2
    ```

1. Answer whether you would like to add Font Awesome as an available font for your theme at the prompt.

1. After the theme is generated, complete the process by using the arrow keys to select the appropriate deployment type for your theme: deploy with a local app server, Docker container, or other URL.

    ```
    ? Select your deployment strategy (Use arrow keys)
    ❯ Local App Server 
      Docker Container 
      Other
    ```

1. Provide the location of the app server at the prompt, depending on which deployment type you are using.

    You may provide the app server directory, the Docker container name, or the host URL to locate the app server.

The theme is then generated and placed inside of a folder named after the ID you have chosen. You can now build and deploy it to your DXP instance by running `gulp deploy` from the theme's base folder.

### Disabling Dart SASS

When you run `gulp build` or `gulp deploy` on a theme created with the theme generator, you may encounter errors, including

```
Error: compound selectors may no longer be extended.
```

This error occurs because the theme generator uses [Dart SASS](https://sass-lang.com/dart-sass) as of Liferay 7.3+, but some environments still rely on features used with the deprecated [LibSass](https://sass-lang.com/blog/libsass-is-deprecated).

Disable Dart SASS in your theme to avoid this error. Add these `dartSass` and `node-sass` properties to the theme's `package.json` (without removing existing properties):

```json
"liferaytheme": {
    "sassOptions": {
        "dartSass": false
    },
    "devDependencies": {
        "node-sass": "7.0.1"
    }
}
```

Run `npm install` to install LibSass. The next time you build with gulp, the errors caused by Dart SASS disappear.

<!-- Add Using Blade to Create a Theme section, with a link to Theme Templates documentation when available-->

## Related Topics

* [Changing Your Site's Appearance](../../../../getting-started/changing-your-sites-appearance.md)
