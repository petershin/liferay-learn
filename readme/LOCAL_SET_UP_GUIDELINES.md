# Locale Set Up Guidelines

To run a local version of [learn.liferay.com](https://learn.liferay.com) there are two primary steps. First you must generate all of the docs contained in this repo, then you must deploy them to a local liferay instance. The following are instructions for doing just that.

## Step 1: Generate Docs

1. Ensure you have Java 11 installed and ready to use. (check by running `java --version`)
1. From the root of this repo, run `./generate_docs.sh`

## Step 2: Setup Liferay Environment

1. Ensure you have Docker installed and running (check by running `docker --version`)
1. Startup a liferay instance running `docker run -p 8080:8080 --name dxp liferay/dxp:latest`
1. Ensure you have the [Liferay Portal Repo](https://github.com/liferay/liferay-portal) cloned on your machine
1. From your Liferay Portal Repo locally, go to `workspaces/liferay-learn-workspace`
1. From the Liferay Learn Workspace directory run `./gradlew deploy "-Ddeploy.docker.container.id=dxp"`
1. You should now be able to navigation to `http://localhost:8080/web/liferay-learn` and see an empty learn site. The site should be up and running, but if you try to click on any of the categories you will see there are no articles. Yet
1. In order to host your images startup a Caddy server by running `docker run -p 8000:80 --name caddy -v ./site/images:/public_html/images liferay/caddy`

*Note*
You are also welcome to spin up your local instance however you want (ie just using tomcat) and deploy the modules there as you normally would.

## Step 3: Deploy Docs

1. Login to your [liferay instance](http://localhost:8080) and navigate to `Control Panel` > `OAuth 2 Administration`
1. Click on `Liferay Learn Etc Cron Oauth Application Headless Server` and copy both `Client ID` and `Client Secret`
1. Export the following environment variables in your terminal (replacing the values with approiate content from prior steps)
    ```
    export LIFERAY_LEARN_ETC_CRON_ROOT_DIR=[Your Path to Liferay Learn Repo]
    export LIFERAY_LEARN_ETC_CRON_LIFERAY_OAUTH_CLIENT_ID=[Your Client ID]
    export LIFERAY_LEARN_ETC_CRON_LIFERAY_OAUTH_CLIENT_SECRET=[Your Client Secret]
    ``` 
1. In your Liferay Portal Repo, navigate to `workspaces/liferay-learn-workspace/client-extensions/liferay-learn-etc-cron`
1. From the Liferay Learn ETC Cron directory run `./gradlew run`