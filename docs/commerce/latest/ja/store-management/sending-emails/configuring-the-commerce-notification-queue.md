# コマース通知キューの設定

チャネルイベントが通知をトリガーすると、Commerce はチャネルの通知キュータブに `Unsent` というステータスでログを記録します。 デフォルトでは、Liferayは15分ごとにキューに入った通知をチェックし、 `Unsent` のステータスがあれば送信します。 しかし、43200分（30日）後に通知が `Unsent` のステータスになると、Liferayはそれを削除します。

キューに入った通知の送信と削除の間隔を変更することができます。

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **システム設定** に移動します。

1. **オーダー** をクリックし、 **コマース通知キュー** を選択します。

1. **Notification Queue Entry Check Interval** と **Notification Queue Entry Delete Interval** のフィールドに新しい値を入力します。 値は分単位で設定される（例：15＝15分）。

   ![Notification Queue Entry Check and Delete Intervalsのデフォルト値を変更する。](./configuring-the-commerce-notification-queue/images/01.png)

1. ［**Save**］ をクリックします。

## 関連トピック

* [通知テンプレートの使用](./using-notification-templates.md)
