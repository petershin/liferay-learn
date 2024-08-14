---
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
uuid: b5186959-139a-46cd-b36b-bf2863bcb722
---
# JavaScript Import Map Entry YAML Configuration Reference

## Usage Details

This `client-extension.yaml` file defines a JavaScript import map entry client extension:

```yaml
assemble:
    - from: build/static
      into: static
liferay-sample-js-import-maps-entry:
    bareSpecifier: jquery
    name: Liferay Sample JS Import Maps Entry
    type: jsImportMapsEntry
    url: jquery.*.js
```

The required `bareSpecifier` property specifies how you can access the code once you deploy the client extension to Liferay. The `url` property specifies the URL once the client extension is deployed.

## YAML Properties

| **Property**    | **Data Type** | **Description**                                                                                                               |
| :-------------- | :------------ | :---------------------------------------------------------------------------------------------------------------------------- |
| `bareSpecifier` | String        | The module specifier for the client extension to export. This identifier is used to import it from the import map in Liferay. |
| `url`           | URL           | (Required) The exported module's path when it's exported.                                                                     |