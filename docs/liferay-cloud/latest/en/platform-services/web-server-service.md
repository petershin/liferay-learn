---
taxonomy-category-names:
- Cloud
- Cloud Platform Services
- Liferay PaaS
uuid: 00bb067c-b489-4ebd-9ba2-767303b21401
---
# Web Server Service (Nginx)

The Nginx web server functions as a gateway from the open internet to your Liferay Cloud services. It handles all traffic from your users and acts as a high-performance web server.

![The web server is one of several services available in Liferay Cloud.](./web-server-service/images/01.png)

See the [Web server service limitations](../reference/platform-limitations.md#web-server-service) section for more information.

## Configurations

Although Liferay Cloud's services are fine-tuned to work well by default, you may need to configure Nginx further. To do this, you can include any configuration (`.conf`) file inside the `configs/[ENV]/conf.d/` folder. When you deploy your changes, the file is automatically injected into your service and overwrites the default configuration. Here's an example folder structure with a configuration file inside the appropriate directory:

    webserver
    ├── configs
    │   └── common
    │       └── conf.d
    │           └── nginx.conf
    └── LCP.json

Files in `/webserver/configs/[ENV]/` are copied as overrides into `/etc/nginx/` in the web server container in Liferay Cloud. Files in `/webserver/configs/[ENV]/public/` are copied as overrides into `var/www/html/`.

## Automatic Log Rotation

{bdg-secondary}`Web server version 5.3.0+`

Nginx's access and error logs (by default, stored in the Nginx container's `/var/log/nginx/` directory) automatically rotate to prevent the individual files from becoming too large to read. On a regular interval (by default, every midnight in UTC), the current access and error log files are rotated and replaced with new files. Automatic rotation also occurs if the files reach a certain maximum size threshold (by default, 50 MB).

The newest files after rotation are created with a `.0` postfix to the file names, and successively older files have postfixes ordered sequentially (`.1`, `.2`, etc.). The rotation is handled smoothly and does not interrupt Nginx or your service's regular function.

You can define these environment variables in your web server service to adjust the rotation behavior:

* `LCP_LOGROTATE_SCHEDULE`: Defines the schedule for automatic rotation (using a Cron schedule syntax, in UTC±00).

* `LCP_LOGROTATE_FILE_SIZE`: Defines a maximum size for log files before they are automatically rotated.

* `LCP_LOGROTATE_FILE_COUNT`: Defines the maximum number of rotated log files to keep in the container.

## Scripts

You can use scripts for more extensive customizations, but you must use caution when doing so. This is the most powerful way to customize the web server service and can cause undesired side effects.

Any `.sh` files found in the `configs/[ENV]/scripts/` folder are run prior to starting your service. For example, you can place a script in this directory structure to remove all log files:

    webserver
    ├── configs
    │   └── common
    │       └── scripts
    │           └── remove-log-files.sh
    └── LCP.json

## Key Deployment Directories

| **File Type**             | **Path**                         | **Description**                                                     |
| :------------------------ | :------------------------------- | :------------------------------------------------------------------ |
| Web server configurations | webserver/configs/[ENV]/conf.d/  | [Configuration files, including `nginx.conf`.](#configuration)      |
| Static content            | webserver/configs/[ENV]/public/  | Static content served to your site.                                 |
| Custom scripts            | webserver/configs/[ENV]/scripts/ | [Scripts](#scripts) here automatically run when the service starts. |

## Environment Variables

These environment variables are available for the web server service:

| Name | Default value | Description |
| :--- | :--- | :--- |
| `LCP_HAPROXY_RESOLVER_HOLD_TIME` | `10` | Configures the [`hold` configuration](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-hold) for the HAProxy load balancer. This configuration is for the `valid` status.|
| `LCP_HAPROXY_RESOLVER_RETRIES` | `3` | Configures the [`resolve_retries` configuration](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-resolve_retries) for the HAProxy load balancer (the number of retries the session will attempt to connect to the server before giving up).|
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RESOLVE` | `1` | Configures the [`timeout` configuration](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) for the HAProxy load balancer (the number of seconds for an event timeout). This configuration is for the `resolve` event.|
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RETRY` | `1` | Configures the [`timeout` configuration](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) for the HAProxy load balancer (the number of seconds for an event timeout). This configuration is for the `retry` event.|
| `LCP_HAPROXY_SERVER_TEMPLATE_BACKEND_NUM` | `10` | Overrides the maximum number of instances for any service. If you plan to use [auto-scaling](../manage-and-optimize/auto-scaling.md), then set this to the highest value needed. |
| `LCP_LOGROTATE_FILE_COUNT` | `52` | The maximum number of Nginx access and error logs to keep (for each) after [automatic rotation](#automatic-log-rotation). The oldest files are removed beyond this limit. |
| `LCP_LOGROTATE_FILE_SIZE` | `50M` | The maximum size an Nginx access or error log can reach before it forces [automatic log rotation](#automatic-log-rotation). |
| `LCP_LOGROTATE_SCHEDULE` | `0 0 * * *` | A Cron schedule for when [automatic Nginx log rotation](#automatic-log-rotation) occurs. |
| `LCP_WEBSERVER_LOG_FORMAT` |   | Customizes the format for Nginx logging. See the [official Nginx documentation](https://docs.nginx.com/nginx/admin-guide/monitoring/logging/#setting-up-the-access-log). |
| `LCP_WEBSERVER_MODSECURITY` | `Off` | Enables or disables ModSecurity. Set this value to `On` to enable and process rules, or to `DetectionOnly` to process rules without executing any disruptive actions. See [Web Application Firewall](..//tuning-security-settings/web-application-firewall.md). |

The [Ingress Load Balancer](../infrastructure-and-operations/networking/load-balancer.md) is also configured via the web server service. Environment variables can be added to this service to configure the load balancer and custom domains. See [the Load Balancer environment variables reference](../infrastructure-and-operations/networking/load-balancer.md#environment-variables-reference) for more information.

All environment variables and other forms of configuration for Nginx are in the [official Nginx documentation](https://docs.nginx.com/). You can set such configurations in the `configs/[ENV]/` directory, and environment variables in the service's `LCP.json` file.
