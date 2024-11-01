---
uuid: c79386c9-9344-49e3-bfd4-626b4f8750ed
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---

# JavaScript YAML Configuration Reference

You can define a JavaScript client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines a JavaScript client extension:

```yaml
able-global-js:
   name: Able JS
   scriptElementAttributes:
      async: true
      data-attribute: "value"
      data-senna-track: "permanent"
      fetchpriority: "low"
   type: globalJS
   url: global.js
```

The required `url` property defines the JavaScript resource file's location. When enabled on a page, JavaScript at this path runs on each page load.

[The example workspace](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-global-js-2) includes a complete JavaScript client extension.

## YAML Properties

These properties are specific to JavaScript client extensions:

| Name                      | Data Type | Description                                                                                                                                                                                                                                                                                                                   |
| :------------------------ | :-------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `url`                     | URL       | (Required) The path to the JavaScript file added to the HEAD of the page when the client extension is enabled. The complete URI is prefixed by the `baseURL` value.                                                                                                                                                           |
| `scriptElementAttributes` | String    | Beginning in Liferay DXP 2024.Q2/Portal 7.4 GA120, you can add string and Boolean attributes to the HTML `script` element. Use the format `name: "value"` for strings and `name: value` for Booleans.                                                                                                                         |
| `scope`                   | String    | Beginning in Liferay DXP 2024.Q4/Portal 7.4 GA129, you can set the scope to `instance` to make the JavaScript apply to all pages in the Liferay instance including administrative panels (e.g., site administration and the control panel). The default is `page`, and applies only to [site pages as set by the administrator](../using-a-javascript-client-extension.md#use-the-client-extension-on-a-page). |
| `scriptLocation`          | String    | Beginning in Liferay DXP 2024.Q4/Portal 7.4 GA129, you can specify whether the script runs in the page `head` or `bottom`. This onyl applies when the scope is `instance`.                                                                                                                                                    |

See [Frontend Client Extension Properties](../../customizing-liferays-look-and-feel.md#frontend-client-extension-properties) for properties common to all frontend client extensions.

## Related Topics

- [Frontend Client Extensions](../../customizing-liferays-look-and-feel.md)
- [Working with Client Extensions](../../client-extensions/working-with-client-extensions.md)
