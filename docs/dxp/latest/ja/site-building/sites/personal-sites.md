# 個人サイト

デフォルトでは、Liferayは全てのユーザーに対して個人サイトを生成します。 </a>各サイトには、2つのページセット
: マイプロフィール（公開）とマイダッシュボード（非公開）があります。 各ユーザーは、自分の個人サイトの唯一のメンバーであり、コンテンツを表示および管理するためにサイトを使用することができます。</p> 

</a> 必要に応じて、ポータルのプロパティを使用して、 個人用サイトを無効化またはカスタマイズすることができます。</p> 



```{important}
Liferay 7.4 U22+ と GA22+ では、新規にインストールした Liferay には、ダッシュボードページを含むプライベートページの作成を無効にするリリース機能フラグが含まれています。 個人サイトのカスタムダッシュボードページを手動で作成するには、LiferayシステムでPrivate Pagesを有効にする必要があります。 詳しくは、[プライベートページの有効化](../creating-pages/understanding-pages/understanding-pages.md#enabling-private-pages)をご覧ください。
```




```{tip}
ユーザーグループサイトでは、グループメンバー全員の個人サイトに動的にページを追加することができます。 詳しくは、[ユーザーグループサイト](../../users-and-permissions/user-groups/user-group-sites.md)を参照してください。
```




## プロフィールページとダッシュボードページ

プロフィールページでは、ユーザーがコンテンツ（ブログ、アクティビティなど）を公開することができます。 デフォルトでは、各プロフィールページにはユーザーの基本情報が表示され、ユーザーのvCard（バーチャル名刺）へのダウンロードリンクが提供されます。

![プロフィールページでは、他のユーザーが閲覧できるように公開情報を表示します。](./personal-sites/images/01.png)

ダッシュボードページでは、個人用ファイルへのアクセス、個人用RSSフィードの作成、サイトメンバーシップの管理などを行うことができます。 デフォルトでは、各ダッシュボードページには「マイサイト」ウィジェットが含まれています。

![ダッシュボードページには、あなただけが見ることができるプライベートな情報が表示されます。](./personal-sites/images/02.png)



## 個人サイトページの管理

個人サイトのページにアクセスするには、次の手順に従います。

1. 個人用メニューアイコンを開き、*［My Profile］*または *［My Dashboard］*を選択します。
   
   ![個人用メニューから個人サイトページにアクセスします。](./personal-sites/images/03.png)

1. *サイトメニュー* (![Site Menu](../../images/icon-product-menu.png)) を開き、 *サイトビルダー*を展開し、 *ページ*をクリックします。

1. 他のサイトページと同じように管理する [サイトページ](../creating-pages/understanding-pages/understanding-pages.md).

ユーザーグループを介して、ユーザーの個人サイトのページを追加および定義することもできます。 詳細は、[ユーザーグループサイト](../../users-and-permissions/user-groups/user-group-sites.md)を参照してください。



## 個人サイトの権限とロール

個人用サイトの権限とロールは、以下に示す動作に従います。

- 管理者は、ロールから権限を削除することにより、Liferay Portalの権限システムを介して個人サイトの変更可能な部分をカスタマイズできます（ユーザーロールから関連する権限を削除することにより、すべてのユーザーが何も変更できないようにします）。
- ユーザーは、[パワーユーザーロール](../../users-and-permissions/roles-and-permissions/default-roles-reference.md#regular-roles)のメンバーである場合、個人のサイトを管理し、ページとアプリケーションを変更できます。



## ポータルプロパティを使用した個人サイトのカスタマイズ

個人サイトのデフォルトページをカスタマイズするために、[`portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md)に追加できるポータルプロパティがいくつかあります。 ページの名前、ページに表示されるアプリケーション、ページのテーマとレイアウトテンプレートなどをカスタマイズできます。 詳細については、`portal.properties`ファイルの[デフォルトユーザーの公開レイアウト](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Default%20User%20Public%20Layouts)セクションと[デフォルトユーザーの非公開レイアウト](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Default%20User%20Private%20Layouts)セクションを参照してください。 これらのプロパティの一部を以下の表に示します。

| 機能                          | プロパティ                                           |
|:--------------------------- |:----------------------------------------------- |
| 個人サイトを無効にする                 | `layout.user.public.layouts.enabled=false`      |
| 個人サイトの非公開ページを無効にする          | `layout.user.private.layouts.enabled=false`     |
| 個人サイトの自動作成を無効にする            | `layout.user.public.layouts.auto.create=false`  |
| 個人サイトでのプライベートページの自動作成を無効にする | `layout.user.private.layouts.auto.create=false` |


個人サイトの公開ページセットと非公開ページセットは別々に処理されます。 一方のページセットを有効のままにして、もう一方を無効にすることができます。 最初にインスタンスのユーザーの個人サイトを有効にしてから無効にした場合、既存の個人サイトは、次にユーザーがサインインするまでインスタンスに残り、その時点で削除されます。



## 追加情報

- [サイトの追加](./adding-a-site.md)
- [サイトテンプレート](./site-templates.md)
- [ユーザーグループサイト](../../users-and-permissions/user-groups/user-group-sites.md)
