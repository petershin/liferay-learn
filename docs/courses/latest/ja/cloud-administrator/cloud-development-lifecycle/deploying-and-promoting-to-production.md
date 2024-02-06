# プロダクションへのデプロイとプロモート

Kyle が Liferay Cloud を使って開発に取り組み始めると、彼はシンプルなウィジェットモジュールをデプロイしてプロモートすることで、最初の完全なデプロイプロセスを経験します。

ここでは、サンプルウィジェットをデプロイしてテストし、プロセス全体を説明します。

## 新しいコードのプッシュアップ

新しいシンプルなウィジェットを含むサンプルモジュールをダウンロードして、Liferay Cloud 環境にデプロイします。

1. プロジェクトリポジトリの `liferay/` ディレクトリでコマンドプロンプトを開きます。

1. サンプルのソースコードをダウンロードし、 `modules/` フォルダーに解凍します。

    ```bash
    curl https://resources.learn.liferay.com/courses/latest/en/cloud-administrator/cloud-development-lifecycle/liferay-e3v7.zip -O
    ```

    ```bash
    unzip liferay-e3v7.zip -d modules/
    ```

1. ソースコードをコミットし、GitHubのリモートリポジトリにプッシュします。

    ```bash
    git add modules
    ```

    ```bash
    git commit -m "Add a simple module to push to production."
    ```

    ```bash
    git push origin [branch_name]
    ```

`infra` 環境はプッシュから新しいビルドを作成し、それが完了したら Liferay Cloud コンソールからデプロイできます。

## UATへのデプロイ

次に、ビルドをテスト用のUAT環境にデプロイする。

```{note}
UATにデプロイするか、別の`dev`環境にデプロイするかは、サブスクリプションとあなた自身のワークフローに依存します。 自動デプロイを設定すると、最初の環境への手動デプロイを省略できます。
```

1. Liferay Cloud コンソールで、画面上部の **Builds** をクリックします。

1. プッシュから新しいビルドを見つけ、 **Deploy build to...をクリックする。**

   ![Buildsページでビルドを見つけ、UATにデプロイします。](./deploying-and-promoting-to-production/images/01.png)

1. **Environment** ドロップダウンメニューから、UAT環境を選択します。

1. チェックボックスをクリックして、配備の影響を確認します。

   ![環境を選択してチェックボックスをクリックすると、Deploy Buildボタンが表示されます。](./deploying-and-promoting-to-production/images/02.png)

1. ［**Deploy Build**］ をクリックします。

UAT環境のサービスが再起動し、バックアップされると、サンプルモジュールがLiferayインスタンスにデプロイされます。

## UAT環境へのアクセス

次に、手動で新しいウィジェットをテストし、正しく動作することを確認します。

1. `infra` 環境に移動します。

1. 画面左側の **Settings** をクリックします。

1. **Secrets** タブを選択。

1. `lcp-secret-ci-customer-user` secretをクリックする。

   ![lcp-secret-ci-customer-user secretには、UATインスタンスにアクセスするために必要なユーザー名が含まれています。](./deploying-and-promoting-to-production/images/03.png)

1. **View** をクリックして、UATインスタンスにログインするために必要なシークレット値を確認します。

   ![秘密の値を表示し、確認するには「表示」をクリックします。](deploying-and-promoting-to-production/images/04.png)

    ```{tip}
    デフォルトのユーザー名は `customer` である。
    ```

1. 秘密のリストに戻るには、戻る矢印をクリックします。

1. `lcp-secret-ci-customer-password` secretをクリックする。

1. **View** 。 値そのものをクリックすると、クリップボードにコピーできます。

1. UAT環境に移動します。

1. ページ上部の **Visit Site** をクリックしてください。

1. 認証情報の入力を求められたら、 `lcp-secret-ci-customer-user` 、 `lcp-secret-ci-customer-password` 、それぞれシークレットから見つけたユーザー名とパスワードを入力する。

これでログインに成功し、UAT Liferayインスタンスにアクセスできました。

## 受け入れテスト

次に、新しいウィジェットが正しく動作するかテストしてください。

1. デフォルトの [管理者アカウントの概要](https://learn.liferay.com/web/guest/w/dxp/getting-started/introduction-to-the-admin-account) 。

1. ページ上部の編集アイコン( ![edit icon](../../images/icon-edit.png) )をクリックすると、ウィジェットのリストにアクセスできます。

1. フラグメントとウィジェットのサイドバーから、 **ウィジェット** タブをクリックします。

1. 下にスクロールして、 **サンプル** セクションを展開し、新しいウィジェット **E3V7 ウィジェット** を見つける。

    ![E3V7ウィジェットは、追加したサンプルモジュールの新しいウィジェットです。](./deploying-and-promoting-to-production/images/05.png)

1. ページ上の任意の場所にドラッグして、どのように見えるか確認してください。 サンプルウィジェットはシンプルなテキストを表示します。

ウィジェットが動作していることを確認したら、引き続きビルドを本番環境に昇格させます。

## 本番環境へのデプロイ

カイルは、製作を進める前にマネージャーのマーカスの承認を得る必要がある。 承認されれば、計画されたダウンタイム中に、同じビルドを本番環境に導入することができる。

ビルドがテスト工程を通過したので、本番環境にデプロイする。

1. Liferay Cloud コンソールで **Builds** をクリックします。

1. 先ほどと同じビルドをリストから選び、 **Deploy build to...をクリックする。**

1. **Environment** ドロップダウン・メニューで、本番環境を選択します。

1. チェックボックスをクリックして、配備の影響を確認します。

1. ［**Deploy Build**］ をクリックします。

本番環境のサービスは、ビルドから新たに追加されたもので再起動する。 サービスが復旧したら、本番環境の Liferay インスタンスにアクセスして、新しいウィジェットが表示されるのを確認できます。

Next: [自動デプロイメント](./setting-up-automatic-deployment.md) を設定し、開発ワークフローをスピードアップする。

## 関連概念

* [Liferay Cloud 導入ワークフローの概要](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow)
* [Liferayサービスへのデプロイ](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/deploying-to-the-liferay-service)
* [Liferay Cloud Consoleを使った変更のデプロイ](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console)
* [Liferay Cloudサービスへのログイン](https://learn.liferay.com/w/liferay-cloud/getting-started/logging-into-your-liferay-cloud-services)
