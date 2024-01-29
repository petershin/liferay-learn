# Glowroot Freemarker プラグインによるテンプレートのトラブルシューティング

{bdg-secondary}`liferay DXP 2023.Q4+/Portal 7.4 GA100+`.

Glowroot は、 [FreeMarker テンプレート](../../site-building/displaying-content/using-information-templates.md) をトラブルシューティングし、遅いトランザクションを特定することができます。

## FreeMarkerプラグインの設定

1. Configuration **&rarr;** Plugins **に移動する。 Liferay FreeMarker Templates Plugin** をクリックします。

1. インスツルメンテーションは `INFO`、`DEBUG`、`TRACE` レベルで設定できる。

   `INFO`レベルはテンプレート変換にかかる時間を示す。 `DEBUG` レベルは、各テンプレート変換を個別の検査のための一意なトランザクショ ンとして扱う。 この設定は、より多くのGlowrootオーバーヘッドを使用するかもしれないことに注意してください。 `TRACE`レベルでは、テンプレートスクリプトの詳細と、検査用のトレースの詳細を表示します。

## FreeMarkerテンプレートのトラブルシューティング

1. **Transactions** タブに移動し、ドロップダウンメニューから **FreeMarker Templates** を選択します。 すべてのテンプレート・トランザクションのリストが表示される。

1. 特定のトランザクションの詳細を見るには、トランザクションパネルの **Slow traces** タブをクリックする。

1. データポイントをクリックすると、トランザクションの詳細が表示されます。 内訳のセクションにあるテンプレートの変換時間を参照。

   ![Click on the data point to see details about the transaction.](./troubleshooting-templates-with-glowroot-freemarker-plugin/images/01.png)

1. さらに下にスクロールして、 **Trace entries** をクリックする。 トレースが拡大され、フラグメントの変換の詳細が表示される。

   ![The trace is expanded to show details of the fragment transformation.](./troubleshooting-templates-with-glowroot-freemarker-plugin/images/02.png)

テンプレート・トランザクションのエラーを検査する、

1. **Errors** タブに移動し、ドロップダウンメニューから **FreeMarker Templates** を選択します。

1. 特定のエラーをクリックして検査する。
