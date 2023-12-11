# バックアップのダウンロードとアップロード

Liferay クラウドバックアップサービスは環境のデータベースと Liferay インスタンスの `LIFERAY_HOME/data` フォルダの全内容のバックアップを作成します。 このコンテンツはアーカイブファイル（それぞれ `.gz` と `.tgz` ）として保存され、Liferay Cloud コンソールからダウンロードできます。

ユーザーは[Liferayクラウドコンソールを使って](#uploading-backups-via-the-console)、または[バックアップAPI](#backup-service-apis)を使って環境のバックアップをダウンロードまたはアップロードすることもできます。

```{note}
バックアップ]ページは、バックアップサービスのバージョンが4.3.5より古い場合、本番環境でのみ使用できます。
```

## CLIツールによるバックアップのダウンロード

{bdg-secondary}`CLIツールバージョン3.12.0+、バックアップサービスバージョン5.9.0+、Liferayサービスバージョン5.3.0+が必要です。`

[CLI ツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) を使用して、データベースとドキュメント・ライブラリ・ボリュームの両方を含むバックアップを直接ダウンロードすることができます。

特定のバックアップのIDを使用してこのコマンドを実行し、そのデータベースとドキュメント・ライブラリを同時にダウンロードします：

```bash
lcp backup download --backupId [ID]
```

オプションで3つのコマンドラインスイッチがある：

`--データベース`はデータベースのみをダウンロードすることを指定する。

`--doclib`はドキュメントライブラリのみをダウンロードすることを指定する。

`--concurrency`は、並行してダウンロードするファイル数を定義する（最大10,000）。

複数のスイッチを使用する例である：

```bash
lcp backup download --backupId [ID] --doclib --concurrency 500
```

同時にダウンロードする最適なファイル数は、システムやネットワークの仕様によって異なります。 `concurrency`フラグは、データベースが単一のファイルとしてダウンロードされるため、ドキュメントライブラリのダウンロードにのみ影響します。

## CLIツールによるバックアップのアップロード

{bdg-secondary}`CLIツールバージョン3.12.0+、バックアップサービスバージョン5.9.0+、Liferayサービスバージョン5.3.0+が必要です。`

```{warning}
Liferay Cloudでは、データベースのテーブルとカラムの名前は大文字と小文字が区別されます。 データベースをアップロードする前に、テーブル名がパスカルケースであることを確認してください。 詳しくは、 [表の正しい大文字小文字の確認](../../migrating-to-liferay-cloud.md#ensuring-correct-table-capitalization) を参照のこと。
```
データベースとドキュメント・ライブラリの両方を含むバックアップをアップロードするには、このコマンドを実行します：

```bash
lcp backup upload --project [Project name] --environment [Environment] --doclib [Path to document library folder] --database [Path to database .gz file]
```

アップロードするには、 [データベースダンプ](#creating-the-database-file) を作成し、`.gz` アーカイブに圧縮する必要があります。

また、`--concurrency`フラグを追加して、並行してアップロードするストリームの数（最大10,000）を指定することもできる。

## データベースとドキュメントライブラリのアップロード準備

環境のバックアップをLiferay Cloudにアップロードするには、データベースをアーカイブファイルとして用意する必要があります。 バックアップサービスのバージョンが5.9.0より前の場合、ドキュメントライブラリも別のアーカイブファイルに圧縮する必要があります。

### データベースファイルの作成

MySQL ダンプを（`.sql` スクリプトとして）作成し、`.gz` アーカイブに圧縮するには、以下のコマンドを実行する：

```bash
mysqldump -uroot -ppassword --add-drop-database --databases lportal | gzip -c | cat > database.gz
```

```{note}
Backup サービスが少なくともバージョン `4.2` に更新されていない場合は、以下のコマンドを実行してアーカイブを `.tgz` ファイル（`tar zcvf database.tgz database.gz`）に変換する必要があります。 そして、出来上がった `.tgz` アーカイブをアップロードに使用します。
```
`databases`フラグと`--add-drop-database`フラグは、バックアップのリストアが正しく動作するために必要である。 また、`/backup/download` API を使用して、バックアップサービスが MySQL ダンプファイルをどのように作成するかを確認することもできます。

これらのオプションを指定した場合、作成されるダンプファイルには、create tableステートメントの直前に以下のコードが含まれます。

```sql
--
-- Current Database: `lportal`
--

/*!40000 DROP DATABASE IF EXISTS `lportal`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lportal` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lportal`;
```

### ボリュームファイルの作成

[LCPツール](#uploading-backups-via-the-cli-tool) を使用してバックアップをアップロードする場合、ツールは自動的にドキュメント・ライブラリのファイルを圧縮するため、ボリューム・ファイルを作成する必要はありません。

クラウドコンソールUIまたはAPI経由でバックアップをアップロードするには、ドキュメントライブラリを圧縮してアップロードする必要があります。

```{tip}
バックアップのアップロード時にLiferay Cloudの権限が設定されていない場合、その後の環境へのバックアップの復元に時間がかかることがあります。 長いリストア時間を避けるために、`LIFERAY_HOME`フォルダに移動して、ドキュメントライブラリを圧縮する前に次のコマンドを実行してください。chown -R 1000:1000 data/document_library/`
```

このコマンドを実行すると、データボリュームが圧縮されます。

```bash
cd $LIFERAY_HOME/data && tar -czvf volume.tgz document_library
```

## コンソールによるバックアップのダウンロード

```{important}
コンソール経由でバックアップをダウンロードできるのは、**バックアップサービス5.9.0以前**のみです。 バージョン5.9.0以上では、代わりに [CLIツール](#downloading-backups-via-the-cli-tool) 。
```

以下の手順に従って（管理者として）、選択した環境の_Backups_ページからバックアップをダウンロードしてください：

1. ダウンロードするバックアップの _アクション_ ( ⋮ ) をクリックします。

1. *ダウンロード*をクリックしてください。

   ![Click on the Actions button, and then click Download.](./downloading-and-uploading-backups/images/01.png)

1. *Database* (`.gz`) または _Liferay_ (`.tgz`) ファイルをクリックしてダウンロードを開始します。 これらのZIPアーカイブを合わせて、環境のバックアップとします。

   ```{note}
   バックアップサービスがまだバージョン `4.2` 以上にアップデートされていない場合、データベースボリュームは `.gz` ではなく `.tgz` アーカイブとしてダウンロードされます。
   ```

   ![Click to download the database and Liferay data volume files.](./downloading-and-uploading-backups/images/02.png)

## コンソールによるバックアップのアップロード

Liferay Cloudにバックアップをアップロードする前に、データベースダンプとドキュメントライブラリを別々のアーカイブに圧縮する必要があります。 オンプレミス環境での準備については、 [データベースとドキュメントライブラリのアップロードの準備](#preparing-the-database-and-document-library-for-upload) を参照してください。

```{warning}
Liferay Cloudでは、データベースのテーブルとカラムの名前は大文字と小文字が区別されます。 データベースをアップロードする前に、テーブル名がパスカルケースであることを確認してください。 詳しくは、 [表の正しい大文字小文字の確認](../../migrating-to-liferay-cloud.md#ensuring-correct-table-capitalization) を参照のこと。
```
Backupsページから以下の手順に従ってください：

1. 画面上部にある*バックアップをアップロード...*をクリックします。

1. バックアップのアップロード」ページで、該当する環境を展開し、データベースとドキュメントライブラリの両方の「+」アイコンをクリックしてアップロードします。

   ![Click the icons to upload both the database and document library as .gz archives.](./downloading-and-uploading-backups/images/03.png)

1. データベース・ダンプとドキュメント・ライブラリの両方がアップロードされたら、_Initiate Upload_をクリックします。

Liferay Cloudはあなたがアップロードしたファイルを使ってバックアップを生成し、あなたの環境にリストアできるリストに追加します。 バックアップが生成されている間は、他のバックアップの生成や復元はできません。

バックアップが生成されると、ページに成功のメッセージが表示され、サービスは通常の動作を再開する。

![When the backup is finished being added to the list in your environment, a success message appears.](./downloading-and-uploading-backups/images/04.png)

## バックアップサービスのAPI

バックアップサービスにはAPIがあり、バックアップバージョン5.9.0以前のバックアップのダウンロードやアップロードにも使用できます。 これらのAPIは、`curl`のようなコマンドラインツールを使って呼び出すことができる。

### ホスト名の取得

バックアップAPIを呼び出すには、バックアップサービスのホスト名が必要です。 *サービス*のページでご覧いただけます。

![View the backup service's host name from the Services page.](./downloading-and-uploading-backups/images/05.png)

バックアップサービスのホスト名は、サービス名、プロジェクト名、環境名を組み合わせたものです。

この例を考えてみましょう。

* サービス名: `backup`
* プロジェクト名: `lfrjoebloggs`
* 環境名: `prd`
* ホスト名：`backup-lfrjoebloggs-prd.lfr.cloud`。

### 認証

ベーシック認証やユーザーアクセストークンを使って、リクエストを認証することができます。

SSOが有効な場合、トークン認証が必要であることに注意してください。 このトークンはクッキーの `access_token` から取得し、 `dxpcloud-authorization` ヘッダーで使用することができる。

アップロードAPIでトークン認証を利用した例をご紹介します。

```bash
curl -X POST \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/upload \
  -H 'Content-Type: multipart/form-data' \
  -H 'dxpcloud-authorization: Bearer [User token]' \
  -F 'database=@/my-folder/database.gz' \
  -F 'volume=@/my-folder/volume.tgz'
```

```{note}
ヘッダー `dxpcloud-authorization` でユーザートークンを渡すことは、バックアップサービスのバージョン `3.2.0` 以降でのみ機能します。 以前のバージョンは、少なくとも `3.2.0` にアップグレードする必要があります。 それ以前のバージョンへのリクエストはヘッダー `Authorization：ベアラ [プロジェクトマスタートークン]`. プロジェクトマスタートークンは、Liferay Cloudコンソールの任意のシェルで `env | grep LCP_PROJECT_MASTER_TOKEN` コマンドを実行することで確認することができます。
```

### データベースAPIのダウンロード

データベースをダウンロードするAPIには、`.gz`ファイルを返すエンドポイントがある。 id`パラメータはバックアップIDを表し、バックアップページで確認できます。 このIDは2つのダッシュで区切られた3つの文字列で構成される（例：`dxpcloud-lqgqnewltbexuewymq-201910031723`）。

#### パラメーター

| 名前   | 種類       | 必須 |
| :--- | :------- | :- |
| `id` | `String` | はい |

#### curlの例

```bash
curl -X GET \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/download/database/[ID] \
  -u user@domain.com:password \
  --output database.gz
```

```{note}
バックアップサービスがまだバージョン `4.2` 以上にアップデートされていない場合、データベースボリュームは `.gz` ではなく `.tgz` アーカイブとしてダウンロードされます。
```

### Data Volume APIのダウンロード

データ・ボリュームをダウンロードするAPIには、`.tgz`ファイルを返すエンドポイントがある。 `id`パラメータはバックアップIDを表し、バックアップページで確認できます。 このIDは2つのダッシュで区切られた3つの文字列で構成される（例：`dxpcloud-lqgqnewltbexuewymq-201910031723`）。

#### パラメーター

| 名前   | 種類       | 必須 |
| :--- | :------- | :- |
| `id` | `String` | はい |

#### curlの例

```bash
curl -X GET \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/download/volume/[ID] \
  -u user@domain.com:password \
  --output volume.tgz
```

### バックアップAPIのアップロード

アップロードバックアップAPIを使ってLiferay Cloudにバックアップをアップロードするには、以下の手順に従ってください。

1. [データベースファイル作成します](#creating-the-database-file)。

1. [ボリュームファイル作成します](#creating-the-volume-file)。

1. データベースとボリュームのファイルを使って、 [バックアップAPIを起動します](#invoking-the-backup-api)。

アップロードAPIを使用する前に、データベースダンプとドキュメントライブラリを別々のアーカイブに圧縮する必要があります。 オンプレミス環境でのアップロードの準備については、 [データベースとドキュメント・ライブラリーのアップロードの準備](#preparing-the-database-and-document-library-for-upload) を参照してください。

#### バックアップAPIの呼び出し

**パラメーター**

| 名前         | 種類     | 必須 |
| :--------- | :----- | :- |
| `database` | `File` | はい |
| `volume`   | `File` | はい |

**curlの例**

```bash
curl -X POST \
  https://backup-[Project name]-[Environment].lfr.cloud/backup/upload \
  -H 'Content-Type: multipart/form-data' \
  -F 'database=@/my-folder/database.gz' \
  -F 'volume=@/my-folder/volume.tgz' \
  -u user@domain.com:password
```

## 関連トピック

* [バックアップ・サービスの概要](./backup-service-overview.md) 
* [バックアップからのデータ復元](./restoring-data-from-a-backup.md) 
* [データベースサービス (MySQL)](../database-service/database-service.md) 
