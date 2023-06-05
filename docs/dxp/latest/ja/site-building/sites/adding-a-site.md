# サイトの追加

サイトは、パーソナライズされたデジタル体験を構築するためのカスタマイズ可能なスペースです。 以下の手順に従って、Liferay インスタンスに基本的な Site を作成します。

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** タブを開き、 **サイト** をクリックします。

    ![サイト」アプリケーションを開く。](./adding-a-site/images/01.png)

1. **追加** ボタン（![Add Button](../../images/icon-add.png)）をクリックします。

1. **サイトテンプレートの選択** .

    **Blank** を選択すると、ページやコンテンツのない新しいサイトを作成することができます。 また、カスタムまたはデフォルトの [サイトテンプレート](./site-templates.md) を選択し、新しいサイトにページ、コンテンツ、および設定を入力することもできます。

1. Site の **の名前** を入力します。

   ```{note}
   [プライベートページ](../creating-pages/understanding-pages/understanding-pages.md#enabling-private-pages) がシステムで有効になっていれば、サイトテンプレートから継承したすべてのページがプライベートかどうか判断することができます。
   ```

1. **保存** をクリックして、Siteの作成を開始します。

完了すると、新しい [サイトの設定](../site-settings/site-settings-ui-reference.md)にリダイレクトされます。 サイトの設定を開始することができます。サイトの構築に使用できるアプリケーションの完全なリストについては、 [デフォルトのサイトアプリケーション](./default-site-applications.md) を参照してください。

## 組織サイトの作成

Liferay [組織](../../users-and-permissions/organizations/understanding-organizations.md) は、分散したユーザー管理を可能にし、組織階層を反映したインスタンスユーザーとロールの整理と管理を行う便利な方法を提供します。 また、組織を作成すると、組織専用のサイトを有効にして、ポータルの分散管理を容易にすることができます。 この機能は、親組織と子組織の両方で利用できるため、各グループのニーズに合わせてコンテンツを作成、管理し、サイトの階層を素早く作ることができます。 詳しくは、 [組織サイト](../../users-and-permissions/organizations/organization-sites.md) をご覧ください。

```{note}
組織サイトを作成する際に使用できるのは、ブランクテンプレートまたはカスタムテンプレートのみです。 他のデフォルトテンプレートは使用できません。
```

## グループサイトの作成

Liferay [User Groups](../../users-and-permissions/user-groups/creating-and-managing-user-groups.md) は、複数のOrganizationとSiteにまたがることができるユーザーのリストです。 </a> 必要であれば、ユーザーグループ専用のサイトを作成し、各グループメンバーの個人サイト
にページを追加することができます。 詳細は、[ユーザーグループサイト](../../users-and-permissions/user-groups/user-group-sites.md)を参照してください。</p> 



## 関連トピック

* [サイト構築の概要](../introduction-to-site-building.md)
* [サイトテンプレート](./site-templates.md)
* [サイトにメンバーを追加する](./site-membership/adding-members-to-sites.md)
