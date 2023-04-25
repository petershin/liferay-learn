# パブリケーションテンプレートの使用

{bdg-secondary}`利用可能 Liferay 7.4 U63+/GA63+`

詳細や投稿者を共有した出版物の作成を簡単にするために、出版物テンプレートを使用します。 招待するユーザーのリストを作成し、ロールを割り当て、トークンを使って名前や説明を自動入力することができます。

パブリケーションテンプレートを作成するには

1. **グローバルメニュー**( ![Global Menu](../../../images/icon-applications-menu.png) ) を開き、 **アプリケーション** タブを開き、 **出版** をクリックします。

1. アプリケーションバーの「**アクション**」( ![Actions Button](../../../images/icon-actions.png) ) をクリックし、「**テンプレート**」 を選択します。

   ![Publicationsアプリケーションを開き、アプリケーションバーの「Actions」ボタンをクリックし、「Templates」を選択します。](./using-publication-templates/images/01.png)

1. **追加**(![Add button](../../../images/icon-add.png)） をクリックします。

1. テンプレートの名前と説明を入力します。

   ![テンプレートの名前と説明を入力します。](./using-publication-templates/images/02.png)

1. テンプレートで作成された出版物に使用する名前と説明を入力します。

   文字列テンプレートトークンを使用して、動的に値を生成することができます：

   * `${RANDOM_HASH}`

   * `${TODAY_DATE}`

   * `${CURRENT_USERNAME}`

   ![テンプレートで作成された出版物に使用する名前と説明を入力します。](./using-publication-templates/images/03.png)

1. **Invite Users** をクリックして、テンプレートで作成された出版物のデフォルトユーザーと役割分担を指定します。

   ![ユーザーを招待する］をクリックして、テンプレートで作成された出版物のデフォルトユーザーと役割分担を指定します。](./using-publication-templates/images/04.png)

   貢献者を追加するには、ユーザーを検索し、役割を選択します。 詳細は、 [パブリケーションでのコラボレーション](./collaborating-on-publications.md) を参照してください。

   ![ユーザーを検索し、役割を選択する。](./using-publication-templates/images/05.png)

   ```{note}
   Publicationsアプリケーションにアクセスする権限のないユーザーを招待した場合、Liferayは自動的に [Publications User](./publications-permissions.md#publications-user-role) ロールを割り当てる。
   ```

1. ［**保存**］ をクリックします。

新しいテンプレートは、「出版テンプレート」ページに表示されます。

![テンプレートは、「出版テンプレート」ページに表示されます](./using-publication-templates/images/06.png)

ユーザーは、 [出版物を作成するときにテンプレートを選択することができます](./creating-and-managing-publications.md#creating-a-new-publication) 。 テンプレートを選択すると、名前と説明のフィールドに自動的に入力され、デフォルトの投稿者が招待されます。

![ユーザーは、パブリケーションを作成する際に、このテンプレートを選択することができます。](./using-publication-templates/images/07.png)

## 追加情報

* [パブリケーションの作成と管理](./creating-and-managing-publications.md)
* [パブリケーションでのコラボレーション](./collaborating-on-publications.md)
* [出版物の使用許可](./publications-permissions.md)
