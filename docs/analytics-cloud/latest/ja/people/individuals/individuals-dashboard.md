# 個人ダッシュボード

Individuals dashboardでは、訪問者やサイトの利用状況に関する幅広い分析データを提供しています。

ダッシュボードを表示するには

1. メニューの「個人」セクションの「個人」をクリックする。

1. **Overview** タブをクリックする（Individualsをクリックするとデフォルトでこのタブが選択されている）。

Individuals Dashboardには、以下のパネルがあります。

* [現在の合計](#current-totals) 
* [エンリッチド・プロファイル](#enriched-profiles)
* [アクティブな個人](#active-individuals)
* [趣味](#interests)
* [内訳](#breakdown)

## Current Totals

Current Totalsパネルには、Analytics Cloudによって追跡された既知および匿名の訪問者の合計数が表示されます。

![The Current Totals panel presents total numbers for visitors to your Site.](./individuals-dashboard/images/01.png)

```{note}
個人は、ログイン時にメールアドレスがAnalytics Cloudと同期されたユーザーデータと照合されると、既知とみなされます。 新規ユーザーがサイトに登録すると、そのデータが Analytics Cloud と同期され、既知の個人として表示されるまでに最大 2 時間かかる場合があります。
```

また、パネルには、過去30日と比較した総数の変化率も表示されます。

## 充実化したプロファイル

［充実化したプロファイル］パネルには、過去30日以内に充実化された個人の総数が表示されます。

![The Enriched Profiles panel presents the total number of individuals who have been enriched.](./individuals-dashboard/images/02.png)

属性がその訪問者に関連付けられている場合はいつでも、その訪問者は充実化されているとみなされます。たとえば、 [DXPから連絡先データを同期](../../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) させた場合などです。

## 有効な個人

［アクティブな訪問者］パネルには、選択した期間中にお客様のサイトにアクセスした既知および匿名の訪問者に関する情報が表示されます。

![The Active Individuals panel presents a chart of individuals over time who have interacted with the Site.](./individuals-dashboard/images/03.png)

日、週、月に基づいてデータを視覚化することを選択します。 データは、時間の範囲（過去24時間、過去7日間、過去30日間、過去90日間など）でフィルタリングすることができます。 その他のプリセット期間 **をクリックすると、追加の時間範囲が表示されます。 カスタム範囲** をクリックすると、ご希望の開始日と終了日でフィルタリングできます。

## 関心

［関心］パネルでは、人気の高いトピックトップ5を紹介しています。

![The Interests panel presents a chart of popular topics.](./individuals-dashboard/images/04.png)

全個人に占める興味の割合は、特定のトピックに興味を持っている人の割合を示す。 これらのトピックは、ページのHTMLのtitle、description、keywordタグから導き出されます。

興味のあるトピックの全リストを表示するには、パネル内の **View All Interests** をクリックします。 または、ページ上部の［関心］タブをクリックします。

関心の詳細については、 [興味のあるトピックの理解](./understanding-interests.md) を参照してください。

## 内訳

［内訳］パネルは、訪問者の選択された属性に基づく分布情報を表示します。 これらの属性が利用できる：

* `additionalName`：ミドルネーム
* `birthDate`：生年月日
* `Email`: メールアドレス
* `familyName`：家族名
* `givenName`: 与えられた名前
* `jobTitle`: 職名
* `languageId`：優先言語
* `modifiedDate`: 最終更新日
* `screenName`: スクリーンネーム

![The Breakdown panel presents distribution information based on selected attributes.](./individuals-dashboard/images/05.png)

新たな内訳を追加するには

1. パネルの右上にあるプラス記号をクリックします。

1. ドロップダウンメニューで、属性を選択します。

1. 内訳の名前を入力し、 **Save** をクリックします。

その他の属性の内訳を見るには、 **Explore Breakdown** をクリックしてください。 または、ページ上部の **Distribution** タブをクリックします。
