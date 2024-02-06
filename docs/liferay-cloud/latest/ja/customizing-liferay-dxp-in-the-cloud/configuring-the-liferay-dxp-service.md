# Liferay DXPサービスの設定　

Liferay DXPを設定するには、 [システム設定](https://learn.liferay.com/dxp/latest/ja/system-administration/configuring-liferay/system-settings.html) や、 [構成ファイルの使用](https://learn.liferay.com/dxp/latest/ja/system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.html) と [ポータルプロパティ](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/portal-properties.html) を使用するなど、いくつかの方法があります。 Liferay CloudのLiferay DXPインスタンスのDXPプロパティと設定ファイルは、リポジトリ内のLiferay DXP サービスディレクトリの`configs/`フォルダーのいずれかに配置されることでデプロイされます。

```
liferay
├── configs
│   ├── common
│   ├── dev
│   ├── local
│   ├── prd
│   └── uat
└── LCP.json
```

`common/`ディレクトリを除き、特定の環境フォルダ（`dev`、`uat`、`prod`など）に追加された変更は、対応する環境にデプロイするときに **のみ** プロパゲートされます。 `common/`ディレクトリに追加された変更は、ターゲットのデプロイ環境に関係なく、 **常に** デプロイされます。 これは、すべてのサービスにおいて、 `configs/` ディレクトリ内のすべてのサブフォルダに適用されます。

## ポータルプロパティ

[ポータルプロパティ](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/portal-properties.html) は、`portal-ext.properties`ファイルに保存されたプロパティです。 これらは、Liferay DXP環境の設定に使用されます。

オンプレミスのLiferay DXPインスタンスの場合、このファイルは `$LIFERAY_HOME`の中に属します。 Liferay Cloudを使用する場合、ポータルプロパティファイルを適切な `configs/{ENV}/`フォルダに配置して、デプロイ時にLiferay DXPインスタンスの `$LIFERAY_HOME` にコピーします。

例えば、開発環境のプロパティは、 `configs/common` ディレクトリのプロパティファイルと、 `configs/dev` ディレクトリのプロパティから構成されています。 同名のファイルがある場合は、環境固有のディレクトリにあるファイルが、 `共通の` ディレクトリにあるファイルを上書きします。

### ポータルプロパティを複数のファイルに分割する

デフォルトでは、Liferayは `portal-ext.properties` ファイルのみから直接プロパティを読み取りますが、環境固有のファイルなど、リポジトリ内の異なるファイルにプロパティを整理しておくと便利です。 ポータルプロパティを上書きするために、追加のファイルを定義することができます。

* `portal-all.properties`：環境全体でLiferay DXPを変更するプロパティが含まれています

* `portal-env.properties`：現在の環境にのみ影響するプロパティが含まれます（たとえば、環境ごとに異なる外部サービスの認証情報とURLエンドポイント）

これらのファイルを使用するには、 `portal-ext.properties` ファイルが、 `portal-all.properties` および `portal-env.properties` を、 `include and override` プロパティを使用して、明示的にインポートする必要があります。

```
include-and-override=/opt/liferay/portal-all.properties
include-and-override=/opt/liferay/portal-env.properties
```

そして、以下のような構造でプロパティを整理することができます：

```
liferay
├── configs
│   ├── common
│   │   ├── portal-ext.properties
│   │   └── portal-all.properties
│   ├── dev
│   │   └── portal-env.properties
│   ├── local
│   │   └── portal-env.properties
│   ├── prd
│   │   └── portal-env.properties
│   └── uat
│       └── portal-env.properties
└── LCP.json
```

`portal-ext.properties` と `portal-all.properties`ファイル は、すべての環境で共有されます。 そこに共有のプロパティを追加し、それぞれの `portal-env.properties` ファイルに環境固有のプロパティを追加することができます。 詳細については、 [ポータルプロパティ](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/portal-properties.html#portal-property-priority) を参照してください。

```{note}
ポータルプロパティは、環境変数として定義することもできます。 詳しくは [環境変数リファレンス](./liferay-service-environment-variables.md#environment-variables-reference) をご覧ください。
```

## OSGiの構成

OSGi構成（`.cfg` または `.config` ファイル）は、Liferay DXPでOSGiコンポーネントを構成するために使用されます。

これらの構成ファイルは、 `$LIFERAY_HOME`内の `osgi/configs/` フォルダに属しています。 Liferay Cloudを使用する場合、これらのファイルを適切な `config` フォルダに配置して、デプロイ時にLiferay DXPインスタンスの`configs/{ENV}/osgi`にコピーします。

## Tomcatの設定

適切な環境の `liferay/configs/{ENV}` フォルダにファイルをデプロイして、LiferayサービスのTomcatサーバーを設定し、設定ファイルを上書きします。 例えば、Liferayコンテナのファイルシステムにある `{TOMCAT HOME}/conf/web.xml` ファイルを上書きするには、カスタマイズしたファイルをリポジトリの適切な `liferay/configs/{ENV}/tomcat/conf/` フォルダに配置して、変更をデプロイします。

```{note}
Liferay CloudのLiferayコンテナ内には、一般的な `tomcat` フォルダと、バージョン管理された `tomcat-x.x.x` フォルダの 2 つの tomcat フォルダが存在します。 `tomcat`フォルダは、バージョン管理された`tomcat-x.x.x`フォルダへのシンボリックリンクを持っているので、一般的な`tomcat`フォルダ内のファイルを上書きすると、新しいファイルが両方のフォルダに反映されるようになっています。
```

```{warning}
Tomcatのデフォルト設定を上書きする場合、Liferay CloudのLiferayサービスは、Cloudプラットフォーム上の閉じたネットワークに存在することに留意してください。 オンプレミスのLiferayインストールで変更可能なネットワーク構成の中には、クラウド環境ではデフォルト値から変更できないものや、お客様の環境で問題が発生する可能性のあるものがあります。
```

## 環境変数

Liferay Cloud の Liferay サービスは、JVM メモリ設定やデータベース接続設定など、オンプレミスインスタンスとは異なる設定の代わりに [環境変数](../reference/defining-environment-variables.md) (または [secret](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md)) を使用します。環境変数は [ポータルのプロパティを上書きしたり置き換えたり](./liferay-service-environment-variables.md#overriding-portal-properties) するのにも使えます。

詳しくは[Liferayサービス環境変数](./liferay-service-environment-variables.md)を参照してください。

## 関連トピック

* [Liferay DXPサービスの使用](../customizing-liferay-dxp-in-the-cloud.md)
* [Liferay Cloudでのクラスタリングの有効化](./setting-up-clustering-in-liferay-cloud.md)
* [ポータルプロパティ](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/portal-properties.html)
* [Liferayサービス環境変数](./liferay-service-environment-variables.md)
