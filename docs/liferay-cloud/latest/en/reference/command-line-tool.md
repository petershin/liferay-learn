---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Reference
- Liferay PaaS
- Liferay SaaS
uuid: 2c706859-b73d-41ec-a5a2-b6ca6d3c367c
---
# Command-Line Tool

The CLI tool can be used to view and manage your Liferay Cloud services. Once installed, you can run `lcp --help` in your terminal to view available actions.

!!! tip
    You can run the `-v` or `--verbose` option at the end of any `lcp` command to see extra logging and information. Run the `--help` flag at the end of any `lcp` command to see the available flags you can use with it.

- [Installing the CLI Tool](#installing-the-cli-tool)
- [Upgrading the CLI Tool from Version 2 to 3](#upgrading-the-cli-tool-from-version-2-to-3)
- [Configuring the CLI Remote](#configuring-the-cli-remote)
- [Showing the Service Logs](#showing-the-service-logs)
- [Changing the Number of Service Instances](#changing-the-number-of-service-instances)
- [Listing Projects or Services](#listing-projects-or-services)
- [Restarting a Service](#restarting-a-service)
- [Deploying to Your Liferay Cloud Environment](#deploying-to-your-liferay-cloud-environment)
- [Downloading Files from the Liferay Service](#downloading-files-from-the-liferay-service)
- [Accessing a Service's Shell](#accessing-a-services-shell)
- [Uninstalling Version 3 of the CLI Tool](#uninstalling-version-3-of-the-cli-tool)

## Installing the CLI Tool

### \*nix Systems

Open your terminal, and run this command:

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/install.sh -fsSL | bash
```

If you get a permissions error, try running the command again and replacing `bash` with `sudo bash`.

### Windows Systems

Download the latest version of the [Windows installer](https://cdn.liferay.cloud/lcp/stable/latest/lcp-install.exe), and follow the steps in the wizard.

## Upgrading the CLI Tool from Version 2 to 3

You must first uninstall your current version before you can install and use version 3. This prevent conflicts with the same binary name.

!!! important
    These instructions are specific to uninstalling CLI version 2 and are **not** the same as those for [uninstalling version 3 of the CLI tool](#uninstalling-version-3-of-the-cli-tool).

### Uninstalling Version 2 on MacOS or Linux

1. Open a terminal and run: `lcp uninstall`.

1. Verify uninstall is complete by running the command `lcp`.

### Uninstalling Version 2 on Windows

1. On Windows 10, go to *Control Panel* &rarr; *Programs* &rarr; *Uninstall a program*.

	Alternatively, for Windows 7 and 8, go to *Control Panel* &rarr; *Add or Remove Programs*.

1. Select `lcp amd64-installer-0.3`

1. Click _Uninstall_ then confirm.

1. Verify uninstall is complete by running the command `lcp` or `lcp.exe`.

Verify that CLI version 2 has been uninstalled before installing version 3.

### Installing Version 3

Once version 2 is uninstalled, you can follow the [above instructions](#installing-the-cli-tool) to install version 3 of the CLI tool.

## Configuring the CLI Remote

To access Liferay Cloud services via the CLI tool, it must be configured to point to Liferay Cloud's remote URL: `liferay.cloud`.

To list the CLI's remotes, run this command:

```bash
lcp remote
```

You can add new remotes to the CLI tool using this command:

```bash
lcp remote set <remote-alias> <remote-url>
```

If desired, you can change its default remote:

```bash
lcp remote default <remote-alias>
```

Alternatively, you can specify the remote inline:

```bash
lcp shell -p <project-id> --service <service-id> --remote <remote-alias>
```

## Downloading Backups

Use the `lcp backup` command to download a specific backup using its ID.

Run this command to download both the database and document library concurrently:

```bash
lcp backup download --backupId <ID>
```

Alternatively, add the `--database` or `--doclib` flags to only download the one specified:

```bash
lcp backup download <type> --backupId <ID>
```

## Showing the Service Logs

Use `lcp log` commands to display logs for specific projects, services, and instances. Below are some common commands, though you can see available command options by running `lcp log --help`.

View all service logs for a project environment:

```bash
lcp log -p <project>-<environment>
```

View logs for a single service in a project environment:

```bash
lcp log -p <project>-<environment> -s <service>
```

Alternatively, use a service's full URL to view its logs:

```bash
lcp log --url <service>-<project>-<environment>.lfr.cloud
```

By default, the `lcp log` command only returns 10,000 lines to reduce network impact. However, you can avoid this restriction by using `--since` and `--until` parameters to specify a period of time (e.g., `yesterday`, `"yesterday at 9pm"`, `"10 minutes ago"`, `"mm/dd/YYYY HH:mm:ss"`).

View all service logs for a project environment from a specific time to the present:

```bash
lcp log -p <project>-<environment> --since <start_time>
```

View all service logs for a project environment from a specific period of time:

```bash
lcp log --since "<start_time>" --until "<end_time>"
```

You can also pipe the output of an `lcp log` command into a file by appending `>> "<new-file.txt>"` to the end of the command. When run, the new file is created in your terminal's current path.

```bash
lcp log -p <project>-<environment> -s <service> --since "<start_time>" --until "<end_time>" >> "<new-file.txt>"
```

## Changing the Number of Service Instances

Use `lcp scale` commands to individually scale environment services. These examples include some common commands, though you can see available command options by running `lcp scale --help`.

!!! warning
    This command is deprecated. Instead, you can scale instances manually in the dashboard. See [Scaling the Liferay Service](../manage-and-optimize/scaling-the-liferay-service.md) for more information on manual scaling.

View all services and their instances for a project environment, and then select a service to scale:

```bash
lcp scale -p <project>-<environment>
```

Then, follow the terminal prompts to select a service and determine the number of its instances.

Alternatively, specify the target service and desired number of instances as part of the `lcp scale` command:

```bash
lcp scale -p <project>-<environment> -s <service> <instances>
```

You can also scale instances using its full URL:

```bash
lcp scale --url <service>-<project>-<environment>.lfr.cloud <instances>
```

## Listing Projects or Services

Use `lcp list` commands to view project services, each with its image and status. These examples include some common commands, though you can see available command options by running `lcp list --help`.

View a complete list of projects, services, and instances that you either own or collaborate on:

```bash
lcp list
```

View the image and status of environment specific services:

```bash
lcp list -p <project>-<environment>
```

Check the image and status of a specific service:

```bash
lcp list -p <project>-<environment> --service <serviceID>
```

Alternatively, you can check a service by passing its full URL to `lcp list`:

```bash
lcp list --url <service>-<project>-<environment>.lfr.cloud
```

## Restarting a Service

Use `lcp restart` commands to restart an environment service. These examples include some common commands, though you can see available command options by running `lcp restart --help`.

View all project environments and services, and then select an environment service to restart:

```bash
lcp restart
```

Restart a specific service in a project:

```bash
lcp restart -p <project>-<environment> -s <service>
```

Alternatively, restart a service by passing its full URL to `lcp restart`:

```bash
lcp restart --url <serviceID>-<projectID>.lfr.cloud
```

## Deploying to Your Liferay Cloud Environment

Use the `lcp deploy` command to deploy either a specific service or all of your services to one of your environments:

```bash
lcp deploy
```

Running `lcp deploy` from the root directory of your repository deploys all applicable services to your chosen environment. Run the command from one service's folder (with the service's `LCP.json` file in that folder) to specifically deploy that service to the environment.

Run the command with `-r` to specify a remote (by its ID) other than the default:

```bash
lcp deploy -r <remote-id>
```

See [Deploying Changes via the CLI Tool](../updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool.md) for more information.

## Downloading Files from the Liferay Service

Use the `files download` command to download files from the Liferay service. The files must be in the Liferay service's persistent storage directory (`/mnt/persistent-storage/`).

For example,

```bash
lcp files download --prefix path/to/files --dest destination
```

This command downloads all files from your Liferay service's `/mnt/persistent-storage/path/to/files/` directory into a `destination/` folder.

Change the number of files downloading in parallel (by default 100) with the `--concurrency` flag.

For example, the command below downloads all files from the `/mnt/persistent-storage/path/to/files/` directory into the current working directory, up to 600 files at a time.

```bash
lcp files download --prefix path/to/files --concurency 600
```

See all of the available command options by running `lcp files download --help`.

## Accessing a Service's Shell

To access a service container's shell, run this command:

```bash
lcp shell
```

This lists all the services in the container and prompts you to choose
which one to access.

Alternatively, access the shell of a specific service's container by adding the
service's project ID and service ID to the `lcp shell` command:

```bash
lcp shell -p <project>-<environment> -s <service>
```

## Open docs

Use the `lcp docs` command to access Liferay Cloud resources, including official documentation, Help Center content, and more.

## Uninstalling Version 3 of the CLI Tool

For Mac and Linux, run this command:

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/uninstall.sh -fsSL | bash
```

For Windows 7 and 8, go to *Control Panel* &rarr; *Add or Remove Programs*. In Windows 10, go to *Control Panel* &rarr; *Programs* &rarr; *Uninstall a program*. Then, find *LCP CLI* in the list of programs, select it, and click *Uninstall*. Follow the steps in the wizard.

## Related Topics

- [Troubleshooting Tools and Resources](../support-and-troubleshooting/troubleshooting-tools-and-resources.md)
- [Deploying Changes Via the CLI Tool](../updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool.md)
