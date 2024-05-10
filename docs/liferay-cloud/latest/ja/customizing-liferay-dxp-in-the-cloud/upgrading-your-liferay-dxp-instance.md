# Liferay DXPインスタンスのアップグレード

Liferayは定期的にLiferay DXPの新しいマイナーバージョンとメジャーバージョンをリリースします。 このバージョンには、セキュリティとバグ修正、および拡張機能が含まれています。 Liferay DXPの新しいメジャーバージョンの増分にアップグレードするには、DXPデータベースをアップグレードする必要があります。

```{note}
実稼働中の大規模なデータセットの場合、スムーズなアップグレードを行うためには、さらにいくつかの考慮事項があります。 例えば、カスタムコードやマーケットプレイスアプリは、正常に動作し続けるために追加のアップデートが必要な場合があります。 コアアップグレードの包括的な概要については、 [アップグレードの基本](https://learn.liferay.com/w/dxp/installation-and-upgrades/upgrading-liferay/upgrade-basics) を参照してください。
```

```{note}
新しいマイナーバージョンやサービスパックに更新するには、代わりに [Liferay DXP の新しいバージョンへの更新](./updating-your-dxp-instance-to-a-new-minor-version.md) をご覧ください。
```

```{important}
Liferay Cloudで環境をアップグレードする場合、アップグレードしたデータベースをリストアする必要があるため、Liferayサービスの再起動によるダウンタイムが発生します。 本番環境では、このようなダウンタイムが発生することを想定して、計画的に対処してください。
```

次の手順を確認して、データベースのアップグレードを実行します。

1. [前提条件をインストールする](#install-prerequisites)
1. [バックアップをダウンロード](#download-a-backup)
1. [データを抽出してインポートする](#extract-and-import-the-data)
1. [データのアップグレードを実行する](#perform-the-data-upgrade)
1. [ドキュメントライブラリとデータベースの圧縮](#compress-the-document-library-and-database)
1. [ドキュメントライブラリとデータベースのアップロード](#upload-the-document-library-and-database)
1. [バックアップを復元する](#restore-the-backup)

## 前提条件をインストールする

アップグレードの手順を開始する前に、以下の前提条件を満たしてください。

* [ローカルで利用可能なMySQLインストール](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/) 。
* アップグレードするバージョンのDXPに対応する、 [ダウンロードしたLiferay DXPバンドル](https://customer.liferay.com/en_US/downloads) 。 このバンドルを選択した場所に抽出します。

```{important}
古いものを再利用するのではなく、アップグレード用の新しいバンドルをダウンロードしてください。 過去に使用したデータが、データアップグレードの妨げになる場合があります。
```

## バックアップをダウンロード

次の手順を実行して、現在 `prd` 環境で実行されているDXPインスタンスのバックアップ（データベースとデータボリュームの両方で設定される）をダウンロードします。

1. [Liferay Cloud コンソール](https://console.liferay.cloud/login) にログインしてください。

1. 本番環境に移動し、メニューから［**バックアップ**］を選択します。

    ![運用環境の［バックアップ］ページに移動します。](./upgrading-your-liferay-dxp-instance/images/01.png)

1. リストされているバックアップの1つを選択し、［アクション］メニューから［**ダウンロード**］を選択します。 データボリュームとデータベースのzipファイルをダウンロードします。

    ![各オプションをクリックすると、データボリュームとデータベースアーカイブの両方がダウンロードされます。](./upgrading-your-liferay-dxp-instance/images/02.png)

## データの抽出とインポート

次のステップは、ダウンロードしたアーカイブからデータを抽出し、アップグレードに必要な場所にデータを移動することです。

### データ量を抽出する

バックアップからデータボリュームを抽出するには、次の手順を実行します：

1. ダウンロードしたデータボリュームの `.tgz` アーカイブ（名称 `backup-lfr-<PROJECT_NAME>-prd-<BACKUP_ID>.tgz`）を、先ほど解凍した Liferay バンドル内の `LIFERAY_HOME/data` フォルダーに移動させます。

1. 以下のコマンドを実行して、アーカイブを抽出します：

    ```bash
    tar -xvzf ARCHIVE_NAME.tgz
    ```

### データベースの抽出とインポート

ダウンロードしたデータベースアーカイブ（名前は `backup-db-<PROJECT_NAME>-prd-<BACKUP_ID>.tgz`）の場所でコマンドプロンプトを開き、以下の手順を実行してMySQLにインポートします：

1. データベースアーカイブを抽出します：

    ```bash
    tar -xvzf ARCHIVE_NAME.tgz
    ```

1. ローカルシステムのMySQLクライアントにログインします：

    ```bash
    mysql -u root -ppassword
    ```

1. ファイル名（拡張子を除く）をデータベース名として使用して、データをインポートするデータベースを作成します：

    ```
    create database DATABASE_NAME;
    ```

1. 抽出された `.sql` ダンプからデータベースをインポートします：

    ```
    use DATABASE_NAME;
    ```

    ```
    source DATABASE_NAME.sql;
    ```

1. 最後に、MySQLクライアントから切断します：

    ```
    exit
    ```

データベースとドキュメントライブラリが配置され、データのアップグレードを実行する準備が整いました。

## データアップグレードの実行

DXPバンドルは、データのアップグレードに使用されるアップグレードツールを提供します。 このツールは、バンドルに含まれるスクリプト `db_upgrade.sh`を介して呼び出されます。

```{note}
データベースのアップグレードツールを事前に設定しておくことで、実行時の柔軟性を高めることができます。 高度な使い方については、 [データベースアップグレードツールの使用](https://learn.liferay.com/w/dxp/installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool) を参照してください。
```

`LIFERAY_HOME/tools/portal-tools-db-upgrade-client` フォルダ内でコマンドプロンプトを開いてください。 次に、以下のコマンドを実行します：

```bash
db_upgrade.sh -j "-Dfile.encoding=UTF-8 -Duser.timezone=GMT -Xmx2048m" -l "output.log"
```

アップグレードツールは、データのアップグレードを開始する前に、インストールに関する情報を要求します。 Tomcatを含むLiferayバンドルをダウンロードした場合は、一部のディレクトリがデフォルト値として自動的に検出されます。

以下は、この情報を入力するアップグレードツールとの相互作用の例です：

```
Please enter your application server (tomcat):
tomcat

Please enter your application server directory (../../tomcat-9.0.17):

Please enter your extra library directories (../../tomcat-9.0.17/bin):

Please enter your global library directory (../../tomcat-9.0.17/lib):

Please enter your portal directory (../../tomcat-9.0.17/webapps/ROOT):

[ db2 mariadb mysql oracle postgresql sqlserver sybase ]
Please enter your database (mysql):
mysql

Please enter your database host (localhost):

(etc.)
```

必要な情報を入力すると、アップグレードツールによってデータのアップグレードが実行されます。 次のメッセージがコンソールに表示されたら、アップグレードは完了です：

```
Completed Liferay core upgrade and verify processes in 64 seconds
Checking to see if all upgrades have completed... done.
```

バンドルをローカルでテストして、アップグレードがスムーズに完了したことを確認します。 `LIFERAY_HOME/tomcat-9.x.x/bin/`から以下のコマンドを実行することで、ローカルにインスタンスをテストすることができます。

```bash
./catalina.sh run
```

アップグレードが完了し、確認されると、データベースとデータボリュームはLiferay Cloudにアップロードできる状態になります。

## ドキュメントライブラリを圧縮する

Liferay のインストールがアップグレードされたので、次の手順で `バックアップ` サービスにアップロードする準備をします。

### ドキュメントライブラリの圧縮

1. あなたの `LIFERAY_HOME/data` フォルダ内でコマンドプロンプトを開いてください。

1. 次のコマンドを使用して、このファイルを `.tgz` アーカイブに圧縮します：

    ```bash
    tar -czvf volume.tgz document_library
    ```

    ```{important}
    もし、ダウンロードしたデータボリュームに他のフォルダ（例えば、 `license/` フォルダ）が含まれていた場合は、 `document_library` の後に追加の引数としてそれらを追加してください。
    ```

### データベースアップグレードツールの使用

1. 次のコマンドを実行して、データベースダンプを実行します：

    ```
    mysqldump -uroot -ppassword --databases --add-drop-database lportal | gzip -c | cat > database.gz
    ```

1. このファイルを以下のコマンドで `.tgz` のアーカイブに圧縮します：

    ```bash
    tar zcvf database.tgz database.gz
    ```

データベースと Liferay データボリュームは、 `backup` サービスにアップロードする準備が整いました。

## ドキュメントライブラリとデータベースのアップロード

コンソールから `backup` サービスにドキュメントライブラリとデータベースのアーカイブをアップロードします。

1. まだログインしていない場合は、 [Liferay Cloud コンソール](https://console.liferay.cloud/login) にログインしてください。

1. 該当する環境の **Backups** ページに移動します。

1. 画面上部の 「**バックアップをアップロード...」をクリックします。画面上部の** をクリックします。

    ![Upload Backup ボタンをクリックすると、アップロードのページにアクセスできます。](./upgrading-your-liferay-dxp-instance/images/03.png)

1. バックアップのアップロード」ページで、該当する環境を展開し、データベースとドキュメントライブラリの両方で `+` のアイコンをクリックし、アップロードします。

    ![アイコンをクリックすると、データベースとドキュメントライブラリの両方が.gz形式のアーカイブとしてアップロードされます。](./upgrading-your-liferay-dxp-instance/images/04.png)

1. データベース・ダンプとドキュメント・ライブラリの両方がアップロードされたら、 ［**アップロードの開始**］ をクリックします。

```{note}
また、アップロードAPIにより、データベースダンプやドキュメントライブラリのアップロードも可能です。 詳細は、 [Backup Service API](../platform-services/backup-service/downloading-and-uploading-backups.md#backup-service-apis) をご覧ください。
```

アップロードが完了すると、新しいバックアップが「バックアップ」ページのリストの最上部に表示されます。

## プロジェクトのLiferayイメージのバージョンを更新する

アップグレードされたデータベースが正しく動作するように、あなたの環境で使用している Liferay イメージのバージョンを更新する必要があります。

Liferay DXP の新バージョンを反映させるために、必要に応じてこれらの場所を更新してください。

* `image` property in `liferay/LCP.json`. [Services Changelogs](https://help.liferay.com/hc/ja/sections/360006251311-Services-Changelog) で更新されたイメージを確認し、アップグレードされた DXP のバージョンがイメージ内のバージョンと一致していることを確認します（例： `7.2` `liferaycloud/liferay-dxp:7.2-4.0.7`)。

* `liferay.workspace.docker.image.liferay` property in `liferay/gradle.properties`. [Liferay DXP Docker Hub ページ](https://hub.docker.com/r/liferay/dxp/tags) で、アップグレードした DXP のバージョンに合致するイメージを確認してください。

これらのイメージバージョンの両方が更新されたら、 [変更点を](./deploying-to-the-liferay-service.md) 選択した環境に展開します。 これは、アップロードしたバックアップを復元するためのLiferayサービスを準備するものです。

## バックアップを復元する

次の手順に従って、選択した環境にバックアップを復元します：

1. Liferay Cloud コンソールにログインしていない場合は、ログインしてください。

1. [バックアップをアップロードした](#upload-the-document-library-and-database) 環境に移動し、サイドメニューから ［**バックアップ**］ をクリックします。

1. リストからバックアップを選択し、そのバックアップのアクションメニューから ［**復元**］ をクリックします。

    ![アップロードしたバックアップの［アクション］メニューから［復元先...］を選択します。](./upgrading-your-liferay-dxp-instance/images/05.png)

1. ドロップダウンリストから復元先の環境の1つを選択します（たとえば、 `dev` 環境）。

    ![バックアップを展開する環境を選択します。](./upgrading-your-liferay-dxp-instance/images/06.png)

1. ［**環境への復元**］ をクリックします。

    ```{note}
    選択した環境は、バックアップがデプロイされている間は利用できなくなります。
    ```


<!-- I'd also want to know if there is a zero downtime way to do an upgrade - because that's one of the next questions I would ask if I put myself in the shoes of someone trying to run a prod and business critical env. We may not be ready to say anything about that - but just a thought to put in your mind as potentially a future iteration of this - or let's say if we find out that you CAN do a zero downtime upgrade using a DR environment, then we should update this article to say so. An example:

Upgrading the liferay service requires a database upgrade and restoring the liferay service using the upgraded database. The process of restoring the upgraded database from backup requires some downtime and we recommend testing your upgrade on the DEV or UAT environments first. Zero downtime upgrades are possible using a DR environment. 

-->

　 これでDXPデータベースを新しいバージョンにアップグレードし、選択した環境にデプロイできました。 また、必要に応じて、 [同じバックアップ](#restore-the-backup) を他の環境に再度リストアすることもできます。

## 関連トピック

DXPアップグレードの詳細：

* [アップグレードの基本](https://learn.liferay.com/w/dxp/installation-and-upgrades/upgrading-liferay/upgrade-basics)
* [DXPインスタンスを新しいマイナーバージョンにアップデートする](./updating-your-dxp-instance-to-a-new-minor-version.md)
* [データベースアップグレードツールの使用](https://learn.liferay.com/w/dxp/installation-and-upgrades/upgrading-liferay/upgrade-basics/using-the-database-upgrade-tool)
