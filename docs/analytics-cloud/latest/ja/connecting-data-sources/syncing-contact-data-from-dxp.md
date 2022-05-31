# DXPから連絡先データを同期する

[LiferayDXPインスタンスをAnalyticsCloud](connecting-liferay-dxp-to-analytics-cloud.md)に接続した後、連絡先データの同期を開始できます。 Liferay DXPの最新リリースでは、連絡先データからAnalytics Cloudに同期するフィールドを細かくコントロールすることができます。

```{note}
同期するコンタクトフィールドを選択する機能は、以下のリリース以降で利用できます。
     * Liferay 7.3 フィックスパック 1
     * Liferay 7.2 フィックスパック 9
     * Liferay 7.1 フィックスパック 20
     * Liferay 7.0 フィックスパック 97
```

## 連絡先データの初期同期

1. Liferay DXPインスタンスで、 *［コントロールパネル］* → *［インスタンス設定］* → *［Analytics Cloud］*に移動します。

1. *［連絡先を選択］*をクリックします。

1. *［連絡先の同期］*をクリックします。

1. スイッチを使って、 _［Sync All］_を有効にします。 また、連絡先の一部だけを同期させたい場合は、［Sync by User Groups］または［Sync by Organization］をクリックしてください。

      ![すべての連絡先を同期したり、グループや組織を同期することができます。](./syncing-contact-data-from-dxp/images/01.png)

      *［Save and Next］* ボタンをクリックします。

1. Liferay DXPでは、連絡先データを2つの別々のテーブル（ContactとUser）に保存します。 ［Contact］タブと［User］タブを切り替えて、同期するフィールドを選択します。 Analytics Cloudでは、いくつかのフィールドを同期する必要があり、それらはグレーで表示されます。

      ![連絡先に同期するフィールドを選択します。](./syncing-contact-data-from-dxp/images/02.png)

      なお、ユーザー用に作成されたカスタムフィールドは、すべて同期に利用できます。 詳細は、[ユーザーにカスタムフィールドを追加する](https://learn.liferay.com/dxp/latest/en/users-and-permissions/users/adding-custom-fields-to-users.html)を参照してください。

      選択後、ページ下部にある *［保存］* ボタンをクリックします。

## 連絡先データフィールドの同期を変更する

1. Liferay DXPインスタンスの *［コントロールパネル］* &rarr; *［インスタンス設定］* &rarr; *［Analytics Cloud］* &rarr; *［Synced Contact Data］* に移動します。

      ![コントロールパネルの［同期された連絡先データ］セクションに移動します。](./syncing-contact-data-from-dxp/images/03.png)

1. _［Sync Data Fields］_をクリックします。

1. 修正して、*［保存］*ボタンをクリックします。
