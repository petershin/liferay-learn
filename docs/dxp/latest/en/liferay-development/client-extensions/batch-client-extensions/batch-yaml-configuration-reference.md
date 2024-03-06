---
uuid: a92f8a77-b22a-44be-88c0-fff9e1284347
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Batch YAML Configuration Reference

Use a `client-extension.yaml` file to define a batch client extension.

## Usage Details

This `client-extension.yaml` file defines a client extension of type `batch`:

```yaml
yoke-batch:
    oAuthApplicationHeadlessServer: yoke-oauth-application-headless-server
    type: batch

yoke-oauth-application-headless-server:
    type: oAuthApplicationHeadlessServer
```

## YAML Properties

These properties are specific to batch client extensions:

| Name                             | Data Type | Description     |
| :------------------------------- | :-------- | :-------------- |
| `name`                           | String    | The batch name. |
| `oAuthApplicationHeadlessServer` | String    | (Required) The identity (`externalReferenceCode`) of an OAuth2 application headless server profile. |

## Related Topics

* [Working with Client Extensions](../working-with-client-extensions.md)
