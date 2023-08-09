# Liferay Talendコンポーネントのインストール

{bdg-warning}`未対応`

LiferayのTalend Open Studio用コンポーネントは、Liferay DXP/PortalとMySQL、SAP、Salesforceなどの外部システム、あるいはファイルとの間でデータのインポート/エクスポートが可能です。 これらのコンポーネントを使用するには、Talend Open Studioに追加する必要があります。

## 前提条件

Liferay コンポーネントのインストールには、JDK 1.8+、Apache Maven 3.3+、および [DXP/Portal コード](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/etl/talend)のローカルコピーが必要です。 また、 [Talend Open Studio 7.1.1](https://download-mirror2.talend.com/esb/release/V7.1.1/TOS_ESB-20181026_1147-V7.1.1.zip) [Components API v0.25.3](https://artifacts-oss.talend.com/nexus/content/repositories/TalendOpenSourceRelease/org/talend/components/components-api/0.25.3/) が既にインストールされている必要があります。

## Talend Open Studioの構成

Talend Open Studioをインストールした後、 `[TOS_ROOT]/configuration/config.ini` ファイルが `maven.repository=global`を設定していないことを確認します。 存在する場合は、その行を削除するか、コメントアウトする。

Mavenは最近、安全でないリポジトリ接続を廃止したため、 `[TOS_ROOT]/configuration/maven_user_setting.xml` ファイルに以下のスクリプトを含めます：

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

リポジトリのミラーの場所は、m2mプラグインがリポジトリに安全に接続できるようにします。

## Talendコンポーネントの構築

Talendコンポーネントをインストールする前に、ローカルの `liferay-portal` リポジトリの [modules/etl/talend](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend) フォルダで `mvn clean install` を実行する必要があります。

これにより、以下のディレクトリ/フォルダーにjarバンドルファイルが生成される：

* `talend-definition/target/`
* `talend-common/target/`
* `talend-runtime/target/`

JARファイルは、これらのローカルmavenリポジトリフォルダにも公開される：

* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.common`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend.definition`
* `$USER_HOME/.m2/repository/com/liferay/com.liferay.talend.runtime`

```{note}
Mavenのビルドは、すべてのテストがパスした場合にのみ成功する。 エラーが発生した場合は、`talend-definition`、`talend-common`、`talend-runtime` のサブフォルダでそれぞれ `mvn clean install -DskipTests` を実行してほしい。 すべてのビルドが成功したら、`modules/etl/talend` フォルダに戻り、`mvn clean install` を実行する。
```

## Talend Studioへのコンポーネントの登録

Mavenビルドが成功したら、以下の手順に従ってTalend Open StudioにLiferayコンポーネントを登録します。

1. Talend Open Studioが開いている場合は閉じます。

1. 生成された `com.liferay.talend.definition-x.y.z-SNAPSHOT.jar` バンドルを `liferay-portal/modules/etl/talend/talend-definition/target` フォルダから `[TOS_ROOT]/plugins` フォルダにコピーします。

1. `[TOS_ROOT]/configuration/config.ini` ファイルの `osgi.bundles` キーを更新して、新しく追加された定義バンドルを含めます。

   ```properties
   osgi.bundles=org.eclipse.equinox.common@2:start,org.eclipse.update.configurator@3:start,
   org.eclipse.equinox.ds@2:start,org.eclipse.core.runtime@start,org.talend.maven.resolver@start,
   org.ops4j.pax.url.mvn@start,org.talend.components.api.service.osgi@start,
   com.liferay.talend.definition-x.y.z-SNAPSHOT.jar@start
    ```

1. `[TOS_ROOT]/configuration/` フォルダから `org.eclipse*` ファイルをすべて削除します。

1. `com.liferay.talend`, `com.liferay.talend.common`, and `com.liferay.talend.runtime` フォルダーをローカルの `$USER_HOME/.m2/repository/com/liferay/` フォルダーから `$TOS_ROOT/configuration/.m2/repository/com/liferay/` フォルダーにコピーします。

1. Talend Open Studioを起動します。 Liferay コンポーネントは *Business* &rarr; *Liferay* *Palette* タブの下に表示されます。

   ![コンポーネントはPaletteタブのBusiness &rarr; Liferayの下に表示されます。](liferay-talend-components-overview/images/01.png)

## Liferay コンポーネントのアップデート

Liferayコンポーネントのコードベースに変更があった場合は、Talendコンポーネントのビルドから上記の手順を繰り返すことで、コンポーネントを最新バージョンにアップデートすることができます。

また、古いファイルやフォルダを削除して置き換える必要があります：

* `[TOS_ROOT]/pluginsフォルダ`にある古い `.jar` 定義ファイルを削除する。
* `[TOS_ROOT]/configuration/.m2/repository/com/liferay/`の `com.liferay.talend`、 `com.liferay.talend.common`、 `com.liferay.talend.runtime` フォルダを置き換えます。

コンポーネントの更新が完了したら、古いコンポーネントを使用していた既存のTalendジョブを更新する必要があります。 これはジョブからLiferayコンポーネントを削除し、再度追加することを含みます。

```{note}
交換する前に、各コンポーネントの構成を必ず文書化してください。 これは、あなたの仕事が以前と同じ機能を維持することを保証するのに役立ちます。
```

## 関連トピック

* [Liferay Talendコンポーネントの概要](./liferay-talend-components-overview.md)
* [Liferayコンポーネントを使用したTalendジョブの設計](./designing-talend-jobs-using-liferay-talend-components.md)
