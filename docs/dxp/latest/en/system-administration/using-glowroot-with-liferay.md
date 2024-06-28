---
toc:
  - ./using-glowroot-with-liferay/troubleshooting-jvm-issues-with-glowroot.md
  - ./using-glowroot-with-liferay/troubleshooting-liferay-performance-issues-with-glowroot.md
  - ./using-glowroot-with-liferay/troubleshooting-templates-with-glowroot-freemarker-plugin.md
  - ./using-glowroot-with-liferay/liferay-performance-use-cases-with-glowroot.md
  - ./using-glowroot-with-liferay/developing-glowroot-plugins.md
uuid: 699aecdd-490f-4386-9a95-1168eff8f1c0
taxonomy-category-names:
- Development and Tooling
- Liferay Self-Hosted
---

# Using Glowroot with Liferay

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA100+`

Liferay bundles [Glowroot](https://glowroot.org/), the open source Java application monitoring tool. The tool displays helpful statistics about your system (e.g. server requests, errors, etc.) with minimal overhead. Use Glowroot to troubleshoot issues and analyze performance issues.

!!! important
	If your Liferay instance is clustered and has multiple nodes, Glowroot data may be misleading.

## Enabling Glowroot

{bdg-primary}`Self-Hosted only`

Enable Glowroot with the `GLOWROOT_ENABLED` environment variable set to `true`. For example,

`docker run -e GLOWROOT_ENABLED=true -it -m 8g -p 8080:8080 liferay/dxp:latest`

If using a Tomcat bundle, run Glowroot from the command line. Navigate to your bundle's `$CATALINA_HOME/bin` folder. Then execute `./catalina.sh glowroot run` (or `catalina.bat glowroot run` on Windows).

## Accessing Glowroot

To access Glowroot, first log in to your Liferay instance with [your administrator account](../getting-started/introduction-to-the-admin-account.md#accessing-liferay-dxp-as-the-admin-user). Glowroot can only be accessed by users with an administrator role.

Navigate to `http://localhost:8080/o/glowroot` to access the dashboard.

![Access the Glowroot dashboard.](./using-glowroot-with-liferay/images/01.png)

## Configure a Central Collector

By default, Glowroot is configured with an embedded collector that does not preserve data in the event of a JVM crash. Configure a central collector by creating a `glowroot.properties` file in your `$LIFERAY_HOME/glowroot` folder:

```properties
agent.id=liferay
collector.address=http://<collector_host>:8181
```

Or [set up the central collector in docker](https://github.com/glowroot/glowroot/wiki/Central-Collector-Installation#option-3-running-in-a-docker-container).

## Monitoring Upgrades with Glowroot

Glowroot can be configured to monitor Liferay upgrades. Create a `config.json` file and place it in your `$LIFERAY_HOME/glowroot/` folder. Copy and paste the sample configuration below into the JSON file.

```json
{
	"advanced":
	{
		"immediatePartialStoreThresholdSeconds": 60,
		"maxProfileSamplesPerTransaction": 50000,
		"maxQueryAggregates": 500,
		"maxServiceCallAggregates": 500,
		"maxTraceEntriesPerTransaction": 2000,
		"maxTransactionAggregates": 500,
		"mbeanGaugeNotFoundDelaySeconds": 60
	},
	"gauges":
	[
		{
			"mbeanAttributes":
			[
				{
					"name": "HeapMemoryUsage.used"
				}
			],
			"mbeanObjectName": "java.lang:type=Memory"
		},
		{
			"mbeanAttributes":
			[
				{
					"counter": true,
					"name": "CollectionCount"
				},
				{
					"counter": true,
					"name": "CollectionTime"
				}
			],
			"mbeanObjectName": "java.lang:type=GarbageCollector,name=*"
		},
		{
			"mbeanAttributes":
			[
				{
					"name": "Usage.used"
				}
			],
			"mbeanObjectName": "java.lang:type=MemoryPool,name=*"
		},
		{
			"mbeanAttributes":
			[
				{
					"name": "FreePhysicalMemorySize"
				},
				{
					"name": "ProcessCpuLoad"
				},
				{
					"name": "SystemCpuLoad"
				}
			],
			"mbeanObjectName": "java.lang:type=OperatingSystem"
		}
	],
	"instrumentation":
	[
		{
			"alreadyInTransactionBehavior": "capture-new-transaction",
			"captureKind": "transaction",
			"className": "com.liferay.portal.kernel.upgrade.UpgradeStep",
			"methodName": "upgrade",
			"methodParameterTypes":
			[],
			"order": 0,
			"timerName": "Upgrade Step Timer",
			"traceEntryMessageTemplate": "Upgrade Step {{this.class.name}}",
			"transactionNameTemplate": "Upgrade Step {{this.class.name}}",
			"transactionType": "Upgrade"
		},
		{
			"alreadyInTransactionBehavior": "capture-new-transaction",
			"captureKind": "transaction",
			"className": "com.liferay.portal.kernel.upgrade.UpgradeProcess",
			"methodName": "upgrade",
			"methodParameterTypes":
			[],
			"order": 0,
			"timerName": "Upgrade Process Timer",
			"traceEntryMessageTemplate": "Upgrade Process {{this.class.name}}",
			"transactionNameTemplate": "Upgrade Process {{this.class.name}}",
			"transactionType": "Upgrade"
		}
	],
	"jvm":
	{
		"maskMBeanAttributes":
		[
			"*password*"
		],
		"maskSystemProperties":
		[
			"*password*"
		]
	},
	"plugins":
	[
		{
			"id": "cassandra",
			"properties":
			{
				"stackTraceThresholdMillis": 1000.0
			}
		},
		{
			"id": "elasticsearch",
			"properties":
			{
				"stackTraceThresholdMillis": 1000.0
			}
		},
		{
			"id": "java-http-server",
			"properties":
			{
				"captureRequestHeaders":
				[],
				"captureRequestRemoteAddr": false,
				"captureRequestRemoteHost": false,
				"captureResponseHeaders":
				[],
				"maskRequestHeaders":
				[
					"Authorization"
				],
				"traceErrorOn4xxResponseCode": false
			}
		},
		{
			"id": "jaxrs",
			"properties":
			{
				"useAltTransactionNaming": false
			}
		},
		{
			"id": "jdbc",
			"properties":
			{
				"captureBindParametersExcludes":
				[],
				"captureBindParametersIncludes":
				[
					".*"
				],
				"captureConnectionClose": false,
				"captureConnectionLifecycleTraceEntries": false,
				"captureConnectionPoolLeakDetails": false,
				"captureConnectionPoolLeaks": false,
				"captureGetConnection": true,
				"capturePreparedStatementCreation": false,
				"captureResultSetGet": false,
				"captureResultSetNavigate": true,
				"captureStatementClose": false,
				"captureTransactionLifecycleTraceEntries": false,
				"stackTraceThresholdMillis": 1000.0
			}
		},
		{
			"id": "liferay-freemarker-templates-plugin",
			"properties":
			{
				"instrumentationLevel": "INFO"
			}
		},
		{
			"id": "logger",
			"properties":
			{
				"traceErrorOnErrorWithThrowable": true,
				"traceErrorOnErrorWithoutThrowable": false,
				"traceErrorOnWarningWithThrowable": false,
				"traceErrorOnWarningWithoutThrowable": false
			}
		},
		{
			"id": "mongodb",
			"properties":
			{
				"stackTraceThresholdMillis": 1000.0
			}
		},
		{
			"id": "play",
			"properties":
			{
				"useAltTransactionNaming": false
			}
		},
		{
			"id": "servlet",
			"properties":
			{
				"captureRequestHeaders":
				[],
				"captureRequestLocalAddr": false,
				"captureRequestLocalHostname": false,
				"captureRequestLocalPort": false,
				"captureRequestParameters":
				[
					"*"
				],
				"captureRequestRemoteAddr": false,
				"captureRequestRemoteHostname": false,
				"captureRequestRemotePort": false,
				"captureRequestServerHostname": false,
				"captureRequestServerPort": false,
				"captureResponseHeaders":
				[],
				"captureSessionAttributes":
				[],
				"maskRequestParameters":
				[
					"*password*"
				],
				"sessionUserAttribute": "",
				"traceErrorOn4xxResponseCode": false
			}
		},
		{
			"id": "spring",
			"properties":
			{
				"useAltTransactionNaming": false
			}
		}
	],
	"transactions":
	{
		"captureThreadStats": true,
		"profilingIntervalMillis": 1000,
		"slowThresholdMillis": 2000
	},
	"uiDefaults":
	{
		"defaultGaugeNames":
		[
			"java.lang:type=Memory:HeapMemoryUsage.used"
		],
		"defaultPercentiles":
		[
			50.0,
			95.0,
			99.0
		],
		"defaultTransactionType": "Web"
	}
}
```

Note that this configuration is needed for Glowroot to start when Liferay starts to monitor the upgrade. Trigger a Liferay upgrade with the [auto upgrade feature](../installation-and-upgrades/upgrading-liferay/upgrade-basics/upgrading-via-auto-upgrade.md).

Once the upgrade is complete, in Glowroot, a new transaction type called upgrade appears in the drop-down menu. Select `Upgrade` from the drop-down menu to view the dashboard.

![Select upgrade from the drop-down menu to view the dashboard.](./using-glowroot-with-liferay/images/02.png)

## Next Steps

- [Troubleshooting JVM Issues with Glowroot](./using-glowroot-with-liferay/troubleshooting-jvm-issues-with-glowroot.md)
- [Troubleshooting Liferay Performance Issues with Glowroot](./using-glowroot-with-liferay/troubleshooting-liferay-performance-issues-with-glowroot.md)
- [Troubleshooting Templates with Glowroot Freemarker Plugin](./using-glowroot-with-liferay/troubleshooting-templates-with-glowroot-freemarker-plugin.md)
- [Liferay Performance Use Cases with Glowroot](./using-glowroot-with-liferay/liferay-performance-use-cases-with-glowroot.md)
- [Developing Glowroot Plugins](./using-glowroot-with-liferay/developing-glowroot-plugins.md)
