---
uuid: 05f145b0-0a81-445c-88af-4aa6d52c0469
---
# Packaging Client Extensions

{bdg-secondary}`Liferay Experience Cloud and Liferay DXP 7.4+ (self-hosted)`

Client extension projects are built as deployable `.zip` archives, called *Liferay Universal File Format Archives* (LUFFAs). Each LUFFA follows a particular structure and defines a few specific component files (which can be automatically generated or provided by your project). The Liferay workspace takes care of packaging client extension projects when you build them, but understanding how it's packaged is important when you are [assembling client extensions](./working-with-client-extensions.md#assembling-client-extensions), or if you're using a different process to create a LUFFA.

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
This directory is only required by [batch client extension projects](./batch-client-extensions.md).
```

The data entities included in a batch client extension are represented as `*.batch-engine-data.json` files, within a `batch/` folder in the built LUFFA. These files can be in any folder structure within the `batch/` folder.

Any number of `*.batch-engine-data.json` files can be placed into a directory structure (of unlimited depth and structure) under the root level `batch/` directory. These files are ignored if there is no batch client extension defined in your project's `client-extension.yaml` file.

## `*.client-extension-config.json`

```{note}
At least one `*.client-extension-config.json` file is **required** in each LUFFA.
```

One or more `*.client-extension-config.json` ([OSGi Configuration Resource Format](https://docs.osgi.org/specification/osgi.cmpn/7.0.0/service.configurator.html#d0e131566)) files are placed at the root of the LUFFA, and they define how your client extensions are structured in the archive. Usually these files are converted automatically during the build process based on your `client-extension.yaml` file's contents. The conversion from YAML to JSON format is not a 1:1 mapping. The conversion process is specified by the [Liferay workspace plugin](https://repo1.maven.org/maven2/com/liferay/com.liferay.gradle.plugins.workspace/).

## `Dockerfile`

```{note}
At least one Dockerfile is **required** in each LUFFA.
```

You must provide a [`Dockerfile`](https://docs.docker.com/engine/reference/builder/) in your project for [microservice client extensions](./microservice-client-extensions.md). You can provide it in the root of your project, so that it's copied into the LUFFA when your project is built.

You must write your `Dockerfile` such that it can execute the microservice client extensions in your project. For example, your `Dockerfile` may need to install specific tools that your microservice's code needs to run. Liferay may provide a limited number of prepared, easy-to-adopt Docker images for some use cases.

The build process automatically generates an appropriate `Dockerfile` for [batch](./batch-client-extensions.md), [configuration](./configuration-client-extensions.md), and [front-end](./front-end-client-extensions.md) client extensions, and includes it in the LUFFA.

If you're packaging the LUFFA yourself, these `Dockerfile`s are expected:

* **Batch**: use `liferay/batch:latest`

    ```Dockerfile
    FROM liferay/batch:latest
    COPY /batch /batch
    ```

* **Configuration**: use `liferay/noop:latest`

    ```Dockerfile
    FROM liferay/noop:latest
    ```

* **Front-end**: use `liferay/caddy:latest`

    ```Dockerfile
    FROM liferay/caddy:latest
    COPY static/ /public_html/
    ```

## `LCP.json`

```{note}
An `LCP.json` file is **required** in each LUFFA.
```

You must provide an `LCP.json` file in your project for [microservice client extensions](./microservice-client-extensions.md). You can provide it in the root of your project, so that it's copied into the LUFFA when your project is built. This `LCP.json` file configures the container that is used for the microservice when it's deployed in Liferay Experience Cloud.

The build process automatically generates an appropriate `LCP.json` file for [batch](./batch-client-extensions.md), [configuration](./configuration-client-extensions.md), and [front-end](./front-end-client-extensions.md) client extensions, and includes it in the LUFFA.

If you're packaging the LUFFA yourself, these specifications are suggested:

* **Batch**:

    A batch Docker image does not require significant resources, so the `LCP.json` can specify small values for `cpu`, `memory` and `scale`.

    It must declare `kind` to be `Job`.

    It requires setting the environment variable `LIFERAY_BATCH_OAUTH_APP_ERC` to the value of your batch client extension's `oAuthApplicationHeadlessServer` property. This can be provided through interpolation, like the example below.

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

* **Configuration**:

    A configuration Docker image requires very little resources (even less than batch), so the `LCP.json` can specify very small values for `cpu`, `memory` and `scale`.

    It must declare `kind` to be `Job`.

    ```json
    {
        "cpu": 0.1,
        "id": "__CLIENT_EXTENSION_ID__",
        "kind": "Job",
        "memory": 10,
        "scale": 1
    }
    ```

* **Front-end**:

    A front-end Docker image does not require significant resources, so the `LCP.json` can specify small values for `cpu`, `memory` and `scale`.

    It must declare `kind` to be `Deployment`.

    It must specify the `loadBalancer` property with `targerPort` set to `80`.

    It should also specify [`livenessProbe` and `readinessProbe` properties](https://learn.liferay.com/w/liferay-cloud/troubleshooting/self-healing) for self-healing.

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
This directory is only required by [front-end client extension projects](./front-end-client-extensions.md).
```

Any number of static resource files can be placed into the root level `static/` directory in the built LUFFA. These files can be in any folder structure within the `static/` folder. These files are ignored if there is no front-end client extension defined in your project's `client-extension.yaml` file.

## Microservice Resources

You can include any additional resources in the built LUFFA for your microservice client extension projects, as long as they do not conflict with other required files.

## Additional Information

* [Working with Client Extensions](./working-with-client-extensions.md)
* [Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md)
