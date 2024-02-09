---
uuid: c1dd2bde-e995-4b03-88e1-8e15adeb7b17
---

# Setting Up Clustering for the Liferay Service

Because Delectable Bonsai's website draws millions of views, it must be clustered to handle the traffic. Here, you'll learn how to configure a two-node cluster of the production environment.

```{important}
You must have an extra Liferay DXP instance provisioned as an add-on for your Liferay Cloud project so that you can cluster your Liferay service and add another node to it. Contact your Liferay account manager for details.
```

## Set the Clustering Properties in LCP.json

Enable clustering and set the scale value in your Liferay service's configuration.

1. In your project repository, navigate to the `liferay/` directory and open the `LCP.json` file.

1. Add the `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` environment variable if it is not present. Set the value to `true`.

   ```json
    {
        "env": {
            "LCP_PROJECT_LIFERAY_CLUSTER_ENABLED": "true"
        }
    }
   ```

1. Add the `scale` property with a value of `1`. This sets the number of nodes, which you'll update later. 

   ```json
    {
        "kind": "Deployment",
        "id": "liferay",
        "scale": 1
    }
   ```

1. Run the Gradle task to create the custom Dockerfile for your Liferay service.

   ```bash
   ./gradlew clean createDockerfile deploy
   ```

1. Copy the `LCP.json` file into the newly created `build/docker` folder before deploying the build.

    ```bash
    cp LCP.json build/docker
    ```

    ```bash
    cd build/docker
    ```

1. Use the CLI tool's `lcp deploy` command to deploy only the Liferay service.

    ```bash
    lcp deploy --project=[project-name] --environment=prd
    ```

The Liferay service restarts with clustering enabled and the `scale` variable initialized. However, the scale is still set to one node only. Continue to update the scale to the desired two nodes.

## Update the Clustering Scale

Now that you have initialized the clustering scale, update it to two nodes and create a new build to deploy it.

1. In your project repository, navigate to the `liferay/` folder and open the `LCP.json` file.

1. Update the value of the `scale` property to `2`.

   ```json
    {
        "kind": "Deployment",
        "id": "liferay",
        "scale": 2
    }
   ```

1. Commit and push the changes to your Git repository.

   ```bash
   git add liferay/LCP.json
   ```

   ```bash
   git commit -m "Enable clustering and set the clustering scale to 2."
   ```

   ```bash
   git push origin [branch_name]
   ```

The updated clustering configuration is now committed, and the Liferay Cloud infrastructure automatically creates a build with it.

## Deploy the Configuration

Now that you have the necessary configuration for clustering, deploy the configuration to your environment.

1. Log into the Liferay Cloud console.

1. Click *Builds* at the top-right of the screen to access the Builds page.

1. Click the Actions menu ![Actions menu icon](../../images/icon-actions.png) for the build corresponding to the commit with your new changes, and select *Deploy build to...*

   ![Select the build to deploy with your commit message from the Builds page.](./setting-up-clustering-for-the-liferay-service/images/01.png)

1. Select your production environment in the *Environment* drop-down menu.

1. Check the boxes acknowledging the impacts of the deployment.

   ![Choose the production environment and complete the form to deploy the build.](./setting-up-clustering-for-the-liferay-service/images/02.png)

1. Click *Deploy Build*.

Once your services restart, clustering is enabled, and you have two nodes of the Liferay service.

Next: [configure the Liferay service to auto-scale](./configuring-auto-scaling.md) for even more instances when they are needed.

## Related Concepts

* [Setting Up Clustering in Liferay Cloud](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud)
* [Configuring the Liferay Service](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service)
* [Deploying Changes via the Liferay Cloud Console](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console)
* [Deploying Changes via the CLI Tool](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool)
* [Liferay Service Environment Variables](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/liferay-service-environment-variables)
