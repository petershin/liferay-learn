---
uuid: a0fa82d8-4d7a-4f6a-bfec-a97106da9baf
taxonomy-category-names:
- DXP Self-Hosted Installation, Maintenance, and Administration
- DXP Configuration
- Liferay Self-Hosted
---
# Maintenance and Troubleshooting in Docker

## Container Status

Liferay containers can report their own statuses through a file which can be used to track the life-cycle of the container. The following environment variables can be used to configure it (showing default values):

```properties
LIFERAY_CONTAINER_STATUS_ENABLED="false"
LIFERAY_CONTAINER_STATUS_REQUEST_CONTENT=
LIFERAY_CONTAINER_STATUS_REQUEST_TIMEOUT=10
LIFERAY_CONTAINER_STATUS_REQUEST_URL=http://localhost:8080/c/portal/robots
```

By setting LIFERAY_CONTAINER_STATUS_ENABLED to true, a separate thread will be forked out to check the status of the container. The thread will check the http response to LIFERAY_CONTAINER_STATUS_REQUEST_URL every 3 seconds before a successful startup and every 30 seconds after there was a successful startup. The request timeout can be configured in  LIFERAY_CONTAINER_STATUS_REQUEST_TIMEOUT (seconds). The retries will be delayed by the timeout, this means that before the container startup the checks will be running for every 13 seconds with the default configuration. The LIFERAY_CONTAINER_STATUS_REQUEST_URL can be changed to a publicly accessible URL name, but keeping http and the port 8080. If LIFERAY_CONTAINER_STATUS_REQUEST_CONTENT is not empty, the returned page will be searched for that string and only consider the result successful if that is available.

The container status is written to the /opt/liferay/container_status file. The potential values are:

- acquiring-startup-lock: When the container is trying to lock the cluster for startup (see startup lock feature)

- pre-configure-scripts: the “pre-configure” scripts are being run

- configure: the configure step is being done.

- pre-startup-scripts: the “pre-startup” scripts are being run

- liferay-start: liferay is starting up and it’s not yet properly responding

- post-shutdown: liferay has been shut down

- fail,http-response-error,curl-return-code-${exit_code}: liferay started up earlier, but there’s a http response problem and the exit code of curl is added

- fail,content-missing: Liferay responds without errors, but the content specified in LIFERAY_CONTAINER_STATUS_REQUEST_CONTENT is not present on the page.

- live: Everything seems to be healthy.

If the Liferay service changed from live to fail, thread dumps are created in the directory configured under LIFERAY_THREAD_DUMPS_DIRECTORY . By default it’s /opt/liferay/data/sre/thread_dumps.

## Container Lifecycle Probe

There’s a probe which we recommend to use in kubernetes if the container status is properly configured. By using /usr/local/bin/probe_container_lifecycle.sh, the status of the container can be quickly checked, without timeouts. The probe will only return true if the container status is live. If the status was not updated for more than 2 minutes, it will fail (this happens when the monitoring container lifecycle monitoring thread fails).

## Startup Lock

To avoid 2 Liferay DXP nodes starting up at the same time, there’s a simple mechanism which uses a shared file system between the nodes to signal that one node is starting up.

The feature uses the container status feature which needs to be enabled and properly configured before turning this feature on.

To leverage this feature, set LIFERAY_CONTAINER_STARTUP_LOCK_ENABLED environment variable to true. This will create the lock file on the LIFERAY_CONTAINER_STARTUP_LOCK_FILE path (default: /opt/liferay/data/liferay-startup-lock). It assumes a shared filesystem (between liferay nodes) under this file. 

The first DXP node will create this lock file and keep it up-to-date every 30 seconds. If other nodes see this file, they will wait for it to be removed. The file content is the host name of the node which is actively starting up. If the file was not touched for more than 2 minutes, the lock will be removed by one of the containers who will try to assume the lock.

## Thread Dump Created with Intervals

If LIFERAY_DOCKER_THREAD_DUMP_INTERVAL_FILE is not empty, the container will start a separate thread monitoring the file itself. By default it’s set to /opt/liferay/data/sre/thread_dump_interval. If this file contains a number, the container will create a thread dump to the LIFERAY_THREAD_DUMPS_DIRECTORY directory with the delay of the number of seconds written in this file. So if /opt/liferay/data/sre/thread_dump_interval is 3, it will create a thread dump every 3 seconds. If the file was not created, it takes less than 60 seconds to notice the change.

This is a useful tool if you need to generate thread dumps on several cluster nodes as if the file is on a shared file system, all of the nodes will start generating thread dumps. It can be also used to detect startup problems if the file is already created when the container starts up.

## Useful Scripts in the Container

- **generate_database_report.sh**: Generates a database report html file which contains information about tables which can cause performance issues (e.g. templates) or about locks and the status of the server.

- **generate_heap_dump.sh**: Generates heap dump. Start with -h parameter to learn about the parameters.

- **generate_thread_dump.sh**: Generates thread dumps with the set interval. By default it creates 20 thread dumps with 3 second delays, run it with -h to list the parameters.

- **inspect_document_library.sh**: See https://help.liferay.com/hc/en-us/articles/16529765923085-How-to-find-out-what-s-using-the-space-in-our-Document-Library-on-LXC-SM