# プロジェクトにチームメンバーを追加する

MarcusはDelectable Bonsaiプロジェクト全体でLiferay Cloudコンソールにアクセスできるが、彼のスタッフのKyleもアクセスする必要がある。

ここでは、チームメンバーに招待状を送る方法を学びます。

## チーム招待状を送る

カイル・クラインのメールアドレスに招待状を送信して、マーカスがカイル・クラインをチームに加えるのを手伝ってください。

1. Liferay Cloud コンソールで、画面上部のドロップダウンメニューから本番環境を選択します。

1. **Team** をクリックする。

1. チーム」ページで、チームメンバーのEメールアドレス（例：kyle.klein@bonsaisyrup.com）を入力します。

   ![チームページからチームメンバーのメールアドレスに招待状を送信します。](./adding-team-members-to-the-project/images/01.png)

1. [該当する](https://learn.liferay.com/w/liferay-cloud/manage-and-optimize/environment-teams-and-roles#understanding-team-roles) 役割のドロップダウンメニューから、 **Contributor** を選択します。

1. **Send Invite** をクリックする。

Liferay Cloudは、提供されたメールアドレスにプロジェクトに参加するための招待状を送信します。 招待されたチームメンバーがまだコンソールのアカウントを持っていない場合は、招待を受け入れるためにアカウントを作成する必要があります。

このプロセスを他の環境（UATなど）でも繰り返し、チームメンバーが適切な環境すべてにアクセスできるようにします。

```{note}
チームメンバーには、それぞれの環境における役割にふさわしい役割を与えましょう。 例えば、開発者が `dev` 環境ですべてのタスクを処理することを期待されている場合、開発者は管理者ロールを持つべきです。 詳しくは [環境チームと役割](https://learn.liferay.com/w/liferay-cloud/manage-and-optimize/environment-teams-and-roles) を確認してください。
```

Next: [CLIツール](./using-the-cli-tool.md) をインストールし、変更をプッシュして環境にデプロイできるようにする。

## 関連概念

* [環境のチームとロール](https://learn.liferay.com/w/liferay-cloud/manage-and-optimize/environment-teams-and-roles)
