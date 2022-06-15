# 簡易ファイルシステムストア

簡易ファイルシステムストアは、デフォルトのファイルストアタイプです。 ファイルシステム（ローカルまたはマウントされた共有）を使用してファイルを格納します。 クラスター環境で簡易ファイルシステムストアを使用する場合、そのフォルダはすべてのクラスターノードからアクセス可能で、同時要求を処理し、ファイルロックをサポートしている必要があります。 [記憶域ネットワーク](https://en.wikipedia.org/wiki/Storage_area_network) またはクラスター化ファイルシステムを使用することをお勧めします。

簡易ファイルシステムストアは、Liferay DXPデータベースにバインドされています。 デフォルトのルートフォルダは`[Liferay Home]/data/document_library`です。 簡易ファイルシステムストアは、次のファイルパス形式を使用してファイルを保存します。

```
[Liferay Home]/data/document_library/companyId/folderId/numericFileEntryName/versionNumber
```

![簡易ファイルシステムストアのファイル構造の例。](./simple-file-system-store/images/01.png)

`[Liferay Home]/data/document_library`フォルダのファイル階層の説明は次のとおりです。

`companyId`：サイトの会社ID。

`folderId`：ファイルエントリが含まれているアプリのフォルダ（ドキュメントとメディアフォルダなど）のID。

`numericFileEntryName`：ファイルエントリの数値名。

`versionNumber`：ファイルエントリのバージョン番号。

**注：** ドキュメントの数値ファイルエントリ名とドキュメントIDは、次の点で異なります。

* それぞれ独立したカウンターを持っています。
* 数値ファイルエントリ名はストレージファイルパスで使用されますが、ドキュメントIDは使用されません。
* それぞれ異なる`DLFileEntry`テーブル列に格納されます。 数値ファイルエントリ名は`name`列に格納され、ドキュメントIDは`fileEntryId`列に格納されます。

```{warning}
ドキュメントライブラリでデータベーストランザクションのロールバックが発生した場合、トランザクションのファイルシステムの変更は元に戻され**ません**。 ドキュメントライブラリファイルとファイルシステムストア内のファイルとの間に不整合が発生する可能性があり、手動での同期が必要になる場合があります。  [DBStore](./dbstore.md) を除くすべてのDXPストアは、この制限に対して脆弱です。
```

## ストアの設定

簡易ファイルシステムストアを構成するには、次の手順に従います。

1. **メニュー**(![Menu](./simple-file-system-store/images/02.png)) ボタンをクリックすると、 **コントロールパネル** が表示されます。
1. ［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**System Settings**］ に移動します。
1. **プラットフォーム** セクションで、 ［**File Storage**］ をクリックします。
1. ［**Simple File System Store**］ 画面で、 ［**Root Directory**］ を [Liferay Home](../../../installation-and-upgrades/reference/liferay-home.md) パス（絶対または相対）に設定します。

    ![システム設定のファイル ストレージページでは、ドキュメントリポジトリストレージを設定できます。](./simple-file-system-store/images/03.png)

1. ［**Save**］ をクリックします。

ファイルストアがすぐに新しいフォルダに切り替わります。

別のストアタイプから簡易ファイルシステムストアに切り替える場合は、次のプロパティを使用して[`portal-ext.properties`](../../../installation-and-upgrades/reference/portal-properties.md)を設定し、DXPを再起動します。

```properties
dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
```

```{important}
[アップロードされたファイルの自動アンチウイルススキャンを有効にする](../enabling-antivirus-scanning-for-uploaded-files.md)を検討します。
```

## クラスター環境でのストアの使用

[クラスター環境](../../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability.md)では、すべてのノードがアクセスできるネットワークマウントファイルシステムをストアに指定します。 ネットワーク化されたファイルシステムは、すべてのノードからアクセス可能で、同時要求をサポートし、ファイルロックをサポートしている必要があります。 そのようなファイルシステムなしで簡易ファイルシステムストアを使用し、複数のユーザーが同時に同じファイルに書き込もうとすると、データが破損する可能性があります。

## 追加情報

* [ファイル ストレージ](../../file-storage.md)
* [Amazon S3 Store](./amazon-s3-store.md)
* [DBStore](./dbstore.md)
* [ファイルストアの移行](../file-store-migration.md)