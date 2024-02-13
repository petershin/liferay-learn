---
toc:
  - ./using-glowroot-with-liferay/troubleshooting-jvm-issues-with-glowroot.md
  - ./using-glowroot-with-liferay/troubleshooting-liferay-performance-issues-with-glowroot.md
  - ./using-glowroot-with-liferay/troubleshooting-templates-with-glowroot-freemarker-plugin.md
  - ./using-glowroot-with-liferay/liferay-performance-use-cases-with-glowroot.md
---
# LiferayでGlowrootを使う

{bdg-secondary}`liferay DXP 2023.Q4+/Portal 7.4 GA100+`.

Liferayは、オープンソースのJavaアプリケーション監視ツールである [Glowroot](https://glowroot.org/) をバンドルしています。 このツールは、システムに関する有用な統計情報（サーバーへのリクエスト、エラーなど）を表示します。 最小限のオーバーヘッドで。 Glowrootを使用して、問題のトラブルシューティングとパフォーマンス問題の分析を行います。

## グロー・ルートの有効化

`GLOWROOT_ENABLED`環境変数を`true` に設定して Glowroot を有効にする。 例えば、

`docker run -e GLOWROOT_ENABLED=true -it -m 8g -p 8080:8080 liferay/dxp:latest`

Tomcatバンドルを使用している場合は、コマンドラインからGlowrootを実行する。 バンドルの `$CATALINA_HOME/bin` フォルダーに移動する。 次に、`./catalina.sh glowroot run`を実行する。

## グロー・ルートへのアクセス

Glowroot にアクセスするには、まず [管理者アカウント](../getting-started/introduction-to-the-admin-account.md#accessing-liferay-dxp-as-the-admin-user) で Liferay インスタンスにログインします。 Glowroot には、管理者ロールを持つユーザーのみがアクセスできます。

`http://localhost:8080/o/glowroot`に移動してダッシュボードにアクセスする。

![Access the Glowroot dashboard.](./using-glowroot-with-liferay/images/01.png)

## セントラルコレクターの設定

デフォルトでは、GlowrootはJVMがクラッシュした場合にデータを保存しないコレクタを組み込んで構成されています。 $LIFERAY_HOME/glowroot`フォルダに`glowroot.properties` ファイルを作成し、中央コレクタを設定します：

```properties
agent.id=liferay
collector.address=http://<collector_host>:8181
```

または、 [docker](https://github.com/glowroot/glowroot/wiki/Central-Collector-Installation#option-3-running-in-a-docker-container) でセントラル・コレクターをセットアップする。

## カスタムプラグインのデプロイ

[Glowrootでは、さまざまなカスタムプラグイン](https://github.com/glowroot/glowroot/tree/main/agent/plugins) 。 カスタムプラグインをデプロイするには、`$LIFERAY_HOME/glowroot/plugins`フォルダにドロップします。 新しいプラグインを作成するときは、必ず `com.liferay.glowroot.plugin.<plugin name>新しいプラグインを作成するときは、必ず`com.liferay.glowroot.plugin.

プラグインにカスタムパッケージが必要な場合は、`portal-ext.properties`ファイルの `module.framework.properties.org.osgi.framework.bootdelegation`プロパティで宣言してください。 例えば、

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

デプロイ後、Glowrootの **Configuration** &rarr; **Plugins** に移動し、プラグインを確認します。

## Glowroot によるアップグレードの監視

Glowroot は Liferay のアップグレードを監視するように設定できます。 `config.json`ファイルを作成し、`$LIFERAY_HOME/glowroot/`フォルダに置きます。 以下のサンプル設定をコピーして、JSONファイルに貼り付けます。

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

この設定は、Liferay がアップグレードの監視を開始したときに Glowroot が起動するために必要です。 [自動アップグレード機能](../installation-and-upgrades/upgrading-liferay/upgrade-basics/upgrading-via-auto-upgrade.md) を使って Liferay のアップグレードをトリガーします。

アップグレードが完了すると、Glowroot のドロップダウンメニューにアップグレードという新しいトランザクションタイプが表示されます。 ダッシュボードを表示するには、ドロップダウンメニューから「アップグレード」を選択します。

![Select upgrade from the drop-down menu to view the dashboard.](./using-glowroot-with-liferay/images/02.png)

## 次のステップ

- [Glowroot による JVM の問題のトラブルシューティング](./using-glowroot-with-liferay/troubleshooting-jvm-issues-with-glowroot.md)
- [Glowroot による Liferay パフォーマンス問題のトラブルシューティング](./using-glowroot-with-liferay/troubleshooting-liferay-performance-issues-with-glowroot.md)
- [Glowroot Freemarker プラグインによるテンプレートのトラブルシューティング](./using-glowroot-with-liferay/troubleshooting-templates-with-glowroot-freemarker-plugin.md)
- [Glowroot による Liferay パフォーマンスの使用例](./using-glowroot-with-liferay/liferay-performance-use-cases-with-glowroot.md)
