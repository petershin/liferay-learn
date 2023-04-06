---
toc:
- ./using-the-liferay-dxp-service/deploying-to-the-liferay-service.md
- ./using-the-liferay-dxp-service/updating-your-dxp-instance-to-a-new-minor-version.md
- ./using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md
- ./using-the-liferay-dxp-service/liferay-service-environment-variables.md
- ./using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md
- ./using-the-liferay-dxp-service/using-the-mysql-client.md
- ./using-the-liferay-dxp-service/upgrading-your-liferay-dxp-instance.md
---
# Liferay DXPサービスの使用

Liferayサービスは、あらゆるプロジェクトの心臓部です。 アプリケーションのLiferay DXPインスタンスを実行し、Webサーバー、Elasticsearch、MySQLデータベースなどの他のサービスとやり取りします。

![Liferayサービスは、Liferay Cloudで利用できるいくつかのサービスのうちの1つです](./using-the-liferay-dxp-service/images/01.png)

Liferay CloudのLiferayサービスは、Liferay DXPのオンプレミスインスタンスと同じように多くの方法で使用できます。 ただし、Liferay Cloudでインスタンスを操作する場合、設定と開発のワークフローにもいくつかの違いがあります。

詳しくは[Liferayサービスの制限](./reference/platform-limitations.md#liferay-service)をご覧ください。

-   [バージョンを選ぶ](#choosing-a-version)
-   [デプロイメント（カスタマイズ、パッチ、ライセンス）](#deployment-customization-patching-and-licensing)
-   [Configuration](#コンフィギュレーション)
-   [ホットデプロイ](#hot-deploy)
-   [クラスタリングの有効化](#enabling-clustering)
-   [ランニングスクリプト](#running-scripts)

## バージョンの選択

使用している Liferay DXP のメジャーバージョンは、Git リポジトリの `liferay/` フォルダ内の `LCP.json` ファイルに設定されています。 `LCP.json`ファイル内のDockerイメージ名を用いて、`image` 変数にメジャーバージョンを設定します。

```
"image": "liferaycloud/liferay-dxp:7.2-4.0.1"
```

同じ `liferay/` フォルダ内の `gradle.properties` ファイルを使用して、特定のサービスパックとフィックスパックを定義することができます。 `liferay.workspace.docker.image.liferay` プロパティは、実際のデプロイに使用される、この特定の修正パックレベルを持つ別の Docker イメージ名を定義しています。

```properties
liferay.workspace.docker.image.liferay=liferay/dxp:7.2.10-sp2-202005120922
```

```{note}
もしあなたのLiferay Cloudスタックがまだ4.x.xにアップデートされていない場合、デフォルトではこのバージョンはリポジトリのルートにある `gradle.properties` ファイル内に代わりに配置されます。この場合、バージョンを `liferay.workspace.lcp.liferay.image` プロパティで定義します（メジャーバージョンとは別に定義する必要はありません）。バージョンの確認方法については、[Understanding Service Stack Versions](./reference/understanding-service-stack-versions.md) を参照してください。
```

Liferay Cloudの[Services Changelog](https://help.liferay.com/hc/en-us/sections/360006251311-Services-Changelog)で、新しいリリースごとのリファレンスを確認することができます。 新しい各サービスアップデートには、インスタンスに使用できるDockerイメージが含まれています。 また、[DXP tags on Docker Hub](https://hub.docker.com/r/liferay/dxp/tags?page=1)を直接確認して、使用するDockerイメージ名を探すこともできます。

リリースメモに記載されている新しいバージョンを使用して、Dockerイメージの値を更新します。 新しいDockerイメージは、インスタンスの起動時、または次回リポジトリからLiferayサービスをデプロイするときに使用されます。 新しいリリースのDockerイメージを使用して、他のサービスのプロパティをアップグレードすることもできます。

## デプロイメント（カスタマイズ、パッチ適用、ライセンス）

Liferay DXPへのカスタム追加の導入には、Gitリポジトリの適切な場所への新しいモジュール、ライセンス、またはホットフィックスの追加が含まれます。

`common/`ディレクトリを除き、環境固有のフォルダ（例：`dev`、`uat`、`prod`）に加えた変更は、対応する環境へのデプロイ時にのみ_伝搬されます。 `common/`ディレクトリに追加された変更は、対象となるデプロイメント環境に関わらず、常にデプロイされることになります。 これは、すべてのサービスの `configs/` ディレクトリ内のすべてのサブフォルダに適用されます。

Liferayサービスは、他のサービスに比べて多くのカスタマイゼーション（ホットフィックスの追加、モジュールのソースコードの構築など）を提供しているため、サービスをデプロイする際には、いくつかの考慮すべき点があります。 詳しくは[Liferayサービスへのデプロイ](./using-the-liferay-dxp-service/deploying-to-the-liferay-service.md) を参照してください。 さらに、デプロイメントのワークフロー全般の流れについては、[デプロイメントワークフローの概要](./build-and-deploy/overview-of-liferay-cloud-deployment-workflow.md) を参照ください。 Liferay Cloudへのデプロイに関するチュートリアルは、[DCP Cloud Console経由で変更をデプロイ](./build-and-deploy/deploying-changes-via-the-liferay-cloud-console.md) を参照してください。

## 設定

Liferayサービスに設定を適用するには、`portal.properties`の変更のように、Gitリポジトリに追加して、変更をGitにプッシュする必要があります。 これらの設定ファイルの追加については、[Liferay DXP サービスの設定](./using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md) を参照してください。

環境変数は、Liferayサービスの設定にも使用され、場合によってはポータルのプロパティをオーバーライドすることもあります。 詳しくは、[Liferay Service Environment Variables](./using-the-liferay-dxp-service/liferay-service-environment-variables.md) をご参照ください。

## ホットデプロイ

ホットデプロイは、Liferay DXP UIを介して実行できます。 これを行うには、［コントロールパネル］→［アプリ］→［アプリマネージャー］に移動します。 次に、右上の点をクリックして、「アップロード」をクリックします。 この画面から、ローカルファイルシステムからファイルを選択してデプロイおよびインストールできます。

```{note}
Liferay Cloudでホットデプロイを使用することは *not* 推奨されません。この方法でデプロイされたカスタマイズは、その後のLiferayサービスのデプロイ時に失われてしまうからです。
```

## クラスタリングを有効にする

Liferay CloudでのLiferay DXPのクラスタリングは、Liferay DXPでのクラスタリングに比べて非常に単純化されたプロセスです。 クラスタリングのサポートが利用可能で、Liferay Cloudですぐに使用できます。 クラスタリングの動作とスケールのための追加の設定には、いくつかの追加の手順が必要です。 詳しくは[Liferay Cloudでのクラスタリングの設定](./using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md) を参照してください。

## スクリプトの実行

`configs/{ENV}/scripts`フォルダにある `.sh` ファイルは、サービスを開始する前に自動的に実行されます。スクリプトは、より広範囲なカスタマイズのために使用することができます。ただし、その際は注意してください。これはLiferay DXPをカスタマイズする最も強力な方法であり、望ましくない副作用を引き起こす可能性があります。

例えば、すべてのログファイルを削除するスクリプトを含めるには、プロジェクトのGitリポジトリ内の次のディレクトリ構造に配置します。

```
liferay
├── LCP.json
└── configs
    └── dev
        ├── deploy
        ├── osgi
        ├── patching
        └── scripts
            ├── remove-log-files.sh
```

```{note}
もしバージョン 3.x.x のサービスを使っているなら、スクリプトは代わりにリポジトリの `lcp/liferay/script/` フォルダに属します。バージョンの確認方法については、[サービススタックのバージョンについて](./reference/understanding-service-stack-versions.md) を参照してください。
```

## 制限事項

Liferay DXPには、コンテンツを構築、管理、Webにデプロイするための強力な機能が多数搭載されています。 しかし、その中にはLiferay Cloudでは利用できない機能もあります。

-   [リモートステージング](https://learn.liferay.com/dxp/latest/en/site-building/publishing-tools/staging/configuring-remote-live-staging.html)は、現在Liferay Cloudでは未サポートです。 オンプレミスからLiferay Cloudに移行する場合、ステージング機能を継続して使用するためには、ローカルステージングに変更する必要があります。

## 追加情報

-   [Liferay サービスへのデプロイ](./using-the-liferay-dxp-service/deploying-to-the-liferay-service.md)
-   [Liferay Cloud Servicesへのログイン](get-started/logging-into-your-liferay-cloud-services.md)
-   [Liferay DXP サービスの設定](./using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)
-   [DCPクラウドコンソールによる変更のデプロイ](build-and-deploy/deploying-changes-via-the-liferay-cloud-console.md)

```{toctree}
:maxdepth: 1

using-the-liferay-dxp-service/deploying-to-the-liferay-service.md
using-the-liferay-dxp-service/updating-your-dxp-instance-to-a-new-minor-version.md
using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md
using-the-liferay-dxp-service/liferay-service-environment-variables.md
using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md
using-the-liferay-dxp-service/using-the-mysql-client.md
using-the-liferay-dxp-service/upgrading-you-liferay-dxp-instance.md
```

```{raw} html
:file: landingpage_template.html
```

```{raw} html
:file: using-the-liferay-dxp-service/landing.html
```
