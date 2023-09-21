# バックアップサービスの概要

プロジェクトのデータを守るためには、定期的にバックアップを取ることが重要です。 Liferay Cloudのバックアップサービスでは、環境データの反復を保存し、必要に応じて環境の復元に使用できます。 これらのバックアップには、Liferay DXPデータベースと`[LIFERAY_HOME]/data`フォルダのすべてのコンテンツの両方が含まれます。

![バックアップサービスは、Liferay Cloudで利用可能ないくつかのサービスのうちの1つです。](./backup-service-overview/images/01.png)

どの環境のバックアップページからでも、バックアップの作成、保持されたバックアップの表示またはダウンロード、そしてバックアップから環境を復元することができます。

また、Liferay Cloudコンソールや、バックアップサービスの`LCP.json`ファイルから、プロジェクトのニーズに合わせてバックアップサービスを設定することができます。

詳細は、 [バックアップサービスの制限](../../reference/platform-limitations.md#backup-service) のセクションを参照してください。

## バックアップページ

どの環境のバックアップページからでも、バックアップサービスの情報や保持されているバックアップの確認、手動でバックアップを作成したりすることができます。

```{note}
バックアップページは、バックアップサービスのバージョンが4.3.5よりも古い場合、実稼働環境でのみ利用できます。
```

以下の手順で、バックアップページにアクセスします。

1. どの環境からでもいいので、左のメニューにある ［**Backups**］ をクリックします。

![どの環境でも、バックアップページからバックアップ履歴を表示したり、手動バックアップを作成したりできます。](./backup-service-overview/images/02.png)

ここから、以下の作業を行います。

* **バックアップ情報の表示** ：選択した環境のバックアップサービス情報をすばやく表示できます。 これには、自動バックアップの頻度、バックアップの保持期間、次回のスケジュールされたバックアップ、最新の作成されたバックアップ、最も古い保持されたバックアップのタイムスタンプ情報が含まれます。
* **バックアップ履歴の表示** ：選択した環境で保持されているバックアップの完全なリストを表示できます。 各エントリには、バックアップの名前、サイズ、タイプ（`Auto`、`Manual`、または`Uploaded`）および作成時刻が表示されます。 赤色のバックアップアイコンは、バックアップに失敗したことを示します。 その横には、 **Backup failed** というメッセージとサポートに連絡するためのリンクが表示されます。
* **手動バックアップの作成** ：選択した環境のバックアップを手動で作成できます。 詳しくは [手動バックアップの作成](#creating-a-manual-backup) をご覧ください。

```{note}
バックアップのタイムスタンプはブラウザの位置情報に基づいて自動的に表示され、バックアップのスケジュールはUTC±00のタイムゾーンに基づいて表示されます。
```

環境管理者は、［バックアップ］ページからアクションボタン(⋮)にアクセスし、保持しているバックアップのダウンロードや環境の復元を行うことができます。

![管理者は、バックアップページからバックアップをダウンロードしたり、環境を復元したりできます。](./backup-service-overview/images/03.png)

また、画面上部の2つのセレクターから、バックアップのリストをステータス（失敗または成功）でフィルタリングしたり、関連するディザスタリカバリ（`dr`）環境（現在の環境に設定されている場合）からバックアップを表示したりすることもできます。

![ディザスターリカバリーのバックアップを表示したり、ドロップダウンメニューからバックアップのステータスでフィルタリングしたりすることができます。](./backup-service-overview/images/04.png)

これらのアクションの詳細と実行方法については、 [バックアップのダウンロードとアップロード](./downloading-and-uploading-backups.md) および [バックアップからのデータの復元](./restoring-data-from-a-backup.md)を参照してください。

## 手動バックアップの作成

［Backups］ページから環境を手動でバックアップするには、 ［**Backup Now**］ をクリックします。 このプロセスは、サービスの規模に応じて数分から数時間かかります。

起動すると、バックアップサービスのアイコンはバックアップ中であることを示し、画面上部にメッセージが表示されます。 新しいバックアップは、［Backup History］にも表示されます。

![画面上部のバックアップサービスのアイコンとメッセージは、バックアップ中であることを示します。](./backup-service-overview/images/05.png)

```{warning}
 Liferayインスタンス上でデータが能動的に変更されている間に作成されたバックアップは、一貫性のないデータを作成する危険性があります。 完全に一貫したバックアップを行うためには、データベース管理者と調整して、手動バックアップを行っている間は更新をフリーズするようにしてください。
```

［**View logs**］ をクリックすると［Logs］ページにリダイレクトされ、リアルタイムでバックアップステージを確認することができます。 また、バックアップのログは、バックアップサービスのページの ［**Logs**］ タブで確認できます。

サービスログの閲覧については、 [ログ管理](../../troubleshooting/reading-liferay-cloud-service-logs.md)を参照してください。

## バックアップサービスの設定

Liferay Cloudコンソールまたはバックアップサービスの`LCP.json`ファイルから、プロジェクトのニーズに合わせてバックアップサービスを設定することができます。

バックアップサービスの設定に使用できる変数の一覧については、 [環境変数のリファレンス](#environment-variables-reference) を参照してください。

```{important}
バックアップサービスを再設定するたびに、バックアップサービスが再起動し、数分間リクエストを受け取らなくなったり、設定によっては挙動が異なる場合があります。
```

### Liferay Cloudコンソールによるバックアップサービスの設定

以下の手順で、Liferay Cloudコンソールを使ってバックアップサービスを設定します。

1. バックアップサービスが導入されている環境に移動します。

1. 環境メニューの ［**Services**］ をクリックします。

1. ［**Backup**］ サービスをクリックします。

1. ［**Environment Variables**］ タブをクリックします。

   ![ご使用の環境で、バックアップサービスの変数タブに移動します。](./backup-service-overview/images/06.png)

   また、環境 ［**概要**］ ページの ［**バックアップ**］ をクリックすると、バックアップサービスのページにアクセスできます。

1. [Environment Variables Reference](#environment-variables-reference) のリストから変数を追加して、バックアップサービスを設定します。

1. ［**Save Changes**］ をクリックします。

通常の環境変数とは別に、Liferay Cloudコンソールから **シークレット** 変数を設定することができます。 詳しくは、[シークレットで安全な環境変数を管理](../../infrastructure-and-operations/security/managing-secure-environment-variables-with-secrets.md)をご覧ください。

### バックアップ`LCP.json`ファイルによるバックアップサービスの設定

以下の手順で、バックアップサービスの`LCP.json`ファイルを介してバックアップサービスを設定します。

1. テキストエディターを使って、以下のパスにあるバックアップ`LCP.json`ファイルを開きます。 `/{your_project_name}/backup/LCP.json`

1. 環境セクションまでスクロールします。

   ```
    "env": {
      "LCP_BACKUP_FOLDER": "/opt/liferay/data",
      "LCP_DATABASE_SERVICE": "mydatabase",
      "LCP_MASTER_USER_PASSWORD": "mypassword"
    },
   ```

1. [Environment Variables Reference](#environment-variables-reference) のリストから変数を追加して、バックアップサービスを設定します。

1. ファイルを保存してプロジェクトにデプロイすると、設定が反映されます。

環境サービスの`LCP.json`ファイルによる設定の詳細については、[LCP.jsonによる設定](../../reference/configuration-via-lcp-json.md)を参照してください。

## 自動バックアップとクリーンアップのスケジューリング

バックアップの作成と削除の頻度を決定することは、データの保護とストレージの最適化に役立ちます。 **本番環境のみスケジュールされたバックアップを行うことができます。**

```{warning}
Liferayインスタンス上でデータが能動的に変更されている間に作成されたバックアップは、一貫性のないデータを作成する危険性があります。 データの不整合のリスクを軽減するために、アクティビティが少ない時間帯にバックアップを作成するように、バックアップスケジュールを設定します。 完全に一貫したバックアップを行うためには、データベース管理者と調整して、 [手動バックアップ](./backup-service-overview.md#creating-a-manual-backup) を行っている間は更新をフリーズするようにしてください。
```

自動バックアップのスケジュールを設定するには、2つの方法があります。

* [コンソール経由](#configuring-the-schedule-via-the-console)
* [環境変数の利用](#configuring-the-schedule-using-environment-variables)

### コンソールでスケジュールを設定する

1. 選択した環境から、［Backup］サービスに移動し、 ［**Configuration**］ タブをクリックします。

   ![［設定］タブをクリックして、バックアップスケジュールの設定にアクセスします。](./backup-service-overview/images/07.png)

   ```{note}
   この環境にバックアップがない場合、バックアップサービスのページで*Set up a regular backup*のリンクをクリックすると、［Configuration］タブも表示されます。
   ```

1. ［**Create backups**］ ドロップダウンメニューで、利用可能なオプションから必要なバックアップの頻度を選択します。 以下のオプションがあります：

   * **Daily** ：毎日バックアップが作成され、作成時刻を設定できます（UTC±00のタイムゾーン）。

   * **Weekly** ：毎週バックアップが作成され、曜日と作成時刻を設定できます（UTC±00タイムゾーン）。

   * **Advanced** ： [cron schedule](https://crontab.guru/) valueを設定することで、より複雑な頻度を設定することができます。

   * **Manually** ：自動バックアップは作成されません。 すべてのバックアップを手動で作成する必要があります。

   ![週間スケジュールの作成を選択した場合は、曜日と時間を選択できます。](./backup-service-overview/images/08.png)

1. ［**Remove backups older than**］ セレクターから目的の保存期間を選択します。

1. ［**変更を保存**］ クリックします。

バックアップサービスが再起動し、サービスが完全に再起動した時点で変更内容が適用されます。

### 環境変数でスケジュールを設定する

バックアップの作成と削除のタイミングをカスタマイズするには、環境ごとに以下の変数を使用します：

* **自動バックアップ** : 自動バックアップの頻度を設定するために、 `LCP_BACKUP_CREATE_SCHEDULE` 変数に [cron scheduling](https://crontab.guru/) valueを追加します。
* **自動化されたクリーンアップ** : 自動化されたバックアップクリーンアップの頻度を設定するために、`LCP_BACKUP_CLEANUP_SCHEDULE`変数に [cron scheduling](https://crontab.guru/) valueを追加します。
* **保存期間** ：`LCP_BACKUP_RETENTION_PERIOD`変数に数値（1～30の間）を追加して、自動クリーンアップで削除される前にバックアップを保持する日数を設定します。

```{note}
標準および非標準の [cron scheduling syntax](https://crontab.guru/) は、UTC±00タイムゾーンに基づいています。 非標準のcron構文を使用する場合、自動バックアップとクリーンアップは指定された値の先頭で実行されます。 例えば、`@daily`は毎日UTCの00:00にバックアップを実行します。
```

これらの環境変数を使用するには、 [Liferay Cloudコンソール](../../reference/defining-environment-variables.md#defining-environment-variables-via-the-liferay-cloud-console) (Backup サービス内) で設定するか、 [プロジェクトリポジトリの `backup/LCP.json`ファイル](../../reference/defining-environment-variables.md#defining-environment-variables-via-lcp-json) に設定しバックアップサービスを自分の環境にデプロイすることです。

```{warning}
Liferay Cloudコンソールから環境変数を設定し、後で`backup/LCP.json`に異なる設定をしてリポジトリからバックアップサービスをデプロイすると、リポジトリからの設定によりコンソールで設定された環境変数が上書きされます。
```

次の`backup/LCP.json`の例では、12時間ごと（つまりUTCの00:00と12:00）にバックアップを作成し、30日以上前のバックアップを削除するクリーンアップを毎月行います。

```
 "env": {
   "LCP_BACKUP_FOLDER": "/opt/liferay/data",
   "LCP_DATABASE_SERVICE": "mydatabase",
   "LCP_MASTER_USER_PASSWORD": "mypassword",
   "LCP_BACKUP_CREATE_SCHEDULE": "0 0,12 * * *",
   "LCP_BACKUP_CLEANUP_SCHEDULE": "@monthly",
   "LCP_BACKUP_RETENTION_PERIOD": "30"
 },
```

## 環境変数リファレンス

| 名前                                              | デフォルト値                     | 説明                                                                                                                                                                          |
|:----------------------------------------------- |:-------------------------- |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LCP_BACKUP_CLEANUP_SCHEDULE`                   | 0 1 * * * | この変数は、 [cron scheduling syntax](https://crontab.guru/) を使って、自動クリーンアップをスケジュールします。 クリーンアップでは、バックアップ保持期間を超えたバックアップをすべて削除します。                                                    |
| `LCP_BACKUP_CREATE_SCHEDULE`                    | `[5-55][0-1] * * *`        | この変数は、 [cron scheduling syntax](https://crontab.guru/) を使って、自動バックアップをスケジュールします。 バックアップサービスのバージョン`3.2.1`以降では、値が指定されていない場合、ランダムなデフォルトが作成されます。                                  |
| `LCP_BACKUP_RESTORE_SCHEDULE`                   | 該当なし                       | この変数は、 [cron scheduling syntax](https://crontab.guru/) を使って、自動復元をスケジュールします。 [ディザスタリカバリ環境](../../troubleshooting/configuring-cross-region-disaster-recovery.md)での使用を目的としています。 |
| `LCP_BACKUP_RESTORE_STRATEGY`                   | `OVERWRITE`                | デフォルトでは、既存のインスタンスは直ちに停止されます。 既存のインスタンスを停止する前に、新しいデータベースインスタンスとボリュームを起動するには、 `PREPARE_AND_SWAP` 戦略を使用します。                                                                    |
| `LCP_BACKUP_RETENTION_PERIOD`                   | `30`                       | この変数は、スケジュールされたクリーンアップでどのバックアップを削除するかを決定します。 クリーンアップによって削除される前にバックアップを保持する日数を選択します。 最大保存期間は30日です。                                                                           |
| `LCP_DATABASE_SERVICE`                          | `database`                 | データベースサービスのID。                                                                                                                                                              |
| `LCP_DBNAME`                                    | `lportal`                  | データベース名。                                                                                                                                                                    |
| `LCP_DEBUG_LOG`                                 | `false`                    | Backupサービスのデバッグログを有効にします。 `true` または `false`に設定します。                                                                                                                         |
| `LCP_GCP_STORAGE_UPLOAD_MAX_RETRIES`            | `6`                        | バックアップのアップロードに失敗した場合に再試行する最大回数です。 この制限を超えると、アップロードは中断され、完全にやり直しになることがあります（最大2回まで）。                                                                                          |
| `LCP_GCP_STORAGE_UPLOAD_MAX_RETRY_DELAY`        | `64`                       | `LCP_GCP_STORAGE_UPLOAD_MAX_RETRIES`で設定された各リトライ間の遅延時間（秒単位）。                                                                                                                 |
| `LCP_GCP_STORAGE_UPLOAD_RETRY_DELAY_MULTIPLIER` | `3`                        | 以降の再試行ごとに`LCP_GCP_STORAGE_UPLOAD_MAX_RETRY_DELAY`で設定された遅延時間を乗算します。                                                                                                          |
| `LCP_GCP_STORAGE_UPLOAD_TIMEOUT`                | `6000`                     | バックアップアップロードリクエスト（または再試行）間の最大遅延時間（秒）。 `LCP_GCP_STORAGE_UPLOAD_RETRY_DELAY_MULTIPLIER` が遅延時間を増加できる量の上限を設定します。                                                                |
| `LCP_MASTER_USER_NAME`                          | `dxpcloud`                 | マスターユーザー名。                                                                                                                                                                  |
| `LCP_MASTER_USER_PASSWORD`                      | `LCP_PROJECT_MASTER_TOKEN` | マスターパスワード。                                                                                                                                                                  |

## 関連トピック

* [バックアップのダウンロードとアップロード](./downloading-and-uploading-backups.md)
* [バックアップページからのデータの復元](./restoring-data-from-a-backup.md)
* [LCP.jsonによる設定](../../reference/configuration-via-lcp-json.md)
* [データベースサービス(MySQL)](../database-service/database-service.md)
