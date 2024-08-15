---
uuid: a0fa82d8-4d7a-4f6a-bfec-a97106da9baf
taxonomy-category-names:
- DXP Self-Hosted Installation, Maintenance, and Administration
- DXP Configuration
- Liferay PaaS
- Liferay Self-Hosted
---
# Maintenance and Troubleshooting in Docker

The Liferay Docker container has tools for maintenance and troubleshooting out-of-the-box. You can set various environment variables to modify settings that help you troubleshoot. One of these reports the status of the container; you can check this status to see its state. If you have more than one node, you can set a startup lock to ensure nodes start one by one. You can set an interval at which thread dumps are made, and you can probe the container's life cycle. 

Read on to learn about each of these troubleshooting tools. 

## Useful Container Variables and Scripts

The following table describes some useful environment variables. 

 | Environment variable                     | Default value                                | Purpose                                                                              |
 |:-----------------------------------------|:---------------------------------------------|:-------------------------------------------------------------------------------------|
 | LIFERAY_CONTAINER_STARTUP_LOCK_ENABLED   | false                                        | Set to `true` to avoid two nodes starting up at the same time.                       |
 | LIFERAY_CONTAINER_STARTUP_LOCK_FILE      | `/opt/liferay/data/liferay-startup-lock`     | The location where the lock file should be created.                                  |
 | LIFERAY_CONTAINER_STATUS_ENABLED         | false                                        | Set to `true` to create a thread to continually check the container status.          |
 | LIFERAY_CONTAINER_STATUS_REQUEST_CONTENT | ""                                           | The status is only `live` if the content returned from the URL contains this string. |
 | LIFERAY_CONTAINER_STATUS_REQUEST_TIMEOUT | 10                                           | Requests wait this many seconds for a response before failing.                       |
 | LIFERAY_CONTAINER_STATUS_REQUEST_URL     | http://localhost:8080/c/portal/robots        | The thread checks the HTTP response to the URL set here.                             |
 | LIFERAY_DOCKER_THREAD_DUMP_INTERVAL_FILE | `/opt/liferay/data/sre/thread_dump_interval` | This file contains the number of seconds between each generated thread dump.         |
 | LIFERAY_THREAD_DUMPS_DIRECTORY           | `/opt/liferay/data/sre/thread_dumps`         | The location where the thread dump file should be created.                           |

Here is a list of useful scripts that can be found inside the container:

- **generate_database_report.sh**: Generates a database report HTML file which contains information about tables which can cause performance issues (e.g. templates) or about locks and the status of the database server.

- **generate_heap_dump.sh**: Generates a heap dump. Use `-h` to learn about the parameters.

- **generate_thread_dump.sh**: Generates thread dumps at the set interval. By default it creates 20 thread dumps with 3 second delays. Use `-h` to learn about the parameters.

- **inspect_document_library.sh**: Generates a report with information on the document library's storage. See [Help Center](https://help.liferay.com/hc/en-us/articles/16529765923085-How-to-find-out-what-s-using-the-space-in-our-Document-Library-on-Liferay-PaaS) to learn more.

## Checking the Container Status

When `LIFERAY_CONTAINER_STATUS_ENABLED` is set to true, a separate thread is forked out to check the status of the container. The container status is written to `/opt/liferay/container_status`. This thread checks the HTTP response to `LIFERAY_CONTAINER_STATUS_REQUEST_URL` every three seconds before a successful startup and every 30 seconds after there was a successful startup. The `LIFERAY_CONTAINER_STATUS_REQUEST_URL` can be changed to a publicly accessible URL as long as it's `http://` and in port 8080. The request timeout can be configured in `LIFERAY_CONTAINER_STATUS_REQUEST_TIMEOUT`. For example, with the default value of 10, the thread waits 13 seconds before checking again. The request is only considered successful when the returned page contains the string in `LIFERAY_CONTAINER_STATUS_REQUEST_CONTENT` if it is not empty.

The potential values for the `container_status` file are:

- **acquiring-startup-lock**: The container is trying to lock the cluster for startup (see [Startup Lock](#startup-lock)).

- **pre-configure-scripts**: The “pre-configure” scripts are being run.

- **configure**: The configure step is being done.

- **pre-startup-scripts**: The “pre-startup” scripts are being run.

- **liferay-start**: Liferay is starting up and it’s not responding properly yet.

- **post-shutdown**: Liferay has been shut down.

- **fail, HTTP-response-error, curl-return-code-${exit_code}**: Liferay started, but there was an error. The HTTP response and the curl command's return code are written to the file.

- **fail, content-missing**: Liferay responds without errors, but the content specified in `LIFERAY_CONTAINER_STATUS_REQUEST_CONTENT` is not present on the page.

- **live**: Everything seems to be healthy.

If the Liferay service's status changed from live to fail, thread dumps are created in the directory set by `LIFERAY_THREAD_DUMPS_DIRECTORY`.

## Startup Lock

!!! important
    You must enable and properly configure the container status settings before enabling startup lock.

To avoid two or more Liferay DXP nodes starting at the same time, there’s a simple mechanism which uses a shared file system between the nodes to signal that one node is starting up. To leverage this feature, set `LIFERAY_CONTAINER_STARTUP_LOCK_ENABLED` environment variable to `true`. This creates a lock file in the path set in `LIFERAY_CONTAINER_STARTUP_LOCK_FILE`.

!!! important
    Startup lock is only available if the file location is on a shared file system.

The first DXP node creates the lock file and updates it every 30 seconds. If other nodes see this file, they wait for it to be removed before starting. The file content is the host name of the node which is actively starting. If the file isn't touched for over two minutes, the next node to check it starts normally and overrides the contents of the file.

## Creating Thread Dumps Intervals

The `LIFERAY_DOCKER_THREAD_DUMP_INTERVAL_FILE` variable should be a valid path to a file. Write a number to this file to set the interval of seconds between thread dumps or leave it empty to turn this feature off. The thread dumps are created in the `LIFERAY_THREAD_DUMPS_DIRECTORY` directory. So if `/opt/liferay/data/sre/thread_dump_interval` is `3`, it creates a thread dump every three seconds.

This is a useful tool to generate thread dumps on several cluster nodes if the file is on a shared file system. It can be also used to detect startup problems if the file is already created when the container starts.

## Container Life Cycle Probe

The Liferay Docker container comes with an out-of-the-box life cycle probe. By using `usr/local/bin/probe_container_lifecycle.sh`, the status of the container can be quickly checked without timeouts. The probe only returns true if the container status is live. If the status hasn't been updated for more than two minutes, it fails (this might happen if the monitoring thread's check fails).

!!! tip
    The life cycle probe is recommended if you're using Kubernetes.