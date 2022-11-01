# Liferay DXPをAnalytics Cloudに接続する

セットアップを開始するには、いくつかの要件があります。

1. [liferay.com](https://www.liferay.com) のアカウントが必要です。 Liferayのアカウントを持っていない場合は、 [アカウントを作成する](https://login.liferay.com/signin/register) .

1. [analytics.liferay.com](https://analytics.liferay.com/) に初めてアクセスする場合、アカウントに多要素認証を設定する必要があります。 ヘルプが必要な場合は、 [多要素認証](../workspace-settings/multi-factor-authentication.md) を参照してください。

1. Liferay DXPのインストールは、以下の最低バージョンのいずれかを満たしている必要があります。

    * 7.4（任意のバージョン）
    * 7.3 フィックスパック 1
    * 7.2 フィックスパック 11
    * 7.1 フィックスパック 22
    * 7.0 フィックスパック 98

1. 少なくとも1つのAnalytics Cloudワークスペースにアクセスする必要があります。 なお、Analytics Cloudの有料ユーザーであれば、ログイン時にワークスペースが表示されます。 わからない場合は、 [help.liferay.com](https://help.liferay.com/) から、または <analytics-cloud@liferay.com>からメールでサポートにご連絡ください。

## コネクショントークン

次に、Analytics Cloud トークンを取得し、それを使用して Liferay インスタンスに接続します。 Liferay Analytics CloudとLiferay DXPは、安全な暗号化されたトークンを介して接続します。 Analytics Cloudで生成されるので、Liferay DXPの設定にコピー＆ペーストする必要があります。

1. Analytics Cloudにログインします。 ワークスペースを選択します。 初めてログインする場合は、オンボーディングガイドが表示されます。 **Next** をクリックすると、次の画面でAnalytics Cloudのトークンが表示されます。 コピーアイコン(![copy icon](../images/icon-copy.png))をクリックすると、トークンがクリップボードにコピーされます。

   ![初回ログイン時には、オンボーディングガイドが表示されます。](./connecting-liferay-dxp-to-analytics-cloud/images/01.png)

   オンボーディングガイドをキャンセルした場合は、 **設定** &rarr; **データソース** に移動してください。 **データソースの追加** をクリックします。 **Liferay DXP** を選択すると、Analytics Cloudのトークンが表示されます。 コピーアイコン(![copy icon](../images/icon-copy.png))をクリックすると、トークンがクリップボードにコピーされます。

1. Liferay DXP インスタンスにログインします。 ［グローバルメニュー］（![Global Menu](../images/icon-applications-menu.png)）を開きます。 **Configuration** &rarr; **Instance Settings** に移動します。 **Platform** の下で、 **Analytics Cloud** をクリックします。 フィールドにAnalytics Cloudトークンを貼り付け、 **Connect** をクリックします。

    ![トークンをコピーして、接続ボタンをクリックします。](./connecting-liferay-dxp-to-analytics-cloud/images/02.png)

    ```{note}
    Liferay DXP 7.0 では、Analytics Cloud Admin は *Configuration* &rarr; *Analytics Cloud* の下にあります。
    ```

1. 接続に成功すると、画面の左下に次のようなメッセージが表示されます。

   `Success: Your request completed successfully`

おめでとうございます！あなたのLiferayインスタンスがAnalytics Cloudに接続されました。

次のステップは、Liferayサイトと連絡先の同期です。 [サイトと連絡先の同期](./syncing-sites-and-contacts.md) を参照し、手順に従ってください。
