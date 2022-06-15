# Liferay Home

**Liferay Home** は、Liferay DXP/Portalがアプリケーションの起動、構成の読み取り・適用、JARファイルのロード、ログの生成などを行うフォルダです。

Liferay Homeの場所は、インストールタイプによって異なります。

****Liferay Tomcatバンドルでは** 、Liferay Homeはインストールの最上位フォルダであり、アプリケーションサーバーが含まれています。
****アプリケーションサーバー上のインストールでは** 、Liferay Homeフォルダはアプリケーションサーバーによって異なります。 アプリケーションサーバーにインストールする場合は、Liferay Homeの場所について、そのアプリサーバーに関する記事（[**アプリサーバー]へのインストール** など）を参照してください。

## Liferay Homeの構造

DXP/Portal のインストールには、アプリケーションサーバーに関係なく、次のフォルダ構造を使用します。

```
[LIFERAY_HOME]
    ├── data
    ├── deploy
    ├── elasticsearch-sidecar // Named 'elasticsearch7' in 7.3. Not included in 7.2 and earlier.
    ├── license
    ├── logs
    ├── osgi
    │   └── configs
    │   └── [core] // Included only in 7.2 and earlier
    │   └── marketplace
    │   └── modules
    │   └── portal
    │   └── state
    │   └── static
    │   └── war
    ├── patching-tool // (Subscription)
    ├── tools
    └── [work] // Included only in 7.2 and earlier
```

## Liferay Homeリファレンス

ここでは、各フォルダーの目的を説明します。

* `data`（HSQLデータベースが選択されている場合）：埋め込みHSQLデータベース、DXPのファイルリポジトリ、およびサーチインデックスを格納します。 組み込みのHSQLデータベースはデフォルトで設定されていますが、デモンストレーションと試用のみを目的としています。 [ポータルプロパティ`jdbc.default.url`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC) は、Hypersonic組み込みHSQLデータベースの場所を設定します。
* `deploy`：デフォルトでは、このフォルダはプラグインを自動デプロイします。 自動デプロイは、Liferay マーケットプレイスのアプリケーション`.lpkg`ファイル、プラグイン`.war`ファイル、およびプラグイン`.jar`ファイルをサポートしています。 [ポータルプロパティ`auto.deploy.deploy.dir`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Auto%20Deploy) を設定することにより、`deploy`フォルダの代替パスを構成できます。
* `elasticsearch-sidecar`: DXP/Portalで始まるElasticsearchノードを保持します。 7.3では `elasticsearch7` というフォルダ名になっています。 7.2以前では、このフォルダは含まれていません。 詳細は、 [サイドカーまたはEmbedded モードのElasticsearchの使用](../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/using-the-sidecar-or-embedded-elasticsearch.md) を参照してください。
* `license`：著作権およびバージョンファイルがここにあります。
* `logs`：DXP/Portal はこのフォルダを作成し、ここにログファイルを書き込みます。 問題を診断するときに、それらを調べます。 `portal-impl.jar`の`portal-impl/src/META-INF/portal-log4j.xml`ファイルは、ログファイルの場所を設定します。 ログファイルの場所を上書きするには、 [Extプラグインで`ext-impl/src/META-INF/portal-log4j-ext.xml`ファイルを使用する](https://help.liferay.com/hc/articles/360029030791-Customizing-Core-Functionality-with-Ext) 必要があります。
* `osgi`：OSGiランタイムのすべてのJARファイルといくつかの構成ファイルは、このフォルダに属しています。 [ポータルプロパティ`module.framework.base.dir`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Module%20Framework) は、OSGiフォルダの場所を設定します。 以下がそのサブフォルダです。
  * `configs`: ここにコンポーネント [構成ファイル](../../system-administration/configuring-liferay/system-settings.md#exporting-and-deploying-configurations) をデプロイします。
  * `[core]`：7.2以前にのみ存在します。 コアモジュールを保持します。
  * `marketplace`：マーケットプレイスアプリケーションとアプリケーションスイート。
  * `modules`：デプロイしたモジュール。
  * `portal`：非コアモジュール。
  * `state`：OSGiバンドルのインストール、バンドルストレージなどのOSGi内部状態ファイルが含まれています。
  * `static`：カスタマイゼーションをJARファイルとしてここにデプロイします。
  * `war`：デプロイしたWARプラグイン。
* `patching-tool`：（サブスクリプション）このフォルダには、パッチとパッチをインストールするためのユーティリティが含まれています。
* `tools`: Database Upgrade Toolとターゲットプラットフォームのインデクサを格納します。
* `[work]`：7.2以前にのみ存在します。 モジュールJasper作業ファイルを保持します。

```{note}
DXPがLiferay Homeフォルダにリソースを作成できない場合、またはDXPが特定のアプリケーションサーバーで実行されている場合は、DXPを実行しているオペレーティングシステムユーザーのホームフォルダに `liferay`と呼ばれるフォルダが作成されます。 この場合、その `liferay`フォルダがLiferay Homeになります。 たとえば、オペレーティングシステムのユーザー名が*jbloggs*の場合、`liferay`フォルダのパスは`/home/jbloggs/liferay` または `C:\Users\jbloggs\liferay`になります。
```
