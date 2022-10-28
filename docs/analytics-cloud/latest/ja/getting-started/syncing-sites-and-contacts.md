# サイトと連絡先の同期

これで、 [Liferay DXP を Analytics Cloud](./connecting-liferay-dxp-to-analytics-cloud.md)に接続したので、サイトと連絡先を同期する時が来ました。

```{note}
Liferay DXPを初めて使う場合、Analytics Cloudがトラッキングを開始するためのLiferayインスタンス上のコンテンツはそれほど多くありません。 デモサイトを立ち上げてAnalytics Cloudを学びたい場合は、Liferay Commerceの【Minium Accelerator Site】（https://learn.liferay.com/commerce/latest/en/starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.html）を使ってサンプルコンテンツを生成することを検討してみてください。 
```

## サイトの同期

サイトを同期させるための最初のステップは、新しいプロパティを作成することです。 プロパティは、1つのLiferayサイトまたは複数のLiferayサイトに関連するラベルです。 Analytics Cloudは、お客様がプロパティを定義する方法に従ってデータを集計します。 この例では、1つのサイトが1つのプロパティに関連付けられている簡単な設定を示しています。 複数のサイトを持つプロパティの定義について詳しくは、 [Scoping Sites and Individual Using Properties](../workspace-settings/scoping-sites-and-individuals-using-properties.md)をご覧ください。

1. Analytics Cloudで、 _Settings_ &rarr; _Properties_に移動します。 _New Property_ をクリックし、ラベルを入力します。 (Minium Siteなど）。

2. Liferay DXPインスタンスで、Global Menu (![Global Menu](../images/icon-applications-menu.png)) を開いてください。 _Configuration_ &rarr; _Instance Settings_に移動します。 _Platform_の下で、 _Analytics Cloud_をクリックします。 _サイトを選択_をクリックします。

3. 作成したプロパティは、「利用可能なプロパティ」の下に表示されます。 プロパティの名前をクリックします。 次のページで、同期したいサイトを選択し、 _Done_をクリックします。

   ![同期したいサイトと、利用可能なサイトのリストを選択します。](./syncing-sites-and-contacts/images/02.png)

   シンクに成功すると、画面の左下にこのメッセージが表示されます。

    `Success: Your request completed successfully`

## 連絡先の同期

次に、Liferayインスタンスにある既存の連絡先を同期させます。

```{important}
Analytics Cloudには、個々のコンタクトデータを同期して管理するためのツールが用意されています。 ただし、ここで説明するツール、およびドキュメントの他の場所で説明するツールは、プライバシー規制（GDPRなど）への対応を直接目的としたものを含め、これらのプライバシー規制への準拠を保証するものではありません。 個人情報を取り扱うウェブサイトを運営する企業や個人は、個人情報保護法の適用を受け、その遵守に必要な措置を慎重に判断する必要があります。
```

1. Liferay DXPインスタンスで、Global Menu (![Global Menu](../images/icon-applications-menu.png)) を開いてください。 _Configuration_ &rarr; _Instance Settings_に移動します。 _Platform_の下で、 _Analytics Cloud_をクリックします。 _［連絡先を選択］_をクリックします。

1. 連絡先同期オプションで、 _連絡先同期_をクリックします。 _Sync All_ を有効にすると、すべての連絡先を同期させることができます。 また、連絡先のサブセットを同期させたい場合は、 _ユーザーグループによる同期_ または _組織による同期_ をクリックします。 _保存して次へ_をクリックします。

1. Liferay DXPでは、連絡先データを2つの別々のテーブル（ContactとUser）に保存します。 _Contact_ タブと _User_ タブを切り替えて、同期するフィールドを選択します。 Analytics Cloudは一部のフィールドを同期する必要があるため、それらはグレーアウトされています。 この例では、デフォルトの選択のままにしておきます。 _［保存］_ をクリックします。

    ![リストからシンクしたいフィールドを選択します。](./syncing-sites-and-contacts/images/03.png)

    シンクに成功すると、画面の左下に次のようなメッセージが表示されます。

    `Success: Your request completed successfully`

素晴らしい！これで準備は万端です。 ユーザーがサイトを訪問して操作すると、Analytics Cloudは何が起こっているかの追跡を開始します。 そうしたら、 [Viewing the Analytics Dashboard](././viewing-the-analytics-dashboard.md) に飛び込んで、追跡されるさまざまなインタラクションを確認することができます。
