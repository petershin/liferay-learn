# インスタンス設定の構成

Liferayインスタンスは同じインストールを共有しますが、異なるドメイン名からユニークなデジタル体験を提供するように構成されています。 各インスタンスには独自の設定がある。

ここでは、前のステップで作成した仮想インスタンスのユーザー認証設定を行います。 `glance.clarityvisionsolutions.com`の場合、クラリティ ビジョン ソリューションズは、ゲストがユーザー アカウントを作成できないようにします。 その代わりに、IT管理者が各従業員のアカウントを作成する。

## ユーザー認証の設定

1. 前のステップで作成した `glance.clarityvisionsolutions.com` インスタンスに移動します。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Instance Settings** に移動する。 **Platform** の下で、 **User Authentication** を選択する。

1. **Allow strangers to create accounts** というラベルのついたボックスのチェックを外す。

   ![見知らぬ人がアカウントを作成できるようにする」のチェックが外れている。](./configuring-instance-settings/images/01.png)

   現在、ゲストは新しいユーザーアカウントを作成することができません。

次のステップは、 [サーバー管理と電子メール](./server-administration-and-email.md)。

## 関連コンセプト

- [インスタンス設定](https://learn.liferay.com/ja/w/dxp/system-administration/configuring-liferay/virtual-instances/instance-configuration)
