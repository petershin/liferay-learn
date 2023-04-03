---
uuid: 01f46794-2cd4-4ffc-94d3-e244880f2b6f
---
# Packaging Client Extensions

{bdg-secondary}`7.4+`

The Liferay workspace takes care of packaging client extension projects but there are details about packaging which are necessary to understand when [specifying the files to include](working-with-client-extensions.md#packaging-files-in-client-extensions) or when building a custom packaging tool.

The packaging output is called the **Universal File Format Archive** (UFFA) which is a ZIP archive which follows a particular structure and defines a few specific contents some of which are automatically generated if not provided by the project.

The structure of a UFFA is:
```bash
.
├── batch
│   └── **/*.batch-engine-data.json
├── *.client-extension-config.json
├── Dockerfile
├── LCP.json
├── static
│   └── **/*
└── [microservice_resources]*
```

## `batch`

***Note:*** This path is only required by `batch` client extension projects.

Any number of `*.batch-engine-data.json` files can be placed into a directory structure (of unlimited depth and structure) under the root level `batch` directory. These files must be accompanied by a `batch` client extension defined in `client-extension.yaml` otherwise they will be ignored.

## `*.client-extension-config.json`

***Note:*** At least one is **required**.

One or more client extension config json ([OSGi Configuration Resource Format](https://docs.osgi.org/specification/osgi.cmpn/7.0.0/service.configurator.html#d0e131566)) files are placed in the root of the archive. Usually these files are converted automatically by the workspace from the contents of `client-extension.yaml`. The conversion from `yaml` to `json` is not a 1:1 mapping. The heuristics of the conversion are codified in the [workspace plugin](https://repo1.maven.org/maven2/com/liferay/com.liferay.gradle.plugins.workspace/).

## `Dockerfile`

***Note:*** One is **required**.

In the case of `microservice` client extensions, a `Dockerfile` must be provided in the root of the archive. This is usually accomplished by placing the `Dockerfile` in the root of the project where the workspace will then copy this file into the archive. This `Dockerfile` must be constructed such that it can execute the `microservice` client extensions in the project. Liferay may provide a limited number of prepared, easy to adopt Docker images for some use cases.

In the case of `batch`, `configuration` and `front-end` client extensions the `Dockerfile` is prescribed and will be automatically added into the archive.

When implementing a packaging tool the following docker files are expected:

* `batch` - use `liferay/batch:latest`

    ```Dockerfile
    FROM liferay/batch:latest
    COPY /batch /batch
    ```

* `configuration` - use `liferay/noop:latest`

    ```Dockerfile
    FROM liferay/noop:latest
    ```

* `front-end` - use `liferay/caddy:latest`

    ```Dockerfile
    FROM liferay/caddy:latest
    COPY static/ /public_html/
    ```

## `LCP.json`

***Note:*** One is **required**.

In the case of `microservice` client extensions, a `LCP.json` must be provided in the root of the archive. This is usually accomplished by placing the `LCP.json` in the root of the project where the workspace will then copy this file into the archive. This `LCP.json` declares the settings used to run the `microservice` client extension image in LXC.

In the case of `batch`, `configuration` and `front-end` client extensions the `LCP.json` is prescribed and will be automatically added into the archive.

When implementing a packaging tool the following `LCP.json`s are suggested:

* `batch` - the batch docker image does not require significant number of resources so the `LCP.json` can specify small values for `cpu`, `memory` and `scale`. It requires setting the environment variable `LIFERAY_BATCH_OAUTH_APP_ERC` to the value of the `oAuthApplicationHeadlessServer` property declared for the batch client extension. This can be provided through interpolation as shown bellow. It must declare `kind` to be `Job`.

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

* `configuration` - the configuration docker image requires little-to-no resources (even less than batch) so the `LCP.json` can specify very small values for `cpu`, `memory` and `scale`. It must declare `kind` to be `Job`.

    ```json
    {
        "cpu": 0.1,
        "id": "__CLIENT_EXTENSION_ID__",
        "kind": "Job",
        "memory": 10,
        "scale": 1
    }
    ```

* `front-end` - the front-end docker image does not require significant number of resources so the `LCP.json` can specify small values for `cpu`, `memory` and `scale`. It must declare `kind` to be `Deployment`. It must specify the `loadBalancer` property with `targerPort` set to `80`. It _should_ also specify `livenessProbe` and `readinessProbe` properties for self-healing.

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

See the [Configuration via LCP.json](../../../../../liferay-cloud/latest/en/reference/configuration-via-lcp-json.md) article.

## `static`

***Note:*** This path is only required by `front-end` client extension projects.

Any number of static resource files can be placed into a directory structure (of unlimited depth and structure) under the root level `static` directory. These files must be accompanied by `front-end` client extensions defined in `client-extension.yaml` otherwise they will be ignored.

## `[microservice_resources]*`

***Note:*** This path is only required by `microservice` client extension projects.

In the case of `microservice` client extensions any additional resources can be added into the archive provided they do not conflict with the required files previously mentioned.

## Additional Information

* [Working with Client Extensions](./client-extensions/working-with-client-extensions.md)
* [Liferay Workspace](./tooling/liferay-workspace/what-is-liferay-workspace.md)
