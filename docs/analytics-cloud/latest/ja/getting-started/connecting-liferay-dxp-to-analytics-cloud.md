---
uuid: c44fbb5a-5155-4b25-b97e-b574fb16f3d6
---
# Liferay DXPをAnalytics Cloudに接続する

{bdg-secondary}`利用可能 Liferay DXP 7.4 U67+`

Liferay DXPとAnalytics Cloudは、安全で暗号化されたトークンで接続します。 このトークンはAnalytics Cloudによって生成され、Liferay DXPの構成に追加する必要があります。 接続すると、どのデータを同期させるかを決めることができます。

```{note}
このプロセスはLiferay DXPのバージョンによって異なりますが、前提条件は同じです。 別の方法については、 [Liferay DXP 7.4 U66 and Earlier Versions](#liferay-dxp-74-u66-and-earlier-versions) をご参照ください。
```

## 前提条件

Liferay DXPをAnalytics Cloudに接続するには、以下の前提条件があります。

1. [liferay.com](https://www.liferay.com) アカウントが必要です。 お持ちでない方は、 [アカウントを作成してください。](https://login.liferay.com/signin/register) .

1. [analytics.liferay.com](https://analytics.liferay.com/) に初めてアクセスする場合、アカウントに多要素認証を設定する必要があります。 詳しくは、 [多要素認証](../workspace-settings/multi-factor-authentication.md) をご覧ください。

1. Liferay DXPのインストールは、以下の最低バージョンのいずれかを満たす必要があります。

   * 7.4（どのバージョンでも）
   * 7.3 フィックスパック 1
   * 7.2 フィックスパック 11
   * 7.1 フィックスパック 22
   * 7.0 フィックスパック 98

1. 少なくとも1つのAnalytics Cloudワークスペースにアクセスする必要があります。 Analytics Cloudの有料ユーザーであれば、ログイン時に自分のワークスペースが表示されるはずです。 もしわからない場合は、 [help.liferay.com](https://help.liferay.com/) またはメール <analytics-cloud@liferay.com>でサポートにお問い合わせください。

## オンボーディングガイドの活用

1. Analytics Cloudにログインし、ワークスペースを選択します。

   初めてログインする場合は、オンボーディングガイドが表示されます。 **次へ** をクリックし、Analytics Cloudのトークンをコピーします。

   ![最初にログインしたときにオンボーディングガイドが表示されます。](./connecting-liferay-dxp-to-analytics-cloud/images/01.png)

   または、 **Settings** &rarr; **Data Sources** の下にトークンを見つけることができます。 **データソースの追加** をクリックし、 **Liferay DXP** を選択し、Analytics Cloud のトークンをコピーします。

1. Liferay DXPインスタンスにログインします。

1. **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブを開き、 **インスタンスの設定** をクリックします。

1. **Platform** の下で、 **Analytics Cloud** をクリックします。

   初回は4ステップのオンボーディングガイドが表示されますね。

1. Analytics Cloudのトークンを入力し、 **Connect** をクリックします。

   ![トークンを入力し、［接続］をクリックします。](./connecting-liferay-dxp-to-analytics-cloud/images/02.png)

1. 既存のAnalytics Cloudのプロパティを選択するか、 **Add**()をクリックします。![追加ボタン](../images/icon-add.png))で作成することができます。 選択したら、 **Assign** をクリックします。

   ```{note}
   プロパティは、1つまたは複数のLiferayサイトに関連付けられたラベルで、Analytics Cloudがデータを集約する方法を決定します。
   ```

   ![既存の物件を選択するか、新規に物件を作成します。](./connecting-liferay-dxp-to-analytics-cloud/images/03.png)

1. プロパティに割り当てるサイトを選択します。 **Commerce** のトグルを有効にして、Commerce [チャネルについて](https://learn.liferay.com/commerce/latest/ja/store-management/channels/introduction-to-channels.html) も割り当てます。

   同じサイトまたはチャンネルを、一度に1つのプロパティにのみ割り当てることができます。 詳しくは、 [スコープサイトとプロパティを使用する個人](../workspace-settings/scoping-sites-and-individuals-using-properties.md) をご覧ください。

   ![Analytics Cloudと同期するサイトとチャンネルを選択します。](./connecting-liferay-dxp-to-analytics-cloud/images/04.gif)

1. ［**Next**］ をクリックします。

1. 同期させたい個人プロファイルとアカウントプロファイルを選択します。

   トグルを使用して、すべての連絡先とアカウントデータを同期するか、ユーザーグループ、組織、アカウントグループに基づいてサブセットを選択します。

   ![Analytics Cloudと同期させたいコンタクトデータを選択します。](./connecting-liferay-dxp-to-analytics-cloud/images/05.png)

   ```{important}
   Analytics Cloudは、個々のコンタクトデータを同期して管理するためのツールを提供します。 ただし、これらのツールは、プライバシー規制（GDPRなど）の遵守を保証するものではありません。 お客様は、お客様のサイトが個人データを保存し処理する場所で、プライバシー法を遵守するために必要な慣行および構成を慎重に決定する必要があります。
   ```

1. ［**Next**］ をクリックします。

1. 各エンティティに必要な属性を選択します。 Commerceチャンネルを同期している場合、Commerceエンティティの属性を選択することができます。

   Analytics Cloudでは、同期するためにいくつかのフィールドが必要です。これらのフィールドはグレーアウトされています。

   ![各エンティティについて、同期する属性を選択します。](./connecting-liferay-dxp-to-analytics-cloud/images/06.png)

1. ［**Finish**］ をクリックします。

   このメッセージが表示されることを確認する。

   `Success: DXP has successfully connected to Analytics Cloud. You will begin to see data as activities occur on your sites.`

おめでとうございます！LiferayインスタンスがAnalytics Cloudに接続されました。

## Liferay DXP 7.4 U66およびそれ以前のバージョン。

### コネクショントークン

Liferay DXPとAnalytics Cloudは、安全で暗号化されたトークンで接続します。 このトークンはAnalytics Cloudによって生成され、Liferay DXPの構成に追加する必要があります。 接続すると、どのデータを同期させるかを決めることができます。 お手持ちのLiferay DXPのバージョンによって、処理方法が異なります。

1. Analytics Cloudにログインし、ワークスペースを選択します。

   初めてログインする場合は、オンボーディングガイドが表示されます。 **次へ** をクリックし、Analytics Cloudのトークンをコピーします。

   ![最初にログインしたときにオンボーディングガイドが表示されます。](./connecting-liferay-dxp-to-analytics-cloud/images/08.png)

   または、 **Settings** &rarr; **Data Sources** の下にトークンを見つけることができます。 **データソースの追加** をクリックし、 **Liferay DXP** を選択し、Analytics Cloud のトークンをコピーします。

1. Liferay DXPインスタンスにログインします。

1. **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブを開き、 **インスタンスの設定** をクリックします。

1. プラットフォーム」の下にある「**Analytics Cloud**」 をクリックします。

1. Analytics Cloudのトークンを貼り付け、 **Connect** をクリックします。

   ![トークンを貼り付け、［接続］をクリックします。](./connecting-liferay-dxp-to-analytics-cloud/images/09.png)

   ```{note}
   Liferay DXP 7.0では、Analytics Cloud Adminは*Configuration* &rarr; *Analytics Cloud*の下にあります。
   ```

1. このメッセージが表示されることを確認する。

   `Success: Your request completed successfully`

おめでとうございます！LiferayインスタンスがAnalytics Cloudに接続されました。 次のステップは、Liferayサイトと連絡先の同期です。

### サイトの同期

サイトを同期するには、プロパティを作成し、1つまたは複数のサイトに関連付ける必要があります。 Analytics Cloudは、お客様のプロパティの定義方法に従ってデータを集約します。 この例では、1つのサイトが1つの物件と関連付けられている簡単な設定を示しています。 複数のサイトを持つプロパティの定義について詳しくは、 [プロパティを使用するサイトと個人のスコープ](../workspace-settings/scoping-sites-and-individuals-using-properties.md)をご覧ください。

1. Analytics Cloudで、 **設定** &rarr; **プロパティ** に移動します。

1. **New Property** をクリックし、ラベルを入力します（例：Minium Site）。

1. DXP インスタンスで、 **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブを開き、 **インスタンス設定** をクリックします。

1. プラットフォーム」の下にある「**Analytics Cloud**」 をクリックします。

1. 「**サイトを選択」をクリック** .

1. 利用可能なプロパティ」の下にある新しいプロパティを選択します。

1. 同期させたいサイトを選択し、 **完了** をクリックします。

   ![同期させたいサイトを選択します。](./connecting-liferay-dxp-to-analytics-cloud/images/10.png)

   このメッセージが表示されることを確認する。

   `Success: Your request completed successfully`

### 連絡先の同期

1. DXP インスタンスで、 **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブを開き、 **インスタンス設定** をクリックします。

1. プラットフォーム」の下にある「**Analytics Cloud**」 をクリックします。

1. ［**連絡先を選択**］ をクリックします。

1. 連絡先同期オプション」の下で、「**連絡先同期**」 をクリックします。 **Sync All** を切り替えると、すべての連絡先が同期されます。 また、連絡先のサブセットを同期させたい場合は、 **ユーザーグループによる同期** または **組織による同期** をクリックしてください。

   ```{important}
   Analytics Cloudは、個々のコンタクトデータを同期して管理するためのツールを提供します。 ただし、これらのツールは、プライバシー規制（GDPRなど）の遵守を保証するものではありません。 お客様は、お客様のサイトが個人データを保存し処理する場所で、プライバシー法を遵守するために必要な慣行および構成を慎重に決定する必要があります。
   ```

1. **保存して次へ** をクリックします。

1. **Contact** タブと **User** タブを切り替えて、同期するフィールドを選択します。 Liferay DXPでは、連絡先データを2つの別々のテーブル（ContactとUser）に保存します。 Analytics Cloudでは、同期するためにいくつかのフィールドが必要です。これらのフィールドはグレーアウトされています。

   ![リストから同期させたいフィールドを選択します。](./connecting-liferay-dxp-to-analytics-cloud/images/11.png)

1. ［**保存**］ をクリックします。

   このメッセージが表示されることを確認する。

   `Success: Your request completed successfully`

素晴らしい！これで準備は万端ですね。 ユーザーがサイトを訪問し、インタラクションを行うと、Analytics Cloudは何が起こっているのかを追跡し始めます。 そうなったら、 [Analytics Dashboardの表示](./viewing-the-analytics-dashboard.md) に飛び込んで、トラッキングされるさまざまなインタラクションを確認することができます。
