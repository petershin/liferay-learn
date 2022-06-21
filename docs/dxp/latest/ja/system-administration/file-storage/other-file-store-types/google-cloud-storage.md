# Google Cloud Storage

> Liferay DXP 7.3 SP3および7.4以降で利用可能です。

Liferay DXPは、Google's Cloud Storage (GCS)サービスと統合できます。 GCSとの統合により、Liferayインスタンスのファイルをシームレスにクラウド上に保存し、アクセスすることができます。

この接続を有効にする前に、まず、GCSアカウントを準備する必要があります。 準備ができたら、コントロールパネルからLiferayインスタンスがGCSを使うように設定し、 `dl.store.impl`ポータルプロパティを設定してGCSをデフォルトストアとして使用するようにします。

```{important}
ドキュメントライブラリでデータベーストランザクションのロールバックが発生した場合、トランザクションのファイルシステムの変更は元に戻されません。 ドキュメントライブラリファイルとファイルシステムストア内のファイルとの間に不整合が発生する可能性があり、手動での同期が必要になる場合があります。 これは、DBStore以外のDXPストアの制限事項です。
```

## GCS前提条件

LiferayのGCS統合を有効にするには、アクティブなGCSアカウントとプロジェクトが必要です。 サーバー間、アプリレベルの認証を有効にするには、このプロジェクトに [ストレージバケット](https://cloud.google.com/storage/docs/creating-buckets) と [サービスアカウント](https://cloud.google.com/iam/docs/creating-managing-service-accounts) が必要です。 また、サービスアカウントのJSON [セキュリティキー](https://cloud.google.com/iam/docs/creating-managing-service-account-keys) を作成する必要があります。 詳しくは、 [Google Cloud Storage](https://cloud.google.com/storage/docs) の公式ドキュメントをご覧ください。

```{important}
サービスアカウントのセキュリティキーは、JSONキータイプを使用する必要があります。
```

## LiferayでのGCS Storeの設定

次の手順に従って、GCS Storeを設定します。

1. **グローバルメニュー**（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブをクリックして、 ［**設定**］ &rarr; ［**System Settings**］ に移動します。

1. ［**File Storage**］ をクリックします。

   ![［システム設定］の［ファイルストレージ］をクリックします。](./google-cloud-storage/images/01.png)

1. ［GCS Store Configuration］をクリックします。

1. （必須）以下の情報を入力してください。

   * *Service Account Key*: GCSプロジェクトのサービスアカウントに安全にアクセスするために使用されるプライベートJSONキーです。

   * *Bucket Name*: ファイルの保存に使用するGCSバケット名です。

   ![サービスアカウントキーとバケット名を入力します。](./google-cloud-storage/images/02.png)

1. (オプション) GCS へのLiferay呼び出しの試行を設定します。

   ![GCS へのLiferay呼び出しの試行を設定します。](./google-cloud-storage/images/03.png)

1. (オプション) セキュリティを強化するために、 **AES-256 暗号化キー** を入力します。

   ![AES-256 暗号化キーを入力します。](./google-cloud-storage/images/04.png)

1. 完了したら、 ［**保存**］ をクリックします。

GCS Storeの設定が完了したら、GCSをデフォルトのファイルストレージシステムとして設定することができます。

## GCSをデフォルトのストアとして設定する

以下の手順に従って、LiferayインスタンスのデフォルトストアとしてGCSを使用します。

1. 下記のプロパティをインスタンスの[`portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md)ファイルに追加します。

   ```properties
   dl.store.impl=com.liferay.portal.store.gcs.GCSStore
   ```

   `portal-ext.properties`ファイルが存在しない場合は、上記の値で新規ファイルを作成し、インスタンスの[LIFERAY_HOME](../../../installation-and-upgrades/reference/liferay-home.md) または `[USER_HOME]`フォルダーに追加します。

   これは、`portal.properties` ファイルの`dl.store.impl` のデフォルト値をオーバーライドします。

1. Liferayサーバーを再起動します。

## 追加情報

* [ポータルプロパティ](../../../installation-and-upgrades/reference/portal-properties.md)
* [ファイル ストレージ](../../file-storage.md)