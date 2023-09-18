# サインインの設定

Liferayのサインインウィジェットは設定可能で、あなたが設定したオプションに合わせて調整されます。 前のステップでは、2つの [仮想インスタンス](../../configuration/configuring-virtual-instances.md)を設定しました。 そのうちのひとつは、一般向けの外部ウェブサイトである。 もうひとつは、従業員やパートナー向けの社内イントラネットだ。

ゲストユーザーは、外部サイトにアクセスし、アカウント登録することで、商品の購入、フォーラムへの参加、レシピの投稿など、Delectable Bonsaiと交流することができます。 対照的に、管理者によって登録されたユーザー以外は、内部ウェブサイトにアクセスできないようにする。 このため、2つのサイトで異なる認証を調整する必要がある。

## 公開ウェブサイトでの認証の設定

1. <http://localhost:8080>のメイン（公開）ウェブサイトに移動する。

1. 管理者としてログインし、 [Kyle Klein](../../users-accounts-organizations/managing-users.md)。

1. **グローバルメニュー** &rarr; **インスタンス設定** &rarr; **プラットフォーム** &rarr; **ユーザー認証** .

1. **Allow strangers to create accounts with company email address** 以外のすべてのボックスにチェックが入っていることを確認する。 Delectable Bonsaiは、マーケティング部門のメンバーにのみ公開ウェブサイトのアカウントを持ってもらいたいと考えており、そのアカウントは管理者によって作成されます。

   ![外部サイトでは、すべてのボックスにチェックを入れるのが適切である。](./configuring-sign-in/images/01.png)

1. ［**保存**］ をクリックします。

公共のウェブサイトなので、自分で登録する不謹慎なユーザーは、 **root** や **admin** のようなスクリーンネームをつけることにするかもしれない。 それを防ぐことはできる。

1. 左側の **Reserved Credentials** をクリックします。

1. Screen Names（スクリーン名）]フィールドに、ユーザーにつけさせたくないスクリーン名を1行に1つずつ入力する：
   - 管理者
   - ルート
   - 社長

1. ［**保存**］ をクリックします。

前のステップでユーザーに電子メールの確認を要求したので、見込みのあるユーザーがアクセスできない電子メールアドレスを予約する必要はありません。

これで、公開ウェブサイトの認証が設定されました。 これで社内のウェブサイトに移ることができる。

## 内部ウェブサイトの認証設定

デレクタブルボンサイの社内イントラネットは「ブレックファスト」と呼ばれ、ドメイン名は `breakfast.delectablebonsai.com`。 あなたは、 [前のステップ](../../configuration/configuring-virtual-instances.md)でそれを作成し、カイル・クラインをそのインスタンスの管理者にした。 その指示に従わなかった場合は、今すぐ従ってここに戻ってきてください。

これで、社内イントラネットでの認証を設定できる。

1. ブラウザで <http://breakfast.delectablebonsai.com:8080> にアクセスし、カイル・クラインとしてログインする。

1. **グローバルメニュー** &rarr; **インスタンス設定** &rarr; **プラットフォーム** &rarr; **ユーザー認証** .

1. 今回は、「ユーザーの認証方法」を変更してください。 to **By Screen Name** .

1. **Allow strangers to create accounts** のチェックを外す。

1. ［**保存**］ をクリックします。

![社内ウェブサイトのオプションを設定する。](./configuring-sign-in/images/02.png)

内部ユーザーは、メールアドレスではなく、管理者から与えられたスクリーンネームを使用して認証されます。

これで内部ウェブサイトの認証が設定されました。

次へ [認証ベリファイア](./authentication-verifiers.md)

## 関連コンセプト

[認証の基本](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/authentication-basics)

[ユーザー認証](https://learn.liferay.com/web/guest/w/dxp/system-administration/configuring-liferay/virtual-instances/user-authentication)
