---
uuid: a4730247-c6d1-49b6-b8e5-4f2c6616e585
---
# Liferay Workspace
<!--TASK: Rename Article-->

Liferay Workspaces are specialized development environments that serve as the foundation for Liferay projects. They streamline the entire project lifecycle for developers by providing tools for creating, building, deploying, and testing your projects. Each workspace supports Gradle (default) and Maven, and you can seamlessly create and manage your workspace using popular IDEs like Eclipse and IntelliJ IDEA. Workspaces work hand-in-hand with Liferay's CLI tools: *Blade CLI* for managing workspaces and projects, and the *Liferay Cloud CLI* for managing Cloud services and deploying client extensions to the Cloud Platform.

Typically, projects have a one-to-one relationship with a workspace and can include a wide variety of elements, such as client extensions, plugins, and fragments.

<!--TASK: Add diagram representing Liferay Workspace's folders and scripts structure. -->

Here you'll learn about the benefits of workspaces and set up the workspace you'll use throughout this course.

<!--TASK: Add video demo to article?-->

## Key Benefits of Liferay Workspaces

Solution development is often complex and difficult to coordinate. Liferay workspaces provide centralized solution management that supports the full development lifecycle across multiple environments. As such, they promote team-based development for all levels of solution contributors. Let's consider some of these benefits more closely.

* **Faster Development Cycles**: Streamlined project management, pre-configured properties, and Gradle automation minimize development effort and accelerate project completion.

* **Lower Technical Barrier**: Workspace tools and automation lower the technical barrier for contributing to Liferay projects.

* **Centralized Collaboration**: Using one workspace for each project helps facilitate collaboration among developers by providing a centralized space for managing and sharing project resources.

* **Improved Consistency**: Standardized project structures and configurations within the workspace help maintain consistency across different Liferay modules and applications.

* **Simplified Testing**: Integration with Docker provides efficient setup for different environments (Development, UAT, Production) and helps facilitate thorough testing processes.

To bring these benefits back to the Clarity story, workspaces introduce standards and processes to ensure that any customizations their developers create follow an expected pattern, enabling individual team members to pick up another’s work with no knowledge transfer required. Also, while workspaces are not for the non-technical user, the tools and automation found in workspaces means that Clarity developers can ramp up and be productive in a shorter period of time because they don’t have to be experts in Liferay to get something done.

## Exercise: Setting Up the Clarity Workspace

As explained in the previous module, you'll help implement Clarity's enterprise website throughout this course. Instead of starting from scratch, you'll use a partially complete website provided in a Liferay workspace: [Enablement Bootcamp Clarity](https://github.com/liferay/enablement-bootcamp-clarity). Here you'll set up this workspace locally in preparation for the following modules.

To do this,

1. Open your terminal and clone the training workspace to your computer:

   ```bash
   git clone https://github.com/liferay/enablement-bootcamp-clarity
   ```

   This saves a copy of the project in your current terminal directory.

   !!! important
       If you've cloned the repo previously, ensure your workspace is up to date by running `git pull origin main`.

1. Go to the workspace's root folder in your terminal:

   ```bash
   cd enablement-bootcamp-clarity/
   ```

1. Initialize your Liferay bundle.

   ```bash
   blade server init
   ```

   This downloads and builds dependencies for running Liferay, including the Liferay Tomcat server.

   If you don't have Blade installed, run the correct `gradlew` command for your OS:

   * **Unix-based**:

      ```bash
      ./gradlew initBundle
      ```

   * **Windows**:

      ```bash
      .\gradlew.bat initBundle
      ```

1. Use Blade to start your Liferay server:

   ```bash
   blade server run
   ```

   Alternatively,

   * **Unix-based**:

      ```bash
      ./bundles/tomcat/bin/catalina.sh run
      ```

   * **Windows**:

      ```bash
      .\bundles\tomcat\bin\catalina.bat run
      ```

   !!! tip
       Wait until you see `org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds` to indicate startup completion.

1. When finished, access your Liferay DXP instance by going to `localhost:8080` in your browser.

1. Sign in using these credentials:

   * Username: `admin@clarityvisionsolutions.com`
   * Password: `learn`

1. Take some time to explore the site and resources included in the training workspace.

## Exercise (Bonus): Using Blade to Create Workspaces from Scratch

Creating a workspace from scratch is a simple task using Liferay's Blade CLI tool.

To do this,

1. In your terminal, run this command to list available Liferay DXP versions:

   ``` bash
   blade init -l
   ```

   !!! tip
       For optimal performance and all the latest features, we recommend using Liferay DXP's latest version.

1. Run this command with your chosen version and a name for your workspace:

   ``` bash
   blade init -v [Liferay version] [workspace name]
   ```

   For example,

   ``` bash
   blade init -v dxp-2024.q2.0 clarity-customer-portal
   ```

1. Verify the workspace was created successfully.

   It should include these files and folders:

   ```log
   ├── build.gradle
   ├── configs
   │   ├── common
   │   │   └── portal-setup-wizard.properties
   │   ├── dev
   │   │   └── portal-ext.properties
   │   ├── docker
   │   │   └── portal-ext.properties
   │   ├── local
   │   │   └── portal-ext.properties
   │   ├── prod
   │   │   ├── osgi
   │   │   │   └── configs
   │   │   │       └── com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.config
   │   │   └── portal-ext.properties
   │   └── uat
   │       ├── osgi
   │       │   └── configs
   │       │       └── com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.config
   │       └── portal-ext.properties
   ├── Dockerfile.ext
   ├── GETTING_STARTED.markdown
   ├── gradle
   │   └── wrapper
   │       ├── gradle-wrapper.jar
   │       └── gradle-wrapper.properties
   ├── gradle-local.properties
   ├── gradle.properties
   ├── gradlew
   ├── gradlew.bat
   ├── modules
   ├── platform.bndrun
   ├── settings.gradle
   └── themes
   ```

## Conclusion

Great! Now you're ready to start contributing to Clarity's enterprise website! But before moving on, let's explore client extensions and better understand how they relate to Liferay workspaces.

Up Next: [Client Extensions](./client-extensions.md)

## Additional Resources

See our documentation to learn more about Liferay Workspaces and our development tools:

* [Liferay Workspace](https://learn.liferay.com/web/guest/w/dxp/building-applications/tooling/liferay-workspace)
* [Creating A Liferay Workspace](https://learn.liferay.com/w/dxp/liferay-development/tooling/liferay-workspace/creating-a-liferay-workspace)
* [Blade CLI](https://learn.liferay.com/w/dxp/liferay-development/tooling/blade-cli)
