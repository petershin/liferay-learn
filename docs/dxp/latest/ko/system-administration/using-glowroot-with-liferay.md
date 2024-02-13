---
toc:
  - ./using-glowroot-with-liferay/troubleshooting-jvm-issues-with-glowroot.md
  - ./using-glowroot-with-liferay/troubleshooting-liferay-performance-issues-with-glowroot.md
  - ./using-glowroot-with-liferay/troubleshooting-templates-with-glowroot-freemarker-plugin.md
  - ./using-glowroot-with-liferay/liferay-performance-use-cases-with-glowroot.md
---
# Liferay와 함께 Glowroot 사용

{bdg-secondary}`liferay DXP 2023.Q4+/포탈 7.4 GA100+`

Liferay는 오픈 소스 Java 애플리케이션 모니터링 도구인  [Glowroot](https://glowroot.org/) 번들로 제공합니다. 이 도구는 시스템에 대한 유용한 통계(예: 서버 요청, 오류 등)를 표시합니다. 최소한의 오버헤드로. Glowroot를 사용하여 문제를 해결하고 성능 문제를 분석하세요.

## 글로우루트 활성화

'GLOWROOT_ENABLED' 환경 변수를 'true'로 설정하여 Glowroot를 활성화합니다. 예를 들어,

`docker run -e GLOWROOT_ENABLED=true -it -m 8g -p 8080:8080 liferay/dxp:latest`

Tomcat 번들을 사용하는 경우 명령줄에서 Glowroot를 실행하세요. 번들의 `$CATALINA_HOME/bin` 폴더로 이동하세요. 그런 다음 `./catalina.sh Glowroot run`을 실행합니다.

## 글로우루트에 접근하기

Glowroot에 액세스하려면 먼저 [관리자 계정](../getting-started/introduction-to-the-admin-account.md#accessing-liferay-dxp-as-the-admin-user) 사용하여 Liferay 인스턴스에 로그인하세요. Glowroot는 관리자 역할을 가진 사용자만 액세스할 수 있습니다.

대시보드에 액세스하려면 `http://localhost:8080/o/glowroot`로 이동하세요.

![Access the Glowroot dashboard.](./using-glowroot-with-liferay/images/01.png)

## 중앙 수집기 구성

기본적으로 Glowroot는 JVM 충돌 시 데이터를 보존하지 않는 내장형 수집기로 구성됩니다. `$LIFERAY_HOME/glowroot` 폴더에 `glowroot.properties` 파일을 생성하여 중앙 수집기를 구성합니다.

```properties
agent.id=liferay
collector.address=http://<collector_host>:8181
```

또는 [docker](https://github.com/glowroot/glowroot/wiki/Central-Collector-Installation#option-3-running-in-a-docker-container) 에서 중앙 수집기를 설정하십시오.

## 사용자 정의 플러그인 배포

[Glowroot에는 다양한 사용자 정의 플러그인](https://github.com/glowroot/glowroot/tree/main/agent/plugins) 을 사용할 수 있습니다. 사용자 정의 플러그인을 배포하려면 해당 플러그인을 `$LIFERAY_HOME/glowroot/plugins` 폴더에 놓습니다. `com.liferay.glowroot.plugin 패키지를 사용하세요.<plugin name>` 새 플러그인을 생성할 때.

플러그인에 사용자 정의 패키지가 필요한 경우 `module.framework.properties.org.osgi.framework.bootdelegation` 속성 아래의 `portal-ext.properties` 파일에서 이를 선언하세요. 예를 들어,

```properties
module.framework.properties.org.osgi.framework.bootdelegation=\
  __redirected,\
  com.liferay.expando.kernel.model,\
  com.liferay.glowroot.plugin.*,\
  com.liferay.portal.servlet.delegate,\
  com.liferay.portal.servlet.delegate*,\
  com.sun.ccpp,\
  com.sun.ccpp.*,\
  com.sun.crypto.*,\
  com.sun.image.*,\
  com.sun.imageio.plugins.*,\
  com.sun.jmx.*,\
  com.sun.jndi.*,\
  com.sun.mail.*,\
  com.sun.management.*,\
  com.sun.media.*,\
  com.sun.msv.*,\
  com.sun.org.*,\
  com.sun.tools.*,\
  com.sun.xml.*,\
  com.yourkit.*,\
  jdk.*,\
  org.glowroot.agent,\
  org.glowroot.agent.*,\
  sun.*,\
  weblogic.jndi,\
  weblogic.jndi.*
```

배포한 후 Glowroot에서 **Configuration** &rarr; **Plugins** 로 이동하여 플러그인을 확인하세요.

## Glowroot로 업그레이드 모니터링

Liferay 업그레이드를 모니터링하도록 Glowroot를 구성할 수 있습니다. `config.json` 파일을 생성하여 `$LIFERAY_HOME/glowroot/` 폴더에 넣습니다. 아래 샘플 구성을 복사하여 JSON 파일에 붙여넣습니다.

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

Liferay가 업그레이드 모니터링을 시작할 때 Glowroot를 시작하려면 이 구성이 필요합니다. [자동 업그레이드 기능으로 Liferay 업그레이드를 시작하세요](../installation-and-upgrades/upgrading-liferay/upgrade-basics/upgrading-via-auto-upgrade.md) .

업그레이드가 완료되면 Glowroot에서 드롭다운 메뉴에 업그레이드라는 새로운 거래 유형이 나타납니다. 대시보드를 보려면 드롭다운 메뉴에서 '업그레이드'를 선택하세요.

![Select upgrade from the drop-down menu to view the dashboard.](./using-glowroot-with-liferay/images/02.png)

## 다음 단계

* [Glowroot로 JVM 문제 해결](./using-glowroot-with-liferay/troubleshooting-jvm-issues-with-glowroot.md)
* [Glowroot로 Liferay 성능 문제 해결](./using-glowroot-with-liferay/troubleshooting-liferay-performance-issues-with-glowroot.md)
* [Glowroot Freemarker 플러그인을 사용한 템플릿 문제 해결](./using-glowroot-with-liferay/troubleshooting-templates-with-glowroot-freemarker-plugin.md)
* [Glowroot를 사용한 Liferay 성능 사용 사례](./using-glowroot-with-liferay/liferay-performance-use-cases-with-glowroot.md)
