---
toc:
  - ./batch-client-extensions/batch-yaml-configuration-reference.md
uuid: 601bd5b5-8b5b-4ac6-9030-776439ff9aa7
---
# Batch Client Extensions

{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md)`

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (self-hosted)`

```{toctree}
:maxdepth: 3

batch-client-extensions/batch-yaml-configuration-reference.md
```

Batch client extensions provide data entities to your Liferay instance. Begin by creating the data in a Liferay instance, then export it as a batch client extension (for example, [export an object definition](../objects/creating-and-managing-objects/exporting-and-importing-object-definitions.md) as a client extension). Bring it into your Liferay instance by [deploying](./working-with-client-extensions.md#deploying-to-your-liferay-instance) the client extension.

You can export any type of data supported by the [batch engine framework](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) from your Liferay instance as batch client extensions, including [object definitions](../objects/creating-and-managing-objects/exporting-and-importing-object-definitions.md) and [workflow definitions](../../process-automation/workflow/introduction-to-workflow.md). Deploy exported `.zip` files to Liferay Experience Cloud or self-hosted Liferay instances.

Add this [portal property](../../installation-and-upgrades/reference/portal-properties.md) before starting up your Liferay instance to enable batch client extensions:

```properties
feature.flag.COMMERCE-8087=true
```

Specify the batch client extension in your `client-extension.yaml` file:

```yaml
type: batch
```

## Additional Information

* [Introduction to Client Extensions](../client-extensions.md)
* [Configuring Client Extensions in `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
