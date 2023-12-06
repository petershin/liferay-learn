# オートアップグレードによるアップグレード

インスタンスを起動する前に、ポータル・プロパティで **auto upgrade** を有効にすると、データベースを自動的にアップグレードできます。

```{important}
アップグレードする前に、**必ず**データベースと既存のインストールを[バックアップ](../../maintaining-a-liferay-installation/backing-up.md)してください。 バックアップコピーでアップグレードプロセスをテストすることをお勧めします。
```

## Tomcatバンドルによるアップグレード

1. [の準備と計画](../upgrade-basics.md#preparation-and-planning) のステップを確認し、出版物、カスタム開発、データベースの刈り込みなどの機能が考慮されていることを確認する。

1. [アップグレードに使用する予定の最新の Liferay-Tomcat バンドルを](../../installing-liferay/installing-a-liferay-tomcat-bundle.md#download) ダウンロードしてください。

1. バンドルをホストの場所に解凍します。

1. [新しいバンドルを初めて起動する](../../installing-liferay/running-liferay-for-the-first-time.md)。 セットアップウィザードが表示されます。

1. データベースセクションで、 **Change** をクリックし、Liferay インストールのデータベース設定を入力します。

   ![セットアップウィザードのデータベースセクションでデータベース設定を入力します。](./upgrading-via-auto-upgrade/images/01.png)

1. ［**Finish Configuration**］ をクリックします。 データベースの設定は、 [Liferay のホームフォルダ](../../reference/liferay-home.md)にある `portal-setup-wizard.properties` ファイルに保存されます。

1. 同じ Liferay のホームフォルダに `portal-ext.properties` ファイルを作成します。 設定オプションは、この [ポータルプロパティ](../../reference/portal-properties.md) ファイルで設定する。

1. ファイルを開き、 `upgrade.database.auto.run=true`を設定する。

1. (オプション) `upgrade.report.enabled=true` を設定して、 [アップグレードレポート](../reference/upgrade-report.md)を有効にします。

1. (オプション) `upgrade.log.context.enabled=true` を設定して、 [アップグレードログコンテキスト](../reference/upgrade-log-context.md)を有効にします。

1. プロパティファイルを保存し、 [Liferay を再起動します](../../installing-liferay/running-liferay-for-the-first-time.md#restart-the-server) 。

1. Liferayが再起動すると、データベースは自動的に更新され、コンソールログに進捗が表示されます。 アップグレードレポートを有効にした場合、レポートは完了後 `Liferay_Home/reports` フォルダにあります。

```{note}
アップグレード後も Liferay を使い続けるには、`upgrade.database.auto.run` プロパティを削除するか、値を `false` に設定してください。
```

## 関連トピック

* [アップグレードの基本](../upgrade-basics.md)
* [データベースアップグレードオプション](../reference/database-upgrade-options.md)
* [データベースアップグレードツールの使用](./using-the-database-upgrade-tool.md)
* [カスタム開発のアップグレード](../upgrading-custom-development.md)
* [アップグレードのトラブルシューティング](../reference/troubleshooting-upgrades.md)
* [MBeansによるアップグレードの監視](../reference/monitoring-upgrades-with-mbeans.md)
