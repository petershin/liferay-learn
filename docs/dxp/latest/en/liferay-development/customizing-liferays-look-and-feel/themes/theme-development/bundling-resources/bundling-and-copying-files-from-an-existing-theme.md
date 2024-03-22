---
uuid: 98265510-3c61-456b-8ce5-7e61b18b1e82
---

# Bundling and Copying Files from an Existing Theme

By using gulp's `kickstart` task, you can copy the files from a previously created theme into any theme you choose. This functionality is useful in case you want to develop a theme based on an existing one.

The process is different from extending a theme. While the `kickstart` task serves as a single inheritance method, theme extending applies the extended theme's `src` files dynamically on top of the base theme on every build.

!!! warning
    Using gulp's `kickstart` task can overwrite files with the same name. Backup your files as necessary.

## Creating and Copying Themes

!!! note
    In case you did not set up your environment to create a theme, see [Setting Up an Environment and Creating a Theme](../setting-up-an-environment-and-creating-a-theme.md).

Follow these steps to create multiple themes and copy the files from one into the other:

1. Create two themes by [Running the Liferay Theme Generator](../setting-up-an-environment-and-creating-a-theme.md#running-the-liferay-theme-generator). Label them as `Liferay Theme 1` and `Liferay Theme 2`.

1. Navigate to Liferay Theme 1's root folder.

   ```bash
   cd liferay-theme1-theme/
   ```

1. Open `src/css/_custom.scss` and add the code snippet:

   ```css
   body, #wrapper {
      background: orange;
   }

   a {
      transition: color 2s ease-in-out, font-size 2s ease-in-out;
   }

   a:hover {
      color: yellow;
      font-size: 1.2rem;
   }
   ```

1. Run `npm link` to install Liferay Theme 1 globally, making it usable within other themes.

1. Go to Liferay Theme 2's folder and run gulp's `kickstart` task.

   ```bash
   cd liferay-theme2-theme/
   ```

   ```bash
   gulp kickstart
   ```

1. You can choose to copy from globally installed themes or themes published on the npm registry. For this example, choose the first option.

   ```
   ? Where would you like to search? (Use arrow keys)
   ❯ Search globally installed npm modules
   Search npm registry (published modules)
   ```

1. Select Liferay Theme 1 in the npm modules list.

   ```
   ? Select a theme (Use arrow keys)
   ❯ liferay-theme1-theme
   ```

   A confirmation message appears when gulp has finished copying the theme's files.

   ```
   [10:49:43] Finished 'kickstart' after 4.29 s
   ```

1. Open `src/css/_custom.scss` and check if it's similar to Liferay Theme 1's file.

1. Run `gulp deploy` to build and deploy Liferay Theme 2. That way, you can use your newly configured theme in your running Liferay Portal instance.

Now you know how to develop a theme based on an existing one by configuring and copying its files.

## Related Topics

* [Bundling and Installing Resources into Your Theme via Themelets](./bundling-and-installing-resources-into-your-theme-via-themelets.md)
* [Bundling Independent UI Resources via Theme Contributors](./bundling-independent-ui-resources-via-theme-contributors.md)
* [Setting Up an Environment and Creating a Theme](../setting-up-an-environment-and-creating-a-theme.md)
