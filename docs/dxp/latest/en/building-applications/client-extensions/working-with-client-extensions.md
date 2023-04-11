---
uuid: 01f46794-2cd4-4ffc-94d3-e244880f2b6f
---
# Working with Client Extensions

{bdg-secondary}`7.4+`

Using client extensions, you can extend Liferay without deploying OSGi modules. Just like traditional module development, client extensions live in a [Liferay Workspace](../tooling/liferay-workspace.md). Get started by learning

- What tools are required to begin developing client extensions
- How to define a client extension in its configuration file
- How to deploy client extensions

## Required Tools and Settings

To start developing client extensions, obtain the following items:

1. Java 8 or JDK 11.

    ```{note}
    Check the [compatibility matrix](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) for information on supported JDKs, databases, and environments. See [JVM Configuration](../../installation-and-upgrades/references/jvm-configuration.html) for recommended JVM settings.
    ```

1. A Liferay workspace. To download a workspace with example client extension projects, run

    ```bash
    curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
    ```

    You can copy the client extension projects (in the `client-extensions/` directory) into your own workspace or use the sample workspace directly.

1. If you are using Liferay Experience Cloud(LXC), you must have the [`lcp` CLI tool](https://learn.liferay.com/liferay-cloud/latest/en/reference/command-line-tool.html).

## Client Extension Projects

Client extension development follows the _workspace_ plus _project_ model. Within a Liferay workspace a client extension project is a directory under `<workspace>/client-extensions` in which development takes place and where a single build process results in a single set of outputs. A client extension project contains a `client-extension.yaml` file which describes the client extensions implemented. The project also embodies the basic unit of packaging which is a **Universal File Format Archive** (UFFA for short).

## Grouping Client Extensions in Projects

Client extensions grouped together in a single project form a cohesive collection, packaged as a single, deployable unit when built. It's your decision as a developer to group client extensions together where it makes sense (e.g., to improve efficiency when they should work on related tasks).

However, when you build client extensions in a single project together, they are associated with a Docker container that represents a workload particular to that project. This means that there are some restrictions on which kinds of client extensions can be grouped together. For example, [microservice client extensions](./microservice-client-extensions.md) cannot be grouped with other types of client extensions, because they represent a workload that runs as a microservice outside of your Liferay instance, which is incompatible with most other classifications.

You can group client extensions together in these ways:

* Any client extension type with others of the same classification (i.e., only batch client extensions, or only front-end client extensions)
* *Configuration* client extensions plus *batch* client extensions
* *Configuration* client extensions plus *front-end-client extensions*
* *Configuration* client extensions plus *microservice client extensions*

If you try to build a project which has an incompatible grouping of client extensions (e.g. `front-end` plus `microservice`), it causes an error.

## Configuring Client Extensions

Client extensions are defined in `client-extension.yaml` files with these properties:

* `name`: Enter the name as it appears in the Liferay UI. If it's not configurable in the UI, the `name` value is not used.

* `type`: Set the client extension's type (e.g., `themeCSS`). The type determines how Liferay handles the client extension when it's deployed.

* `dxp.lxc.liferay.com.virtualInstanceId`: Enter the virtual instance ID to deploy to.

Each client extension project has its own folder inside of the workspace's `client-extensions/` folder. A client extension project contains a single `client-extension.yaml` file, which defines one or more client extensions. For example, [the `iframe-2` project's `client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-2/client-extension.yaml) defines three `iframe` client extensions: `Baseball`, `Football`, and `Hockey`.

### Assembling Client Extensions

When you build a client extension, more files are automatically created and packaged with the built [LUFFA](./packaging-client-extensions.md) (i.e., the resulting `.zip` file). However, you must define an `assemble` block in your `client-extension.yaml` file to configure which files to include from your build or project files.

An `assembleClientExtension` gradle task executes when you run `gradle build` or `gradle deploy` within a client extension project, and it includes the files specified in the project's `assemble` block. By default, outputs are placed into a `build/clientExtension` folder in your project. Everything in this folder is used to create the LUFFA (e.g., `dist/my-client-extension-project.zip`).

The `assemble` block is a YAML *array* that can include multiple instructions for files to include. Each set of instructions must be in this form:

```yaml
- from: <some folder in your project>
  include: <single file or glob match>
  into: <output location in archive>
```

Each item in the `assemble` array has these properties:

* `from`: Specify the folder *from which* to copy files into your client extension archive.

* `include`: Specify a single file or glob matching a subset of files to include from the `from` directory. If this is not defined, all files are included recursively (equivalent to `**/*`).

    You can also use an array of multiple `include` patterns if needed, like

    ```yaml
    assemble:
        - from: build
          include:
            - "vite/js/*.js"
            - "vite/css/*.css"
          into: static
   ```

* `into`: Specify where the matching resources are copied *into* for your resulting LUFFA.

    Front-end client extensions must be put into the `static` directory. They use static resources, and the `static` directory allows Liferay to serve theim as static resources (in self-hosted instances) or from containers in Liferay Experience Cloud.

    Batch client extensions must be put into the `batch` directory because they require special handling when deployed.

* `fromTask`: (mutually exclusive with `from`) A special case exists when a gradle build is used in the project. `fromTask` specifies a named gradle task in the project that is executed before the assembly step. 

    For example, in a `microservice` client extension project using Spring Boot, the gradle task `bootJar` creates the `.jar` file containing the application and all its dependencies. In this example, it is preferable to use the property `fromTask`. This causes the workspace to, first, execute the project's `bootJar` gradle task and then _include_ the outputs of the task (i.e., the built `.jar` file) in the root of the resulting LUFFA:

    ```yaml
    assemble:
        - fromTask: bootJar
    ```

### Example `assemble` Blocks

Here is an example of an `assemble` block with multiple `from` items:

```yaml
assemble:
    - from: build/folder/aaa
      include: "css/*.css"
      into: folder/aaa
    - from: build/folder/aaa
      include: "css/*.css"
      into: folder/aaa
```

You can also specify to include resources from your project that are not built, like

```yaml
assemble:
    - from: assets
      into: static
```

or

```yaml
assemble:
    - from: somewhere/else
      include: "*.ico"
      into: static
```

For more details on the creation, structure and contents of a LUFFA, see [Packaging Client Extensions](./packaging-client-extensions.md)

## Deploying to Your Liferay Instance

Client extensions are built into deployable `.zip` archives. Each client extension archive contains a JSON file with the client extension's settings.

Deploy client extensions by placing the `.zip` files in the correct location for your Liferay installation. The exact commands you'll use depend on how your Liferay instance is hosted.

### Deploying to LXC

To deploy client extensions for LXC,

1. Go to your workspace's `client-extensions/` folder and run

   ```bash
   ../gradlew clean build
   ```

   The compiled `.zip` files are created in each project's `dist/` folder. To build one project at a time, run the command from the project's folder.

1. Run this command to deploy each client extension to your chosen environment:

   ```bash
   lcp deploy --extension <extension-zip-file>
   ```

   When prompted, select a project and the deployment environment. The zip files are uploaded to your LXC project once the command completes.

### Deploying to a Self-Hosted Liferay Instance

If you host your Liferay installation on-premises, use the workspace bundle zip to deploy your client extensions.  To build and deploy your client extensions, run this command from your workspace's `client-extensions/` folder:

```bash
../gradlew clean distBundleZip
```

If you must manually deploy the zip files, run

```bash
../gradlew clean build
```

Then copy the archives from each project's `dist/` folder into the server's `[Liferay Home]/osgi/client-extensions/` folder.

## Additional Information

* [Batch Client Extensions](./batch-client-extensions.md)
* [Configuration Client Extensions](./configuration-client-extensions.md)
* [Front-end Client Extensions](./front-end-client-extensions.md)
* [Microservice Client Extensions](./microservice-client-extensions.md)
* [Packaging Client Extensions](./packaging-client-extensions.md)

## Tutorials

* [Using a JavaScript Client Extension](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [Using a CSS Client Extension](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
