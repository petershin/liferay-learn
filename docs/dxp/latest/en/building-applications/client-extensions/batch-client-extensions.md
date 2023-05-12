---
toc:
  - ./batch-client-extensions/batch-yaml-configuration-reference.md
uuid: 601bd5b5-8b5b-4ac6-9030-776439ff9aa7
---
# Batch Client Extensions

{bdg-link-primary}`[Dev Feature](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags)`

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (self-hosted)`

```{toctree}
:maxdepth: 3

batch-client-extensions/batch-yaml-configuration-reference.md
```

Batch client extensions work with Liferay's [batch engine framework](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) to provide data entities to your Liferay instance. From Liferay's Import/Export Center, export one instance's data. Then add it to a batch client extension and [deploy](./working-with-client-extensions.md#deploying-to-your-liferay-instance) it to bring the data into a different Liferay instance. 

To enable batch client extensions, add this [portal property](../../installation-and-upgrades/reference/portal-properties.md) before starting Liferay:

```properties
feature.flag.COMMERCE-8087=true
```

```{warning}
This is a [feature under development](../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags). Never enable a dev feature flag in production.
```

Specify the batch client extension in your `client-extension.yaml` file:

```yaml
type: batch
```

You can export any type of data supported by the [batch engine framework](../../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) from your Liferay instance, including [object definitions](../objects/creating-and-managing-objects.md) and [workflow definitions](../../process-automation/workflow/introduction-to-workflow.md). When exporting, choose the JSONT file format. Once the `*.batch-engine-data.json` file is added to a [batch client extension](./batch-client-extensions/batch-yaml-configuration-reference.md), deploy the [built archive](./packaging-client-extensions.md) to Liferay Experience Cloud or self-hosted Liferay instances.

## Related Topics

* [Introduction to Client Extensions](../client-extensions.md)
* [Configuring Client Extensions in `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
