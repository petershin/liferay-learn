# DBStore

DBStoreは、ファイルをBLOBとしてDXPデータベースに保存します。 DBStoreには、ファイルベースのストアタイプ(Simple、Advanced、S3）が持つトランザクションロールバックの脆弱性はありません。

DBStoreのファイルサイズ制限は1ギガバイトです。 1ギガバイトを超えるファイルを保存するには、[簡易ファイルシステムストア](./simple-file-system-store.md)または [高度なファイルシステムストア](../../file-storage.md#configuring-advanced-file-system-store) を使用します。

## ストアの設定

1. 次のプロパティを使用して[`portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md)を設定します。

    ```properties
    dl.store.impl=com.liferay.portal.store.db.DBStore
    ```

1. DXPを再起動します。

DXPがファイルをDBStoreに保存するようになりました。

```{important}
[アップロードされたファイルの自動アンチウイルススキャンを有効にする](../enabling-antivirus-scanning-for-uploaded-files.md)を検討します。
```

## 追加情報

* [ファイル ストレージ](../../file-storage.md)
* [ファイルストアの移行](../file-store-migration.md)
