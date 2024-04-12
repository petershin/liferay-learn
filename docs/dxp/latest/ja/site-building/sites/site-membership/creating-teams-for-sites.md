# サイトにチームを作成する

サイト内で同じタスクセット（サイトのウィキコンテンツのモデレート、掲示板スレッドの管理、ブログの執筆、サイト内の特定のページの編集など）を実行するユーザーのグループ（**ad hoc**）がある場合、それらをサイトチームに編成し、様々なサイト固有の機能に対してチームにパーミッションを割り当てることができます。 1つのサイト内で権限を管理するには、サイトチームが望ましい方法である。 サイトチームに割り当てられた権限は、そのサイトのみに適用される。

```{note}
Liferay ポータルインスタンスで複数のサイトや組織で使用するユーザグループのパーミッションを作成・適用するには、ユーザを [ユーザグループ](../../../users-and-permissions/user-groups/creating-and-managing-user-groups.md) に集約し、 [roles](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) を介してユーザグループのパーミッションを割り当てることを検討してください。
```

以下の手順では、これらのトピックについて説明します。

* [サイトにチームを追加する](#adding-a-team-to-a-site)
* [チームにメンバーを追加する](#adding-members-to-a-team)
* [チーム権限の管理](#managing-team-permissions)
* [チームアプリの権限の管理](#managing-team-app-permissions)

## サイトにチームを追加する

1. **Product Menu**(![Product Menu](../../../images/icon-product-menu.png)) を開き、コンパスのアイコン (![Compass Icon](../../../images/icon-compass.png)) &rarr; サイトを選択します。

1. ［**People**］ &rarr; ［**Teams**］ の順に選択します。

    ![製品メニューの「ピープル」メニューからチームを作成します。](./creating-teams-for-sites/images/01.png)

    ```{note}
    ユーザー、組織、ユーザー・グループなど、その他のサイト・メンバーシップ・グループは、「People」の下にある「Memberships」アプリで設定できます。 サイト・メンバーシップがどのように機能するかについては、[サイト・メンバーシップ・タイプの変更](../../site-settings/site-users/changing-site-membership-type.md)を参照してください。
    ```

1. **追加**（![Add Button](../../../images/icon-add.png)） をクリックします。

1. 名前と説明を入力し、 ［**Save**］ をクリックします。 新しいチームがリストに表示されます。

![サイト内にチームを作成すると、チームメンバーが同じリソースにアクセスし、同じ種類のタスクを実行できるようになるため、チームワークとコラボレーションが促進されます。](./creating-teams-for-sites/images/02.png)

## チームにメンバーを追加する

1. チーム名のリンクをクリックします。

1. **追加**（![Add Button](../../../images/icon-add.png)） をクリックします。

1. チームに追加するユーザーを選択し、 **Add** をクリックします。

## チーム権限の管理

1. 新しいサイトの横にある **アクション** をクリックし、![操作](../../../images/icon-actions.png)を選択し、 **Permissions** を選択します。

    ```{note}
    チームにパーミッションを設定すると、チームのメンバー全員にパーミッションが割り当てられます。 チームの権限を管理できるのは、チームを編集/管理できる管理者のみです。
    ```

1. 権限をオン/オフにして、 ［**保存**］ をクリックします。

## チームアプリの権限の管理

また、アプリからチームの権限を管理することもできる。

1. **Product Menu**(![Product Menu](../../../images/icon-product-menu.png)) を開き、サイトのメニュー（例えば掲示板）からアプリを選択します。

1. 画面右上の **オプション**(![Options](../../../images/icon-options.png)) メニューを開き、パーミッション関連のオプションを選択します。

1. 役割欄でチームを見つけ、適切な権限を選択する。

![ルナリゾートの掲示板管理人サイトチームは、掲示板アプリケーションに対して無制限の権限を持っています。](./creating-teams-for-sites/images/03.png)
