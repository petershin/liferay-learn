# Liferay DXPをAnalytics Cloudに接続する

{bdg-secondary}`Liferay DXP 7.4 U67+`.

Liferay DXPおよびAnalytics Cloudは、安全で暗号化されたトークンで接続します。 このトークンはAnalytics Cloudによって生成され、Liferay DXPの構成に追加する必要があります。 接続すると、同期するデータを決定できます。

```{note}
このプロセスはLiferay DXPのバージョンによって異なりますが、前提条件は同じです。 [Liferay DXP 7.4 U66 and Earlier Versions](#liferay-dxp-74-u66-and-earlier-versions) を参照してください。
```

## 前提条件

Liferay DXPをAnalytics Cloudに接続するには、以下の前提条件があります。

1. [liferay.com](https://www.liferay.com) アカウントが必要です。 [アカウントをお持ちでない場合は、](https://login.liferay.com/signin/register) アカウントを作成してください。

1. [analytics.liferay.com](https://analytics.liferay.com/) に初めてアクセスする際は、アカウントの多要素認証を設定する必要があります。 詳細は [多要素認証](../reference/multi-factor-authentication.md) を参照のこと。

1. Liferay DXPのインストールは、以下の最小バージョンのいずれかを満たす必要があります。

   * 7.4（すべてのバージョン）
   * 7.3 フィックスパック 1
   * 7.2 フィックスパック 11
   * 7.1 フィックスパック 22
   * 7.0 フィックスパック 98

1. 少なくとも1つのAnalytics Cloudワークスペースにアクセスする必要があります。 Analytics Cloudの有料ユーザーであれば、ログイン時に自分のワークスペースが表示されます。 わからない場合は、 [help.liferay.com](https://help.liferay.com/) からサポートにご連絡ください。

1. (オプション）ユーザーの同期には Liferay DXP のバッチエンジンを使用します。 非常に多くのユーザーを同期する場合は、バッチサイズを大きくしてください。 Liferay DXP で、 **Global Menu** &rarr; **Instance Settings** &rarr; **Batch Engine** に移動します。 **Export Batch Size**と**Import Batch Size** を `1000` に設定する。

## オンボーディングガイドの利用

1. Analytics Cloudにログインし、ワークスペースを選択します。

   初めてログインする場合は、オンボーディングガイドが表示されます。 Next_をクリックし、Analytics Cloud トークンをコピーします。

   ![You see an onboarding guide when you login first.](./connecting-liferay-dxp-to-analytics-cloud/images/01.png)

   または、 **Settings** &rarr; **Data Sources** の下にトークンがあります。 Add Data Source **をクリックし、** Liferay DXP_ を選択し、Analytics Cloud トークンをコピーします。

1. Liferay DXPインスタンスにログインします。

1. ![グローバルメニュー](../images/icon-applications-menu.png) を開き、[コントロールパネル] タブを開き、[インスタンス設定] をクリックします。

1. ［プラットフォーム］で［アナリティクス クラウド］をクリックします。

   初回は4ステップのオンボーディングガイドが表示されます。

1. Analytics Cloudトークンを入力し、 **Connect** をクリックします。

   ![Enter the token and click Connect.](./connecting-liferay-dxp-to-analytics-cloud/images/02.png)

1. 既存のAnalytics Cloudプロパティを選択するか、 **Add**（![Add Button](.../images/icon-add.png)）をクリックして作成します。 選択したら、 **Assign** をクリックします。

   ```{note}
   プロパティは1つまたは複数のLiferayサイトに関連付けられたラベルで、Analytics Cloudがデータをどのように集約するかを決定します。
   ```

   ![Select an existing property or create a new one.](./connecting-liferay-dxp-to-analytics-cloud/images/03.png)

1. プロパティに割り当てるサイトを選択します。 Commerce_トグルを有効にすると、Commerce [チャネルについて](https://learn.liferay.com/w/commerce/store-management/channels/introduction-to-channels) も割り当てられます。

   一度に1つのプロパティにのみ、同じサイトまたはチャンネルを割り当てることができます。 詳細については、 [Scoping Sites and Individual Using Properties](../workspace-settings/scoping-sites-and-individuals-using-properties.md) を参照のこと。

   ![Select sites and channels to sync with Analytics Cloud.](./connecting-liferay-dxp-to-analytics-cloud/images/04.gif)

1. 「次へ」をクリックする。

1. 同期させたい個人プロフィールとアカウントプロフィールを選択します。

   トグルを使用して、すべての連絡先とアカウントデータを同期するか、ユーザーグループ、組織、アカウントグループに基づいてサブセットを選択します。

   ![Select the contact data you want to sync with Analytics Cloud.](./connecting-liferay-dxp-to-analytics-cloud/images/05.png)

   ```{important}
   Analytics Cloudは、個々の連絡先データを同期して管理するためのツールを提供します。 ただし、これらのツールは、プライバシー規制（GDPRなど）の遵守を保証するものではありません。 お客様は、お客様のサイトが個人データを保存し処理する場所で、プライバシー法を遵守するために必要な慣行および構成を慎重に決定する必要があります。
   ```

1. 「次へ」をクリックする。

1. 各エンティティに必要な属性を選択します。 コマース・チャンネルを同期している場合、コマースエンティティの属性を選択することができます。

    Analytics Cloudでは、いくつかのフィールドを同期する必要があり、それらはグレーで表示されます。

    ![Select the attributes to sync for each of the entities.](./connecting-liferay-dxp-to-analytics-cloud/images/06.png)

1. 「終了」をクリックする。

    以下のメッセージが表示されることを確認します。

    成功です：DXP は Analytics Cloud に正常に接続しました。 サイト上でアクティビティが発生すると、データが表示されるようになります。

これで、LiferayインスタンスがAnalytics Cloudに接続されました。

## Liferay DXP 7.4 U66およびそれ以前のバージョン

### 接続トークン

Liferay DXPおよびAnalytics Cloudは、安全で暗号化されたトークンで接続します。 このトークンはAnalytics Cloudによって生成され、Liferay DXPの構成に追加する必要があります。 接続すると、同期するデータを決定できます。 お使いのLiferay DXPのバージョンによって、プロセスが異なります。

1. Analytics Cloudにログインし、ワークスペースを選択します。

   初めてログインする場合は、オンボーディングガイドが表示されます。 Next_をクリックし、Analytics Cloud トークンをコピーします。

   ![You see an onboarding guide when you log in first.](./connecting-liferay-dxp-to-analytics-cloud/images/08.png)

   または、 **Settings** &rarr; **Data Sources** の下にトークンがあります。 Add Data Source **をクリックし、** Liferay DXP_ を選択し、Analytics Cloud トークンをコピーします。

1. Liferay DXPインスタンスにログインします。

1. ![グローバルメニュー](../images/icon-applications-menu.png) を開き、[コントロールパネル] タブを開き、[インスタンス設定] をクリックします。

1. [プラットフォーム]で[**Analytics Cloud**]をクリックします。

1. アナリティクス クラウドのトークンを貼り付け、 **Connect** をクリックします。

   ![Paste the token and click Connect.](./connecting-liferay-dxp-to-analytics-cloud/images/09.png)

   ```{note}
   Liferay DXP 7.0では、Analytics Cloud Adminは*Configuration* &rarr; *Analytics Cloud*の下にあります。
   ```

1. 以下のメッセージが表示されることを確認します。

   `Success: Your request completed successfully`

これで、LiferayインスタンスがAnalytics Cloudに接続されました。 次のステップは、Liferayサイトと連絡先の同期です。

### サイトの同期

サイトを同期するには、プロパティを作成し、1つまたは複数のサイトに関連付ける必要があります。 Analytics Cloudは、お客様のプロパティの定義方法に従ってデータを集約します。 この例では、1つのサイトが1つの物件と関連付けられている簡単な設定を示しています。 複数のサイトを持つプロパティの定義についての詳細は、 [プロパティを使用したサイトと個人のスコープ](../workspace-settings/scoping-sites-and-individuals-using-properties.md) を参照のこと。

1. Analytics Cloudで、 **Settings** &rarr; **Properties** に移動します。

1. **New Property** をクリックし、ラベルを入力する（例：Minium Site）。

1. DXPインスタンスで、 **グローバルメニュー**（ ![グローバルメニュー](../images/icon-applications-menu.png) ）を開き、 **コントロールパネル** タブに移動し、 **インスタンス設定** をクリックします。

1. プラットフォーム]で[**Analytics Cloud**]をクリックします。

1. サイトを選択_をクリックします。

1. 利用可能なプロパティ下にある新規プロパティを選択します。

1. 同期したいサイトを選択し、 **Done** をクリックする。

   ![Select the site you want to sync.](./connecting-liferay-dxp-to-analytics-cloud/images/10.png)

   以下のメッセージが表示されることを確認します。

   `Success: Your request completed successfully`

### 連絡先の同期

1. DXPインスタンスで、 **グローバルメニュー**（ ![グローバルメニュー](../images/icon-applications-menu.png) ）を開き、 **コントロールパネル** タブに移動し、 **インスタンス設定** をクリックします。

1. [プラットフォーム]で[**Analytics Cloud**]をクリックします。

1. 連絡先の選択」をクリックします。

1. [連絡先の同期オプション]で、[**連絡先の同期**]をクリックします。 すべての連絡先を同期するには、 **Sync All** を切り替えます。 また、連絡先のサブセットを同期したい場合は、 **ユーザーグループ単位で同期** または **組織単位で同期** をクリックします。

   ```{important}
   Analytics Cloudは、個々の連絡先データを同期して管理するためのツールを提供します。 ただし、これらのツールは、プライバシー規制（GDPRなど）の遵守を保証するものではありません。 お客様は、お客様のサイトが個人データを保存し処理する場所で、プライバシー法を遵守するために必要な慣行および構成を慎重に決定する必要があります。
   ```

1. 「保存して次へ」をクリックする。

1. 「連絡先」タブと「ユーザー」タブを切り替えて、同期するフィールドを選択します。 Liferay DXPでは、連絡先データを2つの別々のテーブル（ContactとUser）に保存します。 Analytics Cloudでは、いくつかのフィールドを同期する必要があり、それらはグレーで表示されます。

   ![Select the fields you want to sync from the list.](./connecting-liferay-dxp-to-analytics-cloud/images/11.png)

1. 「保存」をクリックする。

   以下のメッセージが表示されることを確認します。

   `Success: Your request completed successfully`

これですべての設定が完了しました。 ユーザーがサイトにアクセスしてエンゲージすると、Analytics Cloudは何が起こっているのかを追跡し始めます。 そうなれば、 [アナリティクスダッシュボードを見る](./viewing-the-analytics-dashboard.md) に飛び込んで、トラッキングされるさまざまなインタラクションを見ることができます。
