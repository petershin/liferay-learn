# バックアップのダウンロードとアップロード

Liferay Cloud バックアップサービスは、環境のデータベースと Liferay インスタンスの `LIFERAY_HOME/data` フォルダーの全内容のバックアップを作成します。 このコンテンツはアーカイブファイル（それぞれ`.gz` と `.tgz` ）として保存されており、Liferay Cloud コンソールからダウンロードすることができます。

[ユーザーは、Liferay Cloud Console](#uploading-backups-via-the-console) を使用して、または [Backup APIs](#backup-service-apis) を使用して、環境のバックアップをダウンロードまたはアップロードすることもできます。

```{note}
バックアップページは、バックアップサービスのバージョンが4.3.5よりも古い場合、実稼働環境でのみ利用できます。
```

## コンソールによるバックアップのダウンロード

以下の手順で、選択した環境の ［**バックアップ**］ ページからバックアップをダウンロードします：

1. ダウンロードしたいバックアップの **Actions** ボタン( ⋮ )をクリックします。

1. ［**ダウンロード**］ をクリックします。

   ![ ［Actions］ ボタンをクリックして、［Download］ をクリックします。](./downloading-and-uploading-backups/images/01.png)

1. **Database**(`.gz`) または **Liferay**(`.tgz`) のファイルをクリックすると、ダウンロードが始まります。 これらのZIPアーカイブを合わせて、環境のバックアップとします。

    ```{note}
    バックアップサービスがまだバージョン `4.2` 以上にアップデートされていない場合、データベースボリュームは `.gz` ではなく `.tgz` アーカイブとしてダウンロードされます。
    ```

    ![クリックすると、データベースとLiferayのデータボリュームファイルをダウンロードできます。](./downloading-and-uploading-backups/images/02.png)

```{note}
選択した環境の管理者のみが、バックアップページからバックアップをダウンロードできます。
```

## コンソールによるバックアップのアップロード

```{warning}
Liferay Cloud では、データベースのテーブルとカラムの名前は大文字と小文字が区別されます。 データベースをアップロードする前に、テーブル名がパスカルケースであることを確認してください。 詳細は [Ensuring Correct Table Capitalization](../../migrating-to-liferay-cloud.md#ensuring-correct-table-capitalization) を参照してください。
```

また、 選択した環境の [**バックアップ**] ページから、プロジェクトにバックアップをアップロードすることもできます。

Liferay Cloudにバックアップをアップロードする前に、データベースダンプとドキュメントライブラリを別々のアーカイブに圧縮する必要があります。 オンプレミス環境での準備については、 [Preparing Database and Document Library for Upload](#preparing-the-database-and-document-library-for-upload) を参照してください。

```{warning}
アップロードが開始されると、アップロードが完了するまで、バックアップサービスは他のバックアップの生成やリストアに利用できません。
```

**バックアップ** のページから以下の手順を行います。

1. 画面上部の 「**バックアップをアップロード...」をクリックします。画面上部の** をクリックします。

1. バックアップのアップロードページで、該当する環境を展開し、データベースとドキュメントライブラリの両方の `［+］` アイコンをクリックしてアップロードします。

    ![アイコンをクリックすると、データベースとドキュメントライブラリの両方が.gz形式のアーカイブとしてアップロードされます。](./downloading-and-uploading-backups/images/03.png)

1. データベース・ダンプとドキュメント・ライブラリの両方がアップロードされたら、 ［**アップロードの開始**］ をクリックします。

Liferay Cloudは、アップロードしたファイルを使ってバックアップの生成を開始し、環境にリストアできるリストに追加します。 バックアップが生成されている間は、他のバックアップの生成や復元はできません。

バックアップが生成されると、ページに成功のメッセージが表示され、サービスが正常に動作するようになります。

![お使いの環境でバックアップのリストへの追加が完了すると、成功メッセージが表示されます。](./downloading-and-uploading-backups/images/04.png)

## バックアップサービスのAPI

バックアップサービスにはAPIが用意されており、バックアップのダウンロードやアップロードにも利用できます。 これらのAPIは、 `curl`のようなコマンドラインツールを使って呼び出すことができます。

### ホスト名の取得

バックアップAPIを呼び出すには、バックアップサービスのホスト名が必要です。 これは、 **サービス** のページにあります。

![サービス」ページから、バックアップサービスのホスト名を表示します。](./downloading-and-uploading-backups/images/05.png)

バックアップサービスのホスト名は、サービス名、プロジェクト名、環境名を組み合わせたものです。

この例で考えてみましょう。

* サービス名： `バックアップ`
* プロジェクト名： `lfrjoebloggs`
* 環境名： `prd`
* ホスト名： `backup-lfrjoebloggs-prd.lfr.cloud`

### 認証

ベーシック認証やユーザーアクセストークンを使って、リクエストを認証することができます。

なお、SSOが有効な場合は、トークン認証が必要です。 このトークンは、クッキー `access_token` から取得し、 `dxpcloud-authorization` ヘッダーで使用することができます。

以下は、upload APIでトークン認証を使用する例です。

```bash
curl -X POST \
  https://backup-<PROJECT-NAME>-<ENV>.lfr.cloud/backup/upload
  -H 'Content-Type: multipart/form-data' \
  -H 'dxpcloud-authorization.Bearer -H 'dxpcloud-authorization.Backup/upload' \ -H 'Content-Type: multipart/form-data' , dxpcloud-authorization:Bearer <USER_TOKEN>' ￭
  -F 'database=@/my-folder/database.gz' ￭
  -F 'volume=@/my-folder/volume.tgz'
```

```{note}
ヘッダー `dxpcloud-authorization` でユーザートークンを渡すことは、バックアップサービスのバージョン `3.2.0` 以降でのみ機能します。 以前のバージョンは、少なくとも `3.2.0` にアップグレードする必要があります。 それ以前のバージョンへのリクエストは、ヘッダ `Authorization.Bearer  ` を使用する必要があります。`Bearer <PROJECT_MASTER_TOKEN>`. プロジェクトマスタートークンは、Liferay Cloud コンソールの任意のシェルで `env | grep LCP_PROJECT_MASTER_TOKEN` コマンドを実行することで確認することができます。
```

### データベースAPIダウンロード

データベースをダウンロードするAPIには、 `.gz` ファイルを返すエンドポイントがあります。 `id` パラメータはバックアップIDを表しており、これは「バックアップ」ページで確認できます。 このIDは、2つのダッシュで区切られた3つの文字列で設定　されています（例： `dxpcloud-lqgqnewltbexuewymq-201910031723`）。

#### パラメーター

| 名前   | 種類    | 必須 |
|:---- |:----- |:-- |
| `id` | `文字列` | はい |

#### curlの例

```bash
curl -X GET \
  https://backup-<PROJECT-NAME>-<ENV>.lfr.cloud/backup/download/database/id \
  -u user@domain.com:password \
  --output database.gz
```

```{note}
バックアップサービスがまだバージョン `4.2` 以上にアップデートされていない場合、データベースボリュームは `.gz` ではなく `.tgz` アーカイブとしてダウンロードされます。
```

### Data Volume APIのダウンロード

データボリュームをダウンロードするAPIには、 `.tgz` ファイルを返すエンドポイントがあります。 `id` パラメータはバックアップIDを表しており、これは「バックアップ」ページで確認できます。 このIDは、2つのダッシュで区切られた3つの文字列で設定　されています（例： `dxpcloud-lqgqnewltbexuewymq-201910031723`）。

#### パラメーター

| 名前   | 種類    | 必須 |
|:---- |:----- |:-- |
| `id` | `文字列` | はい |

#### curlの例

```bash
curl -X GET \
  https://backup-<PROJECT-NAME>-<ENV>.lfr.cloud/backup/download/volume/id \
  -u user@domain.com:password \
  --output volume.tgz
```

### バックアップAPIをアップロードする

以下の手順で、upload backup API を使って Liferay Cloud にバックアップをアップロードします。

1. [データベースファイル](#creating-the-database-file) を作成します。

1. [ボリュームファイルの作成](#creating-the-volume-file) .

1. [データベースとボリュームのファイルを使って、](#invoking-the-backup-api) バックアップAPIを起動します。

アップロードAPIを使用する前に、データベースダンプとドキュメントライブラリを別々のアーカイブに圧縮する必要があります。 オンプレミス環境でのアップロードの準備については、 [データベースとドキュメント・ライブラリーのアップロードの準備](#preparing-the-database-and-document-library-for-upload) を参照してください。

#### Backup APIの起動

**パラメーター**

| 名前       | 種類     | 必須 |
|:-------- |:------ |:-- |
| `データベース` | `ファイル` | はい |
| `体積`     | `ファイル` | はい |

**curlの例**

```bash
curl -X POST \
  https://backup-<PROJECT-NAME>-<ENV>.lfr.cloud/backup/upload \
  -H 'Content-Type: multipart/form-data' \
  -F 'database=@/my-folder/database.gz' \
  -F 'volume=@/my-folder/volume.tgz' \
  -u user@domain.com:password。
```

## データベースとドキュメントライブラリのアップロード準備

環境のバックアップをLiferay Cloudにアップロードするには、その環境のデータベースとドキュメントライブラリを別々のアーカイブファイルとして用意する必要があります。

### データベースファイルの作成

MySQLダンプを作成し（ `.sql` スクリプトとして）、それを `.gz` アーカイブに圧縮するには、以下のコマンドを実行します。

```bash
mysqldump -uroot -ppassword --add-drop-database --databases lportal | gzip -c | cat > database.gz
```

```{note}
Backup サービスが少なくともバージョン `4.2` に更新されていない場合は、以下のコマンドを実行してアーカイブを `.tgz` ファイルに変換する必要があります。`tar zcvf database.tgz database.gz`. そして、出来上がった `.tgz` アーカイブをアップロードに使用します。
```

`データベース` および `add-drop-database` オプションは、バックアップの復元が正しく機能するために必要です。 また、 `/backup/download` APIを使用して、バックアップサービスがどのようにMySQLのダンプファイルを作成するかを確認することができます。

これらのオプションを指定した場合、作成されるダンプファイルには、create tableステートメントの直前に以下のコードが含まれます。

```sql
--
-- 現在のデータベースです。`lportal`
--

/*!40000 DROP DATABASE IF EXISTS `lportal`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lportal` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lportal`.CREATE DATABASE */ `lportal`.DEFAULT CHARACTER SET utf8 */ USE `lportal`.DATABASE */ `lportaute */ `lportal`.DATABASE */
```

### ボリュームファイルの作成

```{tip}
バックアップのアップロード時にLiferay Cloudのパーミッションが設定されていない場合、その後の環境へのバックアップの復元に時間がかかることがあります。 長いリストア時間を避けるために、`LIFERAY_HOME`フォルダに移動して、ドキュメントライブラリを圧縮する前に次のコマンドを実行してください。chown -R 1000:1000 data/document_library/`.
```

このコマンドを実行すると、データボリュームが圧縮されます。

```bash
cd $LIFERAY_HOME/data && tar -czvf volume.tgz document_library
```

## 関連トピック

* [バックアップサービスの概要](./backup-service-overview.md)
* [バックアップからのデータの復元](./restoring-data-from-a-backup.md)
* [データベースサービス(MySQL)](../database-service/database-service.md)
