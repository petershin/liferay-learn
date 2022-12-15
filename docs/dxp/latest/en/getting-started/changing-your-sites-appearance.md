# Changing Your Site's Appearance

Liferay has many ways to customize your site's appearance. Your site's favicon and theme are two of the first elements you may want to change. Themes set a default look and feel for your site, while the favicon is an icon that identifies your site in the user's browser tab.

## Changing Your Site's Favicon

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Open the *Site Menu* (![Site Menu](../images/icon-product-menu.png)) and go to *Site Builder* &rarr; *Pages*.

1. Click the *Actions* button (![Action Button](../images/icon-actions.png)) in the Application Bar and select *Configuration*.

   ![Open the Pages application, click the Actions button in the Application Bar, and select Configuration.](./changing-your-sites-appearance/images/01.png)

1. Under Favicon, click *Change Favicon*.

   ![Click the Change Favicon button.](./changing-your-sites-appearance/images/02.png)

1. Select or upload an image.

1. Click *Save*.

Your site uses the chosen image for its favicon.

## Changing Your Site's Theme

By default, Liferay instances use the Classic theme, but you can deploy and use custom themes.

### Deploy a New Theme

1. Download the WAR containing the [Acme Sample Blue Theme](./liferay-5b2v-theme.war):

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/getting-started/changing-your-sites-appearance/liferay-5b2v-theme.war -O
    ```

1. Deploy the WAR containing the theme:

    <!-- ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq) -->

    ```bash
    docker cp liferay-5b2v-theme.war docker-container:[path-to-deploy-folder]
    ```

This loads the sample theme into your DXP instance. You can check your console for the following message to confirm the theme successfully deployed:

```
2020-03-11 17:06:35.601 INFO  [fileinstall-/opt/liferay/osgi/war][BundleStartStopLogger:39] STARTED liferay-5b2v-theme_1.0.0 [1112]
```

### Change Your Site's Theme

1. Open your browser to `https://localhost:8080` and [log in as an administrator](./introduction-to-the-admin-account.md).

1. Open the *Site Menu* (![Site Menu](../images/icon-product-menu.png)) and go to *Site Builder* &rarr; *Pages*.

1. Click the *Actions* button (![Action Button](../images/icon-actions.png)) in the Application Bar and select *Configuration*.

   ![Open the Pages screen, click the Actions button in the Application Bar, and select Configuration.](./changing-your-sites-appearance/images/01.png)

1. Expand the *Look And Feel* section and click *Change Current Theme*:

   ![Click Change Current Theme to select a new theme.](./changing-your-sites-appearance/images/03.png)

1. Select the sample theme: *Acme Sample Blue Theme*.

1. Click *Save*.

Navigate to the Home page and confirm the background color is now blue.

![Confirm the background color is now blue.](./changing-your-sites-appearance/images/04.png)

## What's Next

Additionally, you can use [style books](../site-building/site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) to further customize design elements and [master page templates](../site-building/creating-pages/defining-headers-and-footers/master-page-templates.md) to design the header and footer for content pages. See [Site Appearance](../site-building/site-appearance/site-appearance.md) for a complete overview of customizing the look and feel of your site.

There are many themes available on the [Liferay Marketplace](../system-administration/installing-and-managing-apps/using-marketplace.md) that can be used to quickly achieve a professional look and feel.

You can also learn how to [create your own theme](../site-building/site-appearance/themes/introduction-to-themes.md).

<!-- ## Changing Your Site's Logo

Coming soon! -->
