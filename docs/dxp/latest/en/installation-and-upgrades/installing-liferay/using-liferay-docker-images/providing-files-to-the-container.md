---
uuid: 4418f4d0-284a-4366-af8d-1458ca1cf598
taxonomy-category-names:
- DXP Self-Hosted Installation, Maintenance, and Administration
- DXP Configuration
- Liferay Self-Hosted
---
# Providing Files to the Container

The Liferay container uses the files you provide to execute the following use cases:

* Configure Liferay with `.properties` Files and `.config` files
* Configure Tomcat
* Deploy apps and other artifacts
* Update the Patching Tool
* Patch DXP
* Run scripts

All of the use cases can be triggered on container creation when the container finds files in specific folders within key container folders.

**Key Container Folders:**

* `/mnt/liferay`
* `/user/local/liferay/scripts`

The [Container Lifecycle and API](./container-lifecycle-and-api.md) specifies the scanned subfolders, the phases in which the container scans them, and the actions taken on their files.

You can provide files to the container in several ways.

**Ways to Provide Files:**

* [Bind mounts](https://docs.docker.com/storage/bind-mounts/)
* [Volumes](https://docs.docker.com/storage/volumes/)
* [Using `docker cp`](https://docs.docker.com/engine/reference/commandline/cp/)

All of the use cases, except for deploying artifacts and using `.config` files, require making files available on container creation. Bind mounts and volumes accomplish this. Deploying artifacts and applying `.config` files can be accomplished on container creation using bind mounts and volumes, or at run time using `docker cp`.

Bind mounts are used in the examples here as they are simpler than volumes for providing files. As you prepare files for mounting to a container, it's helpful to organize them in a way that's easiest for you to manage. Bind mounting to Liferay containers, organizing files, and using `docker cp` are covered here.

## Bind Mount Format

You can specify any number of bind mounts to a `docker run` command. Each bind mount follows this format:

```
-v [source path in host]:[destination path in container]
```

The bind mount source can be any folder path or file path in the host. The bind mount destination can be any folder path or file path in the container.

## Scanned Container Folders

The container scans these folders.

* `/mnt/liferay/deploy`
* `/mnt/liferay/files` (all files and subfolders are scanned)
* `/mnt/liferay/patching`
* `/mnt/liferay/scripts`
* `/usr/local/liferay/scripts/post-shutdown`
* `/usr/local/liferay/scripts/pre-configure`
* `/usr/local/liferay/scripts/pre-startup`

Please see the [API](./container-lifecycle-and-api.md#api) for the actions and use cases associated with each folder.

## Organizing Files for Bind Mounting

You can organize Liferay container bind mounts in several different ways:

* Bind to one or both of the key folders: `/mnt/liferay` and `/usr/local/liferay/scripts`
* Bind to their subfolders
* Bind to a mix of subfolders and files

The table below shows some example bind mount methods and describes their pros and cons.

### Example Bind Mounts

| Method | Example | Pros | Cons |
| :----- | :------ | :------- | :---------- |
| Mount to `/mnt/liferay` | `-v [host-path]:/mnt/liferay` | Centralizes the input files. | Input files must be organized in subfolders that the container expects (see the locations listed [above](#scanned-container-folders)). |
| Mount to `/mnt/liferay` subfolders separately | `-v [host-path]/[folder-1]:/mnt/liferay/deploy -v [host-path]/[folder-2]:/mnt/liferay/files`<br><br><br>Note: `[host-path]` can be the same path or different paths. | Flexibility to use input file groups in different locations on the host. | More host file locations to manage. |
| Mount to individual files | `-v [host path]/setenv.sh:/mnt/liferay/files/tomcat/bin/setenv.sh` | Input files are clearly visible in the `docker run` command. | Lengthy docker run commands. Even more host file locations to manage. |

The most general way to provide files to the container's [configuration phase](./container-lifecycle-and-api.md#lifecycle) is to bind mount a host folder to the container's `/mnt/liferay` folder.

## Bind Mounting a Host Folder to `/mnt/liferay`

If you want to centralize files for configuring, patching, and deploying to Liferay, consider bind mounting a host folder to the container's `/mnt/liferay` folder.

```{note}
Most of the examples in the use case articles use this bind mount strategy.
```

Hre are the steps:

1. Designate a folder on your host to serve as a base folder.

1. In the base host folder, create subfolders that correspond to all of the `/mnt/liferay` subfolders that the container acts on. Please see [Container Lifecycle and API](./container-lifecycle-and-api.md) for container folder details.

    ```bash
    cd [host folder]
    mkdir deploy files patching scripts
    ```

    Result:

    ```
    [host folder]
    ├───deploy
    ├───files
    ├───patching
    └───scripts
    ```

    ```{note}
    You don't have to create all of the subfolders, just the ones you're populating.
    ```
1. Populate the subfolders with files for the container to act on.

    For example, you could [add a `portal-ext.properties` file](./configuring-containers.md#portal-properties) to configure DXP and [add a Security Fix Pack](./patching-dxp-in-docker.md) to install.

    Result:

    ```
    [host folder]
    ├───deploy
    ├───files/portal-ext.properties
    ├───patching/[Security Fix Pack file name].zip
    └───scripts
    ```

1. In your `docker run` command, bind mount your base host folder to the container's `/mnt/liferay` folder.

    ```bash
    docker run -v [host folder path]:/mnt/liferay ...
    ```

Per the [Container Lifecycle](./container-lifecycle-and-api.md#liferay-phases), your new container acts on the files in (and nested under) your mounted host folder and then starts Tomcat

## Using `docker cp`

The [`docker cp`](https://docs.docker.com/engine/reference/commandline/cp/) command is a convenient alternative for deploying applications, modules, and configurations to a Docker container.

```bash
docker cp [file] [container]:[folder path]
```

Deploying an application:

```bash
docker cp some_app.lpkg my_container:/opt/liferay/deploy
```

Deploying a [configuration file](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md):

```bash
docker cp com.liferay.journal.configuration.JournalServiceConfiguration.config my_container:/opt/liferay/osgi/configs
```

If you use `docker cp` on macOS, however, the file's ownership is preserved, instead of changing to user/group `liferay`. Here are a couple workarounds:

* Set the file ownership and permissions using `tar` as input to the `docker cp` command. Here's an example:

    ```bash
    tar -cf - command.sh --mode u=+rwx,g=-wx,o=-wx --owner liferay --group liferay | docker cp - my_container:/usr/local/liferay/scripts/pre-startup
    ```

* Open a Bash session in the container after using `docker cp` and change the file's ownership.

    ```bash
    docker exec -it my_container bash
    ```

    ```bash
    chown -R liferay:liferay /usr/local/liferay/scripts/pre-startup/command.sh
    ```

## Conclusion

Now you know how to provide files to the container using bind mounts and `docker cp` commands. Please see the [Container Lifecycle and API](./container-lifecycle-and-api.md) for more details. For use case details, please see these articles:

* [Configuring Containers](./configuring-containers.md)
* [Installing Apps and Other Artifacts to Containers](./installing-apps-and-other-artifacts-to-containers.md)
* [Patching DXP in Docker](./patching-dxp-in-docker.md)
