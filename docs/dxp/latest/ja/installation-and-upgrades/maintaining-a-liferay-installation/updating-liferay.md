# Liferayのアップデート

{bdg-secondary}`Liferay DXP 7.3 SP3以降および7.4 GA1以降で利用可能`

バンドルリリースでLiferayインストールを更新します。 最新の機能、セキュリティリリース、およびライブラリの更新はすべて1つのバンドルにまとめて提供されます。 Liferayより前のバージョンについては、 [Liferayの旧バージョンをアップデートする](./updating-previous-versions-of-liferay.md) を参照してください。

```{warning}
Liferay DXP/Portalをアップデートする前に、**必ず** データベースとインストールを[バックアップ](./backing-up.md)してください。
```

新しいアップデートの準備として、Liferayインストールの重要な依存関係を確認します。 これには、データベース、ドキュメントライブラリ、カスタムモジュールなどが含まれます。 ポータルプロパティ、OSGi構成、Tomcatファイル、データベースjarなどの他のファイルも重要です。 [考慮すべき重要なファイル](#important-files-to-consider) を参照してください。

デフォルトでは、Liferay Homeディレクトリはバンドル内にあります。 更新を簡単にするために、Liferay Homeディレクトリをバンドルの外に移動して、新しいバンドルリリースのファイルを誤って上書きしないようにします。

1. 環境変数を別のディレクトリに設定します。

   `export LIFERAY_HOME="/your/liferay/directory"`

1. `portal-ext.properties`ファイルで次のディレクトリパスを指定します。

   `liferay.home=/your/liferay/directory`

1. 上記のパスを設定すると、LiferayのOSGiフォルダパスも依存関係に設定されます。 マーケットプレイスが機能するには、再びバンドルを指している必要があります。

   `module.framework.marketplace.dir=/new_liferay_bundle/osgi/marketplace`

1. `portal-ext.properties` ファイルを保存します。

## 構成管理

新しいバンドルリリースに更新する前に、重要な依存関係とファイルを保存してください。 シェルスクリプトまたはLiferayワークスペースを使用して保存できます。

### シェルスクリプトの使用

以下のような単純なシェルスクリプトを使用して、依存するすべてのLiferay構成ファイルとライブラリをバックアップできます。 この例では、配列を使用して、新しいバンドルリリースに移行するときに必要なファイルを一覧表示しています。

```bash
   #!/bin/bash

   # Liferay and Tomcat locations
   LIFERAY_HOME="./liferay"
   CATALINA_HOME="$LIFERAY_HOME/tomcat-9.0.56"

   declare -a persistent_files=(
   "$LIFERAY_HOME/portal-ext.properties"
   "$LIFERAY_HOME/portal-setup-wizard.properties"
   "$LIFERAY_HOME/osgi/configs/com.liferay.portal.search.elasticsearch.configuration.ElasticsearchConfiguration.cfg"
   "$LIFERAY_HOME/osgi/configs/com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.cfg"
   "$LIFERAY_HOME/osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.cfg"
   "$CATALINA_HOME/conf/server.xml"
   "$CATALINA_HOME/conf/web.xml"
   "$CATALINA_HOME/bin/setenv.sh"
   "$CATALINA_HOME/webapps/ROOT/WEB-INF/classes/ehcache-config/"
   "$CATALINA_HOME/lib/ojdbc8.jar"
   "$LIFERAY_HOME/patching-tool/default.properties"
   "$LIFERAY_HOME/osgi/marketplace/override/"
   "$CATALINA_HOME/conf/Catalina/localhost/"
   "$CATALINA_HOME/webapps/ROOT/WEB-INF/classes/META-INF/portal-log4j-ext.xml"
   )

   echo "Backing up the following files"
   tar cvfz ./persisted_bundle_configs-`date +%Y%m%d.%H%M`.tgz --files-from <(printf "%s\n" "${persistent_files[@]}")
```

上記のスクリプトは、新しくダウンロードされたバンドルのフォルダストラクチャーの上に解凍できる圧縮された`tar`ファイルを生成します。

### Liferay Workspaceの使用

Liferay Workspaceは、`configs`フォルダ内の環境サブフォルダを使用して構成管理を提供します。 さらに、すべての環境で使用されるすべてのファイルに`共通の`フォルダがあります。 いずれかの環境フォルダ内に配置された構成ファイルのパスは、バンドルリリースにあるパスと一致する必要があることに注意してください。 以下に例を示します。

      ../configs/dev/tomcat-9.0.56/conf/server.xml

詳細については、 [Creating Deployment Environments](../../building-applications/tooling/liferay-workspace/configuring-liferay-workspace.html#creating-deployment-environments) を参照してください。

環境がセットアップされたら、Gradleタスクを使用してバンドルを生成できます。 `distBundleZip`または`distBundleTar`を使用して、定義された環境用の特定のバンドルを生成します。 以下に例を示します。

```bash
./gradlew distBundleZip -Pliferay.workspace.environment=dev
```

Gradleタスクは、適切な構成ファイルを階層化し、モジュールとテーマをコンパイルする前に、新しいバンドルをダウンロードします。

結果のバンドルは、LiferayWorkspaceの`build`フォルダにあります。  使用中のLiferay DXPのバージョンは、`gradle.properties`ファイル内の`liferay.workspace.product`プロパティによって定義されます。

1つのタスクですべての環境のバンドルを生成するには、`distBundleZipAll`または`distBundleTarAll`を使用します。 以下に例を示します。

```bash
./gradlew distBundleTarAll -Pliferay.workspace.bundle.dist.include.metadata=true
```

結果として得られるZipまたはTarの各ファイル名には、構成環境の名前とタイムスタンプが含まれます。 このGradleタスクは、Liferay Workspace 3.4.32以降で使用できます。

## 考慮すべき重要なファイル

以下は、新しいバンドルリリースに移行するときにバックアップを検討する一般的なファイルのリストです。 このリストは完全なものではなく、インストールには、言及されていない追加のファイルやライブラリが含まれている場合があります。 さらに、Apache Tomcat以外のアプリケーションサーバーについては説明していませんが、原則はどのアプリケーションサーバーを保守する場合でも同じです。 [アプリケーションサーバーへのLiferayのインストール](../installing-liferay/installing-liferay-on-an-application-server.md) を参照してください。

### Liferayのプロパティ（/LIFERAY/）

* `portal-ext.properties`
* `portal-setup-wizard.properties`

### Liferay OSGIの構成（/LIFERAY/osgi/configs/）

OSGI Configディレクトリには、複数の構成ファイルが含まれている可能性があります。 以下は、考慮すべき一般的なOSGi構成ファイルの一部です。

* `com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.config`
* `com.liferay.portal.search.elasticsearch[6|7].configuration.ElasticsearchConfiguration.config`
* `com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config`

### Liferayクラスタリング（LIFERAY/TOMCAT/）：

jgroupsまたはehcache構成ファイルのバックアップに加えて、JNDIプール設定でJDBC Pingを使用することを検討してください。 これにより、ehcache構成ファイルを抽象化および簡素化できます。 IPとデータベース固有の設定の両方が定義されなくなり、ファイルをほぼ汎用的にすることができます。

* `webapps/ROOT/WEB-INF/classes/ehcache-config/tcp.xml`

### Liferayの永続ログ設定（LIFERAY/TOMCAT/）

* `webapps/ROOT/WEB-INF/classes/META-INF/portal-log4j-ext.xml`

## Tomcat/アプリケーションサーバー（LIFERAY/TOMCAT/）

* `conf/server.xml`
* `conf/web.xml`
* `bin/setenv.sh`

### データベースライブラリ（LIFERAY/TOMCAT/）

Liferayデータベースへの接続には、HikariによるJNDIを使用することをお勧めします。 したがって、Hikari、MySQL、Oracle、またはその他のデータベースドライバなどのJNDI接続を設定するために必要なライブラリをバックアップする必要があります。

7.4では、これらのドライバーはLIFERAY/TOMCAT/libフォルダにあります。 以前のバージョンでは、これらのライブラリはLIFERAY/TOMCAT/lib/extにありました。 以下に例を示します。

* Oracleの場合は`lib/ojdbc8.jar`
* MySQLの場合は`lib/mysql.jar`
* Hikari DB Poolの場合は`lib/hikaricp.jar`

JNDIを使用していない場合は、バックアップが必要になる可能性のあるデータベースドライバーについて、7.4の`LIFERAY/TOMCAT/webapps/ROOT/WEB-INF/shielded-container-lib`または以前のバージョンの`LIFERAY/TOMCAT/lib/ext`を参照してください。

### その他のファイルまたはライブラリ

他のライブラリまたはファイルをバックアップすることをお勧めします。

* `lib/xuggler.jar`（`LIFERAY/TOMCAT/webapps/ROOT/WEB-INF/lib/`）（7.3で廃止予定）
* SAMLキーストア（`LIFERAY/data/keystore.jks`）
