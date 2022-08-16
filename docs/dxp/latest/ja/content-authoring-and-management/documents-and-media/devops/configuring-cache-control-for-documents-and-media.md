# ドキュメントとメディアのキャッシュを設定する

{bdg-secondary}`Liferay 7.4 U21以降およびGA21以降で利用可能`

デフォルトでは、ドキュメントとメディアファイルは、ブラウザやサーバーにキャッシュされません。 これは、ファイルの可視性が一般に動的なプロパティや設定（パーミッションなど）に依存するためです。 ただし、必要に応じてキャッシュを有効にし、設定することができます。

```{important}
キャッシュの設定は、Guestロールに表示されるドキュメントにのみ適用されます。
```

以下の手順に従って、Liferayシステムまたはインスタンスにキキャッシュを設定します。

1. **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブに移動して ［**System Settings**］ もしくは ［**Instance Settings**］ をクリックします。 スコープ設定の詳細については、[設定スコープについて](../../../system-administration/configuring-liferay/understanding-configuration-scope.md)を参照してください。

1. ［**Documents and Media**］ &rarr; ［**Cache Control**］ にアクセスしてください。

   ![［ドキュメントとメディア］の設定の［キャッシュ制御］に移動します。](./configuring-cache-control-for-documents-and-media/images/01.png)

1. ［**Cache Control**］ ポリシーを選択します。

   * Private：ユーザーのブラウザによるキャッシュを許可

   * Public：CDNもしくはプロキシサーバーによるキャッシュを許可

1. キャッシュされたドキュメントの ［**Max Age**］ を設定します。 この値は、応答が新規とみなされるまでの秒数を設定します。 設定された時間が経過すると、キャッシュされたドキュメントのバージョンは失効し、更新が必要になります。 値を`0`のままにしておくことは、値を指定しないことと同じです。

1. (オプション) キャッシュから除外するMIME種別のリストを入力します (例: `application/pdf`、`image/jpeg`、`video/mp4`)。

   ```{tip}
   頻繁に更新されるMIME種別がある場合、その種別のキャッシュを無効にして、最新バージョンのファイルがユーザーに表示されるようにすることができます。
   ```

1. ［**Save**］ をクリックします。

## 追加情報

* [ドキュメントとメディアのストレージクォータを設定する](./setting-storage-quotas-for-documents-and-media.md)
* [ドキュメントとメディアプレビューの設定](./configuring-documents-and-media-previews.md)
* [キャッシュ](../../../building-applications/data-frameworks/cache.md)
