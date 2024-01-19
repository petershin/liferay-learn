---
taxonomy-category-names:
- Cloud
- Cloud Platform Builds and Deployments
- Liferay PaaS
uuid: f4d0e616-3513-4e2d-bebe-ab55ebe28774
---
# Automatically Deploying CI Service Builds

With Liferay Cloud, you can use webhooks to automatically trigger Jenkins builds for changes pushed or merged to your project's Git repository (e.g., [GitHub](../getting-started/configuring-your-github-repository.md#integrating-with-the-jenkins-service), [Bitbucket](../getting-started/configuring-your-bitbucket-repository.md#connecting-bitbucket-to-your-jenkins-service), [GitLab](../getting-started/configuring-your-gitlab-repository.md#connecting-gitlab-to-your-jenkins-service)). These builds can then be manually deployed to project environments via the Liferay Cloud Console. Alternatively, you can speed up the deployment process by configuring the CI service to automatically deploy successful builds from a specific branch to a specified environment.

By default, automatic deployment is controlled by the `LCP_CI_DEPLOY_BRANCH` and `LCP_CI_DEPLOY_TARGET` variables. Together they determine which branch is used to trigger automatic deployments as well as the environment to which the builds are automatically deployed. Their default values are set to `develop` and `dev` respectively.

If desired, you can configure automatic deployment by editing the `LCP_CI_DEPLOY_BRANCH` and `LCP_CI_DEPLOY_TARGET` variables via the Liferay Cloud Console:

1. Navigate to the `infra` environment for your Liferay Cloud Project to see its environment variables.

   ![Go to the CI service's page, and click on the Environment Variables tab](./automatically-deploying-ci-service-builds/images/01.png)

1. Add the following variables to the CI service:

   * **Key**: `LCP_CI_DEPLOY_BRANCH`

      **Value**: enter the desired branch name (e.g., `useracceptance`).

   * **Key**: `LCP_CI_DEPLOY_TARGET`

      **Value**: enter the desired environment name (e.g., `uat`).

1. Click on *Save Changes*. This causes the CI service to restart with the new variables.

Once restarted, any changes pushed or merged to your specified branch are automatically built and deployed to the target environment.

## Related Topics

* [Overview of the Liferay Cloud Development Workflow](./overview-of-the-liferay-cloud-deployment-workflow.md)
* [Deploying Changes via the Liferay Cloud Console](./deploying-changes-via-the-liferay-cloud-console.md)
* [Deploying Changes via the CLI Tool](./deploying-changes-via-the-cli-tool.md)
