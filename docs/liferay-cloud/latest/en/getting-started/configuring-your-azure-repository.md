---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: 2bb866ab-12f8-45ee-bc20-5ea889744925
---
# Configuring Your Azure Repository

Upon receiving a Liferay Cloud onboarding email, you're provisioned a GitHub repository hosted in the `dxpcloud` organization. This repository is a template for a team's separate private Liferay Cloud development repository and is typically removed after 10 business days. Users must:

1. Transfer the provisioned repository to their own private repository.
1. Integrate their private repository with the Jenkins (CI) service in Liferay Cloud using a Webhook.

The provisioned repository will be on GitHub, but you can transfer it to a GitLab repository as of version 3.2.0 of the Jenkins service. This must be done with administrative access to the GitLab repository.

!!! note
    The repository's administrators *are not necessarily the same* as your project's administrators in the Cloud console.

## Preparing the Jenkins Service

If you've customized your Jenkinsfile, follow this guide to [extend the default Jenkinsfile](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile).

## Importing from GitHub to Azure

1. Go to [Azure DevOps](https://dev.azure.com/).

1. Click *New project*.

   ![Click New project to begin creating a new Azure repository.](./configuring-your-azure-repository/images/01.png)

1. Provide a name for the project.

1. Ensure the visibility is set to private.

1. Click *Repos* in the side navigation.

1. Click *Import* under *Import a repository*.

   ![Click Inport to open the import modal.](./configuring-your-azure-repository/images/02.png)

1. Insert the GitHub repository's URL into *Clone URL*.

1. Select *Requires Authentication*.

   ![Import the GitHub repository using the import modal.](./configuring-your-azure-repository/images/03.png)

1. Fill out the Username and Password/PAT fields and click *Import*.

If you need help creating, cloning, and pushing repositories, see [Azure's documentation](https://learn.microsoft.com/en-us/azure/devops/user-guide/code-with-git?toc=%2Fazure%2Fdevops%2Fget-started%2Ftoc.json&view=azure-devops).

## Generating Access Tokens for Azure

Next, create an access token that will be used by the Webhook to trigger Jenkins builds:

1. Navigate to the personal access tokens page.

   ![Create a personal access token for GitLab, which cannot be accessed again later.](./configuring-your-azure-repository/images/04.png)

1. Click *New Token*.

1. Provide a name and an expiration date for this token.

1. Configure the access token to have the following permissions:

   - ****:

## Connecting Azure to Your Jenkins Service

## Connecting to a Private Azure Server

## Verifying Builds

## Related Topics

- [Configuring Your GitHub Repository](./configuring-your-github-repository.md)
- [Configuring Your BitBucket Repository](./configuring-your-bitbucket-repository.md)
- [Configuring Your GitLab Repository](./configuring-your-gitlab-repository.md)
