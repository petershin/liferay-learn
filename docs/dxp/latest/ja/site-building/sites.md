---
toc:
- ./sites/adding-a-site.md
- ./sites/site-templates.md
- ./sites/site-hierarchies.md
- ./sites/site-membership.md
- ./sites/personal-sites.md
- ./sites/exporting-importing-site-pages-and-content.md
- ./sites/default-site-applications.md
---

# サイト

```{toctree}
:maxdepth: 4

sites/adding-a-site.md
sites/site-templates.md
sites/site-hierarchies.md
sites/site-membership.md
sites/personal-sites.md
sites/exporting-importing-site-pages-and-content.md
sites/default-site-applications.md
```

サイトは、パーソナライズされたデジタル体験を構築するためのカスタマイズ可能なスペースです。 各サイトには、ポータル、イントラネット、eコマース・ストアフロントなどのカスタムソリューションを構築するための、 [out-of-the-box applications](./sites/default-site-applications.md) が含まれています。 サイトを作成する際、ブランクサイトを作成するか、カスタムおよびデフォルトのサイトテンプレートを使用して、定義済みの構造とコンテンツをサイトに入力することができます。

```{note}
サイトレベルで作成されたページ、コンテンツ、およびその他のアプリケーションデータは、そのサイトにスコープされ、通常、サイト間で共有することはできません。 ただし、一部のデータは[階層化されたサイト](./sites/site-hierarchies.md)間で共有することが可能です。 

また、サイトレベルの設定は、システムレベルおよびインスタンスレベルの設定より優先されます。 詳しくは、[Understanding Configuration Scope](../system-administration/configuring-liferay/understanding-configuration-scope.md) を参照してください。
```


<!--TASK:
## Site Types

Liferay provides multiple kinds of Sites for specific use cases. You can use each type of Site for adding functionality and managing your users and content.

### Organization Sites

With Liferay [Organizations](../users-and-permissions/organizations/understanding-organizations.md), you can enable dedicated Organization Sites to facilitate distributed portal administration. This feature is available for both parent and child Organizations, so you can quickly create a hierarchy of Sites with content created, administered, and tailored specifically to each group's needs. See [Organization Sites](../users-and-permissions/organizations/organization-sites.md)

### User Group Sites

Liferay [User Groups](../users-and-permissions/user-groups/creating-and-managing-user-groups.md) are lists of users that can span multiple Organizations and Sites. If desired, you can create dedicated Sites for User Groups to add Pages to the [personal Site](#personal-sites) of each group member. See [User Group Sites](../users-and-permissions/user-groups/user-group-sites.md) for more information.

### Personal Sites

By default, Liferay generates a personal Site for every User. Each User is the sole member of their personal Site and can use it to display and manage their content. See [Personal Sites](./sites/personal-sites.md) for more information.

## Using Sites with Commerce

Liferay Sites are used with [Channels](https://learn.liferay.com/commerce/latest/en/store-management/channels.html) to create e-commerce storefronts. The Channel's Site Type (i.e., B2B, B2C, or B2X) determines how the Site works with Accounts. See [Commerce Site Types](https://learn.liferay.com/commerce/latest/en/starting-a-store/sites-and-site-types.html) for more information.
-->

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} サイトの追加
:link: ./sites/adding-a-site.md
:::

:::{grid-item-card} サイトテンプレート
:link: ./sites/site-templates.md
:::

:::{grid-item-card} サイトヒエラルキー
:link: ./sites/site-hierarchies.md
:::

:::{grid-item-card} サイトメンバーシップ
:link: ./sites/site-membership.md
:::

:::{grid-item-card} 個人サイト
:link: ./sites/personal-sites.md
:::

:::{grid-item-card} サイトページとコンテンツのエクスポート/インポート
:link: ./sites/exporting-importing-site-pages-and-content.md
:::

:::{grid-item-card} デフォルトサイトアプリケーション
:link: ./sites/default-site-applications.md
:::
::::
