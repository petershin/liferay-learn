# Liferay DXPをAnalytics Cloudに接続する

Liferay DXPインスタンスには、webアナリティクスデータや訪問者データが豊富に含まれています。 Webサイトの訪問者情報を監視・収集するためには、データソースを追加してLiferay DXPサイトとAnalytics Cloudとの接続を設定する必要があります。

Analytics Cloudはアクセストークンを使用してLiferay DXPと接続します。 Liferay DXPのインストールは、以下のフィックスパックの最小要件を満たしている必要があります：

* 7.3 フィックスパック 1
* 7.2 フィックスパック 11
* 7.1 フィックスパック 22
* 7.0 フィックスパック 98

## データソースの追加

1. ［**設定**］ > ［**データソース**］ > ［**データソースの追加**］ に移動してデータソースを作成します。 このアクションを実行するには、管理者ロールが必要です。

1. データソースタイプとしてLiferay DXPを選択します。 コピーするトークンを提供する画面が表示されます。

      ![Analytics Cloudは、コピーするためのトークンを提供します。](connecting-liferay-dxp-to-analytics-cloud/images/01.png)

1. トークンをコピーして、Liferay DXPインスタンスに移動します。 ［**コントロールパネル**］ にある ［**設定**］ > ［**Instance Setting**］ 、および ［**プラットフォーム**］ セクションの ［**Analytics Cloud**］ をクリックします。 以下の画像のように、［Analytics Cloud Token］フィールドにアクセストークンを貼り付け、 ［**Connect**］ をクリックします。

      ![AnalyticsCloudトークンをLiferayDXPインストールのインスタンス設定構成に追加します。](connecting-liferay-dxp-to-analytics-cloud/images/02.png)

```{note}
Liferay DXP 7.0の場合、Analytics Cloud Adminは、*Configuration* > *Analytics Cloud*の下にあります。
```

接続が成功すると、 `Your DXP instance is connected to Analytics Cloud`というメッセージが表示されます。

```{note}
解析データの抑制については、 [Do Not Track Feature](../workspace-data/data-control-and-privacy.md#do-not-track-feature) を参照してください。
```

![DXPとAnalytics Cloudの接続が正しく設定されたことを示す成功メッセージが表示されます。](connecting-liferay-dxp-to-analytics-cloud/images/03.png)

これでDXPがACワークスペースに接続されました。

注：新しいデータソースが追加されると、同じ名前のプロパティが自動的に作成されます。 重複している場合は、増分のサフィックスが追加されます（例：Liferay DXP（1））。 データソースの名前もプロパティの名前も、後でいつでも変更できます。

## 次のステップ

* [サイトと個人をプロパティでスコープする](./scoping-sites-and-individuals-using-properties.md)
