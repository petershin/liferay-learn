# バックアップページからのデータの復元

カイルは、サイトのデータに影響を与える可能性のある変更のテストを始めたいと考えている。

ここでは、テスト中に失われたデータを復元するために、手動バックアップを復元します。

## 本番環境からの手動バックアップの作成

データの損失や不安定性を引き起こす可能性のある変更をテストする前に、Liferayインスタンスがバックアップされていることを常に確認する必要があります。

テストを開始する前に、手動でバックアップを作成してください。

1. Liferay Cloud コンソールで本番環境に移動します。

1. 画面左側の **Backups** をクリックします。

1. **Backup Now** をクリックして手動バックアップを作成します。

![この練習には手動バックアップを使用する。](./restoring-data-from-a-backup/images/01.png)

バックアップサービスが利用できず、バックアップが完了するまでページ上のボタンが無効になります。

## バックアップをUATにリストアする

本番環境からのバックアップが終了したら、UAT環境にリストアする。

1. リストの一番上にある手動バックアップの横にある **アクション**( ![Actions icon](../../images/icon-actions.png) ) をクリックし、 **リストア先... をクリックします。**

   ![必要なバックアップを選択し、Restore to...をクリックします。](./restoring-data-from-a-backup/images/02.png)

1. Select Environment］ドロップダウンメニューから、UAT環境を選択します。

1. チェックボックスをクリックして、バックアップリストアの影響を確認します。

   ![バックアップ・リストアの影響を確認すると、「環境にリストア」ボタンが表示されます。](./restoring-data-from-a-backup/images/03.png)

1. **Restore to Environment** をクリックする。

バックアップがリストアされる間、UAT環境のサービスは一時的に利用できなくなります。

## 災害をシミュレートする

UATのLiferayインスタンスからデフォルトのホームページを削除して災害をシミュレートします。

1. UAT環境に移動します。

1. ページ上部の **Visit Site** をクリックし、UAT Liferay インスタンスにアクセスします。 以前にログインしてセッションの有効期限が切れている場合は、 [、プロジェクトの認証情報（](./deploying-and-promoting-to-production.md#accessing-your-uat-environment) ）を使用して認証します。

1. [管理者アカウントの概要](https://learn.liferay.com/web/guest/w/dxp/getting-started/introduction-to-the-admin-account) としてログインする。

1. 画面左側のナビゲーション・メニューで、 **Site Builder** &rarr; **Pages** をクリックします。

1. ホームページの横にある「アクション」メニュー( ![Actions icon](../../images/icon-actions.png) )を開き、 **削除** をクリックします。

   ![ページメニューからホームページを削除する。](./restoring-data-from-a-backup/images/04.png)

   削除を確認するポップアップダイアログが表示されます。

1. ![ページメニューからホームページを削除する。](./restoring-data-from-a-backup/images/04.png)

ホームページは削除され、削除を取り消すことはできない。 ホームページがなくなったため、画面右上の「**Home**」ボタンも消える。

## バックアップを復元する

カイルはページを削除した後、削除すべきではなかったことに気づく。 カイルがLiferayインスタンスにアクセスする前に取ったバックアップを復元することで、UATのデータを回復できるようにします。

1. Liferay Cloud コンソールで本番環境に移動します。

1. **バックアップ** をクリックする。

1. 手動バックアップの横にある「アクション」メニュー( ![Actions icon](../../images/icon-actions.png) )をクリックし、「**Restore to...」をクリックします。**

1. **Select environment** ドロップダウンメニューから、UAT環境を選択します。

1. 表示されるチェックボックスをクリックして、バックアップのリストアの影響を確認します。

1. **Restore to Environment** をクリックする。

バックアップを復元している間、UAT Liferayサービスが一時的に利用できません。 終了後、再度サイトにアクセスすると、ホームページが復元されていることを確認できる。

Next: [Liferay Cloud コンソールのシェル](./using-the-liferay-services-shell.md) を使って直接 Liferay データベースに問い合わせます。

## 関連コンセプト

* [バックアップサービスの概要](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/backup-service/backup-service-overview)
* [バックアップページからのデータの復元](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/backup-service/restoring-data-from-a-backup)
* [Liferay Cloudサービスへのログイン](https://learn.liferay.com/w/liferay-cloud/getting-started/logging-into-your-liferay-cloud-services)
