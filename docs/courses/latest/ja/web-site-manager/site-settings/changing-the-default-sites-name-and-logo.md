# デフォルトのサイト名とロゴを変更する

あなたのLiferayインスタンスは、"Liferay"（ `/guest` をフレンドリーURLとする）と呼ばれるデフォルトのサイトと一緒に出荷されます。 このサイトはインスタンスのデフォルトのランディングページであるため、その詳細はインスタンスの設定に直接結びつきます。

ここで、このサイトをクラリティの新しい公開サイトとして再利用します。

## サイトのロゴを変更する

カイル・クライン（Kyle Klein）としてログインし、 [インスタンスの管理者](https://learn.liferay.com/w/courses/liferay-administrator/users-accounts-organizations/managing-users#create-an-administrator) 、インスタンスの設定を変更できるようにします。

1. Liferayインスタンスにアクセスし、Kyle Kleinとしてログインします。

1. 画面上部のグローバルメニュー（ ![Applications menu](../../images/icon-applications-menu.png) ）を開き、 **コントロールパネル** &rarr; **インスタンス設定** をクリックします。

1. インスタンス設定ページで、 **インスタンス設定** をクリックします。

   ![デフォルトのサイト名とロゴは、インスタンス構成画面で設定します。](./changing-the-default-sites-name-and-logo/images/01.png)

1. Clarityサイトのロゴをダウンロードして解凍します：

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/liferay-v6j4.zip -O
   ```

   ```bash
   unzip liferay-v6j4.zip
   ```

1. インスタンス構成ページで、 **Change Logo** ボタン( ![Change icon](../../images/icon-change.png) )をクリックします。

1. ダウンロードした画像 (`ClarityLogo.png`) をポップアップ・モーダルにアップロードし、 **完了** をクリックします。

   ![ポップアップモダールを使用してClarityロゴをアップロードします。](./changing-the-default-sites-name-and-logo/images/02.png)

1. ［**Save**］ をクリックします。

## サイト名の変更

デフォルトの "Liferay "を適切なサイト名に変更してください。

1. インスタンス構成]で、 [**全般**] スコープをクリックします。

   ![サイトの名前を変更するには、 [全般]スコープをクリックします。](./changing-the-default-sites-name-and-logo/images/03.png)

1. **Name** フィールドに、 **Clarity** と入力する。

## その他の重要なインスタンス設定の変更

また、ホームURLとメールドメインも、あなたのサイトにより適切な用語に変更する必要がある。

1. 同じ一般設定ページで、 **メールドメイン** フィールドのドメインを `clarityvisionsolutions.com`に変更します。

1. **Home URL** フィールドに `/web/p` と入力する。

   次の演習でサイトのフレンドリーURLを変更するので、インスタンスが変更に伴ってユーザーを正しくリダイレクトするように、ホームURLを今すぐ変更してください。

1. ページの下部にある ［**保存**］ をクリックします。

これで、サイトの一般的な詳細がクラリティ・ブランドを適切に反映するようになりました。 デフォルトのホームページ（`localhost:8080/web/guest`、セルフホストまたはDockerインスタンスの場合）を再訪問して変更を確認する。

![デフォルトのホームページには、クラリティの名前とロゴが表示されるようになりました。](./changing-the-default-sites-name-and-logo/images/05.png)

というのも、このサイトのURLはまだクラリティに適合していないからだ。 `/guest`。 次に、 [、サイト](./changing-your-public-sites-settings.md)の設定を変更する。

## 関連コンセプト

* [インスタンス設定](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/virtual-instances/instance-configuration)
