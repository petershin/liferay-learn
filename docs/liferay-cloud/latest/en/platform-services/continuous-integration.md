---
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
uuid: 7c189c0f-2937-4adf-b0a6-d7e1741c3cd8
---
# Continuous Integration

Liferay Cloud uses [Jenkins](https://jenkins.io/) to power its continuous integration infrastructure service. When you send a pull request or push a commit to one of your pre-configured GitHub branches, an automatic and configurable build is triggered.

```{note}
Liferay Cloud customers (using the `customer` login) have permissions to manage and review their builds, but do not have full administrative privileges.
```

By default, this automated build compiles code and can be configured to execute tests. Liferay Cloud builds your services and shows their status on your environment's Builds page. If the tests fail, you can check the Jenkins dashboard and logs at `https://ci-companyname-infra.lfr.cloud`.

```{note}
Continuous integration only works if you deploy from GitHub, GitLab, or Bitbucket, *not* the CLI.
```

See the [CI service limitations](../reference/platform-limitations.md#continuous-integration-service) for more information.

## Using the Default Jenkinsfile

The CI service includes a default Jenkinsfile used for your project's builds. The default Jenkinsfile encapsulates all the logic that was previously stored on the Jenkinsfile and moves it to a Jenkins plugin. This means that all bug fixes, security fixes, and improvements can be applied without requiring any CI configuration.

Additionally, extension points are available to customize every step of the CI pipeline.

### Extending the Default Jenkinsfile

To extend the default Jenkinsfile, you can add the following files to the `ci` folder in your project repository:

- `Jenkinsfile-before-all`
- `Jenkinsfile-before-cloud-build`
- `Jenkinsfile-before-cloud-deploy`
- `Jenkinsfile-after-all`
- `Jenkinsfile-post-always`

Here is a basic overview of the steps in the CI build process:

1. Load `ci/Jenkinsfile-before-all`, if it exists.

1. Build the Liferay Workspace.

1. Load `ci/Jenkinsfile-before-cloud-build`, if it exists.

1. Create the Liferay Cloud build that you see in console.

1. Load `ci/Jenkinsfile-before-cloud-deploy`, if it exists.

1. If the current branch is the deploy branch, you can deploy the build to an environment in the cloud. The `LCP_CI_DEPLOY_BRANCH` environment variable sets the deploy branch, while `LCP_CI_DEPLOY_TARGET` specifies the deployment environment.

1. Load `ci/Jenkinsfile-after-all`, if it exists. This runs when all build steps are completed.

1. Load `ci/Jenkinsfile-post-always`, if it exists. This runs whether the build succeeds or fails.

To see how they are used in the default pipeline, monitor the Jenkins service startup logs. The full default Jenkinsfile is printed out in the startup logs.

## Extra Pipeline Customization and External Calls

It is possible to use the additional steps in your pipeline to call external services. For example, you may call a third-party monitoring service through REST API, or call a script to run during the build process.

You can also create your own pipeline by defining your own `Jenkinsfile` in your repository's `ci/` folder. See the [Jenkins website](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/) for more information.

```{warning}
External services or custom pipelines should be used with discretion and are outside the scope of Liferay Cloud Support. Custom Jenkins plugins are not supported.
```

## Reusing Code Between Different Extension Points

You will likely want a way to share code between these extension points. One basic way is to load a groovy script. For example, you could create a groovy file in the `ci/` folder called `util.groovy` with these contents:

```
def sendSlackMessage(message) {
	println(message)
}

return this
```

Then you could insert the following in `ci/Jenkinsfile-before-cloud-build`:

```
def util = load("ci/util.groovy")

util.sendSlackMessage("About to create Liferay Cloud build...")
```

## Environment Variables Reference

The following environment variables are only used in the default Jenkinsfile. To see what they do please refer to [Jenkins documentation regarding pipeline options](https://jenkins.io/doc/book/pipeline/syntax/#options).

Name                                          | Default Value   | Description |
:--- | :--- | :--- |
`LCP_CI_ARTIFACT_DAYS_TO_KEEP`        | `-1`            | Number of days that artifacts are stored |
`LCP_CI_ARTIFACT_NUM_TO_KEEP`         | `1`             | Set the number of recent builds for which *artifacts* and *stashes* are preserved. |
`LCP_CI_BUILD_DAYS_TO_KEEP`           | `14`            | Number of days that builds are stored |
`LCP_CI_BUILD_NUM_TO_KEEP`            | `10`            | Number of builds that are stored |
`LCP_CI_BUILD_TIMEOUT_MINUTES`        | `30`            | Set a timeout period for the Pipeline run, after which Jenkins should abort the Pipeline  |
`LCP_CI_CLI_LOG_LEVEL`                |                 | If set to `verbose`, the CI service uses the `--verbose` flag when performing lcp commands. This provides more information for debugging when the commands are run. |
`LCP_CI_DEPLOY_BRANCH`                | `develop`       | Specify the branch to use for [automatic deployment](../updating-services-in-liferay-paas/automatically-deploying-ci-service-builds.md). If not set to a valid branch name, automatic deployment is disabled. |
`LCP_CI_DEPLOY_TARGET`                |                 | Sets the environment [automatic deployment](../updating-services-in-liferay-paas/automatically-deploying-ci-service-builds.md) will deploy to. Only used if `LCP_CI_DEPLOY_BRANCH` is set. |
`LCP_CI_LIFERAY_DXP_HOTFIXES_[ENV]`   |                 | The name of a hotfix (without the `.zip` extension) for CI to apply automatically when deploying the Liferay service. Replace `[ENV]` with the environment name (in all-caps), or `COMMON`. |
`LCP_CI_PRESERVE_STASHES_BUILD_COUNT` | `20`            | Set the number of recent builds for which *stashes* are preserved. Stashes cannot be preserved for more builds than allowed by the `LCP_CI_ARTIFACT_NUM_TO_KEEP` variable. |
`LCP_CI_SCM_MANAGE_HOOKS`             | `true`          | Option to enable or disable [automatic web hook management](../getting-started/configuring-your-github-repository.md#personal-access-token-usage) for code hosting platforms (such as GitHub). |
`LCP_CI_SCM_PROVIDER`                 | `github`        | Sets which source control management service is used for retrieving builds. Accepted values are [`bitbucket`](../getting-started/configuring-your-bitbucket-repository.md), [`github`](../getting-started/configuring-your-github-repository.md), and [`gitlab`](../getting-started/configuring-your-gitlab-repository.md). |
`LCP_CI_SCM_REPOSITORY_NAME`          |                 | Sets the repository name used to retrieve builds (from GitHub, Bitbucket, or GitLab). |
`LCP_CI_SCM_REPOSITORY_OWNER`         |                 | The repository owner used to retrieve builds. |
`LCP_CI_SCM_TOKEN`                    |                 | The personal access token needed to access and retrieve builds from Bitbucket, GitHub, or GitLab. |
`LCP_CI_USE_DEFAULT_JENKINSFILE`      | `false`         | Option to enable or disable the Default Jenkinsfile |
`LCP_DATABASE_SERVICE`                |                 | The host name of the Database service. |

## Related Topics

* [Logging into your Liferay Cloud Services](../getting-started/logging-into-your-liferay-cloud-services.md)
* [Configuring Your GitLab Repository](../getting-started/configuring-your-gitlab-repository.md)
* [Configuring Your Bitbucket Repository](../getting-started/configuring-your-bitbucket-repository.md)
