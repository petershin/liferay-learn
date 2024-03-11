---
uuid: 148da815-c222-47e6-b037-beb8969c3b04
taxonomy-category-names:
- Development and Tooling
- Frontend Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Editor Config Contributor YAML Configuration Reference

{bdg-secondary}`Liferay DXP 2024.Q1+/Portal 7.4 GA112+`

!!! important
    This feature is currently behind a release feature flag (LPS-186870). Read [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.

You can define an Editor Config Contributor client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines an Editor Config Contributor extension definition:

```yaml
able-editorConfigContributor:
   editorConfigKeys:
      - contentEditor
      - description
      - sampleClassicEditor
      - sampleLegacyEditor
   name: Liferay Sample Editor Config Contributor
   type: editorConfigContributor
   url: index.js
```

Editor Config Contributor client extensions override existing CKEditor configurations in a `ConfigContributor.java` file. The client extension's configuration options must match the `ConfigContributor` it's overriding (portlet names, editor names, and editor config keys).

Client extensions are deployed at the instance level and impact all CKEditor instances across pages within that virtual instance if they meet the configuration criteria.

!!! tip
    By specifying configuration options, you can control which CKEditor instances your extensions affect. If you omit specific configuration options, the extension applies to all CKEditors filtered by the provided criteria. If no options are specified, the extension applies to every CKEditor instance in the DXP environment.

The required URL property points to a JavaScript snippet that should implement a function according to the [TypeScript interfaces outlined in the public API](https://github.com/liferay/liferay-frontend-projects/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/projects/js-toolkit/packages/js-api/editor/index.ts).

[The example workspace](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-editor-config-contributor) includes a complete Editor Config Contributor client extension.

!!! important
    Developers must provide valid configurations when implementing the client extension. The system does not perform any validation checks on these configurations.

## YAML Properties

These properties are specific to Editor Config Contributor client extensions:

| Name               | Data Type     | Description                                                                                                                        |
|:-------------------|:--------------|:-----------------------------------------------------------------------------------------------------------------------------------|
| `editorConfigKeys` | `Set<String>` | Specifies the keys related to the editor configurations that this client extension will override or contribute to.                 |
| `name`             | `String`      | The name of the client extension.                                                                                                  |
| `type`             | `String`      | Indicates the type of client extension.                                                                                            |
| `url`              | `URL`         | (Required) The path to the JavaScript snippet that implements the functionality of the Editor Config Contributor client extension. |

See [Front-end Client Extension Properties](../front-end-client-extensions.md#front-end-client-extension-properties) for properties common to all front-end client extensions.

## Related Topics

- [Front-end Client Extensions](../front-end-client-extensions.md)
- [Working with Client Extensions](../working-with-client-extensions.md)
- [Theme CSS YAML Configuration Reference](./theme-css-yaml-configuration-reference.md)
