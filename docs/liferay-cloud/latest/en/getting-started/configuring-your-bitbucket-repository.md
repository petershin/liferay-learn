---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: 4cc9c375-56da-4f38-83d3-7f0c9a58840c
---
# Configuring Your Bitbucket Repository

Your Liferay Cloud onboarding email contains a link to a GitHub repository hosted in the `dxpcloud` organization. This repository is a template for a team's private Liferay Cloud development repository and is typically removed after 10 business days. Users must

1. Transfer the provisioned repository to their own private repository.
1. Integrate their private repository with the Jenkins (CI) service in Liferay Cloud using a Webhook.

The provisioned repository is on GitHub, but you can transfer it to a BitBucket repository as of version 3.2.0 of the Jenkins service. This must be done with administrative access to the BitBucket repository.

!!! note
    The repository's administrators *are not necessarily the same* as your project's administrators in the Cloud console.

## Preparing the Jenkins Service

If you've customized your Jenkinsfile, follow this guide to [extend the default Jenkinsfile](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile).

## Creating a Bitbucket Repository

First, create a new Bitbucket repository.

1. Go to [Bitbucket](https://bitbucket.org).

1. Click the "+" icon in the sidebar under the search icon.

   ![Click the + icon to begin creating a new BitBucket repository.](./configuring-your-bitbucket-repository/images/01.png)

1. Click *Repository* to start creating a new repository.

   ![Fill in the details for your new repository.](./configuring-your-bitbucket-repository/images/02.png)

1. Provide a name for the repository.

1. Ensure the access level is set to private.

1. Set *Include a README?* to *No*.

1. Click *Create repository*.

## Transferring from GitHub to Bitbucket

Follow these steps to transfer the provisioned GitHub repository to your own Bitbucket repository:

1. Clone the provisioned GitHub repository locally:

   ```bash

   git clone git@github.com:dxpcloud/example.git

   ```

   !!! note
       If you have already cloned the repository for work with another provider, then you can skip this step and work within the same clone.

1. Add a new Git remote and point to Bitbucket:

   ```bash

   git remote add bitbucket git@bitbucket.org:example/example.git

   ```

1. Push the cloned repository to the new remote repository:

   ```bash

   git push bitbucket master

   ```

If you need help creating, cloning, and pushing repositories, see [Bitbucket's documentation](https://confluence.atlassian.com/bitbucket/create-a-git-repository-759857290.html).

## Generating App Password for BitBucket

Next, create an app password that will be used by the Webhook to authenticate with Bitbucket and trigger Jenkins builds. The Bitbucket user that generates the app password **must** have admin-level access to the repository.

Perform the following steps to generate an app password:

1. From your user settings page, under *Access Management* click *App passwords*.

   ![Click App passwords under the user settings page.](./configuring-your-bitbucket-repository/images/03.png)

1. Click *Create app password*.

   ![Generate a new app password, which cannot be accessed again later.](./configuring-your-bitbucket-repository/images/04.png)

1. Provide a label for the app password.

1. Grant the app the following permissions:

   - `Pull request - read, write` (this should also flag Repositories - read, write)
   - `Webhooks -  read, write`

1. Click *Create*.

1. Copy the app password (it does not appear again). This is BitBucket's equivalent of a personal access token.

!!! important
    The user that generated the app password must use their username for the `LCP_CI_SCM_USERNAME` environment variable.

## Checking Branch Types and Prefixes

In order for Liferay Cloud to be able to properly link to your branches, you must provide it with a complete list of the branch prefixes in use in your repository. Each of the branch types used in your repository has its own prefix, which is defined in the repository's settings.

On [the Bitbucket website](https://bitbucket.org), click *Repository settings* &rarr; *Branching model* from the menu on the left. This brings you to the *Branching model* page, where the prefix for each of your branches appears. Take note of each of these prefixes to add them to the `LCP_CI_SCM_BITBUCKET_BRANCH_PREFIXES` CI environment variable.

![The default branch types (and prefixes) for a Bitbucket repository are bugfix/, feature/, hotfix/, and release/.](./configuring-your-bitbucket-repository/images/05.png)

## Connecting BitBucket to Your Jenkins Service

Lastly, set environment variables in the Jenkins service's to point to your new repository:

1. Log in to the Liferay Cloud Console and navigate to your Jenkins service in the `infra` environment.

1. Navigate to the *Environment Variables* tab.

1. Configure the following environment variables:

| Name                                   | Value              |
| :------------------------------------- | :----------------- |
| `LCP_CI_SCM_PROVIDER`                  | bitbucket          |
| `LCP_CI_SCM_REPOSITORY_OWNER`          | [repo owner]       |
| `LCP_CI_SCM_REPOSITORY_NAME`           | [repo name]        |
| `LCP_CI_SCM_TOKEN`                     | [app password]     |
| `LCP_CI_SCM_USERNAME`                  | [auth username]    |
| `LCP_CI_SCM_BITBUCKET_BRANCH_PREFIXES` | [list of prefixes] |

Define `LCP_CI_SCM_USERNAME` as the user that [generated the app password](#generating-app-password-for-bitbucket). Define `LCP_CI_SCM_BITBUCKET_BRANCH_PREFIXES` as a list of all [prefixes used in your repository's branches](#checking-branch-types-and-prefixes), separated by spaces.

After updating these environment variables, the Jenkins service restarts. Any pushed branches and pull requests in your new repository should now trigger.

## Connecting to a Private Bitbucket Server

To use a private Bitbucket server, you must set an additional environment variable in your Jenkins service:

| Name                     | Value              |
| :----------------------- | :----------------- |
| `LCP_CI_SCM_SERVER_HOST` | [private host URL] |

Set the `LCP_CI_SCM_SERVER_HOST` variable to the base URL of your private Bitbucket server (for example, `http://private.bitbucket.org/`). This sets the server URL that CI uses to retrieve your code base when generating builds and linking to your repository's branches. By default, CI uses `https://bitbucket.org/` as the base URL for Bitbucket.

## Verifying Builds

Pushed branches and pull requests trigger builds that you can see or deploy from the Builds tab in the Liferay Cloud Console. After setting up integration with the Jenkins service, a good next step is to verify these builds, to ensure that the integration was successful.

### Verifying Builds from Pushed Branches

Verify that new Git pushes trigger Jenkins builds:

1. Make a change to the repository (like adding a file), then commit it to the branch:

   ```bash
   git commit -m "Add file to test builds"
   ```

1. Push the branch up to BitBucket:

   ```bash
   git push bitbucket branch-name
   ```

1. Navigate to the *Builds* page in the Liferay Cloud Console.

1. Verify that the build displays for the pushed branch on the Builds page.

### Verifying Builds from Pull Requests

Verify that new pull requests trigger Jenkins builds:

1. Create a pull request from any branch to the `develop` branch.

1. Verify that a new build is created for the pull request.

1. Navigate to the *Builds* page in the Liferay Cloud Console.

1. Click the links for the branch and commit in the appropriate build.

   ![Check the links for the branch and commit for your build, on the Builds page.](./configuring-your-bitbucket-repository/images/06.png)

1. Verify that the links redirect to the correct BitBucket pages.

## Related Topics

- [Configuring Your GitHub Repository](./configuring-your-github-repository.md)
- [Configuring Your GitLab Repository](./configuring-your-gitlab-repository.md)
- [Configuring Your Azure Repository](./configuring-your-azure-repository.md)
