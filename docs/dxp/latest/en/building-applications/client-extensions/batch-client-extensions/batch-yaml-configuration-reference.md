---
uuid: a92f8a77-b22a-44be-88c0-fff9e1284347
---
# Batch YAML Configuration Reference

You can define a Batch client extension with a `client-extension.yaml` file.

## Usage Details

This `client-extension.yaml` file defines a Batch client extension:

```yaml
yoke-batch:
    oAuthApplicationHeadlessServer: yoke-oauth-application-headless-server
    type: batch

yoke-oauth-application-headless-server:
    type: oAuthApplicationHeadlessServer
```

## YAML Properties

These properties are specific to Batch client extensions:

| Name | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `name` | String | | The Batch name. |
| `oAuthApplicationHeadlessServer` | String | | (Required) The identity (`externalReferenceCode`) of an OAuth2 application headless server profile. |

## Additional Information

* [Working with Client Extensions](../working-with-client-extensions.md)
