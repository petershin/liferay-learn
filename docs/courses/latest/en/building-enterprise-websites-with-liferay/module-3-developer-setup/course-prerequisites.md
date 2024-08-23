---
uuid: c098e6ef-1ddb-456e-ae41-ee4645f78334
---
# Course Prerequisites

Throughout this course, you'll use a local Liferay environment to implement Clarity's enterprise website. Before moving forward, complete these prerequisites to prepare your system for the following exercises:

* [Git](#git)
* [Java JDK 11](#java-jdk-11)
* [Liferay CLI Tools (Optional)](#liferay-cli-tools-optional)

## Git

To verify Git is installed and ready for use, open a terminal window and run this command:

```bash
git version
```

!!! note
    If you're on Windows, use Command Prompt, PowerShell, or BASH to execute terminal commands.

This returns the version of your git installation. For example,

```log
git version 2.45.2
```

If the Git command is not found, please see official documentation for how to install Git for your OS ([macOS](https://git-scm.com/download/mac)|[Windows](https://git-scm.com/download/win)|[Linux/Unix](https://git-scm.com/download/linux)).

## Java JDK 11

This course requires Java JDK 11. You can find the appropriate OpenJDK distribution for your OS [here](https://learn.microsoft.com/en-us/java/openjdk/download#openjdk-11). You can download the JDK as a ZIP (Windows) or TAR.GZ (Linux/Mac) package. To install, extract the file in a folder of your choice, then set the JAVA_HOME environment variable to that folder. Alternatively, you can install Java using native installers according to your OS ([macOS](https://learn.microsoft.com/en-us/java/openjdk/install#install-on-macos)|[Windows](https://learn.microsoft.com/en-us/java/openjdk/install#install-on-windows)|[Linux](https://learn.microsoft.com/en-us/java/openjdk/install#install-on-ubuntu)).

!!! note
    Some users have encountered issues running Liferay with openjdk-11.0.2. If you are using this version, please update to JDK 11.0.23+.

Once you've installed Java JDK 11, open a terminal window and run this command to ensure it is ready for use:

```bash
java -version
```

The JDK version appears. For example,

```log
openjdk version "11.0.19" 2023-04-18 LTS
OpenJDK Runtime Environment Zulu11.64+19-CA (build 11.0.19+7-LTS)
OpenJDK 64-Bit Server VM Zulu11.64+19-CA (build 11.0.19+7-LTS, mixed mode)
```

If it does not, you may need to perform additional troubleshooting steps that are beyond the scope of this course. Please see the relevant Java JDK installation documentation for your system.

## Liferay CLI Tools (Optional)

Liferay provides two command-line tools (Blade CLI and Liferay Cloud CLI) to empower users to perform essential lifecycle operations without the need of a graphical user interface. For this course, they are optional. Though if you're working with Liferay SaaS and plan to create client extensions, the Liferay Cloud CLI tool is necessary.

### Blade CLI

The Blade CLI tool can simplify many development tasks. You can use it to create new workspaces, get server bundles, spin up Liferay instances, and more. See [Blade CLI](https://learn.liferay.com/w/dxp/liferay-development/tooling/blade-cli) installation instructions.

Once finished, run this command to verify Blade is installed and ready to use:

```bash
blade version
```

It should return the CLI's version:

```log
blade version 6.0.0.202404102137
```

If the output indicates there is a newer version, run this command to update it:

```bash
blade update
```

!!! note
    While we recommend using Blade to set up Liferay Workspace, you can also use Gradle to complete the process manually. See [Creating a Liferay Workspace Manually](https://learn.liferay.com/web/guest/w/dxp/building-applications/tooling/liferay-workspace/creating-a-liferay-workspace#creating-a-liferay-workspace-manually) for more information.

### Liferay Cloud CLI

The Liferay Cloud CLI tool is for managing instances without using the Liferay Cloud Console UI. This versatile tool provides support for almost all management functions, though its primary uses are

* Project and Service Management
* Deployment and Updates
* Log Management
* Environment Management
* Domain Management

Using the Cloud CLI tool, you can do all this with just a few commands, which are tasks that would otherwise require navigating around the Cloud Administrator Console. To use it, you’ll have to log in when it first runs and set the URL for your Liferay environments, but after that you’re ready to go.

If you’re on Liferay PaaS, this tool is not required for deployment, but it is highly recommended. If you’re on Liferay SaaS, it is required for deploying client extensions. Please see [Liferay Cloud Command-Line Tool](https://learn.liferay.com/en/w/liferay-cloud/reference/command-line-tool) for installation instructions.

## Conclusion

Great! With the prerequisites in place, let's explore Liferay Workspaces and set up your Liferay environment.

Next Up: [Liferay Workspace](./liferay-workspace.md)
