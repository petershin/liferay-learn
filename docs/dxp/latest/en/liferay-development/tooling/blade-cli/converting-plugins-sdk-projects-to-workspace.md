---
uuid: 9675dd8d-a1f6-4288-8bc7-1e4a80ca81e8
---

# Converting Plugins SDK Projects with Blade CLI

Blade CLI can migrate a Plugins SDK project to a Liferay Workspace automatically. During the process, the Ant-based Plugins SDK project is copied to the applicable workspace folder based on its project type (e.g., `wars`) and is converted to a Gradle-based Liferay Workspace project. This speeds up the migration process when upgrading to a Liferay Workspace from a legacy Plugins SDK.

To copy your Plugins SDK project and convert it to Gradle, use the Blade `convert` command:

1. Make sure the projects in your Plugins SDK are ready to deploy. For example, Service Builder services should already be generated. 

1. Navigate to the root folder of your workspace in a command line tool.

1. Execute the following command:

    ```bash
    blade convert -s [PLUGINS_SDK_PATH] [PLUGINS_SDK_PROJECT_NAME]
    ```

    You must provide the path of the Plugins SDK your project resides in and the project name you want to convert. If you prefer converting all the Plugins SDK projects at once, replace the project name variable with `-a` (i.e., specifying all plugins).

The Gradle conversion process also works for themes; they're converted to leverage NodeJS automatically. If you're converting a Java-based theme, add the `-t` option to your command too. This incorporates the [Theme Generator](../../customizing-liferays-look-and-feel/themes/setting-up-an-environment-and-creating-a-theme.md) Gradle plugin for the theme instead. 

!!! note
    When converting a Service Builder project, the `convert` task automatically extracts the project's service interfaces and implementations into OSGi modules (i.e., *-impl and *-api) and places them in the workspace's `modules` folder. Your portlet and controller logic remain a WAR and reside in the `wars` folder.

Your project is successfully converted to a Gradle-based workspace project! Great job!
