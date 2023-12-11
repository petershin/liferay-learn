# 出版テンプレートの使用

{bdg-secondary}`Liferay 7.4 U73+/GA73+`.

共有された詳細と投稿者を持つ出版物の作成を簡単にするには、出版物テンプレートを使用してください。 招待するユーザーのリストを作成し、ロールを割り当て、トークンを使用して名前と説明を自動入力することができます。

パブリケーション・テンプレートを作成するには

1. グローバルメニュー](../../../images/icon-applications-menu.png) を開き、[アプリケーション] タブを開き、[パブリケーション] をクリックします。

1. アプリケーションバーの_Actions_ ( ![Actions Button](../../../images/icon-actions.png) ) をクリックし、_Templates_を選択します。

   ![Open the Publications application, click the Actions button in the Application Bar, and select Templates.](./using-publication-templates/images/01.png)

1. *追加* ([追加ボタン](../../../images/icon-add.png))をクリックします。

1. テンプレートの名前と説明を入力します。

   ![Enter a name and description for the template.](./using-publication-templates/images/02.png)

1. (オプション）このテンプレートを新しい出版物のデフォルトとして設定します。

   **デフォルト・テンプレート**：手動で作成されたパブリケーションはデフォルトでこのテンプレートを使用しますが、パブリケーション作成時に別のテンプレートを選択できます。 [Sandbox Only mode](./enabling-publications.md#how-to-enable-publications) が有効な場合、Default Sandbox Templateが設定されていなければ、自動的に作成された出版物はテンプレートを使用します。

   **デフォルトのサンドボックステンプレート**： [Sandbox Only mode](./enabling-publications.md#how-to-enable-publications) が有効な場合、自動的に作成される出版物はこのテンプレートを使用します。 別のテンプレートを使用して、手動で出版物を作成することもできます。

   ```{note}
   一度にデフォルトテンプレートとデフォルトサンドボックステンプレートは1つしか持てません。
   ```

1. テンプレートで作成された出版物に使用する名前と説明を入力してください。

   文字列テンプレート・トークンを使用して、値を動的に生成することができます：

   * `${RANDOM_HASH}`

   * `${TODAY_DATE}`

   * `${CURRENT_USERNAME}`

   ![Enter a name and description to use for publications created with the template.](./using-publication-templates/images/03.png)

1. *Invite Users*をクリックして、テンプレートで作成された出版物のデフォルトのユーザーと役割割り当てを指定します。

   ![Click Invite Users to specify the default users and role assignments for publications created with the template.](./using-publication-templates/images/04.png)

   貢献者を追加するには、ユーザーを検索し、役割を選択します。 詳細は、 [Collaborating on Publications](./collaborating-on-publications.md) を参照してください。

   ![Search for users and select a role.](./using-publication-templates/images/05.png)

   ```{note}
   Publicationsアプリケーションにアクセスする権限のないユーザーを招待した場合、Liferayは自動的にそのユーザーに [Publications User](./publications-permissions.md#publications-user-role) ロールを割り当てます。
   ```

1. ［_Save_］をクリックします。

新しいテンプレートが「出版テンプレート」ページに表示されます。

![Templates appear in the Publication Templates page](./using-publication-templates/images/06.png)

ユーザーは、 [パブリケーションを作成する際にテンプレートを選択することができます](./creating-and-managing-publications.md#creating-a-publication) 。 テンプレートを選択すると、名前と説明のフィールドに自動的に入力され、デフォルトの投稿者が招待されます。

![Users can select the template when creating a publication.](./using-publication-templates/images/07.png)

## 関連トピック

* [出版物の作成と管理](./creating-and-managing-publications.md) 
* [出版物の共同制作](./collaborating-on-publications.md) 
* [出版許可](./publications-permissions.md) 
