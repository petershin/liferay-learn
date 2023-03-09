# Working with Client Extensions

> Available in Liferay 7.4+

You can use a variety of types of client extensions to extend Liferay without using OSGi modules. Here are some important topics to help you understand how to work with client extensions and get started.

## Required Tools and Settings

You need to set up these prerequisites to get started developing client extensions for your Liferay instance:

1. Java 8 or JDK 11.

    ```{note}
    Please see the [compatibility matrix](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) for information on supported JDKs, databases, and environments. See [JVM Configuration](../../installation-and-upgrades/references/jvm-configuration.html) for recommended JVM settings.
    ```

1. A Liferay workspace. Run this command to download a workspace with example client extension projects:

    ```bash
    curl -J -O https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay\&a\=com.liferay.sample.minimal.workspace\&\v\=LATEST\&p\=zip
    ```

    You can copy the client extension projects (in the `client-extensions/` directory) into your own workspace, or use this sample workspace on its own.

1. The [`lcp` CLI tool](https://learn.liferay.com/liferay-cloud/latest/en/reference/command-line-tool.html) (if you are using Liferay Experience Cloud).

## Configuring Client Extensions in `client-extension.yaml`

Client extensions are defined in `client-extension.yaml` files. They contain these definitions:

* `name`: The client extension's name (as it appears in the Liferay UI). If the client extension is not configurable in the UI, the `name` value is not used.

* `type`: The client extension's type (`globalCSS`, `customElement`, `themeFavicon`, etc.). This determines the way Liferay handles the client extension when it is deployed.

* `dxp.lxc.liferay.com.virtualInstanceId`: the ID of the virtual instance to deploy to. If you are hosting your own Liferay installation(s) and have multiple virtual instances, use this property to control which virtual instance to deploy to.

A client extension project (which is organized as a folder inside of your Liferay workspace's `client-extensions/` directory) contains a single `client-extension.yaml` file. This file defines one or more client extensions contained in the project. For example, [this project's `client-extension.yaml` file](https://github.com/liferay/liferay-portal/blob/master/workspaces/sample-minimal-workspace/client-extensions/baker/client-extension.yaml) contains the definition for three `iframe` client extensions, called `Baseball`, `Football`, and `Hockey`.

### Additional Source Files

Any other source files needed for your client extensions are contained inside of a `src/` folder in the project by default. However, you can also configure the location of any additional files your client extension project needs with an `assemble` block, like this:

```yaml
assemble:
    - from: assets
        include: "**/*"
        into: static
```

It uses these properties:

* `from`: The directory to include additional resources from in your client extension project. When you build the client extension, these resources are included in the resulting `.zip` file. You can use multiple `from` definitions in the `assemble` block; each one must be paired with an `into` property.

* `include`: Either a single file or glob syntax indicating where to find the needed files in the `from` directory.

* `into`: Where to include the additional resources in you client extension `.zip` file when it is built. This can affect the behavior of your client extension. For example, many front-end client extensions (like JavaScript or CSS client extensions) require their source files to be in a `static` directory so that Liferay can serve them as static resources for your site.

## Deploying to Your Liferay Instance

When client extensions are built, they are converted into `.zip` archives that can be deployed to any Liferay instance. Each resulting `.zip` archive contains a `.json` file that incorporates all of the necessary settings for the given client extension.

Deploying client extensions is always a matter of placing the client extension `.zip` files in the correct location for your Liferay installation. Different commands allow you to do this depending on how your Liferay instance is hosted.

### Deploying to LXC

If you are using LXC, first run this command from your workspace's `client-extensions/` folder:

```bash
../gradlew clean build
```

This compiles all of your client extensions into `.zip` files in each project's `dist/` folder. Run the command within a specific project's folder instead to only build one project.

Then run this command to deploy each client extensions to your chosen environment:

```bash
lcp deploy --extension <extension-zip-file>
```

The tool prompts you to select a project, and then the environment to deploy to. The `.zip` files are uploaded to your LXC project once the command completes.

### Deploying to a Self-Hosted Liferay Instance

If you are hosting your Liferay installation on-premises, you can use the workspace bundle zip to deploy your client extensions. Build and deploy your client extensions with this command from your workspace's `client-extensions/` folder:

```bash
../gradlew clean distBundleZip
```

If you must instead manually deploy the `.zip` files to a Liferay instance, run this command:

```bash
../gradlew clean build
```

Then copy all of the `.zip` files from each client extension project's `dist/` folder. Place the files in your target server's `${Liferay Home}/osgi/client-extensions/` folder to deploy them.

## Additional Information

* [Front-end Client Extensions](./front-end-client-extensions.md)
* [Using a JavaScript Client Extension](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [Using a CSS Client Extension](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
