# データベースパスワードのローテーション

Delectable Bonsaiのデータベースセキュリティポリシーは、少なくとも90日ごとにパスワードをローテーションすることです。

ここでは、本番環境のデータベース・パスワードを変更します。

```{important}
データベースの認証情報を変更するには、環境のサービスを再起動する必要があるため、本番環境ではスケジュールされたダウンタイムが必要です。
```

## 手動バックアップの作成

データベースの認証情報を変更する前に、手動でバックアップを作成し、更新後に復元できるようにしてください。

1. Liferay Cloud コンソールで本番環境に移動します。

1. **バックアップ** をクリックする。

1. ［Backups］ページで、 ［**Backup Now**］ をクリックします。

   ![後で復元できる手動バックアップを作成するには、 [今すぐバックアップ]をクリックします。](./rotating-your-database-password/images/01.png)

バックアップが作成されている間、バックアップサービスのコントロールは一時的に使用できません。 バックアップが完了するまで待ってから続行する。

```{warning}
このステップを飛ばさないこと！ 先に進む前にバックアップを作成する必要があります。 データベース・パスワードを変更するには、データベース・サービスを削除して再作成し、データを復元する必要があります。 最初にバックアップを作成しなければ、すべてのデータを失うことになる。 
```

## データベースパスワードの変更

次に、データベースのパスワードを変更する。

1. 画面左側の **Settings** をクリックします。

1. 設定画面で、 **Secrets** タブを選択します。

1. `lcp-secret-database-password` secretの行をクリックする。

   ![lcp-secret-database-password シークレットをクリックして、このシークレットを管理するページにアクセスします。](./rotating-your-database-password/images/02.png)

1. 画面右上の **Edit** をクリックする。

   ![Editをクリックしてシークレット値を変更します。](./rotating-your-database-password/images/03.png)

1. シークレットの編集」ページで、「**値**」 の下にある「**表示**」 をクリックしてシークレットを表示し、値を新しいデータベースパスワードに変更します。

   ```{tip}
   セキュリティ強化のため、強力なパスワードを使用することをお勧めします。 パスワードは簡単に暗記する必要はありません。なぜなら、あなたの環境の管理者は、必要なときにSecretsページからパスワードを取り出すことができるからです。
   ```

1. **Publish secret**（ページ下部）のチェックボックスをチェックし、変更の影響を確認します。

1. **変更の公開** をクリックします。

シークレット値は変更されましたが、データベースサービスはまだ新しいパスワードを使用していません。

## データベースサービスの削除と展開

新しいパスワードを有効にするために、データベースサービスを削除し、再デプロイします。 まず、データのバックアップが取れていることを確認してください！

1. 画面左側の **Services** をクリックする。

1. **Actions**( ![Actions icon](../../images/icon-actions.png) ) をクリックし、 **Delete service** をクリックします。

   ![パスワードの変更を有効にするには、データベースサービスを削除する必要があります。](./rotating-your-database-password/images/04.png)

1. **削除確認** の下のチェックボックスをクリックして、削除の影響を確認します。

   ![すべてのチェックボックスにチェックを入れると、「サービスの削除」ボタンが表示されます。](./rotating-your-database-password/images/05.png)

1. **Delete Service** をクリックする。

1. 画面上部の **Builds** をクリックする。

1. 最新のビルドについては、 **Actions** ![Actions icon](../../images/icon-actions.png) をクリックし、 **Deploy build to... をクリックする。**

1. **Environment** ドロップダウン・メニューから、本番環境を選択します。

1. **配備確認** の下のチェックボックスをクリックして、配備の影響を確認します。

   ![すべてのチェックボックスをクリックすると、Deploy Buildボタンが表示されます。](./rotating-your-database-password/images/06.png)

1. ［**Deploy Build**］ をクリックします。

本番環境のサービスが再起動し、バックアップされると、新しいデータベース・パスワードが使用されます。

## バックアップの復元

サービスが再び稼働したら（ `Ready` ）、事前に作成したバックアップをリストアします。

1. Liferay Cloudコンソールで本番環境に戻ります。

1. 画面左側の **Backups** をクリックします。

1. **アクション**( ![Actions icon](../../images/icon-actions.png) ) をクリックし、 **リストア先... をクリックします。**

   ![データベースサービスが復旧した後、バックアップをリストアする。](./rotating-your-database-password/images/07.png)

1. **Select environment** ドロップダウン・メニューで、本番環境を選択します。

1. チェックボックスをクリックして、リストアプロセスの影響を確認します。

   ![チェックボックスを選択し、バックアップの復元を確定します。](./rotating-your-database-password/images/08.png)

1. **Restore to Environment** をクリックする。

本番環境のサービスが再起動し、バックアップが完了すると、データベースを使用するすべてのサービスが新しいパスワードを使用します。

次へ： [ホットフィックスのインストール手順を説明します](./installing-a-hotfix.md).

## 関連コンセプト

* [データベースパスワードの変更](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/database-service/changing-your-database-password)
* [データベースのユーザー名の変更](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/database-service/changing-your-database-username)
* [データベースサービス(MySQL)](https://learn.liferay.com/web/guest/w/liferay-cloud/platform-services/database-service/database-service)
* [環境変数の定義](https://learn.liferay.com/w/liferay-cloud/reference/defining-environment-variables)
* [シークレットで安全な環境変数を管理](https://learn.liferay.com/w/liferay-cloud/tuning-security-settings/managing-secure-environment-variables-with-secrets)
