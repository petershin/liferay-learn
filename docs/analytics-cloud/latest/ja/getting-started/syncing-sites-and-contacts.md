# サイトと連絡先の同期

これで、 [Liferay DXP を Analytics Cloud](./connecting-liferay-dxp-to-analytics-cloud.md)に接続したので、サイトと連絡先を同期する時が来ました。

```{note}
Liferay DXPを初めて使う場合、Analytics Cloudがトラッキングを開始するためのLiferayインスタンス上のコンテンツはそれほど多くありません。 デモサイトを立ち上げてAnalytics Cloudを学びたい場合は、Liferay Commerceの [Minium Accelerator Site](https://learn.liferay.com/commerce/latest/ja/starting-a-store/using-the-minium-accelerator-to-jump-start-your-b2b-store.html) を使ってサンプルコンテンツを生成することを検討してみてください。 
```

## サイトの同期

サイトを同期させるための最初のステップは、新しいプロパティを作成することです。 プロパティは、1つのLiferayサイトまたは複数のLiferayサイトに関連するラベルです。 Analytics Cloudは、お客様がプロパティを定義する方法に従ってデータを集計します。 この例では、1つのサイトが1つのプロパティに関連付けられている簡単な設定を示しています。 複数のサイトを持つプロパティの定義について詳しくは、 [プロパティを使用したスコープサイトと個人s](../workspace-settings/scoping-sites-and-individuals-using-properties.md)をご覧ください。

1. Analytics Cloudで、 **Settings** &rarr; **Properties** に移動します。 **New Property** をクリックし、ラベルを入力します。 (Minium Siteなど）。

2. Liferay DXPインスタンスで、Global Menu (![Global Menu](../images/icon-applications-menu.png)) を開いてください。 **Configuration** &rarr; **Instance Settings** に移動します。 **Platform** の下で、 **Analytics Cloud** をクリックします。 **サイトを選択** をクリックします。

3. 作成したプロパティは、「利用可能なプロパティ」の下に表示されます。 プロパティの名前をクリックします。 次のページで、同期したいサイトを選択し、 **Done** をクリックします。

   ![同期したいサイトと、利用可能なサイトのリストを選択します。](./syncing-sites-and-contacts/images/02.png)

   シンクに成功すると、画面の左下にこのメッセージが表示されます。

    `Success: Your request completed successfully`

## 連絡先の同期

次に、Liferayインスタンスにある既存の連絡先を同期させます。

```{important}
Analytics Cloudには、個々のコンタクトデータを同期して管理するためのツールが用意されています。 ただし、ここで説明するツール、およびドキュメントの他の場所で説明するツールは、プライバシー規制（GDPRなど）への対応を直接目的としたものを含め、これらのプライバシー規制への準拠を保証するものではありません。 個人情報を取り扱うウェブサイトを運営する企業や個人は、個人情報保護法の適用を受け、その遵守に必要な措置を慎重に判断する必要があります。
```

1. Liferay DXPインスタンスで、Global Menu (![Global Menu](../images/icon-applications-menu.png)) を開いてください。 **Configuration** &rarr; **Instance Settings** に移動します。 **Platform** の下で、 **Analytics Cloud** をクリックします。 ［**連絡先を選択**］ をクリックします。

1. 連絡先同期オプションで、 **連絡先同期** をクリックします。 **Sync All** を有効にすると、すべての連絡先を同期させることができます。 また、連絡先のサブセットを同期させたい場合は、 **ユーザーグループによる同期** または **組織による同期** をクリックします。 **保存して次へ** をクリックします。

1. Liferay DXPでは、連絡先データを2つの別々のテーブル（ContactとUser）に保存します。 **Contact** タブと **User** タブを切り替えて、同期するフィールドを選択します。 Analytics Cloudは一部のフィールドを同期する必要があるため、それらはグレーアウトされています。 この例では、デフォルトの選択のままにしておきます。 ［**保存**］ をクリックします。

    ![リストからシンクしたいフィールドを選択します。](./syncing-sites-and-contacts/images/03.png)

    シンクに成功すると、画面の左下に次のようなメッセージが表示されます。

    `Success: Your request completed successfully`

素晴らしい！これで準備は万端です。 ユーザーがサイトを訪問して操作すると、Analytics Cloudは何が起こっているかの追跡を開始します。 そうしたら、 [アナリティクス ダッシュボードの表示](././viewing-the-analytics-dashboard.md) に飛び込んで、追跡されるさまざまなインタラクションを確認することができます。
