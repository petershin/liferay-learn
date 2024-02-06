# Liferay Cloudサービスへのログイン

デフォルトでは、非本番環境(uatなど）でLiferayとInfrastructureサービスのWebインターフェースにアクセスするには、ログインが必要です。 通常、ログイン認証情報は最初のオンボーディングメールに記載されていますが、Liferay Cloud Consoleにも記載されています。

## ログイン資格情報の検索

1. **infra** 環境に移動します。

1. 左メニューの「**設定**」 をクリックします。

1. **Secrets** タブをクリックします。

1. **lcp-secret-ci-customer-user** と **lcp-secret-ci-customer-password** シークレットをクリックしてアクセスする。

   ![lcp-secret-ci-customer-user および lcp-secret-ci-customer-password シークレットには、お客様のログイン認証が含まれています。](./logging-into-your-liferay-cloud-services/images/01.png)

1. 各シークレットのページで **View** をクリックすると、値が表示されます。 明らかになった値をクリックすると、クリップボードにコピーされます。

   ![表示］をクリックすると、秘密の値が表示されます。](./logging-into-your-liferay-cloud-services/images/02.png)

## ログイン

1. 選択した環境(dev、uatなど）にナビゲートします。

1. ページ上部の「**サイト訪問**」をクリックします。

   ![Visit Siteドロップダウンには、環境内のLiferayインスタンスで利用可能なエンドポイントがすべてリストアップされます。](./logging-into-your-liferay-cloud-services/images/03.png)

   ドロップダウンメニューには、 `liferay` サービスのエンドポイント(デフォルトの `Web サーバ` サービスのエンドポイント、および環境に追加したカスタムドメインを含む）がすべて表示されます。

1. 目的のエンドポイントをクリックして、対応するURLでLiferayインスタンスにアクセスできます。

1. プロンプトが表示されたら、Liferay Cloud [Jenkins のユーザー名とパスワード](#locating-login-credentials) を入力します。

   ![表示されるポップアップで認証する。](./logging-into-your-liferay-cloud-services/images/04.png)

ログインすると、ユーザーはLiferay DXP 7.xインスタンス(この例ではLiferay DXP 7.2 GA1）へリダイレクトされます。

![ログイン後、環境のLiferay DXPインスタンスに移動します。](./logging-into-your-liferay-cloud-services/images/05.png)

### デフォルトのサービスURLの検索

デフォルトの `ウェブサーバー` のエンドポイントの URL は、そのサービスページで確認できます。 `ウェブサーバー` のロゴをクリックすると、その URL が展開されます：

![サービスのロゴがクリック可能なURLに展開されます。](./logging-into-your-liferay-cloud-services/images/06.png)

この方法でLiferayにアクセスする際には、 [Jenkinsログイン資格情報](#locating-login-credentials) が必要です。

同様の手順で、Jenkins CIのWebインターフェイスにもアクセスできます。 Jenkins URLを見つけるには、`infra`環境にある`ci`サービスに移動します：

![CIサービスには、Jenkins CIのWebインターフェースのURLが記載されています。](./logging-into-your-liferay-cloud-services/images/07.png)

## 関連トピック

* [Liferay DXPサービスの使用](../customizing-liferay-dxp-in-the-cloud.md)
* [継続的インテグレーション](../platform-services/continuous-integration.md)
* [Webサーバーサービス](../platform-services/web-server-service.md)
