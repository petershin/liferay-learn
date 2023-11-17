---
uuid: 3f541371-f8ed-4848-8906-58a82baaf5ec
---
# Adding the Intranet Site

Create the site for Delectable Bonsai's intranet, Grow. With the Delectable Bonsai instance running,

1. Log in with the instance administrator user, Kyle Klein: 

   * **Email Address:** kyle@delectablebonsai.com

   * **Password:** test

1. Go to the Global Menu (![Global Menu](../../images/icon-applications-menu.png)) &rarr; Control Panel &rarr; Sites.

1. Click the Add button (![Add](../../images/icon-add.png)) and select _Blank Site_.

1. Enter the name _Grow Delectable Bonsai_.

1. Click _Add_.

   You're brought to the Site Settings for the new site. 

   ![Site settings offers a multitude of configurations for your new site.](./adding-the-intranet-site/images/02.png)

1. Open the Site Configuration settings entry in the Platform category.

   This is where you configure basic details about your site. The Site ID displayed but not editable, as it is used for operations that require a permanent site identifier (e.g., [defining Terms of Use](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/instance-configuration#terms-of-use). The other fields are configurable. 

1. Set the site's description, since this instance will contain multiple sites:

   ```
   The internal site for securing and centralizing employee information and resources, and for promoting communication.
   ```

1. Now set the virtual host for the Grow site. Go to the _Site URL_ section, and enter this in the Virtual Host field:

   ```
   grow.delectablebonsai.com
   ```

   Since you're working locally and not registering/hosting a domain for the site, add this to your local `/etc/hosts` file:

   ```
   127.0.0.1 grow.delectablebonsai.com
   ```

1. Click _Save_ in Site Configuration.

1. In a new browser window or tab, go to <http://grow.delectablebonsai.com:8080>.

NOTE: This screenshot is no good, there may be a bug in Liferay--this actually redirects tot he users profile (a totally different site) since there's no page. Change of approach needed

![There's currently no home page for the Grow site.](./adding-the-intranet-site/images/01.png)

The Grow site needs pages so employees can view content and access the site's applications. Pages for training resources, blog posts, and more are required. To begin, add a home page.

Next: [Adding the Home Page](./adding-the-home-page.md)

## Relevant Concepts

* [Adding a Site](https://learn.liferay.com/web/guest/w/dxp/site-building/sites/adding-a-site)
* [Default Site Applications](https://learn.liferay.com/web/guest/w/dxp/site-building/sites/default-site-applications)
