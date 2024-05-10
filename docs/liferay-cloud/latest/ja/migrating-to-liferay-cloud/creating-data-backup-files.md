# ステージ2：データバックアップファイルの作成

オンプレミス環境とLiferayクラウド環境でLiferayのバージョンが一致したので、インストールしたデータを移行するための準備をします。 この段階では、データベースダンプの作成、ドキュメントライブラリストアの移行、ドキュメントライブラリのアーカイブへの圧縮が行われます。

```{warning}
Liferay Cloudサポートに連絡せずに次のステップでアップロードするには、データベースダンプと（圧縮された）ドキュメントライブラリのアーカイブの合計サイズが2TBを超えてはいけません。
```

## データの凍結

データのバックアップファイルを作成する前に、Liferayインスタンスのデータをフリーズさせるためのウィンドウを手配する必要があります。 これにより、バックアップをとっている間にデータが失われることを防ぎます。 データベース管理者と調整し、データベースとドキュメントライブラリを凍結して移行するためのウィンドウを予約します。

## データベースをMySQLに変換する

データベースがMySQL 5.7と互換性があることを確認してください。 [DBeaver](https://dbeaver.io/) のようなツールを使用して、他のデータベース形式を MySQL に変換することができます。

データの整合性を確保するため、変換の前後にデータベース管理者と調整します。 変換したデータベースをテストするには、 [データベースの設定](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database) に接続してから次に進みます。

### テーブルの正しいキャピタライゼーションの確保

Liferay Cloud ではデータベースのテーブルとカラム名は大文字と小文字を区別し、テーブル名はパスカルケースである必要があります。 テーブル名が小文字で作成されている場合、Liferay Cloudでは認識できません。 これは、特定のオペレーティングシステムとデータベースの組み合わせで発生する可能性があります。 例えば、MySQLはLinuxではデフォルトで大文字と小文字を区別しますが、WindowsやMacOSではそうではありません（Liferayではすべて小文字の名前でテーブルが生成されることがあります）。

データベースダンプを作成する前に、データベースのテーブルがPascalの大文字と小文字で構成されていることを確認してください。 そうでない場合（つまり、すべて小文字の場合）、手動またはスクリプトでPascalの大文字に変換する必要があります。 また、テーブル名を参照する独自のコードには、更新された大文字表記を反映させる必要があります。

例えば、これらの小文字のテーブル名を変換します。

* **accountentry** &rarr; **AccountEntry**

* **cpdefinition** &rarr; **CPDefinition**

* **trashentry** &rarr; **TrashEntry**

MySQL の [`RENAME TABLE`](https://dev.mysql.com/doc/refman/5.7/en/rename-table.html) コマンドを使用すると、テーブルの名前を変更することができます。 [テーブル名の調整についてサポートが必要な場合は、サポートチケット](https://help.liferay.com) を送信してください。

## データベースダンプの作成

```{note}
Windows（OS）をお使いの場合、圧縮ファイルのパック/アンパックのコマンドを実行するために、ファイル圧縮ソフトが必要です。 これを行うには、 [7-zip]（https://www.7-zip.org/）または同様のファイル圧縮ソフトをインストールします。
```

データベースがMySQL形式になったので、データベースサーバーで次のコマンドを実行します。 `#` をそれぞれデータベースユーザーとパスワードに、 `lportal` を必要に応じてデータベース名に置き換えてください。

**Linux、MacOSの場合**(1コマンド)。

```bash
mysqldump -u### -p### --databases --add-drop-database lportal | gzip -c | cat > database.gz
```

**Windowsの場合**（2コマンド）。

```
mysqldump -u### -p##### --databases --add-drop-database lportal > database.sql
```

```
7za a -tgzip database.gz database.sql
```

サーバーは、 `database.gz`という名前の圧縮されたデータベース・ダンプ・ファイルを作成します。

## ドキュメントライブラリーをファイルシステムストアに移行する

ドキュメントライブラリがファイルシステムストアではないファイル保存方法（Amazon S3StoreやDBStoreなど）を使用している場合、先にファイルシステムストアに移行する必要があります。 Simple File System StoreまたはAdvanced File System Storeのいずれかを使用することができます。

```{important}
[ファイルストレージ](https://learn.liferay.com/ja/w/dxp/system-administration/file-storage) では、より簡単に大規模なデータセットに拡張できるフォルダ構造を採用しています。 アドバンストファイルシステムストアへの移行は、長期的にドキュメントライブラリのより多くのファイルを収容するために推奨されており、あらゆる実稼働環境において**必須**です。
```

文書ライブラリを移行する手順については、「 [ファイルストアの移行](https://learn.liferay.com/w/dxp/system-administration/file-storage/file-store-migration) を参照してください。

### 変更を伴うJenkinsビルドの作成

Liferayのローカルインストールを移行した後、 `portal-ext.properties`に変更してLiferay Cloud環境にもビルドを作成しデプロイする必要があります。 文書ライブラリストアを移行する必要がなかった場合は、環境に変更を導入する必要はありません。

Gitコマンドを実行し、Gitがインストールされている端末で変更内容を送信します。

1. 変更したファイルをGitに追加します。

    ```bash
    git add .
    ```

1. 変更内容とメッセージをコミットします。

    ```bash
    git commit -m "Liferay Cloud Migration Stage 2"
    ```

1. 変更をGitHubにプッシュします。

    ```bash
    git push origin master
    ```

プロジェクトはGitHubのリポジトリにリンクされているため、変更をプッシュすると自動的にビルドが作成されます。 ビルドが完了するのを待ってから、次に進みます。

### ビルドを選択した環境にデプロイする

最後に、 [Liferay Cloud Console](https://console.liferay.cloud/) を使って、完成したビルドを選択した環境にデプロイします。

1. Liferay Cloud Consoleでビルドページに移動します（ページ上部のリンクを使用します）。

1. リストの中から前回作成したビルドを探し、アクションメニューから ［**Deploy build to**］ をクリックします。

    ![ビルドのアクションメニューでデプロイします。](./creating-data-backup-files/images/01.png)

1. ビルドをデプロイする環境を選択します（例： `acme-dev`）。

1. 以下の情報を確認し、確認ボックスを選択して、デプロイ結果を確認します。

    ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイします。](./creating-data-backup-files/images/02.png)

1. ［**Deploy Build**］ をクリックします。

ビルドは選択した環境にデプロイされ、 `portal-ext.properties` の変更は `liferay` サービスが再起動したときに適用されます。

```{important}
[バックアップからデータをリストアする](../platform-services/backup-service/restoring-data-from-a-backup.md)場合、ある環境のバックアップが動作するように、DXP Cloud上のすべての環境が同じドキュメントライブラリの実装を使用する必要があります。ビルドをすべての環境に配備して、すべての環境で移行したドキュメントライブラリストアが正しく使用されていることを確認する必要があります。
```

## ドキュメントライブラリの圧縮

文書ライブラリのあるサーバーで、以下のコマンドを実行し、アップロード用に文書ライブラリを圧縮します。

**Linux、MacOSの場合**(2コマンド)。

```bash
cd $LIFERAY_HOME/data
```

```bash
tar -czvf volume.tgz document_library
```

**Windowsの場合**（3コマンド）。

```
cd $LIFERAY_HOME\data
```

```
7za a volume.tar document_library
```

```
7za a volume.tgz volume.tar
```

これで、 `volume.tgz`という名前の圧縮されたドキュメントライブラリのアーカイブができました。

## 次のステップ

これで、2つのファイル（`database.gz` と `volume.tgz`）ができ、Liferay Cloud 環境に適用する準備が整いました。 次に、 [これらのファイルを使って、データのバックアップ](./uploading-and-restoring-the-data-backup.md) をアップロードし、リストアします。
