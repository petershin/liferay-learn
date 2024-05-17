---
uuid: 1c3db0c7-93ae-47c7-abbd-ae2e3e278cb0
---
# Creating Service Wrappers

Introduction

## Deploying a Service Wrapper

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to deploy the example:

1. Download and unzip the `liferay-j1c2.zip` example project.

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/liferay-j1c2.zip -O
    ```

    ```bash
    unzip liferay-j1c2.zip
    ```

1. Build and deploy the project module.

    ```bash
    cd liferay-j1c2
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    !!! note
        This command is the same as copying the deployed jars to `/opt/liferay/osgi/modules` on the Docker container.

1. Confirm the deployment in the Liferay Docker container console.

    ```bash
    STARTED com.acme.j1c2.impl_1.0.0 [1630]
    ```

1. Verify the example module's customization. Open your browser to `https://localhost:8080`.

1. Log out of Liferay and log back in. The service wrapper prints this message to the Liferay Docker container console:

    ```bash
    INFO  [http-nio-8080-exec-6][J1C2UserLocalServiceWrapper:34] Invoking #authenticateByEmailAddress(long, String, String, Map, Map, Map)
    ```

This example outputs a message to the console whenever the `authenticateByEmailAddress` method is called.

## Related Topics