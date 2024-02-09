# バックアップサービスの概要

プロジェクトのデータを守るためには、定期的にバックアップを取ることが重要です。 Liferay Cloudのバックアップサービスでは、環境データの反復を保存し、必要に応じて環境の復元に使用できます。 これらのバックアップには、Liferay DXP Databaseと`[LIFERAY_HOME]/data`フォルダの完全な内容の両方が含まれます。

![The backup service is one of several services available in Liferay Cloud.](./backup-service-overview/images/01.png)

どの環境のバックアップページからでも、バックアップの作成、保持されたバックアップの表示またはダウンロード、そしてバックアップから環境を復元することができます。

また、Liferay Cloudコンソールやバックアップサービスの`LCP.json`ファイルを使って、プロジェクトのニーズに合わせてバックアップサービスを設定することもできます。

詳細は、 [バックアップサービスの制限](../../reference/platform-limitations.md#backup-service) のセクションを参照してください。

## バックアップページ

どの環境のバックアップページからでも、バックアップサービスの情報や保持されているバックアップの確認、手動でバックアップを作成したりすることができます。

```{note}
バックアップ]ページは、バックアップサービスのバージョンが4.3.5より古い場合、本番環境でのみ使用できます。
```

以下の手順で、バックアップページにアクセスします。

1. どの環境からでも、左のメニューから **バックアップ** をクリックしてください。

![View backup history, create manual backups, and more from the Backups page in any environment.](./backup-service-overview/images/02.png)

ここから、以下の作業を行います。

* **バックアップ情報を見る** :選択した環境のバックアップサービス情報をすばやく表示できます。 これには、自動バックアップの頻度、バックアップの保持期間、次回のスケジュールされたバックアップ、最新の作成されたバックアップ、最も古い保持されたバックアップのタイムスタンプ情報が含まれます。
* **バックアップ履歴を見る** :選択した環境で保持されているバックアップの全リストを表示できます。 各エントリには、バックアップの名前、サイズ、タイプ（`Auto`、`Manual`、`Uploaded`）、作成時刻が表示されます。 赤色のバックアップアイコンは、バックアップに失敗したことを示します。 その横には、「バックアップに失敗しました」というメッセージと、サポートに連絡するためのリンクがあります。
* **手動バックアップの作成** ：選択した環境のバックアップを手動で作成できます。 詳しくは [手動バックアップの作成](#creating-a-manual-backup) をご覧ください。

```{note}
バックアップのタイムスタンプはブラウザのロケーションに基づいて自動的に表示され、バックアップスケジュールはUTC±00タイムゾーンに基づいて表示されます。
```

環境管理者は、［バックアップ］ページからアクションボタン(⋮)にアクセスし、保持しているバックアップのダウンロードや環境の復元を行うことができます。

![Administrators can download backups or restore an environment from the Backups page.](./backup-service-overview/images/03.png)

また、画面上部にある2つのセレクタから、ステータス（失敗または成功）でバックアップのリストをフィルタリングしたり、関連するディザスタリカバリ（`dr`）環境（現在の環境に設定されている場合）のバックアップを表示したりすることもできます。

![View Disaster Recovery backups or filter by backup status from the drop-down menus.](./backup-service-overview/images/04.png)

これらのアクションの詳細と実行方法については、 [バックアップのダウンロードとアップロード](./downloading-and-uploading-backups.md) および [バックアップからのデータの復元](./restoring-data-from-a-backup.md) を参照してください。

## 手動バックアップの作成

Backups ページから手動で環境をバックアップするには、 **Backup Now** をクリックします。 このプロセスは、サービスの規模に応じて数分から数時間かかります。

起動すると、バックアップサービスのアイコンはバックアップ中であることを示し、画面上部にメッセージが表示されます。 新しいバックアップは、［Backup History］にも表示されます。

![The backup service icon and a message at the top of the screen indicate a backup is in progress.](./backup-service-overview/images/05.png)

```{warning}
 Liferayインスタンス上でデータが能動的に変更されている間に作成されたバックアップは、一貫性のないデータを作成する危険性があります。 完全に一貫したバックアップを行うためには、データベース管理者と調整して、手動バックアップを行っている間は更新をフリーズするようにしてください。
```

ログを見る_をクリックすると、ログページにリダイレクトされ、バックアップのステージをリアルタイムで見ることができます。 バックアップサービスのページの **Logs** タブでバックアップログを見ることもできます。

サービスログの閲覧については、 [ログ管理](../../support-and-troubleshooting/reading-liferay-cloud-service-logs.md) を参照してください。

## バックアップサービスの設定

Liferay Cloudコンソールまたはバックアップサービスの`LCP.json`ファイルを使用して、プロジェクトのニーズに合わせてバックアップサービスを設定することができます。

バックアップサービスの設定に使用できる変数の一覧については、 [環境変数のリファレンス](#environment-variables-reference) を参照してください。

```{important}
バックアップサービスが再設定されるたびに、バックアップサービスは再起動し、何分間かリクエストの受信を停止したり、設定によって動作が異なる場合があります。
```

### Liferay Cloudコンソールによるバックアップサービスの設定

以下の手順で、Liferay Cloudコンソールを使ってバックアップサービスを設定します。

1. バックアップサービスが導入されている環境に移動します。

1. 環境メニューの **サービス** をクリックします。

1. **バックアップ** サービスをクリックする。

1. **環境変数** タブをクリックする。

   ![Navigate to the backup service's variables tab in your environment.](./backup-service-overview/images/06.png)

   また、環境の **Overview** ページで **Backup** をクリックすると、バックアップサービスのページにアクセスできます。

1. [Environment Variables Reference](#environment-variables-reference) のリストから変数を追加して、バックアップサービスを設定します。

1. **Save Changes** をクリックしてください。

通常の環境変数とは別に、Liferay Cloud コンソールから **Secret** 変数を設定することもできます。 詳しくは、 [シークレットで安全な環境変数を管理](../../tuning-security-settings/managing-secure-environment-variables-with-secrets.md) をご覧ください。

### バックアップ `LCP.json` ファイルを使ったバックアップサービスの設定

以下の手順に従って、`LCP.json`ファイルからバックアップサービスを設定してください：

1. テキストエディタを使用して、以下のパスにあるバックアップ `LCP.json` ファイルを開きます：`{your_project_name}/backup/LCP.json`.

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

`LCP.json`ファイルを使った環境サービスの設定については [LCP.jsonによるコンフィギュレーション](../../reference/configuration-via-lcp-json.md) を参照してください。

## 自動バックアップとクリーンアップのスケジューリング

バックアップの作成と削除の頻度を決定することは、データの保護とストレージの最適化に役立ちます。

```{warning}
Liferayインスタンスでデータがアクティブに変更されている間にバックアップを作成すると、データの不整合が発生する危険性があります。 データの不整合のリスクを軽減するために、アクティビティが減少している時間帯にキックオフするようにバックアップスケジュールを設定します。 完全に一貫性のあるバックアップを確保するには、 [手動バックアップ](./backup-service-overview.md#creating-a-manual-backup) を実行している間、更新をフリーズするようにデータベース管理者と調整し、クリーンアップスケジュール (`LCP_BACKUP_CLEANUP_SCHEDULE`) とは *異なる時間* に実行するように設定します。
```

自動バックアップのスケジュールを設定するには、2つの方法があります。

* [コンソール経由](#configuring-the-schedule-via-the-console)
* [環境変数の使用](#configuring-the-schedule-using-environment-variables)

### コンソールでスケジュールを設定する

1. 選択した環境からBackupサービスに移動し、 **Configuration** タブをクリックします。

   ![Click the Configuration tab to access the backup schedule configuration.](./backup-service-overview/images/07.png)

   ```{note}
   この環境にバックアップがない場合、バックアップ・サービス・ページの*Set up a regular backup*リンクをクリックすると、Configurationタブも表示されます。
   ```

1. **Create backups**（バックアップの作成）ドロップダウンメニューで、利用可能なオプションから希望のバックアップ頻度を選択します。 以下のオプションがあります：

   * **毎日** ：バックアップは毎日作成されます。作成される時間を設定できます（UTC±00タイムゾーン）。

   * **毎週** バックアップが作成されます：バックアップは毎週作成されます。曜日と作成時間を設定できます（UTC±00タイムゾーン）。

   * **高度な** ： [cron schedule](https://crontab.guru/) の値を設定して、より複雑な頻度を設定できます。

   * **手動** 自動バックアップは作成されません。 すべてのバックアップを手動で作成する必要があります。

   ![If you choose to create a weekly schedule, you can then select the day of the week and time.](./backup-service-overview/images/08.png)

1. より古いバックアップを削除する]セレクタから希望の保存期間を選択します。

1. **変更を保存** をクリックします。

バックアップサービスが再起動し、サービスが完全に再起動した時点で変更内容が適用されます。

### 環境変数でスケジュールを設定する

バックアップの作成と削除のタイミングをカスタマイズするには、環境ごとに以下の変数を使用します：

* **自動バックアップ** ：自動バックアップの頻度を設定するために、`LCP_BACKUP_CREATE_SCHEDULE`変数に [cron scheduling](https://crontab.guru/) 。
* **自動クリーンアップ** ：自動バックアップ・クリーンアップの頻度を設定するために、 [cron scheduling](https://crontab.guru/) 値で`LCP_BACKUP_CLEANUP_SCHEDULE`変数を追加します。
* **保持期間** ：`LCP_BACKUP_RETENTION_PERIOD`変数に数値（1～30）を追加して、自動クリーンアップで削除されるまでのバックアップ保持日数を設定します。

```{note}
標準および非標準 [cronスケジューリング構文](https://crontab.guru/) 、いずれもUTC±00タイムゾーンに基づいている。 非標準のcron構文を使用する場合、自動バックアップとクリーンアップは指定された値の先頭で実行されます。 例えば、`@daily`は毎日UTCの00:00にバックアップを実行します。
```

これらの環境変数を使用するには、 [Liferay Cloud コンソール](../../reference/defining-environment-variables.md#defining-environment-variables-via-the-liferay-cloud-console) （Backup サービス内）で設定するか、 [プロジェクトリポジトリの `backup/LCP.json` ファイル](../../reference/defining-environment-variables.md#defining-environment-variables-via-lcp-json) で設定し、Backup サービスをあなたの環境にデプロイします。

```{warning}
Liferay Cloudのコンソールで環境変数を設定し、後で`backup/LCP.json`に異なる設定をしてリポジトリからBackupサービスをデプロイした場合、リポジトリの設定はコンソールで設定した環境変数を上書きします。
```

以下の`backup/LCP.json`の例は、12時間ごと（つまりUTCの00:00と12:00）にバックアップを作成し、30日以上前のバックアップを削除する月次クリーンアップを実行する：

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

| 名前                                              | デフォルト値                                             | 説明                                                                                                                                                                                                |
| :---------------------------------------------- | :------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `LCP_BACKUP_CLEANUP_SCHEDULE`                   | 0 1 * *** | この変数は、 [cron scheduling syntax](https://crontab.guru/) を使って、自動クリーンアップをスケジュールします。 クリーンアップでは、バックアップ保持期間を超えたバックアップをすべて削除します。 これは `LCP_BACKUP_CREATE_SCHEDULE` と競合してはならない。                  |
| `LCP_BACKUP_CREATE_SCHEDULE`                    | `[5-55][0-1] * * *` | この変数は、 [cron scheduling syntax](https://crontab.guru/) . これは `LCP_BACKUP_CLEANUP_SCHEDULE` と競合してはならない。 バックアップサービスのバージョン `3.2.1` 以降では、値が指定されない場合、ランダムなデフォルト値が作成される。                                                     |
| `LCP_BACKUP_RESTORE_SCHEDULE`                   | 該当なし                                               | この変数は、 [cron scheduling syntax](https://crontab.guru/) を使って、自動復元をスケジュールします。 [ディザスタリカバリ環境](../../support-and-troubleshooting/configuring-cross-region-disaster-recovery.md) での使用を目的としています。 |
| `LCP_BACKUP_RESTORE_STRATEGY`                   | `OVERWRITE`                                        | デフォルトでは、既存のインスタンスは直ちに停止されます。 既存のインスタンスを停止する前に新しいデータベースインスタンスとボリュームを起動するには、`PREPARE_AND_SWAP`ストラテジーを使用する。                                                                                          |
| `LCP_BACKUP_RETENTION_PERIOD`                   | `30`                                               | この変数は、スケジュールされたクリーンアップでどのバックアップを削除するかを決定します。 クリーンアップによって削除される前にバックアップを保持する日数を選択します。 最大保存期間は30日です。                                                                                                 |
| `LCP_DATABASE_SERVICE`                          | `database`                                         | データベースサービスのID。                                                                                                                                                                                    |
| `LCP_DBNAME`                                    | `lportal`                                          | データベース名。                                                                                                                                                                                          |
| `LCP_DEBUG_LOG`                                 | `false`                                            | Backupサービスのデバッグログを有効にします。 `true`または`false`に設定する。                                                                                                                                                  |
| `LCP_GCP_STORAGE_UPLOAD_MAX_RETRIES`            | `6`                                                | バックアップのアップロードに失敗した場合に再試行する最大回数です。 この制限を超えると、アップロードは中断され、完全にやり直しになることがあります（最大2回まで）。                                                                                                                |
| `LCP_GCP_STORAGE_UPLOAD_MAX_RETRY_DELAY`        | `64`                                               | `LCP_GCP_STORAGE_UPLOAD_MAX_RETRIES`で設定された再試行間の遅延（秒）。                                                                                                                                        |
| `LCP_GCP_STORAGE_UPLOAD_RETRY_DELAY_MULTIPLIER` | `3`                                                | 再試行するたびに、`LCP_GCP_STORAGE_UPLOAD_MAX_RETRY_DELAY`で設定された遅延を乗算します。                                                                                                                                  |
| `LCP_GCP_STORAGE_UPLOAD_TIMEOUT`                | `6000`                                             | バックアップアップロードリクエスト（または再試行）間の最大遅延時間（秒）。 これは `LCP_GCP_STORAGE_UPLOAD_RETRY_DELAY_MULTIPLIER` が遅延時間を増加させることができる上限を設定します。                                                                              |
| `LCP_MASTER_USER_NAME`                          | `dxpcloud`                                         | マスターユーザー名。                                                                                                                                                                                        |
| `LCP_MASTER_USER_PASSWORD`                      | `LCP_PROJECT_MASTER_TOKEN`                         | マスターパスワード。                                                                                                                                                                                        |

## 関連トピック

* [バックアップのダウンロードとアップロード](./downloading-and-uploading-backups.md)
* [バックアップからのデータ復元](./restoring-data-from-a-backup.md)
* [LCP.json による設定](../../reference/configuration-via-lcp-json.md)
* [データベースサービス (MySQL)](../database-service/database-service.md)
