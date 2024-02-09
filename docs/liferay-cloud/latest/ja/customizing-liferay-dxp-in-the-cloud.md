---
toc:
  - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service.md
  - >-
    - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md
    - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/liferay-service-environment-variables.md
    - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md
    - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/using-the-mysql-client.md
    - ./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/upgrading-your-liferay-dxp-instance.md
---
# Liferay DXPサービスの使用

Liferayサービスは、あらゆるプロジェクトの心臓部です。 アプリケーションのLiferay DXPインスタンスを実行し、Webサーバー、Elasticsearch、MySQLデータベースなどの他のサービスとやり取りします。

![Liferayサービスは、Liferay Cloudで利用可能ないくつかのサービスの1つです。](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/images/01.png)

Liferay CloudのLiferayサービスは、Liferay DXPのオンプレミスインスタンスと同じように多くの方法で使用できます。 ただし、Liferay Cloudでインスタンスを操作する場合、設定と開発のワークフローにもいくつかの違いがあります。

詳しくは、 [Liferay service limitations](./reference/platform-limitations.md#liferay-service) を参照してください。

* [バージョンの選択](#choosing-a-version)
* [デプロイメント（カスタマイズ、パッチ適用、ライセンス）](#deployment-customization-patching-and-licensing)
* [設定](#configuration)
* [ホットデプロイ](#hot-deploy)
* [クラスタリングを有効にする](#enabling-clustering)
* [スクリプトの実行](#running-scripts)

## バージョンの選択

使用しているLiferay DXPのメジャーバージョンは、Gitリポジトリの`liferay/`フォルダの`LCP.json`ファイル内で設定されています。 `LCP.json`ファイル内のDockerイメージ名を使用してメジャーバージョンを `image` 変数として設定します。

```
"image": "liferaycloud/liferay-dxp:7.2-4.0.1"
```

同じ `liferay/` フォルダ内の`gradle.properties`ファイルで、サービスパックとフィックスパックを定義します。 `liferay.workspace.docker.image.liferay` プロパティは、実際のデプロイに使用される、この特定のフィックスパックレベルを持つ別のDockerイメージ名を定義します。

```properties
liferay.workspace.docker.image.liferay=liferay/dxp:7.2.10-sp2-202005120922
```

```{note}
Liferay Cloudスタックがまだ 4.x.x にアップデートされていない場合、デフォルトではこのバージョンは代わりにリポジトリのルートにある `gradle.properties` ファイル内に格納されます。 この場合、`liferay.workspace.lcp.liferay.image`プロパティでバージョンを定義します（メジャーバージョンとは別に定義する必要はありません）。 バージョンチェックの詳細については、 [サービススタックのバージョンについて](./reference/understanding-service-stack-versions.md) を参照してください。
```

Liferay Cloudの [Services Changelog](https://help.liferay.com/hc/ja/sections/360006251311-Services-Changelog) を確認して、新リリースごとのリファレンスを確認できます。 新しい各サービスアップデートには、インスタンスに使用できるDockerイメージが含まれています。 また、 [Docker HubのDXPタグ](https://hub.docker.com/r/liferay/dxp/tags?page=1) を直接確認して、使用するDockerイメージ名を探すこともできます。

リリースメモに記載されている新しいバージョンを使用して、Dockerイメージの値を更新します。 新しいDockerイメージは、インスタンスの起動時、または次回リポジトリからLiferayサービスをデプロイするときに使用されます。 新しいリリースのDockerイメージを使用して、他のサービスのプロパティをアップグレードすることもできます。

## デプロイメント（カスタマイズ、パッチ適用、ライセンス）

Liferay DXPへのカスタム追加の導入には、Gitリポジトリの適切な場所への新しいモジュール、ライセンス、またはホットフィックスの追加が含まれます。

`common/`ディレクトリを除き、特定の環境フォルダ（`dev`、`uat`、`prod`など）に追加された変更は、対応する環境にデプロイするときに **のみ** 伝播されます。 `common/`ディレクトリに追加された変更は、ターゲットのデプロイ環境に関係なく、 **常に** デプロイされます。 これは、すべてのサービスにおいて、 `configs/` ディレクトリ内のすべてのサブフォルダに適用されます。

Liferayサービスは、他のサービスに比べて多くのカスタマイゼーション（ホットフィックスの追加、モジュールのソースコードの構築など）を提供しているため、サービスをデプロイする際には、いくつかの考慮すべき点があります。 詳しくは [Liferayサービスへのデプロイ](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service.md) を参照してください。 また、一般的なデプロイメントワークフローについては、 [Overview of Deployment Workflow](./updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) を参照してください。 Liferay Cloudへのデプロイのチュートリアルについては、 [Deploying Changes via DCP Cloud Console](./updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md)をご覧ください。

## 設定

`portal.properties` 変更など、Liferayサービスに設定を適用するには、Gitリポジトリに設定を追加し、変更をGitにプッシュする必要があります。 これらの設定ファイルの追加の詳細は、 [Liferay DXPサービスの設定](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)を参照してください。

環境変数は、Liferayサービスの設定にも使用され、場合によってはポータルのプロパティをオーバーライドすることもあります。 詳しくは、 [Liferayサービス環境変数](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/liferay-service-environment-variables.md) を参照してください。

## ホットデプロイ

ホットデプロイは、Liferay DXP UIを介して実行できます。 これを行うには、［コントロールパネル］→［アプリ］→［アプリマネージャー］に移動します。 次に、右上の点をクリックして、「アップロード」をクリックします。 この画面から、ローカルファイルシステムからファイルを選択してデプロイおよびインストールできます。

```{note}
Liferay Cloudでホットデプロイを使用することは *not* 推奨されません。この方法でデプロイされたカスタマイズは、その後のLiferayサービスのデプロイ時に失われてしまうからです。
```

## クラスタリングを有効にする

Liferay CloudでのLiferay DXPのクラスタリングは、Liferay DXPでのクラスタリングに比べて非常に単純化されたプロセスです。 クラスタリングのサポートが利用可能で、Liferay Cloudですぐに使用できます。 クラスタリングの動作とスケールのための追加の設定には、いくつかの追加の手順が必要です。 詳細は、 [Liferay Cloud](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md) でのクラスタリングのセットアップを参照してください。

## スクリプトの実行

`configs/{ENV}/scripts` フォルダーにある `.sh` ファイルは、サービスを開始する前に自動的に実行されます。 スクリプトは、より広範なカスタマイズに使用できます。 ただし、これを行う際は注意してください。 これはLiferay DXPをカスタマイズする最も強力な方法であり、望ましくない副作用を引き起こす可能性があります。

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
            └── remove-log-files.sh
```

## 制限事項

Liferay DXPには、コンテンツを構築、管理、Webにデプロイするための強力な機能が多数搭載されています。 しかし、その中にはLiferay Cloudでは利用できない機能もあります。

* [リモート本番環境ステージングの設定](https://learn.liferay.com/dxp/latest/ja/site-building/publishing-tools/staging/configuring-remote-live-staging.html) は、現在Liferay Cloudではサポートされていません。 オンプレミスからLiferay Cloudに移行する場合、ステージング機能を継続して使用するためには、ローカルステージングに変更する必要があります。

## 関連トピック

* [Liferayサービスへのデプロイ](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service.md)
* [Liferay Cloudサービスへのログイン](getting-started/logging-into-your-liferay-cloud-services.md)
* [Liferay DXPサービスの設定](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md)
* [Liferay Cloudコンソールによる変更のデプロイ](updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md)

```{toctree}
:maxdepth: 1

customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/deploying-to-the-liferay-service.md
customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/updating-your-dxp-instance-to-a-new-minor-version.md
customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service.md
customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/liferay-service-environment-variables.md
customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md
customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/using-the-mysql-client.md
customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/upgrading-your-liferay-dxp-instance.md
```

```{raw} html
:file: landingpage_template.html
```

```{raw} html
:file: customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/landing.html
```
