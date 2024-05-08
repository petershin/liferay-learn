---
uuid: ff12f679-5b33-4023-bdaa-1254cd74e415
taxonomy-category-names:
- Development and Tooling
- Developer Tools
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Creating Code with Liferay Workspace

Liferay Workspace is the developer's tool for creating and managing Liferay development projects. 

## Creating Projects

[Blade CLI](../blade-cli/installing-and-updating-blade-cli.md) makes it easy to create projects in Liferay Workspace by providing pre-built project templates. Alternatively, you can create projects manually. 

### Creating a Project Using Blade CLI

1. From inside your workspace, find the project template that most closely matches what you want to do, using this command: 

   ```bash
   blade create -l
   ```

1. Once you've identified the template you want to use, generate your project. For example, to create a MVC Portlet, use this command: 

   ```bash
   blade create -t mvc-portlet -p com.acme.z3x1.portlet -c MyPortlet myproject-web
   ```

   This creates a project using the MVC Portlet template (`-t mvc-portlet`), generates the portlet class in the Java package you specify (`-p com.acme.z3x1.portlet`), specifies the name of the portlet class (`-c MyPortlet`), and names the project `myproject-web`. 

## Creating Projects Manually

You don't need Blade CLI to create projects. You can create a project folder manually if you wish: 

1. From inside your workspace, create a folder to house your project: 

   ```bash
   cd [my project name]
   ```

1. Create a `build.gradle` script for your project. Since you're using Liferay Workspace, most of the time you only need one dependency: 

   ```groovy
   dependencies {
        compileOnly group: "com.liferay.portal", name: "release.portal.api"
   }
   ```

1. Create the folder structure for your project. 

To write code to run on Liferay DXP, you must have a Liferay runtime on which to deploy it. Your first task, therefore, after installing Liferay Workspace should be to add a Liferay bundle to your workspace. 

## Using Liferay Workspace with the Liferay CLI Tool

The [Liferay CLI](../other-tools/liferay-cli-tool.md) tool can be used together with Liferay Workspace. See the Liferay CLI article to learn how to install the tool and generate a project.

!!! note
    Liferay workspace downloads its own node version (i.e. not necessarily your system’s version). If a different node version is needed, declare it in your `build.gradle` file.

```gradle
node {
	nodeVersion = "16.18.1"
	npmVersion = "8.19.2"
    ...
}
```

Make sure to run `gw clean` to clean out the build cache.

## Using the Themes Generator with Liferay Workspace

The Liferay Themes Generator is a node.js-based tool for creating themes to change the look and feel of your site. These projects can also be managed by Liferay Workspace. You can create theme projects with Blade or manually. 

To create a Theme Generator project with Blade, use this command: 

```bash
blade create -t js-theme [project-name]
```

This downloads Node.JS and `yo` for you, and then executes `yo liferay-theme` to get you started. 

You can also create a themes project in Workspace the same way you create it outside of Workspace: 

1. Assuming you've installed the themes generator, navigate to your Liferay Workspace. Like other projects, you can place your theme projects anywhere. Run the following command to create a theme project: 

   ```bash
   yo liferay-theme
   ```

1. Navigate into your new theme folder and run 

   ```bash
   ../gradlew build
   ```

   The above command assumes you're one folder down from the Workspace root; if you've nested your project (perhaps in a `themes` folder), adjust the call to `gradlew` accordingly. This command builds the frontend theme using Liferay's Node Gradle Plugin. 

To verify Workspace recognizes your project, use this command to display all the projects: 

```bash
./gradlew projects
```

## Adding a Liferay Bundle to Workspace

Workspace automates the download and setup of a runtime for your code. When you're ready to run your code on a server, it takes only a few steps to download one: 

1. Find the Liferay release you're targeting. 

   **DXP:** Browse [releases-cdn.liferay.com/dxp](https://releases-cdn.liferay.com/dxp), find the bundle you need, and copy its URL to your clipboard.

   **CE:** Browse [releases-cdn.liferay.com/portal](https://releases-cdn.liferay.com/portal), find the bundle you need, and copy its URL to your clipboard. 

1. When using a more recent versions of *gradle workspace plugins* (v10+), `liferay.workspace.product` is added automatically to your `gradle.properties` file. If using older versions, open `gradle.properties` from the root folder of your workspace and set the bundle URL property: 

   ```properties
   liferay.workspace.bundle.url=[paste the URL from your clipboard]
   ```

!!! warning
    If `liferay.workspace.product` is in your `gradle.properties` file, `liferay.workspace.bundle.url` is not required.

    If using Liferay DXP, also set these properties: 

    ```properties
    liferay.workspace.bundle.token.download=true
    liferay.workspace.bundle.token.email.address=[enter the email address registered on liferay.com]
    liferay.workspace.bundle.token.password=[enter your liferay.com password]
    ```

   Save and close the file. 

1. Ready to download the bundle? Run this command: 

   ```bash
   ./gradlew initBundle
   ```

   Or if you prefer Blade, 

   ```bash
   blade server init
   ```

If on DXP, for security reasons you should remove your password from the properties file after your bundle has downloaded. 

## Deploying Code via Liferay Workspace

You can deploy your code to the Liferay bundle you added in the step above or to a Docker container running Liferay. 

### Deploying Code to a Liferay Bundle

Deploying your code to a bundle added to a Liferay Workspace is a snap. From your project folder, run this Gradle task: 

```bash
../gradlew deploy
```

This calls the Gradle wrapper script in the Workspace root folder and deploys your project to the Liferay bundle added to Workspace. 

### Deploying Code to a Liferay Docker Container

If you've already [created a Liferay Docker Container](./configuring-a-liferay-docker-container.md), deploying to it is just as easy as deploying to a local bundle. Run the same Gradle task: 

```bash
../gradlew deploy
```

## Related Topics

- [Configuring a Liferay Docker Container](./configuring-a-liferay-docker-container.md)
- [Generating Projects with Blade CLI](../blade-cli/generating-projects-with-blade-cli.md)
