# 自動デプロイメントの設定

Kyle は Liferay Cloud で開発とテストを始めることができますが、デプロイ後すぐに変更をテストできれば簡単です。

ここでは、新しくプッシュされた変更を UAT 環境に自動的にデプロイするためのブランチを設定します。

## コンフィギュレーションの追加

`LCP_CI_DEPLOY_BRANCH` および `LCP_CI_DEPLOY_TARGET` CI サービス環境変数を使用して、自動デプロイメントを設定します。

1. Liferay Cloud コンソールで、 `infra` 環境に移動します。

1. CIサービスをクリックする。

1. ［**環境変数**］ タブをクリックします。

1. これらの環境変数の値を設定する：

   * **LCP** CI **DEPLOY_BRANCH** : `ライブアップデート`

   * **LCP** CI **DEPLOY_TARGET** : `uat`

   ![これらの環境変数を使用して、CIに自動デプロイのブランチとターゲット環境を知らせる。](./setting-up-automatic-deployment/images/01.png)

1. **Save Changes** をクリックします。

CIサービスは新しい設定で再起動する。 バックアップが完了すると、その時点から `live-update` ブランチ経由で作成されたビルドが、UAT 環境に自動的にデプロイされます。

## 新しいプッシュでテストする

次に、コミットを行い、自動デプロイが正しく機能していることをテストする。

1. プロジェクト・リポジトリでコマンド・プロンプトを開く。

1. `live-update`という新しいブランチを作成し、それに切り替えます。 このブランチを使用して、UAT にプッシュした新しい開発をすぐにデプロイします。

   ```bash
   git checkout -b live-update
   ```

1. 新規ビルドのトリガーとなるダミーファイルを追加してコミットする。

   ```bash
   touch dummy.txt
   ```

   ```bash
   git add dummy.txt
   ```

   ```bash
   git commit -m "First automatic deployment"
   ```

1. 変更をリモートの `live-update` ブランチにプッシュします。

   ```bash
   git push origin live-update
   ```

1. Liferay Cloud コンソールに戻り、 **Deployments** をクリックします。

   ![新しいプッシュは、UAT環境へのデプロイのリストに表示されます。](./setting-up-automatic-deployment/images/02.png)

新しいコミットはデプロイメントのリストに表示され、UAT環境にデプロイされます。

これで、新しい開発や変更をリポジトリから直接デプロイしてテストできるようになりました。

次: [バックアップを使って開発版から変更を戻す練習](./restoring-data-from-a-backup.md).

# 関連コンセプト

* [CIサービスのビルドを自動的にデプロイする](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/automatically-deploying-ci-service-builds)
