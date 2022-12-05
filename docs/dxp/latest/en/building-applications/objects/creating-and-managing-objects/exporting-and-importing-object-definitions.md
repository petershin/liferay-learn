# Exporting and Importing Object Definitions

{bdg-secondary}`Available Liferay 7.4 U5+/GA9+`

With Liferay Objects, you can import and export object definitions as `.json` files. This provides flexibility during application development, enabling users to easily migrate objects between Liferay environments.

```{important}
Objects does not support exporting and importing relationships. All other object elements and configurations are supported (e.g., scope, fields, layouts, actions).
```

## Exporting Definitions

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the *Actions* button (![Action Button](../../../images/icon-actions.png)) for the desired object and select *Export as JSON*.

   ![Click the Actions button for the desired object and select Export as JSON.](./exporting-and-importing-object-definitions/images/01.png)

1. Click *Save* in the dialog window to begin downloading the object definition as a JSON file.

Once exported, you can import the object definition into compatible Liferay environments.

## Importing Definitions

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Click the *Actions* button (![Actions Button](../../../images/icon-actions.png)) in the Application Bar and select *Import Object*.

   ![Click the Actions button in the Application Bar and select Import Object.](./exporting-and-importing-object-definitions/images/02.png)

1. Enter a *name* for the new object and select the *JSON file* you want to import.

   ```{important}
   Object names must be unique and use PascalCase.
   ```

   ![Enter a name and select the desired JSON file.](./exporting-and-importing-object-definitions/images/03.png)

1. Click *Import*.

The object definition imports in the background and can take a few minutes.

## Additional Information

* [Creating Objects](./creating-objects.md)
* [Activating and Deactivating Objects](./activating-and-deactivating-objects.md)
* [Exporting and Importing Object Definitions](./exporting-and-importing-object-definitions.md)
