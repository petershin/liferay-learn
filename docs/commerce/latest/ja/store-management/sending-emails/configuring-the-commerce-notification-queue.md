# コマース通知キューの設定

チャネルイベントが通知をトリガーすると、Commerce はチャネルの通知キュータブに `未送信` ステータスでログを記録します。 デフォルトでは、Liferayは15分ごとにキューに入れられた通知をチェックし、 `Unsent` ステータスがあれば送信します。 しかし、43200分（30日）後に通知が `Unsent` のステータスになると、Liferayはそれを削除します。

キューに入った通知の送信と削除の間隔を変更できます。

1. *グローバルメニュー* (![Global Menu](../../images/icon-applications-menu.png)) を開き、 *［コントロールパネル］* &rarr; *［システム設定］*に移動します。

1. *Orders* をクリックし、 *Commerce Notification Queue*を選択する。

1. *Notification Queue Entry Check Interval* および *Notification Queue Entry Delete Interval* フィールドに新しい値を入力します。 値は分単位で設定される（例：15＝15分）。

   ![通知キューエントリーのチェック間隔と削除間隔のデフォルト値を変更する](./configuring-the-commerce-notification-queue/images/01.png)

1. *［Save］* をクリックします。

```{warning}
この機能を無効にしたい場合は、 [blacklist](https://learn.liferay.com/web/guest/w/dxp/system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md) 。 インターバルにゼロや負の数を入力しないでください。
```

## 関連トピック

* [通知テンプレートの使用](./using-notification-templates.md)
