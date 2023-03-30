---
uuid: 6abef168-1381-46ae-b190-a9ff7c096d2d
---
# Amazon Simple Storage Service

AmazonのS3（simple storage service）は、DXPのS3ストアが利用しているクラウドベースのストレージソリューションで、ファイルをシームレスにクラウドに保存できます。 AWSアカウントを取得し、S3 **バケット** を作成したら、S3ストアを設定できます。

S3は、ファイルの保存にバケットという概念を用いています。 AmazonのUIで、DXPファイルの [バケット](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-bucket.html) を作成します。 DXPサーバーのホストにできるだけ近い [地理的な地域](https://docs.aws.amazon.com/general/latest/gr/s3.html) にバケットを構成します。

[AWSアカウント](https://aws.amazon.com/s3/) を作成すると、Amazonから自分のアカウントにリンクする [一意のキー](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html/) が割り当てられます。 これらのキーは、S3ストアの設定に使用されます。

```{note}
AWS署名バージョン4リクエストの承認をサポートするためのアクションは必要ありません。
```

## SAXParserのセットアップ

Amazon S3にはSAXParserが必要です。 お使いの環境でSAXParserが利用できない場合。

1. [Xerces SAXParser](https://xerces.apache.org/mirrors.cgi) をアプリケーションサーバーのグローバルライブラリフォルダにダウンロードします。 `Tomcat では /lib/ext` 、JBoss EAP および WildFly では `/module` です。

1. [`system-ext.properties`](../../../installation-and-upgrades/reference/system-properties.md) ファイルで SAXParser を指定する。

    ```properties
    org.xml.sax.driver=com.sun.org.apache.xerces.internal.parsers.SAXParser
    ```

1. `system-ext.properties`ファイルを、DXPアプリケーションのクラスパス（例：`/WEB-INF/classes/`）にあるフォルダにコピーします。

## ストアの設定

1. 設定 [`portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md):

    ```properties
    dl.store.impl=com.liferay.portal.store.s3.S3Store
    ```

1. DXPを再起動します。

1. ［コントロールパネル］から、 ［**設定**］ &rarr; ［**System Settings**］ &rarr; ［**File Storage**］ へ行きます。

1. [**S3 Store**] 画面で、ストアを設定します。

    * **［Bucket Name**］ ：バケットの名前。
    * **［Access Key**］ ：AWSアクセスキー。
    * **［Secret Key**］ ：シークレットキー。
    * **S3 Region** ： [地理的地域](https://docs.aws.amazon.com/general/latest/gr/s3.html) 。デフォルトは`us-east-1`です。

    ![Amazon S3ストアの設定](./amazon-s3-store/images/01.png)

1. 他のフィールドはデフォルト設定のままにします。

1. ［**Save**］ をクリックします。

DXPインスタンスがAmazon S3ストアを使用するようになりました。

```{important}
[アップロードされたファイルの自動アンチウイルススキャンを有効にする](../enabling-antivirus-scanning-for-uploaded-files.md)を検討します。
```

## クラスター環境でのストアの使用

クラスター環境でS3ストアを使用するには、以下の手順に従います。

1. アプリケーションサーバーにまだSAXParserがない場合は、 [Xerces SAXParser](https://xerces.apache.org/mirrors.cgi) を各ノードのアプリケーションサーバーのグローバルライブラリフォルダにコピーします。

1. `system-ext.properties`ファイルをDXPアプリケーションの`/WEB-INF/classes/`フォルダにコピーします。

DXPがクラスター全体でAmazon S3ストアを使用するようになりました。

## データベースのロールバックの制限

```{warning}
ドキュメントライブラリでデータベーストランザクションのロールバックが発生した場合、トランザクションのファイルシステムの変更は元に戻され**ません**。 ドキュメントライブラリファイルとファイルシステムストア内のファイルとの間に不整合が発生する可能性があり、手動での同期が必要になる場合があります。  [DBStore](./dbstore.md) を除くすべてのDXPストアは、この制限に対して脆弱です。
```

Amazonのサービスの使用に関する詳細については、Amazon Simple Storageのドキュメントを参照してください。

## 追加情報

* [ファイルストレージ](../../file-storage.md)
* [Bucket Restrictions and Limitations](https://docs.aws.amazon.com/AmazonS3/latest/dev//BucketRestrictions.html#bucketnamingrules)
* [DBStore](./dbstore.md)
* [ファイルストアの移行](../file-store-migration.md)
