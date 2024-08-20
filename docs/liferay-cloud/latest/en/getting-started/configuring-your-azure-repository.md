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

## Creating an Azure Repository



## Transferring from GitHub to Azure

## Generating Access Tokens for Azure

## Connecting Azure to Your Jenkins Service

## Connecting to a Private Azure Server

## Verifying Builds

## Related Topics

- [Configuring Your GitHub Repository](./configuring-your-github-repository.md)
- [Configuring Your BitBucket Repository](./configuring-your-bitbucket-repository.md)
- [Configuring Your GitLab Repository](./configuring-your-gitlab-repository.md)
