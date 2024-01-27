# ドキュメントとメディアのキャッシュを設定する

{bdg-secondary}`liferay 7.4 U21+およびGA21+`。

デフォルトでは、ドキュメントとメディアファイルは、ブラウザやサーバーにキャッシュされません。 これは、ファイルの可視性が一般に動的なプロパティや設定（パーミッションなど）に依存するためです。 ただし、必要に応じてキャッシュを有効にし、設定することができます。

```{important}
キャッシュ設定は、Guestロールが表示できるドキュメントにのみ適用されます。
```

以下の手順に従って、Liferayシステムまたはインスタンスにキキャッシュを設定します。

1. ![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、[コントロールパネル](_Control Panel_)タブに移動し、[システム設定](_System Settings_)または[インスタンス設定](_Instance Settings_)をクリックします。 コンフィギュレーションのスコープについては、 [Understanding Configuration Scope](../../../system-administration/configuring-liferay/understanding-configuration-scope.md) を参照してください。

1. *Documents and Media* &rarr; _Cache Control_にアクセスしてください。

   ![Go to Cache Control under Documents and Media settings.](./configuring-cache-control-for-documents-and-media/images/01.png)

1. *キャッシュ制御*ポリシーを選択します。

   * Private：ユーザーのブラウザによるキャッシュを許可

   * Public：CDNもしくはプロキシサーバーによるキャッシュを許可

1. キャッシュされたドキュメントの_Max Age_を設定する。 この値は、応答が新規とみなされるまでの秒数を設定します。 設定された時間が経過すると、キャッシュされたドキュメントのバージョンは失効し、更新が必要になります。 値を`0`のままにすることは、値を指定しないことと同じである。

1. (オプション）キャッシュから除外するMIMEタイプのリストを入力する（例：`application/pdf`、`image/jpeg`、`video/mp4`）。

   ```{tip}
   頻繁に更新されるMIMEタイプがある場合は、そのタイプのキャッシュを無効にすることで、最新バージョンのファイルを確実にユーザーに表示することができます。
   ```

1. ［_保存_］をクリックします。

## 関連トピック

* [ドキュメントとメディアの保存クォータの設定](./setting-storage-quotas-for-documents-and-media.md)
* [ドキュメントとメディアプレビューの設定](./configuring-documents-and-media-previews.md)
* [キャッシュ](../../../building-applications/data-frameworks/cache.md)
