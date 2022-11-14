# Setting Widget Scopes

Roles can be scoped by the instance, by site, or by an organization, and it only takes effect within its scope. For example, a Message Boards administrator role with complete access to the message boards has different permissions based on the role's scope. If it's a global role, members have permission to administer message boards across the entire installation. If it's a site role, members only have permission to administer message boards within the site where they've been assigned the role. For organizations with sites, site roles are automatically assigned to organization members based on the organization roles they have. For an organization-scoped Message Boards administrator role, members only have permission to administer message boards within the site of the organization that assigned the role to them.

First, select a scope for your widget:

**Default**: by default, when a widget is added to a page in a site, it is *scoped* to that site. This means its data belongs to that site. If the widget is added to a page in a different site, it employs a completely different data set. This enables you to place a Message Boards widget in one site with one set of categories and threads, and place another Message Boards widget in a different site with a different set of categories and threads.

**Global**: Scoping by site means that you can only have one Message Boards widget per site. If you add one Message Boards widget to a page in a site and add another Message Boards widget to a different page in the same site, the second Message Boards widget contains exactly the same data as the first. This is because, by default, the Message Boards widget is scoped by site. Most of Liferay's DXP other widgets also default to being scoped by site.

**Page**: The data sets of page-scoped widget serve a single page, not an entire site. If you set the scope of a widget to *page* instead of *site*, you can add any number of widgets to different pages, and then they have different sets of data. You can have more than one message board per site if you wish. Most widgets, however, default to the "native" configuration, and have their scopes set to the site where they are placed.

Unless otherwise noted, all widgets support scoping by instance (global), site (default), or page. This grants you some flexibility in how you want to set up your Liferay instance. You can configure the scope of an app with just a few simple steps.

1.  While editing the page, click on *Options* (![Options](../../../../images/icon-app-options.png)) in the app window &rarr; *Configuration* &rarr; *Scope* tab.

1.  Use the drop-down menu to set the scope.

    ![You can change the scope of your application by navigating to its Configuration menu.](./setting-widget-scopes/images/01.png)

1. Save the configuration and publish the change.

That's all it takes to change the scope for a particular widget. By setting the scope to the current page, you can add as many of these widgets to a site as you want, provided they are all added to separate pages.

Once you've created a new scope for widgets, a button (![Scope drop-down icon](../../../../images/icon-cog.png)) with a drop-down menu appears in the *Content & Data* menu for you to select which scope to manage content for. You can choose the default scope or any new scopes you created for your widgets. Your selection changes the content that appears when you manage each type.

![Use the drop-down menu under Content & Data to determine which scope to manage content for.](./setting-widget-scopes/images/02.png)

## Additional Information

- [Configuring Templates](./configuring-templates.md)