---
uuid: a4730247-c6d1-49b6-b8e5-4f2c6616e585
---
# Liferay Workspace

Liferay Workspace is an environment designed to handle the full development life cycle (i.e. create, build, deploy, test) for Liferay DXP projects. Because it is implemented with Gradle scripts and plugins, Liferay Workspace integrates seamlessly with any IDE or development tool. It also works hand-in-hand with Liferay's CLI utilities: *Blade CLI*, which exists to manage workspaces and projects, and the *Liferay Cloud CLI*, which exists to manage Cloud services and deploy client extensions to the Cloud Platform.

<!-- IMAGE: Include diagram image representing Liferay Workspace's folders and scripts structure. -->

## Prerequisites

Complete these prerequisites to install Liferay Workspace on your computer:

1. Install Java: [Oracle JDK 11](https://www.oracle.com/br/java/technologies/javase/jdk11-archive-downloads.html)

1. Install Blade CLI with this command:

    ``` bash
    curl -L https://raw.githubusercontent.com/liferay/liferay-blade-cli/master/cli/installers/local | sh
    ```

    A `Blade installed successfully` message is displayed after completing the installation. Type `blade` to check if the tool is working.

    !!! note
        While we recommend using Blade to set up Liferay Workspace, you can also use Gradle to complete the process manually. See [Creating a Liferay Workspace Manually](https://learn.liferay.com/web/guest/w/dxp/building-applications/tooling/liferay-workspace/creating-a-liferay-workspace#creating-a-liferay-workspace-manually) for more information.

1. Install and configure the Liferay Cloud CLI by following these steps:

    1. Run this command:

       ```bash
       curl https://cdn.liferay.cloud/lcp/stable/latest/install.sh -fsSL | bash
       ```

       If you get a permission error, try replacing `bash` with `sudo bash` and running the command again.

       !!! note
           For Windows systems, find the link to download the Windows installer at [Installing the CLI Tool](https://learn.liferay.com/en/w/liferay-cloud/reference/command-line-tool#installing-the-cli-tool).

    1. Run `lcp login` to authenticate the tool with your Liferay Cloud Platform's account.

    1. When prompted to open the browser, type `Y` and press the Enter key.

    1. Finally, log into your account and wait for the success screen. Your tool should then be authenticated.

1. Configure the CLI tool to point to Liferay Cloud Platform's remote URL (`liferay.cloud`). See [Configuring the CLI Remote](https://learn.liferay.com/en/w/liferay-cloud/reference/command-line-tool#configuring-the-cli-remote) for instructions.

1. Run the `lcp login` command to authenticate the CLI tool with your platform account.

1. Choose and install one of these IDEs in your computer:

   - [VS Code](https://code.visualstudio.com/download) (recommended)
   - [Sublime Text](https://www.sublimetext.com/download)
   - [Eclipse](https://eclipseide.org/)
   - [Intellij IDEA](https://www.jetbrains.com/idea/download/)

## Creating a Liferay Workspace

Follow these steps to generate your own Liferay Workspace:

1. In your command line interface, go to a directory or create an empty folder where you want to generate your workspace.

1. Run this command to see and choose your preferred DXP version:

   ``` bash
   blade init -l
   ```

   !!! tip
       DXP's latest version is recommended.

1. Run this command with your chosen version and a name for your workspace:

   ``` bash
   blade init -v [Liferay version] [workspace name]
   ```

   For example,

   ``` bash
   blade init -v dxp-7.4-u102 clarity-workspace
   ```

If the command doesn't return any errors, the workspace has been successfully generated and is ready to use. You can keep all development resources for the course here.

Next, we'll introduce you to Client Extensions and explain how they relate to Liferay Workspace.

Up Next: [Client Extensions](./client-extensions.md)

## Additional Resources

Follow these links to troubleshoot installation and learn more about the tools covered in this article:

- [Liferay Workspace](https://learn.liferay.com/web/guest/w/dxp/building-applications/tooling/liferay-workspace)
- [Blade CLI](https://learn.liferay.com/web/guest/w/dxp/building-applications/tooling/blade-cli)
- [Liferay Cloud CLI](https://learn.liferay.com/en/w/liferay-cloud/reference/command-line-tool)
