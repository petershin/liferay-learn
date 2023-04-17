# Liferay DXPをAnalytics Cloudに接続する

{bdg-secondary}`Liferay DXP 7.4 U67以降で利用可能`

Liferay DXPおよびAnalytics Cloudは、安全で暗号化されたトークンで接続します。 このトークンはAnalytics Cloudによって生成され、Liferay DXPの構成に追加する必要があります。 接続すると、同期するデータを決定できます。

```{note}
このプロセスはLiferay DXPのバージョンによって異なりますが、前提条件は同じです。 別の方法については、 [Liferay DXP 7.4 U66およびそれ以前のバージョン](#liferay-dxp-74-u66-and-earlier-versions) をご参照ください。
```

## 前提条件

Liferay DXPをAnalytics Cloudに接続するには、以下の前提条件があります。

1. [liferay.com](https://www.liferay.com) アカウントが必要です。 お持ちでない方は、 [アカウントを作成](https://login.liferay.com/signin/register) できます。

1. [analytics.liferay.com](https://analytics.liferay.com/) に初めてアクセスする場合、アカウントに多要素認証を設定する必要があります。 詳しくは、[多要素認証](../workspace-settings/multi-factor-authentication.md)をご覧ください。

1. Liferay DXPのインストールは、以下の最小バージョンのいずれかを満たす必要があります。

   * 7.4(すべてのバージョン）
   * 7.3 フィックスパック 1
   * 7.2 フィックスパック 11
   * 7.1 フィックスパック 22
   * 7.0 フィックスパック 98

1. 少なくとも1つのAnalytics Cloudワークスペースにアクセスする必要があります。 Analytics Cloudの有料ユーザーであれば、ログイン時に自分のワークスペースが表示されます。 ない場合は、 [help.liferay.com](https://help.liferay.com/) からサポートにご連絡ください。

## オンボーディングガイドの利用

1. Analytics Cloudにログインし、ワークスペースを選択します。

   初めてログインする場合は、オンボーディングガイドが表示されます。 ［**Next**］ をクリックし、Analytics Cloudのトークンをコピーします。

   ![最初にログインしたときにオンボーディングガイドが表示されます。](./connecting-liferay-dxp-to-analytics-cloud/images/01.png)

   または、 ［**設定**］ &rarr; ［**データソース**］ 下でトークンを見つけることができます。 ［**データソースを追加**］ をクリックし、 **Liferay DXP** を選択し、Analytics Cloud のトークンをコピーします。

1. Liferay DXPインスタンスにログインします。

1. **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブを開き、 ［**インスタンスの設定**］ をクリックします。

1. **プラットフォーム** 下で、 ［**Analytics Cloud**］ をクリックします。

   初回は4ステップのオンボーディングガイドが表示されます。

1. Analytics Cloudのトークンを入力し、 ［**Connect**］ をクリックします。

   ![トークンを入力し、［接続］をクリックします。](./connecting-liferay-dxp-to-analytics-cloud/images/02.png)

1. 既存のAnalytics Cloudのプロパティを選択するか、 **追加**(![追加ボタン](../images/icon-add.png))をクリックし、作成します。 選択したら、 ［**Assign**］ をクリックします。

   ```{note}
   プロパティは、1つまたは複数のLiferayサイトに関連付けられたラベルで、Analytics Cloudがデータを集約する方法を決定します。
   ```

   ![既存のプロパティを選択するか、 新しいプロパティを作成します。](./connecting-liferay-dxp-to-analytics-cloud/images/03.png)

1. プロパティに割り当てるサイトを選択します。 ［**Commerce**］ のトグルを有効にして、コマース [チャネルについて](https://learn.liferay.com/commerce/latest/ja/store-management/channels/introduction-to-channels.html) も割り当てます。

   一度に1つのプロパティにのみ、同じサイトまたはチャンネルを割り当てることができます。 詳しくは、 [プロパティを使用したスコープサイトと個人](../workspace-settings/scoping-sites-and-individuals-using-properties.md) をご覧ください。

   ![Analytics Cloudと同期するサイトとチャンネルを選択します。](./connecting-liferay-dxp-to-analytics-cloud/images/04.gif)

1. ［**Next**］ をクリックします。

1. 同期させたい個人プロフィールとアカウントプロフィールを選択します。

   トグルを使用して、すべての連絡先とアカウントデータを同期するか、ユーザーグループ、組織、アカウントグループに基づいてサブセットを選択します。

   ![Analytics Cloudと同期させたい連絡先データを選択します。](./connecting-liferay-dxp-to-analytics-cloud/images/05.png)

   ```{important}
   Analytics Cloudは、個々の連絡先データを同期して管理するためのツールを提供します。 ただし、これらのツールは、プライバシー規制(GDPRなど）の遵守を保証するものではありません。 お客様は、お客様のサイトが個人データを保存し処理する場所で、プライバシー法を遵守するために必要な慣行および構成を慎重に決定する必要があります。
   ```

1. ［**Next**］ をクリックします。

1. 各エンティティに必要な属性を選択します。 コマース・チャンネルを同期している場合、コマースエンティティの属性を選択することができます。

   Analytics Cloudでは、いくつかのフィールドを同期する必要があり、それらはグレーで表示されます。

   ![各エンティティについて、同期する属性を選択します。](./connecting-liferay-dxp-to-analytics-cloud/images/06.png)

1. ［**Finish**］ をクリックします。

   以下のメッセージが表示されることを確認します。

   `Success: DXP has successfully connected to Analytics Cloud. You will begin to see data as activities occur on your sites.`

これで、LiferayインスタンスがAnalytics Cloudに接続されました。

## Liferay DXP 7.4 U66およびそれ以前のバージョン

### 接続トークン

Liferay DXPおよびAnalytics Cloudは、安全で暗号化されたトークンで接続します。 このトークンはAnalytics Cloudによって生成され、Liferay DXPの構成に追加する必要があります。 接続すると、同期するデータを決定できます。 お使いのLiferay DXPのバージョンによって、プロセスが異なります。

1. Analytics Cloudにログインし、ワークスペースを選択します。

   初めてログインする場合は、オンボーディングガイドが表示されます。 ［**Next**］ をクリックし、Analytics Cloudのトークンをコピーします。

   ![最初にログインしたときにオンボーディングガイドが表示されます。](./connecting-liferay-dxp-to-analytics-cloud/images/08.png)

   または、 ［**設定**］ &rarr; ［**データソース**］ 下でトークンを見つけることができます。 ［**データソースを追加**］ をクリックし、 **Liferay DXP** を選択し、Analytics Cloud のトークンをコピーします。

1. Liferay DXPインスタンスにログインします。

1. **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブを開き、 ［**インスタンスの設定**］ をクリックします。

1. プラットフォーム下で、 ［**Analytics Cloud**］ をクリックします。

1. Analytics Cloudのトークンを貼り付け、 ［**Connect**］ をクリックします。

   ![トークンを貼り付け、［接続］をクリックします。](./connecting-liferay-dxp-to-analytics-cloud/images/09.png)

   ```{note}
   Liferay DXP 7.0では、Analytics Cloud Adminは、*［設定］* &rarr; *［Analytics Cloud］*の下にあります。
   ```

1. 以下のメッセージが表示されることを確認します。

   `Success: Your request completed successfully`

これで、LiferayインスタンスがAnalytics Cloudに接続されました。 次のステップは、Liferayサイトと連絡先の同期です。

### サイトの同期

サイトを同期するには、プロパティを作成し、1つまたは複数のサイトに関連付ける必要があります。 Analytics Cloudは、お客様のプロパティの定義方法に従ってデータを集約します。 この例では、1つのサイトが1つの物件と関連付けられている簡単な設定を示しています。 複数のサイトを持つプロパティの定義について詳しくは、 [プロパティを使用したスコープサイトと個人](../workspace-settings/scoping-sites-and-individuals-using-properties.md)をご覧ください。

1. Analytics Cloudで、 ［**設定**］ &rarr; ［**プロパティ**］ に移動します。

1. ［**新規プロパティ**］ をクリックし、ラベルを入力します(例：Minium Site）。

1. DXP インスタンスで、 **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png))から ［**コントロールパネル**］ タブを開き、 ［**インスタンスの設定**］ をクリックします。

1. プラットフォーム下で、 ［**Analytics Cloud**］ をクリックします。

1. ［**サイトを選択**］ をクリックします。

1. 利用可能なプロパティ下にある新規プロパティを選択します。

1. 同期させたいサイトを選択し、 ［**Done**］ をクリックします。

   ![同期させたいサイトを選択します。](./connecting-liferay-dxp-to-analytics-cloud/images/10.png)

   以下のメッセージが表示されることを確認します。

   `Success: Your request completed successfully`

### 連絡先の同期

1. DXP インスタンスで、 **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png))から ［**コントロールパネル**］ タブを開き、 ［**インスタンスの設定**］ をクリックします。

1. プラットフォーム下で、 ［**Analytics Cloud**］ をクリックします。

1. ［**連絡先を選択**］ をクリックします。

1. 連絡先の同期オプション下で、 ［**連絡先を同期**］ をクリックします。 ［**Sync All**］ に切り替え、すべての連絡先を同期します。 また、連絡先のサブセットを同期させたい場合は、 ［**ユーザーグループごとに同期する**］ または ［**組織ごとに同期**］ をクリックしてください。

   ```{important}
   Analytics Cloudは、個々の連絡先データを同期して管理するためのツールを提供します。 ただし、これらのツールは、プライバシー規制(GDPRなど）の遵守を保証するものではありません。 お客様は、お客様のサイトが個人データを保存し処理する場所で、プライバシー法を遵守するために必要な慣行および構成を慎重に決定する必要があります。
   ```

1. ［**保存して次へ**］ をクリックします。

1. ［**連絡先**］ タブと ［**ユーザー**］ タブを切り替えて、同期するフィールドを選択します。 Liferay DXPでは、連絡先データを2つの別々のテーブル(ContactとUser）に保存します。 Analytics Cloudでは、いくつかのフィールドを同期する必要があり、それらはグレーで表示されます。

   ![リストから同期させたいフィールドを選択します。](./connecting-liferay-dxp-to-analytics-cloud/images/11.png)

1. ［**保存**］ をクリックします。

   以下のメッセージが表示されることを確認します。

   `Success: Your request completed successfully`

これですべての設定が完了しました。 ユーザーがサイトにアクセスしてエンゲージすると、Analytics Cloudは何が起こっているのかを追跡し始めます。 それが発生した場合、[アナリティクス ダッシュボードの表示](./viewing-the-analytics-dashboard.md)に進み、トラッキングされるさまざまな連携を確認することができます。
