---
uuid: 05f145b0-0a81-445c-88af-4aa6d52c0469
taxonomy-category-names:
- Development and Tooling
- Client Extensions
- Liferay Self-Hosted
- Liferay SaaS
---
# Packaging Client Extensions

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay SaaS`
{bdg-primary}`Liferay PaaS`

{bdg-secondary}`Liferay 7.4`

Client extension projects are built as deployable archives called *Liferay Universal File Format Archives* (LUFFAs) with a `.zip` extension. Each LUFFA has a particular structure and defines specific component files, which are generated automatically if not provided by your project. Liferay workspace packages client extension projects when you build them. Understanding how packaging works is important for [assembling client extensions](./working-with-client-extensions.md#assembling-client-extensions) or creating LUFFAs with a different process.

This is a LUFFA's structure:

```bash
.
├── batch
│   └── **/*.batch-engine-data.json
├── *.client-extension-config.json
├── Dockerfile
├── LCP.json
├── static
│   └── **/*
├── WEB-INF
│   └── liferay-plugin-package.properties
└── [microservice resources]
```

## `batch`

!!! note
    The `batch` folder is only required by [batch client extension projects](../importing-exporting-data.md).

The data entities in a batch client extension are `*.batch-engine-data.json` files inside a `batch/` folder in the built LUFFA. These files can be in any folder structure within the `batch/` folder.

You can place any number of `*.batch-engine-data.json` files under the root level `batch/` directory, using a directory structure of unlimited depth. If you fail to define a batch extension in your project's `client-extension.yaml` file, Liferay ignores these files.

## `*.client-extension-config.json`

!!! note
    At least one `*.client-extension-config.json` file is required in each LUFFA.

At the root of the LUFFA are one or more `*.client-extension-config.json` ([OSGi Configuration Resource Format](https://docs.osgi.org/specification/osgi.cmpn/7.0.0/service.configurator.html#d0e131566)) files. They define how your client extensions are structured in the archive. Usually these files are produced during the build process based on your `client-extension.yaml` file's contents. The conversion from YAML to JSON is specified by the [Liferay workspace plugin](https://repo1.maven.org/maven2/com/liferay/com.liferay.gradle.plugins.workspace/), and is not a 1:1 mapping.

## `Dockerfile`

!!! note
    At least one Dockerfile is required in each LUFFA.

The build process automatically generates and packages a `Dockerfile` for [batch](../importing-exporting-data.md), [configuration](../configuration-as-code.md), and [frontend](../customizing-liferays-look-and-feel.md) client extensions.

You must provide a [`Dockerfile`](https://docs.docker.com/engine/reference/builder/) in your project for [microservice client extensions](../integrating-microservices.md). Add it to the root of your project, and it's copied into the LUFFA when you build the project. Make sure your `Dockerfile` can execute the microservice client extensions in your project. For example, your `Dockerfile` may need to install specific tools that your microservice's code needs to run.

### Packaging a Client Extension Manually

If packaging the LUFFA yourself, batch, configuration, and frontend client extensions requires certain `Dockerfile` conventions. Liferay provides them for you in the images below. 

For batch client extensions, use the `liferay/batch:latest` image:

```Dockerfile
FROM liferay/batch:latest
COPY /batch /batch
```

For configuration client extensions, use the `liferay/noop:latest` image:

```Dockerfile
FROM liferay/noop:latest
```

For frontend client extensions, use the `liferay/caddy:latest` image:

```Dockerfile
FROM liferay/caddy:latest
COPY static/ /public_html/
```

A microservice client extension's `Dockerfile` depends entirely on your specific context, so a pre-configured image cannot be provided.

## `LCP.json`

```{note}
An `LCP.json` file is required in each LUFFA.
```

The build process automatically generates and packages an `LCP.json` file for [batch](../importing-exporting-data.md), [configuration](../configuration-as-code.md), and [frontend](../customizing-liferays-look-and-feel.md).

You must provide an `LCP.json` file in your project for [microservice client extensions](../integrating-microservices.md). Add it to the root of your project, and it's copied into the LUFFA when your project is built. This `LCP.json` file configures the container used for the microservice when it's deployed in Liferay Cloud.

If packaging the LUFFA yourself, each client extension comes with different specification suggestions for its `LCP.json`:

| Client Extension | Requires Significant Resources | Kind | Notes |
| :--------------- | :----------------------------- | :--- | :---- |
| [Batch](#example-batch-client-extension-lcp-json)            | &#10008;                       | Job  | <ul><li>The environment variable `LIFERAY_BATCH_OAUTH_APP_ERC` must be set to the value of your batch client extension's `oAuthApplicationHeadlessServer` property. This can be provided through interpolation.</li><li>You can specify small values for `cpu`, `memory` and `scale`.</li></ul> |
| [Configuration](#example-configuration-client-extension-lcp-json)    | &#10008;                       | Job  | <ul><li>Even less memory intensive than batch extensions.</li><li>You can specify very small values for `cpu`, `memory` and `scale`.</li></ul> |
| [Frontend](#example-frontend-client-extension-lcp-json)        | &#10008;                       | Deployment  | <ul><li>Must specify the `loadBalancer` property with `targetPort` set to `80`.</li><li>Should specify [`livenessProbe` and `readinessProbe` properties](https://learn.liferay.com/w/liferay-cloud/troubleshooting/self-healing) for self-healing.</li><li>You can specify small values for `cpu`, `memory` and `scale`.</li></ul> |

### Example Batch Client Extension LCP.json

 ```json
{
    "cpu": 0.2,
    "env": {
        "LIFERAY_BATCH_OAUTH_APP_ERC": "__batch.oAuthApplicationHeadlessServer__"
    },
    "id": "__CLIENT_EXTENSION_ID__",
    "kind": "Job",
    "memory": 50,
    "scale": 1
}
```

### Example Configuration Client Extension LCP.json

```json
{
    "cpu": 0.1,
    "id": "__CLIENT_EXTENSION_ID__",
    "kind": "Job",
    "memory": 10,
    "scale": 1
}
```

### Example Frontend Client Extension LCP.json

```json
{
    "cpu": 0.2,
    "id": "__CLIENT_EXTENSION_ID__",
    "kind": "Deployment",
    "livenessProbe": {
        "httpGet": {
            "path": "/",
            "port": 80
        }
    },
    "loadBalancer": {
        "cdn": true,
        "targetPort": 80
    },
    "memory": 50,
    "readinessProbe": {
        "httpGet": {
            "path": "/",
            "port": 80
        }
    },
    "scale": 1
}
```

See [Configuration via LCP.json](https://learn.liferay.com/w/liferay-cloud/reference/configuration-via-lcp-json) for more information.

## `static`

!!! note
    The `static` directory is only required by [frontend client extension projects](../customizing-liferays-look-and-feel.md).

You can place any number of static resource files into the root level `static/` directory in the built LUFFA. Use any folder structure you like within the `static/` folder. These files are ignored if there is no frontend client extension defined in your project's `client-extension.yaml` file.

## Microservice Resources

You can include additional resources in the built LUFFA for your microservice client extension projects, as long as they do not conflict with other required files.

## Related Topics

- [Working with Client Extensions](./working-with-client-extensions.md)
- [Liferay Workspace](../tooling/liferay-workspace.md)
