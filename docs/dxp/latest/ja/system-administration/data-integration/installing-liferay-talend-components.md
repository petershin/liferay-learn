# Liferay Talendコンポーネントのインストール

{bdg-warning}`非対応`

LiferayのTalend Open Studio用コンポーネントは、Liferay DXP/PortalとMySQL、SAP、Salesforceなどの外部システム、あるいはファイルとの間でデータのインポートおよびエクスポートを行うことができます。 これらのコンポーネントを使用するには、Talend Open Studioにコンポーネントを追加する必要があります。

## 前提条件

Liferayコンポーネントをインストールするには、JDK 1.8+、Apache Maven 3.3+、および [DXP/Portalコードのローカルコピー](https://github.com/liferay/liferay-portal/tree/7.4.x/modules/etl/talend)が必要です。 また、 [Talend Open Studio 7.1.1](https://download-mirror2.talend.com/esb/release/V7.1.1/TOS_ESB-20181026_1147-V7.1.1.zip) 、 [Components API v0.25.3](https://artifacts-oss.talend.com/nexus/content/repositories/TalendOpenSourceRelease/org/talend/components/components-api/0.25.3/) 、すでにインストールされている必要があります。

## Talend Open Studioの構成

Talend Open Studioをインストールした後、 `[TOS_ROOT]/configuration/config.ini` ファイルが `maven.repository=global`を設定していないことを確認してください。 存在する場合は、その行を削除するか、コメントアウトしてください。

Maven は最近、安全でないリポジトリ接続を非推奨としているため、 `[TOS_ROOT]/configuration/maven_user_setting.xml` ファイルに以下のスクリプトを含めます。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings>
  <localRepository>DO_NOT_CHANGE_THIS</localRepository>
  <mirrors>
    <mirror>
      <id>secure-central-mirror</id>
      <name>Secure Central Mirror Repository</name>
      <url>https://repo.maven.apache.org/maven2</url>
      <mirrorOf>central</mirrorOf>
    </mirror>
  </mirrors>
</settings>
```

リポジトリミラーの位置は、m2m プラグインがリポジトリに安全に接続できることを保証します。

## Talendコンポーネントの構築

`Talendコンポーネントをインストールする前に、ローカルの <a href="https://github.com/liferay/liferay-portal/tree/7.4.x/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend">liferay-portal` リポジトリの</a> modules/etl/talend</code> で、 `mvn clean install を実行する必要があります。</p>

<p spaces-before="0">これにより、以下のディレクトリ/フォルダーにjarバンドルファイルが生成されます。</p>

<ul>
<li><code>talend-definition/target/`</li>
* `talend-common/target/`
* `talend-runtime/target/`</ul>

JARファイルは、これらのローカルMavenリポジトリフォルダにも公開されます。

* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.common`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend.definition`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend.runtime`

```{note}
Mavenのビルドは、すべてのテストが合格した場合にのみ成功します。 エラーが発生した場合は、`talend-definition`, `talend-common`, `talend-runtime` のサブフォルダで、個別に `mvn clean install -DskipTests` を実行してください。 すべてのビルドが成功したら、`modules/etl/talend` フォルダに戻り、`mvn clean install`を実行してください。
```

## Talend Studioにコンポーネントを登録する

Mavenのビルドが成功したら、以下の手順でTalend Open StudioにLiferay Componentsを登録します。

1. Talend Open Studioを開いている場合は、閉じます。

1. 生成された `com.liferay.talend.definition-x.y.z-SNAPSHOT.jar` バンドルを `liferay-portal/modules/etl/talend/talend-definition/target` フォルダーから `[TOS_ROOT]/plugins` フォルダーにコピーしてください。

1. `[TOS_ROOT]/configuration/config.ini` ファイル内の `osgi.bundles` キーを更新し、新しく追加された定義バンドルが含まれるようにします。

   ```properties
   osgi.bundles=org.eclipse.equinox.common@2:start,org.eclipse.update.configurator@3:start,
   org.eclipse.equinox.ds@2:start,org.eclipse.core.runtime@start,org.talend.maven.resolver@start,
   org.ops4j.pax.url.mvn@start,org.talend.components.api.service.osgi@start,
   com.liferay.talend.definition-x.y.z-SNAPSHOT.jar@start
    ```

1. `org.eclipse*` ファイルを `[TOS_ROOT]/configuration/` フォルダーから削除します。

1. `com.liferay.talend`、 `com.liferay.talend.common`、 `com.liferay.talend.runtime` フォルダをローカル `$USER_HOME/.m2/repository/com/liferay/` から `$TOS_ROOT/configuration/.m2/repository/com/liferay/` にコピーしてください。

1. Talend Open Studioを起動します。 Liferay コンポーネントは *Business* &rarr; *Liferay* in *Palette* タブに表示されます。

   ![コンポーネントは、パレットタブのビジネス &rarr; Liferayに表示されます。](liferay-talend-components-overview/images/01.png)

## Liferayコンポーネントを更新する

Liferayコンポーネントのコードベースに変更があった場合、Talendコンポーネントの構築から上記の手順を繰り返すことで、コンポーネントを最新バージョンに更新することができます。

また、古いファイルやフォルダーを削除して置き換える必要があります。

* 古い `.jar` 定義ファイルを `[TOS_ROOT]/plugins フォルダにある`を削除します。
* `com.liferay.talend`, `com.liferay.talend.common`, `com.liferay.talend.runtime` フォルダを `[TOS_ROOT]/configuration/.m2/repository/com/liferay/`で置き換えてください。

コンポーネントの更新が終了したら、古いコンポーネントを使用した既存のTalendジョブを更新する必要があります。 これは、ジョブからLiferayコンポーネントを削除し、再度追加することを意味します。

```{note}
交換する前に、必ず各コンポーネントの構成を記録してください。 これにより、ジョブが以前と同じ機能を維持することができます。
```

## 追加情報

* [Liferay Talendコンポーネントの概要](./liferay-talend-components-overview.md)
* [Liferayコンポーネントを使用したTalendジョブの設計](./designing-talend-jobs-using-liferay-talend-components.md)
