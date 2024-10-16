---
toc:
  - ./importing-exporting-data/using-a-site-initializer-client-extension.md
  - ./importing-exporting-data/batch-yaml-configuration-reference.md
uuid: 601bd5b5-8b5b-4ac6-9030-776439ff9aa7
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Importing/Exporting Data

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay SaaS`
{bdg-warning}`Liferay PaaS`

{bdg-secondary}`Liferay 7.4`

If you want to import or export data from Liferay, you use batch client extensions. Use and reuse your data between different Liferay instances directly from your workspace, as part of your development process.

## Batch Client Extensions

Batch client extensions work with Liferay's [batch engine framework](../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) to provide data entities to your Liferay instance. Export one instance's data (e.g., via `curl` or the Export/Import Center). Then add it to a batch client extension and [deploy](./client-extensions/working-with-client-extensions.md#deploying-to-your-liferay-instance) it to bring the data into another Liferay instance.

To export data to use with batch client extensions, you can use the Export/Import Center via the Applications Menu (![Applications menu icon](../images/icon-applications-menu.png)). To enable the Export/Import center, add this [portal property](../installation-and-upgrades/reference/portal-properties.md) before starting Liferay:

```properties
feature.flag.COMMERCE-8087=true
```

!!! warning
    The batch framework's export/import center is a [feature under development](../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags). Never enable a dev feature flag in production.

Specify the batch client extension in your `client-extension.yaml` file:

```yaml
type: batch
```

You can export any type of data supported by the [batch engine framework](../headless-delivery/consuming-apis/batch-engine-api-basics-exporting-data.md) from your Liferay instance, including [object definitions](./objects/creating-and-managing-objects.md) and [workflow definitions](../process-automation/workflow/introduction-to-workflow.md).

!!! important
    When exporting, use the `jsont` file format. `jsont` is required for `*.batch-engine-dat.json` files when using in conjunction with batch client extensions.

Once the `*.batch-engine-data.json` file is added to a [batch client extension](./importing-exporting-data/batch-yaml-configuration-reference.md), deploy the [built archive](./client-extensions/packaging-client-extensions.md) to Liferay Cloud or self-hosted Liferay instances.

## Site Initializer Client Extensions

A [Site Initializer](../site-building/developer-guide/site-initializers.md) is a type of batch client extension you can deploy to create a pre-built site quickly. Deploying the client extension creates the new site along with any configurations or content provided with it.

Specify the Site Initializer client extension in your `client-extension.yaml` file:

```yaml
type: siteInitializer
```

See [Using a Site Initializer Client Extension](./importing-exporting-data/using-a-site-initializer-client-extension.md) to get started.

## Related Topics

- [Introduction to Client Extensions](./client-extensions.md)
- [Configuring Client Extensions in `client-extension.yaml`](./client-extensions/working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
- [Data Migration Center](../headless-delivery/consuming-apis/data-migration-center.md)
- [Using a Site Initializer Client Extension](./importing-exporting-data/using-a-site-initializer-client-extension.md)
