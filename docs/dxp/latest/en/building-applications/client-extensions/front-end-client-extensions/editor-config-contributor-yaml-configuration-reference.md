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

Editor Config Contributor client extensions override existing CKEditor customization in a `ConfigContributor.java` file. Configuration options of the client extension must match the `ConfigContributor` it's overriding (portlet names, editor names, and editor config keys).

The required url property defines the JavaScript resource file’s location. The JavaScript resource must contain the custom element initialization code.

[The example workspace](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-editor-config-contributor) includes a complete Editor Config Contributor client extension.

!!! important
    You must provide valid configurations. No validations are performed.

Client extensions are deployed on an instance-level basis, affecting editors placed on admin/site pages belonging to that virtual instance.

## YAML Properties

These properties are specific to Editor Config Contributor client extensions:

| Name | Data Type | Description |
| :--- | :--- | :--- |
| `editorConfigKeys` | | Specifies the keys related to the editor configurations that this client extension will override or contribute to. |
| `name` | | The name of the client extension, which is "Liferay Sample Editor Config Contributor" in this case |
| `type` | | Indicates the type of client extension, which is "editorConfigContributor". |
| `url` | URL | (Required) The path to the CSS file added to the page's CSS when enabled on a page. The complete URI is prefixed by the `baseURL` value. |

See [Front-end Client Extension Properties](../front-end-client-extensions.md#front-end-client-extension-properties) for properties common to all front-end client extensions.

## Related Topics

- [Front-end Client Extensions](../front-end-client-extensions.md)
- [Working with Client Extensions](../working-with-client-extensions.md)
- [Theme CSS YAML Configuration Reference](./theme-css-yaml-configuration-reference.md)
