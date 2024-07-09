---
uuid: a0fa82d8-4d7a-4f6a-bfec-a97106da9baf
taxonomy-category-names:
- DXP Self-Hosted Installation, Maintenance, and Administration
- DXP Configuration
- Liferay Self-Hosted
---
# Maintenance and Troubleshooting in Docker

The Liferay Docker container has tools for maintenance and troubleshooting out-of-the-box. The following table contains information on some useful environment variables. You can find more information on them throughout the article.

| Environment variable                     | Default value                                | Purpose                                                                       |
| :--------------------------------------- | :------------------------------------------- | :---------------------------------------------------------------------------- |
| LIFERAY_CONTAINER_STARTUP_LOCK_ENABLED   | false                                        | Set to `true` to avoid 2 nodes starting up at the same time. |
| LIFERAY_CONTAINER_STARTUP_LOCK_FILE      | `/opt/liferay/data/liferay-startup-lock`     | The location where the lock file should be created. |
| LIFERAY_CONTAINER_STATUS_ENABLED         | false                                        | Set to `true` to create a thread to continually check the container status. |
| LIFERAY_CONTAINER_STATUS_REQUEST_CONTENT | -                                            |  |
| LIFERAY_CONTAINER_STATUS_REQUEST_TIMEOUT | 10                                           | The number of seconds between each request.                                   |
| LIFERAY_CONTAINER_STATUS_REQUEST_URL     | http://localhost:8080/c/portal/robots        | The thread checks the HTTP response to the URL set here.                      |
| LIFERAY_DOCKER_THREAD_DUMP_INTERVAL_FILE | `/opt/liferay/data/sre/thread_dump_interval` |  |
| LIFERAY_THREAD_DUMPS_DIRECTORY           | `/opt/liferay/data/sre/thread_dumps`         |  |

Here is a list of useful scripts that can be found inside the container:

- **generate_database_report.sh**: Generates a database report HTML file which contains information about tables which can cause performance issues (e.g. templates) or about locks and the status of the server.

- **generate_heap_dump.sh**: Generates a heap dump. Use `-h` to learn about the parameters.

- **generate_thread_dump.sh**: Generates thread dumps with the set interval. By default it creates 20 thread dumps with 3 second delays. Use `-h` to learn about the parameters.

- **inspect_document_library.sh**: Generates a report with information on the document library's storage. See [Help Center](https://help.liferay.com/hc/en-us/articles/16529765923085-How-to-find-out-what-s-using-the-space-in-our-Document-Library-on-Liferay-PaaS) to learn more.

## Checking the Container Status

When `LIFERAY_CONTAINER_STATUS_ENABLED` is set to true, a separate thread is forked out to check the status of the container. The container status is written to `/opt/liferay/container_status`. This thread checks the HTTP response to `LIFERAY_CONTAINER_STATUS_REQUEST_URL` every 3 seconds before a successful startup and every 30 seconds after there was a successful startup. The `LIFERAY_CONTAINER_STATUS_REQUEST_URL` can be changed to a publicly accessible URL as long as it's `http://` and in port 8080. The request timeout can be configured in `LIFERAY_CONTAINER_STATUS_REQUEST_TIMEOUT`. So, with the default value of 10, the thread waits 13 seconds before checking again. The request is only considered successful when the returned page contains the string in `LIFERAY_CONTAINER_STATUS_REQUEST_CONTENT` if it is not empty.

The potential values for the `container_status` file are:

- **acquiring-startup-lock**: The container is trying to lock the cluster for startup (see [Startup Lock](#startup-lock)).

- **pre-configure-scripts**: The “pre-configure” scripts are being run.

- **configure**: The configure step is being done.

- **pre-startup-scripts**: The “pre-startup” scripts are being run.

- **liferay-start**: Liferay is starting up and it’s not responding properly yet.

- **post-shutdown**: Liferay has been shut down.

- **fail, HTTP-response-error, curl-return-code-${exit_code}**: Liferay started up, but there was an error. The HTTP response and the curl command's return code are written to the file.

- **fail, content-missing**: Liferay responds without errors, but the content specified in `LIFERAY_CONTAINER_STATUS_REQUEST_CONTENT` is not present on the page.

- **live**: Everything seems to be healthy.

If the Liferay service's status changed from live to fail, thread dumps are created in the directory set by `LIFERAY_THREAD_DUMPS_DIRECTORY`.

## Startup Lock

To avoid 2 Liferay DXP nodes starting up at the same time, there’s a simple mechanism which uses a shared file system between the nodes to signal that one node is starting up. To leverage this feature, set `LIFERAY_CONTAINER_STARTUP_LOCK_ENABLED` environment variable to `true`. This creates a lock file in the path set in `LIFERAY_CONTAINER_STARTUP_LOCK_FILE`.

!!! important
    You must enable and properly configure the container status settings before enabling startup lock.

The first DXP node creates the lock file and updates it every 30 seconds. If other nodes see this file, they wait for it to be removed before starting up. The file content is the host name of the node which is actively starting up. If the file isn't touched for over 2 minutes, the next node to try to start up does it normally and overrides the contents of the file.

## Creating Thread Dumps Intervals

If `LIFERAY_DOCKER_THREAD_DUMP_INTERVAL_FILE` is not empty, the container starts a separate thread monitoring the file itself. If this file contains a number, the container creates a thread dump to the `LIFERAY_THREAD_DUMPS_DIRECTORY` directory with the delay of the number of seconds written in this file. So if `/opt/liferay/data/sre/thread_dump_interval` is 3, it creates a thread dump every 3 seconds. If the file was not created, it takes less than 60 seconds to notice the change.

This is a useful tool to generate thread dumps on several cluster nodes since the file is on a shared file system. It can be also used to detect startup problems if the file is already created when the container starts up.