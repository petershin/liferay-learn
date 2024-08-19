---
uuid: f8da5df3-56ab-4185-a9ee-27bcecdde03b
---
# Using Custom SQL Queries

Service Builder creates finder methods that retrieve entities by their attributes (their column values). When you add a column as a parameter for the finder in your `service.xml` file and run Service Builder, it generates the finder method in your persistence layer and adds methods to your service layer that invokes the finder. If your queries are simple enough, you can use Dynamic Query to access Liferay's database. If you want to do something more complicated (like JOINs), you can write your own custom SQL queries.

## Deploying an Example

```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps to deploy the example:

1. Download and unzip the `liferay-p9z0.zip` example project.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/liferay-development/liferay-internals/extending-liferay/liferay-p9z0.zip -O
   ```

   ```bash
   unzip liferay-p9z0.zip
   ```

1. Build and deploy the project module.

   ```bash
   cd liferay-p9z0
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
       This command is the same as copying the deployed jars to `/opt/liferay/osgi/modules` on the Docker container.

1. Confirm the deployment in the Liferay Docker container console.

   ```bash
   STARTED com.liferay.p9z0.web_1.0.0 [1386]
   STARTED com.liferay.p9z0.api_1.0.0 [1384]
   STARTED com.liferay.p9z0.service_1.0.0 [1385]
   ```

1. To verify the example module is working, open your browser to `https://localhost:8080`.

1. Add the P9Z0 Portlet to a page. You can find the example portlet under Sample in Widgets.

   ![Add the P9Z0 portlet to a page.](./using-custom-sql-queries/images/01.png)

1. Add an entry by entering a name and a description. Leave *Hidden* unchecked. Click *Add*, and the new entry appears under P9Z0 Entries.

1. Add another entry with a different name and description. This time, check *Hidden*. The new entry doesn't appear under P9Z0 Entries.

This example uses custom SQL to only retrieve entries with a specified value in the database (`_hidden = false`).

## Adding Custom SQL to the Code

## Related Topics