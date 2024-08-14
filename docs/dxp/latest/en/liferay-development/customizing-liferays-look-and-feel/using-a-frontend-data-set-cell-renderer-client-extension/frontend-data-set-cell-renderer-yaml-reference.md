---
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
uuid: f5869542-8a90-4269-9f8d-c9a9ca67ac46
---
# Frontend Data Set Cell Renderer YAML Reference

You can define a Frontend Data Set cell renderer client extension with a `client-extension.yaml` file.

## Usage Details

The `client-extension.yaml` file defines a Frontend Data Set cell renderer client extension:

```yaml
assemble:
    - from: build/static
      into: static
liferay-sample-fds-cell-renderer:
    name: Liferay Sample Frontend Data Set Cell Renderer
    type: fdsCellRenderer
    url: index.*.js
```

The client extension requires an exported function (like [this example](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-fds-cell-renderer/src/index.ts)) to process a value from a [data set](../../data-sets.md). This example is configured so that a build places the exported code in the `static/` folder for deployment.

The required `url` property specifies where the exported cell renderer function is available when it's deployed.

## YAML Properties

| **Property** | **Data Type** | **Description**                                                                              |
| :----------- | :------------ | :------------------------------------------------------------------------------------------- |
| `url`        | URL           | (Required) The path where the exported function is available to Liferay after it's deployed. |