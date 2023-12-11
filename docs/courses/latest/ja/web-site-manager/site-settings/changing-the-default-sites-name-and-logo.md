# デフォルトのサイト名とロゴを変更する

あなたのLiferayインスタンスは、"Liferay"（フレンドリーURLは`/guest`）と呼ばれるデフォルトのサイトと一緒に出荷されます。 このサイトはインスタンスのデフォルトのランディングページであるため、その詳細はインスタンスの設定に直接結びついている。

ここで、このサイトをクラリティの新しい公開サイトとして再利用します。

## サイトのロゴを変更する

カイル・クライン（Kyle Klein）としてログインし、 [インスタンスの管理者](https://learn.liferay.com/w/courses/liferay-administrator/users-accounts-organizations/managing-users#create-an-administrator) 、インスタンスの設定を変更できるようにします。

1. Liferayインスタンスにアクセスし、Kyle Kleinとしてログインします。

1. 画面上部のグローバルメニュー（[アプリケーションメニュー](../../images/icon-applications-menu.png)）を開き、_コントロールパネル_ &rarr; _インスタンス設定_ をクリックします。

1. インスタンス設定]ページで、[_インスタンス設定_]をクリックします。

   ![The default site's name and logo are set on the Instance Configuration screen.](./changing-the-default-sites-name-and-logo/images/01.png)

1. Clarityサイトのロゴをダウンロードして解凍します：

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/web-site-manager/site-settings/liferay-v6j4.zip -O
   ```

   ```bash
   unzip liferay-v6j4.zip
   ```

1. インスタンス構成ページで、_ロゴ変更_ボタン( ![アイコン変更](../../images/icon-change.png) )をクリックします。

1. ポップアップ・モーダルでダウンロードした画像（`ClarityLogo.png`）をアップロードし、_Done_をクリックします。

   ![Use the pop-up modal to upload the Clarity logo.](./changing-the-default-sites-name-and-logo/images/02.png)

1. ［_Save_］をクリックします。

## サイト名の変更

デフォルトの "Liferay "を適切なサイト名に変更してください。

1. インスタンス構成で、_全般_ スコープをクリックします。

   ![Click the General scope to change the site's name.](./changing-the-default-sites-name-and-logo/images/03.png)

1. *Name*フィールドに*Clarity*と入力する。

## その他の重要なインスタンス設定の変更

また、ホームURLとメールドメインも、あなたのサイトにより適切な用語に変更する必要がある。

1. 同じ一般設定ページで、_Mail Domain_ フィールドのドメインを `clarityvisionsolutions.com` に変更します。

1. *Home URL*フィールドに`/web/p`と入力する。

   次の演習でサイトのフレンドリーURLを変更するので、インスタンスが変更に伴ってユーザーを正しくリダイレクトするように、ホームURLを今すぐ変更してください。

1. ページ下部の_保存_をクリックします。

これで、サイトの一般的な詳細がクラリティ・ブランドを適切に反映するようになりました。 デフォルトのホームページ（セルフホストまたはDockerインスタンスの場合、`localhost:8080/web/guest`）を再訪問して変更を確認する。

![The default home page now has the Clarity name and logo.](./changing-the-default-sites-name-and-logo/images/05.png)

このサイトのURLはまだクラリティに適合していない。 次に、 [、サイト](./changing-your-public-sites-settings.md) の設定を変更する。

## 関連コンセプト

* [インスタンス構成](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/virtual-instances/instance-configuration) 
