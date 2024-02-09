---
toc:
- ./installing-liferay/installing-a-liferay-tomcat-bundle.md
- ./installing-liferay/configuring-a-database.md
- ./installing-liferay/running-liferay-for-the-first-time.md
- ./installing-liferay/using-liferay-docker-images.md
- ./installing-liferay/installing-liferay-on-an-application-server.md
---
# Liferayのインストール

```{toctree}
:maxdepth: 2

installing-liferay/installing-a-liferay-tomcat-bundle.md
installing-liferay/configuring-a-database.md
installing-liferay/running-liferay-for-the-first-time.md
installing-liferay/using-liferay-docker-images.md
installing-liferay/installing-liferay-on-an-application-server.md
```

Liferayはアプリケーションサーバー上で実行されます。 Liferayをホストする方法は3つあります。

* Dockerコンテナを使用する
* オンプレミスでのLiferay Tomcatバンドルを使用する
* オンプレミスで、選択したサポートされているアプリケーションサーバー上で実行する

Liferayをホストする最速の方法は、クラウド上で事前構成されたDockerイメージを使用することです。 クラウドプロバイダーでイメージを使用し、環境変数を使用して[イメージを構成](./installing-liferay/using-liferay-docker-images.md)します。

Liferay Tomcatバンドルは、任意のサーバーに抽出、構成、および実行できるアーカイブです。 これは、Liferayがすでにインストールされ、構成の準備ができている軽量のTomcatアプリケーションサーバーです。

もちろん、オンプレミスでサポートされている任意のアプリケーションサーバーにLiferayをいつでもインストールできます。

```{note}
エンタープライズ契約者は、Liferay Cloud上で [Liferay DXPサービスの使用](https://learn.liferay.com/ja/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service) できます。 Liferay Cloudは、インフラコスト(ハードウェア、電気代）を削減し、より多くの顧客を処理するために高速に拡張し、市場投入までの時間を短縮し、簡単に使用することができます。

Liferay Cloudにご興味のある方は、Liferay Cloud [製品情報](https://www.liferay.com/products/dxp-cloud) をご覧いただくか、Liferayの担当者にお問い合わせください。
```

自分のマシンでLiferayを開発したい場合は、次の便利なオプションを検討してください。

* [Liferay Dockerイメージ](#docker-image)
* [Liferay Tomcat バンドル](#liferay-tomcat-bundle)

## Dockerイメージ

LiferayのDockerイメージは、Liferayの使用を開始するための最速の方法です。 イメージには、Tomcatアプリケーションサーバーに事前インストールされたLiferayが付属しています。 まずは、 [Liferay Dockerイメージの使用](./installing-liferay/using-liferay-docker-images.md) にアクセスしてください。

## Liferay Tomcat バンドル

Liferay Tomcatバンドルは、LiferayがTomcatに事前インストールされているZIPファイルです。 これは、コンテナの外でLiferayの使用を開始する簡単な方法です。

バンドルを開始するには、[Installing a Liferay Tomcat Bundle](./installing-liferay/installing-a-liferay-tomcat-bundle.md)を参照してください。

```{warning}
DockerイメージとTomcatバンドルでは、Liferayはデフォルトで組み込みHSQLデータベースを使用するように構成されています。 デモ目的以外では、フル機能の [サポートされているRDBMS](https://help.liferay.com/hc/ja/articles/360049238151) を使用することをお勧めします。 構成手順については、[データベース設定](./reference/database-configurations.md)を参照してください。
```

## アプリケーションサーバーへのLiferayのインストール

Liferayは、 [サポートされている任意のアプリケーションサーバー](https://help.liferay.com/hc/ja/articles/360049238151) にインストールできます。 これは通常、DevOpsおよび高可用性環境で使用する最も実用的なインストールタイプです。

開始するには、

1. [互換性マトリックス](https://help.liferay.com/hc/ja/articles/360049238151) からサポートされているアプリケーションサーバーを選択します。
1. [アプリケーションサーバー](./installing-liferay/installing-liferay-on-an-application-server.md)にLiferayをインストールするための手順に従います。

## 次のステップ

Liferayをインストールした後、 [Liferayのセットアップ](./setting-up-liferay.md) に進み、次のオプションを構成します。

* 検索
* ローカライズ
* メール
* ファイル ストレージ
* マーケットプレイスアプリ
* 高可用性
* その他

## 関連トピック

* [バックアップ](./maintaining-a-liferay-installation/backing-up.md)
* [Liferayのアップデート](./maintaining-a-liferay-installation/updating-liferay.md)
* [Liferayの保護](./securing-liferay.md)
