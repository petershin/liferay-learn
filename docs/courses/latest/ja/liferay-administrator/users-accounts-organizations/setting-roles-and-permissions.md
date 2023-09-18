# 役割と権限の設定

Liferay では、ユーザーは割り当てられたロールに基づいてパーミッションを受け取ります。 詳しくは [Understanding Roles and Permissions](https://learn.liferay.com/en/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions) を参照してください。

## ユーザーのロールへの割り当て

IT管理者に管理者の役割を与える。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Roles** に移動する。 ［**通常の役割**］ タブで、 ［**管理者**］ をクリックします。

1. 新しいページで、 **Assignees** タブをクリックします。

   - **追加**（![Add icon](../../images/icon-add.png)） をクリックします。
   - 新しいウィンドウで、 **Marcus Morgan** を選択する。
   - ［**Add**］ をクリックします。

   マーカスは現在、管理者の役割を担っている。

なお、ユーザの編集ページからユーザにロールを割り当てることもできます（例： [Creating Users](./managing-users.md#creating-users) for Kyle Klein.を参照）。

## ロールの作成

Delectable Bonsaiの従業員は、仕事内容によって異なるパーミッションが必要です。 例えば、セールス & マーケティング部門の人は、組織サイトのブログにアクセスする必要がある。 また、マーケティング・キャンペーンのための文書やメディアへのアクセスも要求される。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Roles** に移動する。 **Add**(![Add icon](../../images/icon-add.png)) をクリックし、 **Regular Roles** タブの下にある。

1. 新しいウィンドウで、以下の情報を入力する：

   * タイトル `Sales & Marketing Staff`
   * 説明 `営業スタッフ & マーケティング`

［**保存**］ をクリックします。

1. ［**Define Permissions**］ タブをクリックします。

   * 左のナビゲーションをスクロールダウンし、 **サイトと資産ライブラリ管理** &rarr; **コンテンツ & データ** &rarr; **ブログ** .
   * 以下の権限を追加する：

      **リソース許可 - ブログエントリー**
      - `Add Entry`
      - `Subscribe`

      **リソース許可 - ブログエントリー**
      - `Add Discussion`
      - `Update`
      - `Update Discussion`
      - `View`

   * ［**保存**］ をクリックします。

1. **コンテンツ & データ** の下にある、 **ドキュメントとメディア** をクリックします。 以下の権限を追加する：

   **通常権限**
   - `Access in Site and Asset Library Administration`
   - `View`

   **リソース権限**
   - ドキュメント]、[ドキュメントフォルダ]、[ドキュメント]、[ショートカット]、[ドキュメントタイプ]、[メタデータ]のすべてのアクションを選択します。

［**保存**］ をクリックします。 これで、新しいロールにさまざまなパーミッションが設定されました。

1. ユーザーをこのロールに割り当てることができる。

   * **Assignees** タブをクリックします。
   * **追加**（![Add icon](../../images/icon-add.png)） をクリックします。
   * 新しいウィンドウで、 **Lily Lewis** を選択し、 **Add** をクリックします。

   これで、リリー・ルイス、またはこの役割を持つ他の人は、サイト管理メニューからドキュメントやメディアにアクセスできるようになりました。 また、 & マーケティング組織サイトのブログ記事を閲覧したり、追加したりすることもできる。

   ![リリー・ルイスは文書やメディアにアクセスできる。](./setting-roles-and-permissions/images/01.png)

次のステップは、 [アカウントの作成と管理](./working-with-accounts.md)。

## 関連コンセプト

- [ロールと権限について](https://learn.liferay.com/en/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions)
- [ユーザーのロールへの割り当て](https://learn.liferay.com/en/w/dxp/users-and-permissions/roles-and-permissions/assigning-users-to-roles)
- [ロールの作成と管理](https://learn.liferay.com/en/w/dxp/users-and-permissions/roles-and-permissions/creating-and-managing-roles)
