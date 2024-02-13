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

サイトは、パーソナライズされたデジタル体験を構築するためのカスタマイズ可能なスペースである。 各サイトには、ポータル、イントラネット、eコマース・ストアフロン トなどのカスタムソリューションを構築するための、 [、すぐに使えるアプリケーション](./sites/default-site-applications.md)。 サイトを作成する際、空白のサイトを作成するか、カスタムおよびデフォルトのサイトテンプレートを使用して、定義済みの構造とコンテンツをサイトに入力することができます。 [組織](../users-and-permissions/organizations/understanding-organizations.md)を使用している場合は、 [組織専用サイト](../users-and-permissions/organizations/organization-sites.md) を有効にして、各組織のニーズに合ったサイトを開発・管理することもできます。

デフォルトでは、Liferayは認証されたユーザーの個人サイトも生成します。 各ユーザーは、自分の個人サイトの唯一のメンバーであり、自分のコンテンツを表示および管理するためにサイトを使用することができます。 [ユーザーグループ](../users-and-permissions/user-groups/creating-and-managing-user-groups.md)を使用している場合、 [ユーザーグループサイト](../users-and-permissions/user-groups/user-group-sites.md) を作成し、グループメンバー全員の個人サイトに定義済みのページを追加することができます。

```{note}
サイトレベルで作成されたページ、コンテンツ、その他のアプリケーション・データは、そのサイトにスコープされ、一般的にサイト間で共有することはできません。 ただし、一部のデータは[階層内のサイト](./sites/site-hierarchies.md)間で共有できる。 

また、サイト・レベルのコンフィギュレーションは、システム・レベルとインスタンス・レベルのコンフィギュレーションをオーバーライドする。 詳しくは [設定スコープについて](../system-administration/configuring-liferay/understanding-configuration-scope.md) を参照してください。
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} サイトの追加
:link: ./sites/adding-a-site.md
:::

:::{grid-item-card} サイトテンプレート
:link: ./sites/site-templates.md
:::

:::{grid-item-card} サイト階層
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

## コマース・サイトの利用

Liferayサイトは、 [チャンネル](https://learn.liferay.com/commerce/latest/ja/store-management/channels.html) 、eコマースストアを作成するために使用されます。 各チャネルのサイトタイプ（B2B、B2C、B2Xなど）は、サイトがアカウントとどのように連携するかを決定する。 詳しくは [サイトとサイトのタイプ](https://learn.liferay.com/commerce/latest/ja/starting-a-store/sites-and-site-types.html) をご覧ください。
