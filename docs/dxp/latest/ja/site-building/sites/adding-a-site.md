# サイトの追加

サイトは、パーソナライズされたデジタル体験を構築するためのカスタマイズ可能なスペースである。 以下の手順に従って、Liferayインスタンスに基本サイトを作成してください：

1. *グローバルメニュー* ( ![Applications Menu](../../images/icon-applications-menu.png) ) を開き、 *コントロールパネル* タブ &rarr; *サイト*を開きます。

    ![サイト」アプリケーションを開く。](./adding-a-site/images/01.png)

1. *Add* ( ![Add Button](../../images/icon-add.png) ) をクリックする。

1. *サイトテンプレートを選択*. テンプレート *Provided by Liferay* または [*Custom Site Templates*](./site-templates.md) のいずれかを選択してサイトを作成します。

    *Blank Site* テンプレートを選択し、ページやコンテンツのない新しいサイトを作成します。

    ![Liferayが提供するテンプレート、またはカスタムサイトテンプレートを選択し、新しいサイトにページ、コンテンツ、設定を入力することができます。](./adding-a-site/images/02.png)

1. *サイトの名前* を入力します。

   ```{note}
   [プライベート・ページ](../creating-pages/understanding-pages/understanding-pages.md#enabling-private-pages)がシステムで有効になっている場合、サイト・テンプレートから継承されたすべてのページがプライベートかどうかを判断することができます。
   ```

1. *Add* をクリックして、サイトの作成を開始します。

完了すると、新しい [サイトの設定](../site-settings/site-settings-ui-reference.md)にリダイレクトされます。 サイトを構築するために使用できるアプリケーションの完全なリストについては、 [デフォルトのサイトアプリケーション](./default-site-applications.md) を参照してください。

## 組織サイトの作成

Liferay [組織](../../users-and-permissions/organizations/understanding-organizations.md) 分散ユーザー管理を可能にし、組織階層を反映するインスタンスユーザーとロールを組織化し管理する便利な方法を提供します。 組織を作成すると、ポータルの分散管理を容易にするために、組織専用のサイトを有効にすることもできます。 この機能は、親組織と子組織の両方で利用できるため、コンテンツを作成、管理し、各グループのニーズに合わせてカスタマイズしたサイトの階層をすばやく作成できます。 詳しくは [組織サイト](../../users-and-permissions/organizations/organization-sites.md) を参照のこと。

```{note}
組織サイトを作成する際に使用できるのは、ブランクテンプレートまたはカスタムテンプレートのみです。 他のデフォルトテンプレートは使用できません。
```

## グループサイトの作成

Liferay [ユーザーグループ](../../users-and-permissions/user-groups/creating-and-managing-user-groups.md) は、複数の組織やサイトにまたがるユーザーのリストです。 必要であれば、ユーザーグループ専用のサイトを作成し、各グループメンバーの [個人サイト](./personal-sites.md) にページを追加することができます。 詳細は、[ユーザーグループサイト](../../users-and-permissions/user-groups/user-group-sites.md)を参照してください。

## 関連トピック

* [サイト構築を始める](../getting-started-with-site-building.md)
* [サイトテンプレート](./site-templates.md)
* [サイトにメンバーを追加する](./site-membership/adding-members-to-sites.md)
