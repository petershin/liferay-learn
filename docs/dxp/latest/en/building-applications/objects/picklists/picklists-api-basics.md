# Picklists API Basics

You can [Create and Manage Picklists](./using-picklists.md) from the Applications menu, but you can also use Liferay's REST APIs. Call these services to create and manage picklists.

## Adding a Picklist

```{include} /_snippets/run-liferay-dxp.md
```

Then, follow these steps:

1. Download and unzip [Picklists API Basics](./liferay-v3n6.zip).

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/picklists/liferay-v3n6.zip -O
   ```

   ```bash
   unzip liferay-v3n6.zip
   ```

1. Use the cURL script to add a new Picklist to your instance. On the command line, navigate to the `curl` folder. Execute the `ListTypeDefinition_POST_ToInstance.sh` script.

   ```bash
   ./ListTypeDefinition_POST_ToInstance.sh
   ```

   The JSON response shows a new Account has been added:

   ```bash
   "dateCreated" : "2022-11-17T18:42:13Z",
   "dateModified" : "2022-11-17T18:42:13Z",
   "id" : 47502,
   "listTypeEntries" : [ ],
   "name" : "Foo",
   "name_i18n" : {
      "en-US" : "Foo"
   }
   ```

