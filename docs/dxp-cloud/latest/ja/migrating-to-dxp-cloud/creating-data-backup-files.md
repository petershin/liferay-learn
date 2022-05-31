# ステージ2：データバックアップファイルの作成

オンプレミス環境とDXPクラウド環境でLiferayのバージョンが一致したので、インストールしたデータを移行するための準備をする必要があります。 この段階では、データベースダンプの作成、ドキュメントライブラリストアの移行、ドキュメントライブラリのアーカイブへの圧縮が行われます。

```{warning}
DXPクラウドサポートに連絡せずに次のステップでアップロードするには、データベースダンプと（圧縮）ドキュメントライブラリアーカイブの合計サイズが2TBを超えてはいけません。
```

## データを凍結する

データのバックアップファイルを作成する前に、Liferayインスタンスのデータをフリーズさせるためのウィンドウを手配する必要があります。 これにより、バックアップをとっている間にデータが失われることを防ぎます。 データベース管理者と調整し、データベースとドキュメントライブラリを凍結して移行するためのウィンドウを予約します。

## データベースをMySQLに変換する

データベースがMySQL 5.7と互換性があることを確認してください。 [DBeaver](https://dbeaver.io/) のようなツールを使用して、他のデータベース形式をMySQLに変換することができます。

データの整合性を確保するために、変換の前後にデータベース管理者と調整します。 変換したデータベースを [ローカルのLiferayインストールに接続してテストします](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/installing-liferay/configuring-a-database.html) 次に進む前に、変換したデータベースをテストします。

## データベースダンプの作成

```{note}
Windows（OS）をお使いの場合、圧縮ファイルのパック/アンパックのコマンドを実行するために、ファイル圧縮ソフトが必要です。 [7-zip]（https://www.7-zip.org/） などのファイル圧縮ソフトをインストールして行ってください。
```

データベースがMySQL形式になったので、データベースサーバーで次のコマンドを実行します。 `#` はそれぞれデータベースユーザーとパスワード、 `lportal` は必要ならデータベース名で置き換えてください。

**Linux、MacOSの場合** (1コマンド):

```bash
mysqldump -u##### -p##### --databases --add-drop-database lportal | gzip -c | cat > database.gz
```

**Windowsの場合** (2コマンド)。

```
mysqldump -u##### -p##### --databases --add-drop-database lportal > database.sql
```

```
7za a -tgzip database.gz database.sql
```

サーバーは、 `database.gz`という名前の圧縮されたデータベースダンプファイルを作成します。

## ドキュメントライブラリーをファイルシステムストアに移行する

ドキュメントライブラリがファイルシステムストアではないファイル保存方法（Amazon S3StoreやDBStoreなど）を使用している場合、先にファイルシステムストアに移行する必要があります。 Simple File System StoreまたはAdvanced File System Storeのいずれかを使用することができます。

```{tip}
Advanced File System Store](https://learn.liferay.com/dxp/latest/en/system-administration/file-storage/configuring-file-storage.html)では、より簡単に大規模なデータセットに拡張できるフォルダ構造を採用しています。 長期的には、ドキュメントライブラリのより多くのファイルを収容するために、アドバンストファイルシステムストアへの移行をお勧めします。
```

文書ライブラリを移行する手順については、 [ファイルストア移行](https://learn.liferay.com/dxp/latest/en/system-administration/file-storage/file-store-migration.html) を参照してください。

### 変更を伴うJenkinsビルドの作成

Liferayのローカルインストールを移行した後、 `portal-ext.properties`に変更してDXP Cloud環境にもビルドを作成し、デプロイする必要があります。 ドキュメントライブラリストアの移行が必要ない場合は、環境に対する変更を展開する必要はありません。

Gitがインストールされている端末でGitコマンドを実行し、変更内容を送信します。

1. 変更したファイルをGitに追加します。

    ```bash
    git add .
    ```

1. 変更内容とメッセージを添えてコミットしてください。

    ```bash
    git commit -m "DXP Cloud Migration Stage 2"
    ```

1. 変更をGitHubにプッシュします。

    ```bash
    git push origin master
    ```

プロジェクトはGitHubのリポジトリにリンクされているため、変更をプッシュすると自動的にビルドが作成されます。 ビルドが完了するのを待ってから、次に進みます。

### ビルドを選択した環境にデプロイする

最後に、 [DXP Cloud Console](https://console.liferay.cloud/) を使用して、完成したビルドを選択した環境にデプロイします。

1. DXP Cloud Consoleで、Buildsページに移動します（ページ上部のリンクを使用します）。

1. リストの中から前回作成したビルドを探し、[アクション]メニューから *Deploy build to*をクリックします。

    ![ビルドのActionsメニューでデプロイします。](./creating-data-backup-files/images/01.png)

1. ビルドをデプロイする環境を選択します（例： `acme-dev`）。

1. 以下の情報を読み、確認ボックスを選択して、展開結果を確認します。

    ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイしてください。](./creating-data-backup-files/images/02.png)

1. *Deploy Build*をクリックします。

ビルドは選択した環境にデプロイされ、 `portal-ext.properties` への変更は `liferay` サービス再始動の際に適用されます。

```{important}
ある環境のバックアップを他の環境にリストアする場合、DXP Cloud上のすべての環境が同じドキュメントライブラリの実装を使用する必要があります(../platform-services/backup-service/restoring-data-from-a-backup.md)。 ビルドをすべての環境に配備して、すべての環境で移行したドキュメントライブラリストアが正しく使用されていることを確認する必要があります。
```

## ドキュメントライブラリの圧縮

文書ライブラリのあるサーバーで、以下のコマンドを実行し、アップロード用に文書ライブラリを圧縮します。

**Linux、MacOSの場合** (2コマンド)。

```bash
cd $LIFERAY_HOME/data
```

```bash
tar -czvf volume.tgz document_library
```

**Windowsの場合** (3コマンド)。

```
cd $LIFERAY_HOME\data
```

```
7za a volume.tar document_library
```

```
7za volume.tgz volume.tar
```

これで、 `volume.tgz`という圧縮されたドキュメントライブラリのアーカイブができました。

## 次のステップ

これで、2つのファイル（`database.gz` と `volume.tgz`）ができ、DXP Cloud 環境に適用する準備が整いました。 次に、これらのファイルを使って、 [データのバックアップ](./uploading-and-restoring-the-data-backup.md) をアップロードし、リストアします。