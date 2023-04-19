---
uuid: 05f145b0-0a81-445c-88af-4aa6d52c0469
---
# Packaging Client Extensions

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (self-hosted)`

Client extension projects are built as deployable `.zip` archives called *Liferay Universal File Format Archives* (LUFFAs). Each LUFFA has a particular structure and defines specific component files, which are generated automatically if not provided by your project. The Liferay workspace packages client extension projects when you build them. Understanding how packaging works is important for [assembling client extensions](./working-with-client-extensions.md#assembling-client-extensions) or creating LUFFAs with a different process.

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
└── [microservice resources]
```

## `batch`

```{note}
The `batch` directory is only required by [batch client extension projects](./batch-client-extensions.md).
```

The data entities included in a batch client extension are represented as `*.batch-engine-data.json` files, within a `batch/` folder in the built LUFFA. These files can be in any folder structure within the `batch/` folder.

You can place any number of `*.batch-engine-data.json` files under the root level `batch/` directory, using a directory structure of unlimited depth. These files are ignored if there is no batch client extension defined in your project's `client-extension.yaml` file.

## `*.client-extension-config.json`

```{note}
At least one `*.client-extension-config.json` file is required in each LUFFA.
```

One or more `*.client-extension-config.json` ([OSGi Configuration Resource Format](https://docs.osgi.org/specification/osgi.cmpn/7.0.0/service.configurator.html#d0e131566)) files are placed at the root of the LUFFA. They define how your client extensions are structured in the archive. Usually these files are produced during the build process based on your `client-extension.yaml` file's contents. The conversion from YAML to JSON is specified by the [Liferay workspace plugin](https://repo1.maven.org/maven2/com/liferay/com.liferay.gradle.plugins.workspace/), and is not a 1:1 mapping.

## `Dockerfile`

```{note}
At least one Dockerfile is required in each LUFFA.
```

The build process automatically generates and packages a `Dockerfile` for [batch](./batch-client-extensions.md), [configuration](./configuration-client-extensions.md), and [front-end](./front-end-client-extensions.md) client extensions.

You must provide a [`Dockerfile`](https://docs.docker.com/engine/reference/builder/) in your project for [microservice client extensions](./microservice-client-extensions.md). Add it to the root of your project, and it's copied into the LUFFA when you build the project. Make sure your `Dockerfile` can execute the microservice client extensions in your project. For example, your `Dockerfile` may need to install specific tools that your microservice's code needs to run.

If packaging the LUFFA yourself, each client extension type requires certain `Dockerfile` conventions.

For batch client extensions, use the `liferay/batch:latest` image:

```Dockerfile
FROM liferay/batch:latest
COPY /batch /batch
```

For configuration client extensions, use the `liferay/noop:latest` image:

```Dockerfile
FROM liferay/noop:latest
```

For front-end client extensions, use the `liferay/caddy:latest` image:

```Dockerfile
FROM liferay/caddy:latest
COPY static/ /public_html/
```

## `LCP.json`

```{note}
An `LCP.json` file is required in each LUFFA.
```

The build process automatically generates and packages an `LCP.json` file for [batch](./batch-client-extensions.md), [configuration](./configuration-client-extensions.md), and [front-end](./front-end-client-extensions.md).

You must provide an `LCP.json` file in your project for [microservice client extensions](./microservice-client-extensions.md). Add it to the root of your project, and it's copied into the LUFFA when your project is built. This `LCP.json` file configures the container used for the microservice when it's deployed in Liferay Experience Cloud.

If packaging the LUFFA yourself, each client extension comes with different specification suggestions for its `LCP.json`:

- Batch client extensions

  - Do not require significant resources, so the `LCP.json` can specify small values for `cpu`, `memory` and `scale`.

  - Must declare `kind` to be `Job`.

  - Require setting the environment variable `LIFERAY_BATCH_OAUTH_APP_ERC` to the value of your batch client extension's `oAuthApplicationHeadlessServer` property. This can be provided through interpolation, like the example below.

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

- Configuration client extensions

  - Do not require significant resources (less than batch), so the `LCP.json` can specify very small values for `cpu`, `memory` and `scale`.

  - Must declare `kind` to be `Job`.

    ```json
    {
        "cpu": 0.1,
        "id": "__CLIENT_EXTENSION_ID__",
        "kind": "Job",
        "memory": 10,
        "scale": 1
    }
    ```

- Front-end client extensions

  - Do not require significant resources, so the `LCP.json` can specify small values for `cpu`, `memory` and `scale`.

  - Must declare `kind` to be `Deployment`.

  - Must specify the `loadBalancer` property with `targerPort` set to `80`.

  - Should specify [`livenessProbe` and `readinessProbe` properties](https://learn.liferay.com/w/liferay-cloud/troubleshooting/self-healing) for self-healing.

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

```{note}
The `static` directory is only required by [front-end client extension projects](./front-end-client-extensions.md).
```

You can place any number of static resource files into the root level `static/` directory in the built LUFFA. Use any folder structure you like within the `static/` folder. These files are ignored if there is no front-end client extension defined in your project's `client-extension.yaml` file.

## Microservice Resources

You can include additional resources in the built LUFFA for your microservice client extension projects, as long as they do not conflict with other required files.

## Additional Information

* [Working with Client Extensions](./working-with-client-extensions.md)
* [Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md)
