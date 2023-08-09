# 個人サイト

デフォルトでは、Liferayはすべてのユーザーに個人サイトを生成します。 各サイトには、2つの [ページセット](../creating-pages/understanding-pages/understanding-pages.md#page-sets): マイプロフィール（パブリック）とマイダッシュボード（プライベート）があります。 各ユーザーは、自分の個人サイトの唯一のメンバーであり、自分のコンテンツを表示および管理するためにサイトを使用することができます。

必要であれば、ポータル・プロパティを使って個人サイトを[無効化またはカスタマイズ](#customizing-personal-sites-with-portal-properties)することができます。

```{important}
Liferay 7.4 U22+とGA22+では、ダッシュボードページを含むプライベートページの作成を無効にするリリース機能フラグが含まれています。 個人サイトのカスタムダッシュボードページを手動で作成するには、Liferayシステムでプライベートページを有効にする必要があります。 詳しくは[プライベートページの有効化](../creating-pages/understanding-pages/understanding-pages.md#enabling-private-pages)を参照してください。
```

```{tip}
ユーザーグループサイトでは、グループメンバー全員の個人サイトに動的にページを追加することができます。 詳しくは[ユーザー・グループ・サイト](../../users-and-permissions/user-groups/user-group-sites.md)を参照のこと。
```

## プロフィールページとダッシュボードページ

プロフィールページでは、ユーザーがコンテンツ（ブログやアクティビティなど）を公開共有することができます。 デフォルトでは、各プロフィールページにはユーザーの基本情報が表示され、ユーザーのvCard（バーチャル名刺）へのダウンロードリンクが提供されます。

![プロフィールページには、他のユーザーが閲覧できる公開情報が表示されます。](./personal-sites/images/01.png)

ダッシュボードページでは、プライベートファイルへのアクセス、パーソナライズされたRSSフィードの作成、サイトメンバーシップの管理などが可能です。 デフォルトでは、各ダッシュボードページにはマイサイトウィジェットが含まれています。

![ダッシュボード・ページには、あなただけが見ることのできるプライベートな情報が表示されます。](./personal-sites/images/02.png)

## 個人サイトページの管理

個人サイトのページにアクセスするには、以下の手順に従ってください：

1. *User Profile Menu* アイコンを開き、 *My Profile* または *My Dashboard*のいずれかを選択します。
   
   ![ユーザープロファイルメニューから個人サイトのページにアクセスします。](./personal-sites/images/03.png)

1. *Product Menu* (![Product Menu](../../images/icon-product-menu.png)) を開き、 *Site Builder*を展開し、 *Pages*をクリックします。

1. 他の [サイトのページ](../creating-pages/understanding-pages/understanding-pages.md)と同じように管理する。

また、ユーザーグループを通じて、ユーザーの個人サイト用のページを追加および定義することもできます。 詳細は、[ユーザーグループサイト](../../users-and-permissions/user-groups/user-group-sites.md)を参照してください。

## 個人サイトの権限とロール

個人サイトのパーミッションとロールは、以下に示す動作に従います：

- 管理者は、Liferayポータルのパーミッションシステムを使って、ロールからパーミッションを削除することで、個人サイトの変更可能な部分をカスタマイズすることができます（ユーザーロールから関連するパーミッションを削除することで、すべてのユーザーが何かを変更することを禁止します）。
- ユーザーは、 [パワー・ユーザー・ロール](../../users-and-permissions/roles-and-permissions/default-roles-reference.md#regular-roles)のメンバーである場合、個人サイトを管理し、ページやアプリケーションを修正することができます。

## ポータルプロパティを使用した個人サイトのカスタマイズ

個人サイトのデフォルトページをカスタマイズするために、 [`portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) に追加できるポータルプロパティがいくつかあります。 ページの名前、ページに表示されるアプリケーション、ページのテーマとレイアウトテンプレートなどをカスタマイズできます。 詳細については、`portal.properties`ファイルの[デフォルトユーザーの公開レイアウト](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Default%20User%20Public%20Layouts)セクションと[デフォルトユーザーの非公開レイアウト](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Default%20User%20Private%20Layouts)セクションを参照してください。 これらのプロパティの一部を以下の表に示します。

| 機能                         | プロパティ                                           |
|:-------------------------- |:----------------------------------------------- |
| 個人サイトを無効にする                | `layout.user.public.layouts.enabled=false`      |
| 個人サイトのプライベートページを無効にする      | `layout.user.private.layouts.enabled=false`     |
| 個人サイトの自動作成を無効にする           | `layout.user.public.layouts.auto.create=false`  |
| 個人サイトのプライベートページの自動作成を無効にする | `layout.user.private.layouts.auto.create=false` |


個人サイトの公開ページ・セットと非公開ページ・セットは別々に扱われる。 片方のページを有効にしたまま、もう片方を無効にすることができる。 インスタンスでユーザのパーソナル・サイトを有効にしていたが、その後無効にした場合、既存のパーソナル・サイトは、ユーザが次にサインインするまでインスタンスに残り、その時点で削除されます。

## 関連トピック

- [サイトの追加](./adding-a-site.md)
- [サイトテンプレート](./site-templates.md)
- [ユーザーグループサイト](../../users-and-permissions/user-groups/user-group-sites.md)
