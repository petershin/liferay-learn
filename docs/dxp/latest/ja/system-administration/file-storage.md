---
toc:
- ./file-storage/enabling-antivirus-scanning-for-uploaded-files.md
- ./file-storage/file-store-migration.md
- ./file-storage/other-file-store-types.md
---
# ファイルストレージ

Liferay DXPにアップロードされた全てのファイルは、インスタンスの指定されたファイルストアに保存されます。 これには、 [［ドキュメントとメディア］](../content-authoring-and-management/documents-and-media.md)を使ってアップロードされたファイルや、ファイルの添付をサポートするアプリケーション（ [掲示板](../collaboration-and-social/collaboration-and-social-overview.md)など）を使ってアップロードされたファイルが含まれます。 ファイルストアは、ローカルマシン上、ネットワークにマウントされたファイルシステム上、データベース、またはクラウドでホストできます。

```{important}
本番環境に移行する場合は、さまざまなファイルストア構成オプションを確認し、本番環境に移行する**前**に、ニーズに最適なオプションを選択することを強くお勧めします。 そうすることで、プロジェクトの後半でファイル保管場所を移行する手間を省くことができます。
```

```{note}
ファイルストアは［ドキュメントライブラリ］とも呼ばれています。
```

## 高度なファイルシステムストアの設定

高度なファイルシステムストアは、フォルダ内のファイルをアルファベット順にネストすることにより、プログラムで数百万のファイルに拡張できるフォルダ構造を作成します。 これにより、より多くのファイルを保存できるようになり、一部のオペレーティングシステムで発生するフォルダごとに保存できるファイル数の制限を回避できます。 フォルダあたりの保存ファイル数が少ないと、ファイル検索のパフォーマンスも向上します。

![高度なファイルシステムストアのフォルダ構造](./file-storage/images/01.png)

高度なファイルシステムストア方式を使用するには、次の手順に従います。

1. 次のプロパティを使用して[`portal-ext.properties`](../installation-and-upgrades/reference/portal-properties.md)を設定します。

    ```properties
    dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
    ```

1. Liferayを再起動します。

1. ［コントロールパネル］から、 ［**設定**］ &rarr; ［**System Settings**］ &rarr; ［**File Storage**］ へ行きます。

1. ［**Advanced File System Store**］ 画面で、 ［**Root Directory**］ を [Liferay Home](../installation-and-upgrades/reference/liferay-home.md) パス（絶対または相対）に設定します。

    ![高度なファイルシステムストア画面](./file-storage/images/02.png)

1. ［**Save**］ をクリックします。

Liferayは、高度なファイルシステムストアを使用してファイルを保存するようになりました。

```{important}
オプションで[アップロードされたファイルの自動アンチウイルススキャンを有効にする](./file-storage/enabling-antivirus-scanning-for-uploaded-files.md)を設定します。
```

### クラスター環境でのファイルストレージ

[クラスター環境](../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability.md)では、すべてのノードがアクセスできるネットワークマウントファイルシステムをストアに指定します。 ネットワーク化されたファイルシステムは、すべてのノードからアクセス可能で、同時要求をサポートし、ファイルロックをサポートしている必要があります。 そのようなファイルシステムなしで高度なファイルシステムストアを使用し、複数のユーザーが同時に同じファイルに書き込もうとすると、データが破損する可能性があります。

## その他のファイルストレージトピック

### その他のファイルストレージメソッド

利用可能な他の組み込みのファイル保存方法があります。

* [簡易ファイルシステムストア](./file-storage/other-file-store-types/simple-file-system-store.md)は、ファイルシステム（ローカルまたはマウントされた共有）を使用してファイルを格納します。 これは **デフォルト** のファイルストアです。

* [S3 Store（Amazon Simple Storage Service）](./file-storage/other-file-store-types/amazon-s3-store.md)は、Amazonのクラウドベースのストレージを使用しています。

* [DBStore（データベースストレージ）](./file-storage/other-file-store-types/dbstore.md)は、ファイルを`BLOB`としてDXPデータベースに保存します。 DBStoreのファイルサイズ制限は1ギガバイトです。 1ギガバイトを超えるファイルを保存するには、簡易ファイルシステムストアまたは高度なファイルシステムストアを使用します。

```{warning}
ファイルシステムベースのストア（Simple、Advanced、S3）には、トランザクションロールバック機能がありません。 ドキュメントライブラリでデータベーストランザクションのロールバックが発生した場合、トランザクションのファイルシステムの変更は元に戻されません。 ドキュメントライブラリファイルとファイルシステムストア内のファイルとの間に不整合が発生する可能性があり、手動での同期が必要になる場合があります。 [DBStore](./file-storage/other-file-store-types/dbstore.md) 以外のすべてのストアは、この制限に対して脆弱です。
```

### ファイルストア間でのファイルの移行

データ移行ユーティリティは、ファイルをあるストアオプションから別のストアオプションに移動します。 たとえば、この機能を使用して簡易ファイルシステムストア（デフォルトのストア）から高度なファイルシステムストアにファイルを移行すると、パフォーマンスとスケーラビリティのメリットを活用できます。 詳細は、[ファイルストアの移行](./file-storage/file-store-migration.md)を参照してください。