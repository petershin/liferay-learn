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

In the sense the client extensions defined within a project represent a basic unit of packaging, they should comprise a cohesive collection which make sense to deploy as a single unit. The cohesiveness of the grouping can be based on efficiency or relatedness as much as on convenience. This is an architectural decision the developer will need to make. However there are other criteria to consider.

The collection of client extensions in a project will be associated with a particular containerized workload image when packaged. Therefore grouping client extensions within a project carries certain implications. For starters, the workspace will only allow the following groups of client extensions within projects:

* `batch` client extensions by themselves
* `configuration` client extensions by themselves
* `front-end` client extensions by themselves
* `microservice` client extensions by themselves
* `configuration` plus `batch` client extensions
* `configuration` plus `front-end` client extensions
* `configuration` plus `microservice` client extensions

If the workspace detects a project which defines _incompatible_ collection of client extensions (e.g. `front-end` plus `microservice`) it will report it as an error.

## Configuring Client Extensions

Client extensions are defined in `client-extension.yaml` files containing these properties:

`name`: Enter the name as it appears in the Liferay UI. If it's not configurable in the UI, the name value is not used.

`type`: Set the client extension's type (e.g., `globalCSS`). The type determines how Liferay handles the client extension when it is deployed.

`dxp.lxc.liferay.com.virtualInstanceId`: Enter the ID of the virtual instance to deploy to.

Each client extension project lives in a folder inside of the workspace's `client-extensions/` folder. The project contains a single `client-extension.yaml` file, which defines one or more client extensions. For example, [the `iframe-2` project's `client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-2/client-extension.yaml) defines three `iframe` client extensions: `Baseball`, `Football`, and `Hockey`.

### Assembling Client Extensions

When assemling client extensions, there are several files that are automatically created and added to the UFFA (see [Packaging Client Extensions](./packaging-client-extensions.md)). However, the tooling doesn't know which files outputed from the build (or present in the project) to include in the archive. The `assemble` block provides this information.

A gradle task called `assembleClientExtension` executes when `gradle build` or `gradle deploy` are run. This `assembleClientExtension` task executes the `assemble` block. By default, outputs are placed into the `build/clientExtension` folder in your project. Everything in the `build/clientExtension` folder is used to create the UFFA, e.g. `dist/my-client-extension-project.zip`.

The `assemble` block is a yaml _array_ which means that _multiple_ sets of instructions may be defined below it.  Each item in the array should be in this form:

```yaml
    - from: <some folder in your project>
      include: <single file or glob match>
      into: <output location in archive>
```

Each item in the `assemble` array has these properties:

* `from`: Specify the folder _from_ where to copy resources into your client extension archive

* `include`: a single file or glob matching a subset of files to include from the `from` directory. If not specified all files are recursively included, which is equivalent to having specified the value `**/*`.

    Optionally, `include` can be specified as an array when multiple patterns are needed:

    ```yaml
    assemble:
        - from: build
          include:
            - "vite/js/*.js"
            - "vite/css/*.css"
          into: static
   ```

* `into`: Specify where the matching resources are copied _into_ the final archive.  For the front-end client extensions (like JavaScript or CSS client extensions) this must be in the `static` directory so that Liferay can serve them as static resources in a on-prem deployment, but LXC can serve them from a container in the cloud. For batch client extensions this must be the `batch` directory so that Liferay and process them.

* `fromTask`: (mutually exclusive to `from`) A special case exists when a gradle build is used in the project. `fromTask` specifies a named gradle task in the project that will be excuted before the assembly step.

    For example, in a `microservice` client extension project using Spring Boot the gradle task `bootJar` creates the uber-jar that contains the application and all its dependencies. In cases like this, it is more succinct to use the property `fromTask` as in the following example which causes the workspace to, first, execute the project's `bootJar` gradle task and then _include_ the outputs of the task (in this case the Spring Boot uber-jar) in the root of the archive:

    ```yaml
    assemble:
        - fromTask: bootJar
    ```

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

Resources that are not built can also be copied directly from the project source:

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

For more details on the creation, structure and contents of UFFA, see [Packaging Client Extensions](./packaging-client-extensions.md)

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
