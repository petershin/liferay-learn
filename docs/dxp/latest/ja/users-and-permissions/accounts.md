---
toc:
  - ./accounts/account-users.md
  - ./accounts/account-addresses.md
  - ./accounts/account-groups.md
  - ./accounts/account-roles.md
  - ./accounts/account-management-widget.md
  - ./accounts/using-workflow-with-accounts.md
  - ./accounts/channel-defaults.md
---
# アカウント

{bdg-secondary}`7.4以降で利用可能`

アカウントは、管理者が様々な商取引やビジネスのニーズに合わせてユーザーを整理・管理するための手段です。 [組織](./organizations.md) または [ユーザーグループ](./user-groups.md)とは異なり、アカウントは、商品やサービスの購入や既存の顧客の管理などのビジネス状況で発生する可能性のある対話を容易にするのに役立ちます。

アカウントの種類には、 **ビジネス** 、 **パーソン** 、 **ゲスト** の3種類があります。 ビジネスアカウントでは、1つのアカウントに複数のユーザーを関連付けることができます。 個人タイプのアカウントは、1つのアカウントにしか関連付けられません。 ゲストタイプのアカウントは、登録されていないユーザーがあなたのビジネスやサイトを利用できる手段を与えます。

```{note}
アカウントは、もともと [アカウント管理](https://learn.liferay.com/commerce/latest/ja/users-and-accounts/account-management.html) に搭載されていた機能で、現在はLiferay DXP 7.4以上に搭載されています。
```

## アカウントの作成

1. **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **アカウント** に移動します。

1. ［**追加**］ アイコン (![Add icon](../images/icon-add.png)) をクリックして、新しいアカウントを作成します。

1. アカウントに名前をつけ、タイプを選択します。 なお、一度作成したアカウントは、種類を変更することはできません。

   ![アカウントに名前をつけ、タイプを選択します。](./accounts/images/01.png)

1. Tax IDや説明など、アカウントの追加情報を追加します。 ［**保存**］ をクリックすると、新しいアカウントが作成されます。

1. アカウントを作成すると、ページの上部にタブが表示されます。

   ![アカウントを作成すると、新しいタブが表示されます。](./accounts/images/02.png)

### ［詳細］タブ

［Details］タブには、アカウント名やタイプなど、アカウントに関する主な情報が表示されます。 また、デフォルトの請求先住所と配送先住所もここで設定できます。 [カテゴリー](../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) または [カスタムフィールド](../system-administration/configuring-liferay/adding-custom-fields.md) を追加して、アカウントをさらにカスタマイズすることもできます。

### アドレスタブ

［Addresses］タブには、アカウントに関連するさまざまなアドレスが表示されます。 新しいアドレスを追加するには、［追加］アイコンをクリックします（![Add icon](../images/icon-add.png)）。 住所情報を入力し、 ［**保存**］ ボタンをクリックします。

![アドレス情報を入力し、［保存］をクリックします。](./accounts/images/03.png)

詳しくは、 [アカウントアドレス](./accounts/account-addresses.md) をご覧ください。

### ユーザータブ

ユーザー］タブには、アカウントに関連するさまざまなユーザーが表示されます。 なお、個人タイプのアカウントやゲストタイプのアカウントにはこのタブはありません。 ユーザーをアカウントに関連付けるには

1. **追加** アイコンをクリックします（![Add icon](../images/icon-add.png)）。 選択可能なアカウントユーザーのリストがウィンドウに表示されます。

1. ユーザー名の横にあるボックスにチェックを入れてユーザーを選択し、 **Assign** ボタンをクリックします。

1. また、このビューから新しいユーザーを作成することができます。 **Add** アイコン (![Add icon](../images/icon-add.png)) をクリックすると、新規ユーザー追加ページが表示されます。

1. 新しいユーザーの情報を入力し、「**Save**」ボタンをクリックします。

1. アカウントに作成または関連付けられた新しいユーザーは、ユーザータブに表示されます。 詳しくは、 [アカウントユーザー](./accounts/account-users.md) をご覧ください。

### 組織タブ

組織」タブには、アカウントに関連するさまざまな組織が表示されます。 組織を関連付けるには、 ［**追加**］ アイコンをクリックします（![Add icon](../images/icon-add.png)）。 関連付ける組織を選択し、「**Assign**」 ボタンをクリックします。

### ［アカウントグループ］タブ

［アカウントグループ］タブには、アカウントのさまざまなグループメンバーシップが表示されます。 これらのグループの作成や管理については、 [アカウントグループ](./accounts/account-groups.md)を参照してください。

### ［ロール］タブ

役割］タブには、そのアカウントで利用できるさまざまな役割が表示されます。 なお、ゲストタイプのアカウントにはこのタブはありません。

アカウントロールを作成するには

1. **追加** アイコンをクリックします（![Add icon](../images/icon-add.png)）。

1. 次のページで、その役割にタイトルと説明をつけてください。 ［**保存**］ をクリックします。

1. ロールを作成すると、権限を定義し、ユーザーを割り当てることができます。 **Define Permissions** タブをクリックし、役割の権限を選択します。

1. **Assignees** タブをクリックし、役割にユーザーを割り当てます。 **追加** アイコン (![Add icon](../images/icon-add.png)) をクリックしてユーザーを選択し、 **割り当て** ボタンをクリックします。

詳しくは、 [アカウントのロール](./accounts/account-roles.md) をご覧ください。

## アカウントの変更

1. 編集したいアカウントの **アクション** アイコン (![Actions icon](../images/icon-actions.png)) をクリックします。

1. 以下のいずれかを選択してください。

   ![アカウントを編集するための選択を行います。](./accounts/images/04.png)

   * Edit - アカウント情報を見て編集します。
   * ユーザーの管理 - アカウントのユーザーを追加または削除します。
   * 組織の管理 - 組織の関連付けを追加または削除します。
   * Deactivate - アカウントを無効化する。
   * Delete - アカウントを削除します。

   Personアカウントタイプでは、Manage Users機能はありません。

1. **Edit** を選択すると、これらのオプションにアクセスできます：

   ![［編集］を選択すると、より多くのオプションが表示されます。](./accounts/images/02.png)

   * 詳細タブ - アカウントの追加情報を修正または追加します。
   * ［Addresses］タブ - 請求書送付先や配送先の住所を追加・管理します。
   * ユーザータブ-アカウントユーザーの追加・削除を行います。 詳細は、 [アカウントユーザー](./accounts/account-users.md) を参照してください。
   * 組織」タブ-組織の関連付けを追加または削除します。
   * アカウントグループ」タブ - アカウントが所属しているアカウントグループを表示します。 詳細については、 [アカウントグループ](./accounts/account-groups.md) を参照してください。
   * 役割」タブ - アカウントのさまざまな役割を追加または管理します。 詳しくは、 [アカウントのロール](./accounts/account-roles.md) を参照してください。

## 関連情報

* [アカウントユーザー](./accounts/account-users.md)
* [アカウントアドレス](./accounts/account-addresses.md)
* [アカウントグループ](./accounts/account-groups.md)
* [アカウントロール](./accounts/account-roles.md)
* [アカウント管理ウィジェット](./accounts/account-management-widget.md)
* [アカウントでワークフローを使用する](./accounts/using-workflow-with-accounts.md)
* [チャンネルのデフォルト](./accounts/channel-defaults.md)
