# バックアップページからのデータの復元

プロジェクトの開発中には、データを復元したり、プロジェクトを以前の状態にロールバックする必要がある場合があります。 バックアップをある環境に復元しても、各サービスのデータは復元されますが、環境が使用しているビルドは変更 **されません** 。

また、カスタムSQLスクリプトを使用して、データ復元の一環としてデータベースの追加更新を行うこともできます。

バックアップからデータを復元すると、データベースサービスやそれに依存するサービス（Liferayを含む）がダウンします。 ただし、バックアップサービスのバージョンが `5.x.x`以上の場合は、デフォルトの `OVERWRITE`復元動作を`PREPARE_AND_SWAP`に変更することでダウンタイムを最小化することが可能です。 これにより、別の新しいデータベースインスタンスとボリュームが開始され、準備が整ったときにのみ新規インスタンスに切り替わります。 [`LCP_BACKUP_RESTORE_STRATEGY` 環境変数](./backup-service-overview.md#environment-variables-reference) に `PREPARE_AND_SWAP` を設定すると、このストラテジーを使用することができます。

バックアップページの詳細は、 [バックアップサービス](./backup-service-overview.md) および [バックアップのダウンロードとアップロード](./downloading-and-uploading-backups.md) を参照してください。

```{important}
選択した環境のAdminロールを持つユーザーのみが、Liferay Cloudコンソールを介して環境を手動で復元できます。
```

## バックアップページから環境を復元する

各環境の **バックアップ** ページには、最近取得されたすべてのバックアップ（自動および手動）のリストがあります。 このページから環境へバックアップを復元すると、各サービスが使用しているデータは復元されますが、各サービスが使用しているビルドやDockerイメージは変更 **されません** 。

```{warning}
復元するバックアップの `バックアップ` サービスのバージョンは、復元が正常に完了するように、復元前のターゲット環境と一致している必要があります。 Liferayの [以前のDXPバージョンにパッチを適用](https://learn.liferay.com/w/dxp/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier) も、データベーススキーマの不一致によるエラーを避けるために一致させる必要があります。 現在環境にデプロイされているものとは異なるビルドを必要とするバックアップを復元する場合は、復元を開始する前に、[適切なビルドをデプロイ](../../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)してください。
```

以下の手順で、バックアップから環境を復元します。

1. プロジェクトの選択した環境に移動します。

1. 画面左側の環境メニューにある［Backups］をクリックします。

1. プロジェクト環境の復元に使用したいバックアップの **アクション** ボタン（⋮）をクリックします。

1. ［**Restore to...**］ をクリックします。

   ![図1：アクションボタンをクリックして、「Restore To...」をクリックする。](./restoring-data-from-a-backup/images/01.png)

1. ドロップダウンの ［**Environment**］ メニューをクリックして、復元したい環境を選択します。

   ![図2：復元したい環境を選択する。](./restoring-data-from-a-backup/images/02.png)

   ```{note}
   管理者は、アクセスできる環境のみを復元できます。
   ```

1. 下に表示される **チェックボックス** をすべてクリックします。 復元を開始するボタンを有効にするには、これらのボックスをチェックする必要があります。

1. ［**Restore to Environment**］ をクリックして、復元処理を開始します。

   ![図3：すべてのチェックボックスをクリックして、復元を確認する。](./restoring-data-from-a-backup/images/03.png)

復元プロセス中に、ターゲット環境のサービスが再起動します。

バックアップサービスの **ログ** や、アクティビティページの **一般** セクションで、復元のステータスを追跡することができます。

## データ復元でのカスタムSQLスクリプトの適用

カスタムSQLスクリプトを使用して、通常のデータ復元でデータベースの追加更新を行うこともできます。 この方法では、別々に管理しているデータベースのバックアップにスクリプトを適用できるため、機密データのサニタイズに最適です。

```{note}
この機能を使用するには、バックアップサービスのバージョン3.0.7以降が必要です。
```

### SQLスクリプトの準備

SQLスクリプトでサポートされているフォーマットは以下の通りです。

* `.sql` は個々のスクリプトに使われます。
* `.zip`、`.tgz`、`.gz` は、圧縮ファイル内の複数のスクリプトに使用されます。

なお、スクリプトは実行時に英数字の順に実行されます。 SQLスクリプトは、実行するデータベースを正確に参照する必要があります（例えば、 `USE lportal;` または `lportal.User_`など）。

SQLスクリプトを適切な、環境固有の `backup/configs/{ENV}/scripts/` フォルダに入れます。

### データの復元の実行

SQLスクリプトの準備ができたら、以下の手順でカスタムSQLスクリプトをデータリストアに適用します。

1. [バックアップサービスをデプロイ](../../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) して、カスタムSQLスクリプトをオンラインに含めます。

1. 上記の [バックアップページからの環境の復元](#restoring-an-environment-from-the-backups-page) の手順に従ってください。

データベースが復元されると、バックアップ サービスの `scripts` フォルダにあるSQLスクリプトが実行されます。

```bash
Jun 20 14:46:41.795 build-39 [backup-57488f8b8-rjq4f] Running Script: SanitizeOrg.sql
Jun 20 14:46:41.970 build-39 [backup-57488f8b8-rjq4f] Running Script: SanitizeUsers.sql
```

## 関連トピック

* [バックアップサービス](./backup-service-overview.md)
* [バックアップのダウンロードとアップロード](./downloading-and-uploading-backups.md)
* [データベースサービス(MySQL)](../database-service/database-service.md)
