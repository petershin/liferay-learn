---
toc:
  - using-the-server-administration-panel/managing-system-resources.md
  - using-the-server-administration-panel/configuring-logging.md
  - using-the-server-administration-panel/configuring-external-services.md
  - using-the-server-administration-panel/configuring-a-shutdown-event.md
---
# サーバー管理パネルの使用

サーバー管理は、さまざまな低レベルのLiferay DXP構成を保持するシステムスコープの管理パネルです。 サーバー管理では、システムメモリの使用状況、低レベルのプロパティ、一部のサードパーティ統合、ドキュメントリポジトリの移行、ログ、スクリプト、メールサーバーの構成、ポータルのシャットダウンを管理および監視できます。

［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**サーバの管理**］ の順にクリックしてサーバーの管理にアクセスすることができます 。

![サーバー管理の［リソース］タブには、サーバーのメモリ使用量のグラフが表示されます。](using-the-server-administration-panel/images/01.png)

サーバー管理の機能はタブに分割されています。

| サーバー管理タブ | Description                                                                                                                                                                                                                                                                  | ドキュメントリンク                                                                                 |
|:-------- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:----------------------------------------------------------------------------------------- |
| リソース     | システムを監視し、管理タスクを実行します（ガベージコレクターの実行、データベースキャッシュのクリアなど）。                                                                                                                                                                                                                        | [システムリソースの管理](./using-the-server-administration-panel/managing-system-resources.md)       |
| ログレベル    | ログレベルを表示および設定します。 Liferay DXPクラスおよびパッケージのログレベルを変更します。 ログ設定にカスタムオブジェクトを追加します。                                                                                                                                                                                                 | [ロギングの構成](./using-the-server-administration-panel/configuring-logging.md)                 |
| 詳細設定     | システムとポータルのプロパティを表示します。 システムプロパティは、JVMおよびLiferay DXPのシステムプロパティを示し、実行中の構成をデバッグまたは確認するときに使用されます。 ポータルプロパティには、現在のポータルプロパティ値が表示されます。 詳細は、 [ポータルプロパティリファレンスドキュメント](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) を参照してください。              | [ポータルプロパティ](../installation-and-upgrades/reference/portal-properties.md)                  |
| データ移行    | リポジトリから別のリポジトリへドキュメントを移行 たとえば、ドキュメントを別のディスクの新しいリポジトリや新しい形式に移行できます。                                                                                                                                                                                                           | [ファイルストレージの移行](file-storage/file-store-migration.md)                                      |
| メール      | [ポータルプロパティファイル](../installation-and-upgrades/setting-up-liferay/configuring-mail/alternative-email-configuration-methods.md#configuring-the-built-in-mail-session-using-portal-properties) 代わりに、このタブからメールサーバーを構成できます。 これらの設定は、 `portal-ext.properties` ファイルのメールサーバー設定を上書きします。 | [メールの設定](../installation-and-upgrades/setting-up-liferay/configuring-mail.md)             |
| 外部サービス   | 画像、オーディオファイル、ビデオファイルのファイルプレビューを生成するための外部サービスを構成します。                                                                                                                                                                                                                          | [外部サービスの構成](./using-the-server-administration-panel/configuring-external-services.md)     |
| スクリプト    | 移行または管理コードを実行するために、スクリプトコンソールでGroovyスクリプトを記述します。                                                                                                                                                                                                                             | [スクリプトエンジンの使用](./using-the-script-engine.md)                                              |
| シャットダウン  | ログインしているユーザーにシャットダウンが迫っていることを警告するシャットダウンをスケジュールします（今から **x** 分後）。                                                                                                                                                                                                              | [シャットダウンイベントの構成](./using-the-server-administration-panel/configuring-a-shutdown-event.md) |
