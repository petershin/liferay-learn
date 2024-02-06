---
taxonomy-category-names:
- Cloud
- Cloud Platform Builds and Deployments
- Liferay PaaS
uuid: 92d2c151-9db3-4b3e-a8f3-fd6ff298592a
---
# Deploying Changes via the CLI Tool

With the CLI tool, you can directly deploy local project changes without triggering a Jenkins build or using the Liferay Cloud Console. This tutorial walks through the process of adding a portal property to the Liferay service and deploying it to the `dev` using the CLI tool.

To get started, you first need the [CLI tool](../reference/command-line-tool.md) installed and ready to use, as well as a local copy of your project's Git repository (e.g., [GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository), [Bitbucket](https://confluence.atlassian.com/bitbucketserver/clone-a-repository-790632786.html), [GitLab](https://docs.gitlab.com/ee/university/training/topics/getting_started.html#instantiate-workflow-with-clone)).

```{note}
Although the CLI tool provides a quick way to deploy changes to your project, it's best practice to use the CI service and Liferay Cloud console for the majority of deployments. See [Deploying Changes via the Liferay Cloud Console](./deploying-changes-via-the-liferay-cloud-console.md) to learn how.
```

Otherwise, you can skip this step and begin the deployment process:

* [Adding a Portal Property to the Liferay Service](#adding-a-portal-property-to-the-liferay-service)
* [Deploying Your New Build via the CLI Tool](#deploying-your-new-build-via-the-cli-tool)
* [Verifying Your Sample Deployment](#verifying-your-sample-deployment)

## Adding a Portal Property to the Liferay Service

Begin the deployment life cycle by adding a portal property to the `dev` environment's Liferay service and committing your changes:

1. Ensure your local master branch is up-to-date with the latest version of your project's repository.

1. Create a new working branch based on your up-to-date master branch.

   ```bash
   git checkout -b example-cli-deployment-branch
   ```

1. Go to `<project>\liferay\configs\dev\`, and add the following property to the `portal-env.properties` file:

   ```properties
   web.server.display.node=true
   ```

1. Add and commit your changes with the following commands:

   ```bash
   git add .
   ```

   ```bash
   git commit -m "Test - Adding Portal Property"
   ```

## Deploying Your New Build via the CLI Tool

Once you've committed your changes, follow these steps to create a build of your Liferay service with Gradle, and then deploy it to your `dev` environment using the CLI tool:

1. Open your terminal, and navigate to the Liferay service folder.

   ```bash
   cd <project-folder>/liferay
   ```

1. Run `lcp login`. If you're not already logged in, you are prompted to authenticate your credentials via browser.

1. Run the following commands in sequence to create a Gradle build for your Liferay service:

   ```bash
   ./gradlew clean deploy createDockerfile
   ```

   You must first create a Gradle build of the Liferay service before running the `lcp deploy` command. No local build process is required for other services, so you can directly deploy backup, CI, database, search, and webserver services.

1. Copy the `LCP.json` file into the Docker directory before deploying the build.

   ```bash
   cp LCP.json build/docker
   ```

   ```bash
   cd build/docker
   ```

   You must copy the `LCP.json` file into the Docker directory, because the `lcp deploy` command must be run from a directory with the service's `LCP.json` file when deploying that service.

1. Run the following command to deploy the build to your `dev` environment:

   ```bash
   lcp deploy --project=<project-name> --environment=dev
   ```

   ![You can view the progress of your deployment in the terminal.](./deploying-changes-via-the-cli-tool/images/01.png)

   During this process, your new build is added to your project and deployed to the `dev` environment. At this time, the Liferay service should restart with the new portal property.

## Verifying Your Sample Deployment

Once your build has successfully deployed and your `dev` environment's Liferay service is *Ready*, follow these steps to verify your changes:

1. Navigate to your project's `dev` environment.

1. Go to the *Web Server* service's page, and click on its URL to access the `dev` environment's Liferay instance: `https://webserver-<project-name>-dev.lfr.cloud/`.

   ![Click on the Web Server URL to access the dev environment's Liferay instance.](./deploying-changes-via-the-cli-tool/images/02.png)

1. Verify the web server node is displayed at the bottom of the Home Page.

   ![Verify the webserver node is displayed at the bottom of the Home Page.](./deploying-changes-via-the-cli-tool/images/03.png)

## Related Topics

* [Command-Line Tool](../reference/command-line-tool.md)
* [Overview of the Liferay Cloud Development Workflow](./overview-of-the-liferay-cloud-deployment-workflow.md)
* [Deploying Changes via the Liferay Cloud Console](./deploying-changes-via-the-liferay-cloud-console.md)
