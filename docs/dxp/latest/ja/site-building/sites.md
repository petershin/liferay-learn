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

サイトは、パーソナライズされたデジタル体験を構築するためのカスタマイズ可能なスペースです。 各サイトには、ポータル、イントラネット、eコマース・ストアフロントなどのカスタムソリューションを構築するための、 [out-of-the-box applications](./sites/default-site-applications.md) が含まれています。 サイトを作成する際、ブランクサイトを作成するか、カスタムおよびデフォルトのサイトテンプレートを使用して、定義済みの構造とコンテンツをサイトに入力することができます。 [組織](../users-and-permissions/organizations/understanding-organizations.md)を使用している場合、専用の [組織サイト](../users-and-permissions/organizations/organization-sites.md) を有効にし、各組織のニーズに合ったサイトを開発・管理することも可能です。

デフォルトでは、Liferayは認証されたユーザーのために個人サイトも生成します。 各ユーザーは、自分の個人サイトの唯一のメンバーであり、コンテンツを表示および管理するためにサイトを使用することができます。 [User Groups](../users-and-permissions/user-groups/creating-and-managing-user-groups.md)を使用している場合、 [ユーザーグループサイト](../users-and-permissions/user-groups/user-group-sites.md) を作成し、グループメンバー全員の個人サイトに定義済みのページを追加することができます。

```{note}
サイトレベルで作成されたページ、コンテンツ、およびその他のアプリケーションデータは、そのサイトにスコープされ、通常、サイト間で共有することはできません。 ただし、一部のデータは[階層化されたサイト](./sites/site-hierarchies.md)間で共有することが可能です。 

また、サイトレベルの設定は、システムレベルやインスタンスレベルの設定より優先されます。 詳しくは、 [設定スコープについて](../system-administration/configuring-liferay/understanding-configuration-scope.md) を参照してください。
```

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

## コマースでサイトを利用する

Liferay Sites は [チャンネル](https://learn.liferay.com/commerce/latest/ja/store-management/channels.html) と共に使用され、e-コマースストアを作成します。 各チャンネルのサイトタイプ（B2B、B2C、B2Xなど）は、サイトがアカウントとどのように連携するかを決定します。 詳しくは、 [コマースサイトの種類](https://learn.liferay.com/commerce/latest/ja/starting-a-store/sites-and-site-types.html) をご覧ください。
