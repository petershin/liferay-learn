---
toc:
  - ./batch-client-extensions/batch-yaml-configuration-reference.md
uuid: 654223de-17be-4786-a90d-775f986c0911
---
# Batch Client Extensions

```{toctree}
:maxdepth: 3

batch-client-extensions/batch-yaml-configuration-reference.md
```

You can export any type of data supported by the [batch engine framework](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) from your Liferay instance as batch client extensions, including [object definitions](../objects/creating-and-managing-objects/exporting-and-importing-object-definitions.md), [workflow definitions](../../process-automation/workflow/introduction-to-workflow.md), and site initializers. Then you can deploy them again any time, to Liferay Experience Cloud or self-hosted Liferay instances.

```{warning}
Batch client extensions are currently a **beta feature** in Liferay 7.4. The available features are temporarily limited.
```

## Batch Client Extension

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (self-hosted)`

Batch client extensions provide data entities to your Liferay instance. Begin by creating the data in your Liferay instance (for example, [exporting an object definition](../objects/creating-and-managing-objects/exporting-and-importing-object-definitions.md) as a client extension).

Specify the batch client extension in your `client-extension.yaml` file:

```yaml
type: batch
```

## Additional Information

* [Introduction to Client Extensions](../client-extensions.md)
* [Configuring Client Extensions in `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
