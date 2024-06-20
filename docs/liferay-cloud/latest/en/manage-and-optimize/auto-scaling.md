---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Cloud Platform Services
- Liferay PaaS
uuid: f5e2b006-daf3-4775-9182-0d9455a63b38
---
# Auto-scaling

Liferay Cloud's auto-scaling feature automatically creates and destroys instances of the Liferay service as needed to optimize performance. This addresses sudden changes such as increased server traffic, memory leaks, or other issues. By default, this feature is *disabled* in every Liferay Cloud account.

Using this feature, a service can automatically increase (upscale) the number of Liferay DXP instances to a [defined maximum](#setting-the-maximum-number-of-additional-instances) (10 by default), or decrease (downscale) to the number specified in the `scale` property in [`LCP.json`](../reference/configuration-via-lcp-json.md). The `scale` property specifies the minimum number of instances to run:

```json
  "scale": 2,
```

Make sure to monitor your application's [resource usage](./quotas-and-resource-usage.md) (CPU and memory) regularly for applications that require auto-scaling. More insight into your resource requirements helps you more effectively fine-tune your [JVM memory settings](#jvm-memory-configuration) and [auto-scaling behavior](#specifying-target-average-utilization).

## How Auto-Scaling is Charged

Auto-scaling is only available for the Liferay DXP service in production environments. Once auto-scaling is enabled, each extra instance of the service incurs an hourly charge. This charge is independent of the normal Liferay PaaS subscription process.

Liferay issues an invoice to customers after each quarter that they use or deploy auto-scaling instances. Customers must pay this invoice in accordance with their agreement with Liferay.

For each service instance added via auto-scaling, the price depends on your subscription plan. The total charge is based on the number of clock hours that the customer used the scaled instances. For pricing purposes, the total usage during a calendar quarter is rounded up to the nearest full clock hour.

## JVM Memory Configuration

For auto-scaling to work properly, it is important to set an appropriate memory allocation for your Liferay image's JVM. This allocation is necessary to allow the memory usage to expand or contract depending on the server's load.

Set the `liferay` service's `LIFERAY_JVM_OPTS` environment variable to allocate memory using the `-Xms` and `-Xmx` flags. The `-Xms` flag sets the initial memory allocation when the service starts, while the `-Xmx` flag determines the maximum memory allocation for the JVM. For example, if you have a total of 16 GB provisioned and available for this service, you can set this configuration:

```bash
-Xms4096m -Xmx12288m
```

The recommended configuration is to set the `-Xms` flag using 25% of the available memory, and to set the `-Xmx` flag using 75% of the available memory. *Make sure to set your `-Xmx` value lower than the service's total available memory* to avoid errors when other processes in the container require more memory.

Here are some recommended configurations for different levels of memory available to your `liferay` service:

| **Available Memory** | **Recommended LIFERAY_JAVA_OPTS** |
| :------------------- | :-------------------------------- |
| 8 GB                 | -Xms2048m -Xmx6144m               |
| 16 GB                | -Xms4096m -Xmx12288m              |
| 24 GB                | -Xms6144m -Xmx18432m              |
| 32 GB                | -Xms8192m -Xmx24576m              |
| 64 GB                | -Xms16384m -Xmx49152m             |

!!! note
    The `LIFERAY_JAVA_OPTS` variable may appear with other flags, in addition to `-Xms` and `-Xmx`. If other flags are present, update the environment variable with the memory arguments without removing the others.

See [Defining Environment Variables](../reference/defining-environment-variables.md) for help adding this environment variable to your `liferay` service.

## Managing Auto-scaling

Follow these steps to enable or disable auto-scaling in the Liferay Cloud Console:

1. Navigate to the production environment.
1. Navigate to *Services* &rarr; *Liferay* &rarr; *Scale*.
1. Toggle the switch to enable or disable auto-scaling.

With auto-scaling enabled, Liferay Cloud monitors your service and scales it automatically according to the threshold you define.

![Enable or disable auto-scaling from your service's Scale tab.](./auto-scaling/images/01.png)

### Setting the Maximum Number of Additional Instances

By default, auto-scaling can increase the number of instances for the `liferay` service up to 10. You can, however, override this default to use more instances if necessary. You must make changes in two places to accomplish this.

1. Set the `LCP_HAPROXY_SERVER_TEMPLATE_BACKEND_NUM` [environment variable](../reference/defining-environment-variables.md) in your [web server service](../platform-services/web-server-service.md) to the highest *total* number needed. The `liferay` service may not scale beyond the maximum number of instances defined in `LCP_HAPROXY_SERVER_TEMPLATE_BACKEND_NUM` (10 by default).

1. On the Liferay service's *Scale* tab, update the number in *Max number of additional instances* to the desired value.

   !!! note
       This field sets the additional number of instances that auto-scaling can create, adding to the base number of instances. It does not set the maximum total number it can create.

1. Click *Update*.

Once you have updated both of these configurations, auto-scaling adds additional instances to the `liferay` service, up to your newly defined maximum.

## Specifying Target Average Utilization

System administrators can specify a *target average utilization*. This value is an average of memory and CPU usage across Liferay DXP services. That value threshold must be crossed before auto-scaling is triggered.

For example, if three service instances utilize 70%, 90%, and 95% of memory, respectively, then the average memory utilization is 85%. If the target average utilization is set to 90, no upscaling is needed; upscaling in this situation only occurs when the average memory utilization exceeds the target.

The total available memory is specified by the `memory` property in `LCP.json`, as referenced in [Configuration via LCP.json](../reference/configuration-via-lcp-json.md).

Specify the target average utilization in the `autoscale` property of the service's `LCP.json`:

```json
"autoscale": {
  "cpu": 80,
  "memory": 90
}
```

Balance your target average utilization according to your application's specific needs for the most efficient auto-scaling. For example, this configuration heavily prioritizes CPU usage:

```json
"autoscale": {
  "cpu": 60,
  "memory": 95
}
```

If the `autoscale` property isn't set, the target average utilization defaults to 80 for both CPU and memory utilization.

## Auto-scaling and DXP Activation Keys

An activation key is typically required to be deployed and validated to use self-hosted Liferay DXP. On Liferay Cloud when auto-scaling is enabled, the Liferay Cloud team resolves any DXP Activation key issues and adds and removes activation keys as needed.

## Monitoring Scaling

The Plan and Usage page contains the project's scaling information. Navigate to the *Scaling* tab. Under Scaling Summary, you can see

- How many environments have extra nodes from auto-scaling
- How many hours auto-scaling nodes were up during the selected time period
- The associated cost in USD for the nodes

!!! note
    The page only displays scaling events that finished before it loaded. Events that have started but haven't returned to the normal values don't appear on the page until they finish.

You can also see a detailed report for the selected time period in *Auto-scaling Report*.
