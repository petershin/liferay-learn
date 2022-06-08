# Microsoft Azure Blob Storage Service

> 7.4以降および7.3 FP2以降で使用可能です。

Microsoft Azure Blob Storageは、DXPのAzure Blob Storage Storeが使用するクラウドベースのストレージソリューションで、ファイルをクラウドにシームレスに保存することができます。 その下には、膨大な量の非構造化データを処理するために最適化されたマイクロソフトのBlob Storage APIが使用されています。

この接続を有効にする前に、アクティブな [Azure Blob Store アカウント](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-create?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&tabs=azure-portal)、設定済みの [接続文字列](https://docs.microsoft.com/en-us/azure/storage/common/storage-configure-connection-string)、および [Azure Blobコンテナー](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-container-create?tabs=dotnet)を持っている必要があります。

次に、以下を実行して、Liferayインスタンスへの接続を有効にします。

* [コントロールパネルでファイルの保存方法を設定する](#configuring-the-store)
* [`dl.store.impl`ポータルプロパティを設定して、デフォルトのストレージ方式としてAzure Blog Storage](#setting-azure-blog-storage-as-default-store)を使用するように設定します。

```{warning}
ドキュメントライブラリでデータベーストランザクションのロールバックが発生した場合、トランザクションのファイルシステムの変更は元に戻されません。 ドキュメントライブラリファイルとファイルシステムストア内のファイルとの間に不整合が発生する可能性があり、手動での同期が必要になる場合があります。 DBStoreを除くすべてのDXPストアは、この制限に対して脆弱です。
```

## ストアの設定

次の手順に従って、ストアを設定します。

1. *グローバルメニュー* (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; *［コントロールパネル］* &rarr; *［System Settings］* &rarr; *［File Storage］* &rarr; *［Azure Blob Storage］*を開きます。

   ![空欄に接続文字列とコンテナー名を記入する。](./microsoft-azure-blob-storage/images/01.png)

1. Azure Blob Storage Storeの [接続文字列](https://docs.microsoft.com/en-us/azure/storage/common/storage-configure-connection-string) を入力します。

1. ファイルの保存に使用する [Azure Blobコンテナー](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-container-create?tabs=dotnet) の名称を入力します。

1. オプションで、ファイルを保存するための [暗号化スコープ](https://docs.microsoft.com/en-us/azure/storage/blobs/encryption-scope-overview) を入力します。

1. オプションで、HTTPログを有効にするかどうかを決定します。 有効にすると、Azureクライアントが行ったHTTPリクエストとレスポンスがサーバーログに出力されます。

Azure Blob Storage Storeの設定が完了したら、デフォルトのファイルストレージシステムとして設定することができます。

## Azure Blob Storageをデフォルトのストアとして設定する

以下の手順に従って、Liferayインスタンスのデフォルトストアとして Azure Blob Storageを使用します。

1. 下記のプロパティをインスタンスの[`portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md)ファイルに追加します。

   ```properties
   dl.store.impl=com.liferay.portal.store.azure.AzureStore
   ```

   `portal-ext.properties`ファイルが存在しない場合は、上記の値で新規ファイルを作成し、インスタンスの[`LIFERAY_HOME`](../../../installation-and-upgrades/reference/liferay-home.md) または `[USER_HOME]`フォルダーに追加します。

   これは、`portal.properties` ファイルの`dl.store.impl` のデフォルト値をオーバーライドします。

1. Liferayサーバーを再起動します。

再起動が完了すると、構成された Azure Blob Storage コンテナーがインスタンスのデフォルトのストアになります。

```{important}
クラスター環境でAzure Blob Storageのストアを使用している場合、すべてのノードの設定が同一である必要があります。 特に、`portal-ext.properties`ファイルと、システム設定のAzure Blob Storageストア設定が同じであることを確認してください。 
```

## 追加情報

* [Azure Blob Storageのドキュメント](https://docs.microsoft.com/en-us/azure/storage/blobs/)
* [ファイル ストレージ](../../file-storage.md)