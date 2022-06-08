# Liferay-Tomcatバンドルのインストール

Tomcatバンドルには、Liferay DXP/Portalが事前にデプロイされたApache Tomcatアプリケーションサーバーが含まれています。 これは、Liferayをオンプレミスにインストールする最も簡単で最速の方法です。

```{note}
すでに以下のアプリケーションサーバーを使用している場合は、使用しているサーバーの名前をクリックすると、そのサーバーにLiferayを配備する手順が表示されます。 [Tomcat](./installing-liferay-on-an-application-server/installing-on-tomcat.md)、[WildFly](./installing-liferay-on-an-application-server/installing-on-wildfly.md)、[JBoss EAP] (./notr index='0' /> (./installing-liferay-n-application-server/installing-on-wildfly.md)、 [JBoss EAP](./installing-liferay-on-an-application-server/installing-on-jboss-eap.md)、[WebLogic](./installing-liferay-on-an-application-server/installing-on-weblogic.md)、または [WebSphere](./installing-liferay-on-an-application-server/installing-on-websphere.md) 
```

```{note}
ツアーやデモンストレーションの目的でLiferay DXPインスタンスをすばやく起動するには、[Starting With a Docker Image](../../getting-started/starting-with-a-docker-image.md)を参照してください。
```

## 前提条件

Java JDK 8または11が必要です。 JDKを選択するには、 [互換性マトリックス](https://help.liferay.com/hc/en-us/articles/360049238151) を参照してください。 推奨される設定については、[JVM Configuration](../reference/jvm-configuration.md)を参照してください。

## ダウンロード

1. [［ヘルプセンター］](https://help.liferay.com/hc)（サブスクリプション）または[［コミュニティダウンロード］](https://www.liferay.com/downloads-community)にアクセスします。

1. ご希望の Liferay DXP/Portal のバージョンに移動します。

1. Tomcatバンドルをダウンロードします。

| ファイル                   | Description                        |
|:---------------------- |:---------------------------------- |
| Tomcatバンドル（`.tar.gz` ） | 任意のOSにインストールされるgzip圧縮されたバンドルアーカイブ  |
| Tomcatバンドル（`.7z`）      | 任意のOSにインストールされる7-Zip圧縮されたバンドルアーカイブ |

## インストール

バンドルをホスト上に展開します。 この場所は、[Liferay Home](../reference/liferay-home.md)と呼ばれます。

　 これでLiferayをインストールできました。 次にデータベースを設定します。

## 次のステップ

* [データベースの設定](./configuring-a-database.md)