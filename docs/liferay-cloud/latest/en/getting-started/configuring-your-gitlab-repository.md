---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Liferay PaaS
uuid: 7490962d-e315-41bc-8a39-1f93ea03d69e
---
# Configuring Your GitLab Repository

Your Liferay Cloud onboarding email contains a link to a GitHub repository hosted in the `dxpcloud` organization. This repository is a template for a team's private Liferay Cloud development repository and is typically removed after 10 business days. Users must

1. Transfer the provisioned repository to their own private repository.
1. Integrate their private repository with the Jenkins (CI) service in Liferay Cloud using a Webhook.

The provisioned repository is on GitHub, but you can transfer it to a GitLab repository as of version 3.2.0 of the Jenkins service. This must be done with administrative access to the GitLab repository.

!!! note
    The repository's administrators *are not necessarily the same* as your project's administrators in the Cloud console.

## Preparing the Jenkins Service

If you've customized your Jenkinsfile, follow this guide to [extend the default Jenkinsfile](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile).

## Creating a GitLab Repository

First, create a new GitLab repository:

1. Go to [GitLab](https://gitlab.com).

1. Click *New project*.

   ![Click New project to begin creating a new GitLab repository.](./configuring-your-gitlab-repository/images/01.png)

1. Provide a project slug (the repository name in the url).

   ![Fill in the details for your new repository.](./configuring-your-gitlab-repository/images/02.png)

1. Configure the visibility level to private (free users have unlimited private repositories).

1. Ensure *Initialize repository with a README* is unchecked.

1. Click *Create project*.

## Transferring from GitHub to GitLab

Follow these steps to transfer the provisioned GitHub repository to your own GitLab repository:

1. Clone the provisioned GitHub repository locally:

   ```bash

   git clone git@github.com:dxpcloud/example.git

   ```

   !!! note
       If you have already cloned the repository to work with another provider, you can skip this step and work within the same clone.

1. Add a new Git remote and point to GitLab:

   ```bash 

   git remote add gitlab git@gitlab.com:USERNAME/REPOSITORYNAME.git

   ```

1. Push the cloned repository to the new remote repository:

   ```bash 

   git push gitlab master

   ```

If you need help creating, cloning, and pushing repositories, see [GitLab's documentation](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html).

## Generating Access Tokens for GitLab

Next, create an access token to be used by the Webhook to trigger Jenkins builds:

1. Navigate to the [personal access tokens page](https://gitlab.com/profile/personal_access_tokens).

   ![Create a personal access token for GitLab, which cannot be accessed again later.](./configuring-your-gitlab-repository/images/03.png)

1. Provide a name and an expiration date for this access token.

1. Configure the access token to have the following permissions:

   - api
   - read_repository
   - write_repository

1. Click *Create personal access token*.

1. Copy your access token and save it somewhere (it doesn't appear again).

## Connecting GitLab to Your Jenkins service

Lastly, set environment variables in the Jenkins service's to point to your new repository:

1. Log in to the Liferay Cloud Console and navigate to your Jenkins service in the `infra` environment.

1. Navigate to the *Environment Variables* tab.

1. Configure the following environment variables:

| Name                          | Value          |
| :---------------------------- | :------------- |
| `LCP_CI_SCM_PROVIDER`         | gitlab         |
| `LCP_CI_SCM_REPOSITORY_OWNER` | [repo owner]   |
| `LCP_CI_SCM_REPOSITORY_NAME`  | [repo name]    |
| `LCP_CI_SCM_TOKEN`            | [access token] |

After updating these environment variables, the Jenkins service restarts. Any pushed branches and pull requests in your new repository trigger builds.

## Connecting to a Private GitLab Server

To use a private GitLab server, you must set an additional environment variable in your Jenkins service:

| Name                     | Value              |
| :----------------------- | :----------------- |
| `LCP_CI_SCM_SERVER_HOST` | [private host URL] |

Set the `LCP_CI_SCM_SERVER_HOST` variable to the base URL of your private GitLab server (for example, `http://private.gitlab.server.com/`). This sets the server URL that CI uses to retrieve your code base when generating builds and linking to your repository's branches. By default, CI uses `https://gitlab.com/` as the base URL for GitLab.

## Additional GitLab Webhook Configurations

Liferay Cloud's Jenkins service creates a webhook for your selected git SCM provider; however, it only creates the default one. GitLab's default webhook requires additional configuration to match the functionality of GitHub and BitBucket's webhooks.

1. Navigate to your GitLab repository.

1. Navigate to *Settings* and select *Webhooks*.

1. Under *Project Hooks*, verify the created webhook appears.

1. Click the *Edit* button for the CI webhook.

   ![Edit the webhook that has been automatically created for your repository.](./configuring-your-gitlab-repository/images/04.png)

1. Uncheck *Tags push events* and *Comments*.

1. Check *Enable SSL verification*.

1. Click *Save changes*.

## Verifying Builds

Pushed branches and merge requests (GitLab's equivalent of pull requests) trigger builds that you can see or deploy from the *Builds* tab in the Liferay Cloud Console. After setting up integration with the Jenkins service, a good next step is to verify these builds, to ensure that the integration was successful.

### Verifying Builds from Pushed Branches

Verify that new Git pushes trigger Jenkins builds:

1. Make a change to the repository (like adding a file), then commit it to the branch:

   ```bash
   git commit -m "Add file to test builds"
   ```

1. Push the branch up to GitLab:

   ```bash
   git push gitlab branch-name
   ```

1. Navigate to the *Builds* page in the Liferay Cloud Console.

1. Verify that the build displays for the pushed branch on the *Builds* page.

### Verifying Builds from Merge Requests

Verify that new merge requests trigger Jenkins builds:

1. Create a merge request from any branch to the `develop` branch.

1. Verify that a new build is created for the merge request.

1. Navigate to the Builds page in the Liferay Cloud Console.

1. Click the links for the branch and commit in the appropriate build.

   ![Check the links for the branch and commit for your build, on the Builds page.](./configuring-your-gitlab-repository/images/05.png)

1. Verify that the links redirect to the correct GitLab pages.

## Related Topics

- [Configuring Your GitHub Repository](./configuring-your-github-repository.md)
- [Configuring Your BitBucket Repository](./configuring-your-bitbucket-repository.md)
- [Configuring Your Azure Repository](./configuring-your-azure-repository.md)
