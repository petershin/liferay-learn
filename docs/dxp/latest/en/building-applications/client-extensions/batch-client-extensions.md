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

{bdg-secondary}`7.4 U45+/GA45+`

Liferay data entities can be deployable with client extensions. For this purpose there is a single client extension; the Batch Client Extension.

## Batch Client Extension

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (on-premises)`

The Batch client extension provides data entities to your Liferay instance. From Object Definition and Workflow Definition all the way to initilizing an entire site. The data is first exported using the Batch Engine Framework (hence the name.) Any entities supported by the Batch Engine are supported in batch client extensions.

Specify the batch client extension in your `client-extension.yaml` file:

```yaml
    type: batch
```

## Additional Information

* [Introduction to Client Extensions](../client-extensions.md)
* [Configuring Client Extensions in `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml)
