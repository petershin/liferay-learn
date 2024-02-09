# Liferay Cloud バージョン 5 の変更点

Liferay Cloud バージョン 5 は、いくつかの変更と新機能を備えています。

* [NginxによるModSecurityの機能](#modsecurity-capabilities-with-nginx)
* [地域持続性の向上](#improved-regional-persistence)
* [バックアップ・リストア戦略の準備と交換](#prepare-and-swap-backup-restore-strategy)
* [バックアップ・アップロード・リトライの設定](#backup-upload-retry-configuration)

## NginxによるModSecurityの機能

ModSecurityは、Webサーバーのバージョンが5.x.xのLiferay Cloudで利用可能なWebアプリケーションファイアウォールです。 事前に定義されたカスタムルールに照らし合わせて、Webサーバーに送信されたリクエストをリアルタイムで検査します。 このステップでは、XSSやSQLインジェクションなどの典型的なWebアプリケーションのL7攻撃を防止します。

詳しくは、 [Enabling ModSecurity](../tuning-security-settings/web-application-firewall.md) をご覧ください。

## 地域持続性の向上

Liferay Cloudのデータベースとバックアップサービスは、バージョン5.x.xで信頼性が向上しています。 アップグレードすると、サービスが更新され、向上したリージョナルパーシスタンスの恩恵を受けることができます。 これにより、ワークロードに対するパフォーマンスが向上し、フェイルオーバーのレイテンシーを最小化することができます。

## バックアップ・リストア戦略の準備とスワップ

バックアップからデータを復元すると、データベースサービスおよび依存するサービス（Liferayを含む）がダウンします。 ただし、バックアップ サービス バージョン 5.x.x では、リストア動作は、最初に別の新しいデータベース インスタンスとボリュームを開始し、準備ができると新しいインスタンスに切り替わります。 これにより、お客様のインスタンスのダウンタイムを最小限に抑えることができます。

[`LCP_BACKUP_RESTORE_STRATEGY` 環境変数](../platform-services/backup-service/backup-service-overview.md#environment-variables-reference) 'の値を `PREPARE_AND_SWAP` に設定すると、このストラテジーを使用することができます。

## バックアップ・アップロード・リトライの設定

バージョン5.x.xでは、バックアップアップロードの再試行回数とその間の遅延を細かく設定することができます。 詳しくは、 `LCP_GCP_STORAGE_UPLOAD_*` [Backup service environemnt variables](../platform-services/backup-service/backup-service-overview.md#environment-variables-reference) をご覧ください。
