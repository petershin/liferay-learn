# Glowroot Freemarker プラグインによるテンプレートのトラブルシューティング

{bdg-secondary}`liferay DXP 2023.Q4+/Portal 7.4 GA100+`.

Glowroot は、 [FreeMarker テンプレート](../../site-building/displaying-content/using-information-templates.md) をトラブルシューティングし、遅いトランザクションを特定することができます。

## FreeMarkerプラグインの設定

1. Configuration_ &rarr; _Plugins_に移動する。 Liferay FreeMarker Templates Plugin_ をクリックします。

1. インスツルメンテーションは `INFO`、`DEBUG`、`TRACE` レベルで設定できる。

   `INFO`レベルはテンプレート変換にかかる時間を示す。 `DEBUG` レベルは、各テンプレート変換を個別の検査のための一意なトランザクショ ンとして扱う。 この設定は、より多くのGlowrootオーバーヘッドを使用するかもしれないことに注意してください。 `TRACE`レベルでは、テンプレートスクリプトの詳細と、検査用のトレースの詳細を表示します。

## FreeMarkerテンプレートのトラブルシューティング

1. _Transactions_タブに移動し、ドロップダウンメニューから_FreeMarker Templates_を選択します。 すべてのテンプレート・トランザクションのリストが表示される。

1. 特定のトランザクションの詳細を見るには、トランザクションパネルの_Slow traces_タブをクリックする。

1. データポイントをクリックすると、トランザクションの詳細が表示されます。 内訳のセクションにあるテンプレートの変換時間を参照。

   ![Click on the data point to see details about the transaction.](./troubleshooting-templates-with-glowroot-freemarker-plugin/images/01.png)

1. さらに下にスクロールして、_Trace entries_をクリックする。 トレースが拡大され、フラグメントの変換の詳細が表示される。

   ![The trace is expanded to show details of the fragment transformation.](./troubleshooting-templates-with-glowroot-freemarker-plugin/images/02.png)

テンプレート・トランザクションのエラーを検査する、

1. _Errors_タブに移動し、ドロップダウンメニューから_FreeMarker Templates_を選択します。

1. 特定のエラーをクリックして検査する。
