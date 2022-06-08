# ユーザーグループサイト

<!-- The main struggle I have with this article is I have no idea what the value proposition is for this functionality - what is the problem or use case this solves for? -->

[ユーザーグループフォーム](./creating-and-managing-user-groups.md) の下部にある2つのフィールドで、サイトテンプレートを選択して2つのページセット（ *［My Profile］* と *［My Dashboard］*を入力できます。

![ユーザーグループの作成中にユーザーグループサイトを作成できます。](./user-group-sites/images/01.png)

ユーザーグループサイトは、ユーザーの *［My Profile］* （公開）と *［My Dashboard］* （非公開）の個人用サイトに入力する特定のページセットです。

ユーザーは、公開（プロフィール）ページと、場合によっては非公開（ダッシュボード）ページで構成される個人用サイトを持つことができます。 これらは、 [公開](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Default%20User%20Public%20Layouts) と [非公開](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Default%20User%20Private%20Layouts) の両方のサイトで有効にする必要があります。<!-- The first part of this paragraph feels redundant to information presented a couple paragraphs prior.
A *User Group Site* isn't really a Site: it's a set of pages that gets added to either the public (profile) or private (dashboard) Sites of Users. A mixed approach can also be used, where both private and public pages are added for the User Group Site. If Users belong to multiple User Groups, all the pages from those User Group Sites are made part of their personal Sites.
-->![ユーザーのサイトは、ユーザーの個人用メニューで利用できます。](./user-group-sites/images/02.png)

*［My Profile］* および *［My Dashboard］* セレクターメニューから [サイトテンプレート](../../site-building/building-sites/building-sites-with-site-templates.md) を選択して、 [ユーザーグループ](./creating-and-managing-user-groups.md)を作成している間にユーザーグループサイトを作成できます。 手動で、またはサイトテンプレートを使用して、後でユーザーグループサイトを作成することもできます。

## サイトテンプレートからのユーザーグループサイトの作成

[サイトテンプレート](../../site-building/building-sites/building-sites-with-site-templates.md)）からユーザーグループサイトを作成するには、既に存在するユーザーグループに対して、

1. *［コントロールパネル］* &rarr; *［ユーザー］* &rarr; *［ユーザーグループ］*の順に開きます。

1. ユーザーグループの *アクション* (![Actions](../../images/icon-actions.png)) &rarr; *［編集］* をクリックすると、編集フォームが表示されます。

1. *［プロフィール］* メニューからサイトテンプレートを選択して、ユーザーに公開ページを提供します。

1. *［ダッシュボード］* メニューからサイトテンプレートを選択して、ユーザーに非公開ページを提供します。

1. *［保存］*をクリックします。

これで、グループのいずれかのユーザーが *プロフィール* または *ダッシュボード* サイトに移動すると、それらのサイトのコンテンツには、選択したサイトテンプレートが反映されます。

ユーザーグループサイトページは、通常のサイトテンプレートページと同様に機能しますが、重要な例外があります。ユーザーグループサイトページは、ユーザーごとにコピーされません。 これらは、ユーザーが個人用サイトに表示する可能性のあるカスタムページとともに動的に表示されます。 このため、ユーザーはユーザーグループから継承されたページを変更できません。 必要に応じて、ユーザーグループ管理者は、通常のサイトと同様に、ページの特定の領域をカスタマイズ可能として定義できます。その後、ユーザーは、ページの指定された領域にウィジェットを追加および構成できます。

これにより、直接変更することなく、ユーザーの個人用サイトを柔軟に構成できます。 ユーザーがユーザーグループに割り当てられると、ユーザーは個人サイトからユーザーグループのサイトページにすぐにアクセスできます。

```{note}
サイトテンプレートには、サイトテンプレートに加えられた変更を反映させるオプションがあります。 このオプションを有効にしてサイトテンプレートを使用すると、そのテンプレートが変更されたときにユーザーグループのサイトが自動的に更新されます。 このオプションを無効にしても、後で再び有効にすると、テンプレートのページがユーザーのサイトにコピーされ、ユーザーが行った変更が上書きされます。
```

## ユーザーグループサイトを手動で作成する

ユーザーグループサイトをサイトテンプレートに基づく代わりに、手動で作成できます。

1. *コントロールパネル* &rarr; *ユーザー* &rarr; *ユーザーグループ*に移動します。

1. ユーザーグループの *アクション* (![Actions](../../images/icon-actions.png)) &rarr; *［ページの管理］* をクリックします。 この*［ページ］*ウィンドウは、[ページの作成](../../site-building/creating-pages/understanding-pages/understanding-pages.md)に使用するものと同じです。

    ![ユーザーグループサイトを手動で追加するためのコントロールは、ページを作成するためのコントロールと同じです。](./user-group-sites/images/03.png)

1. ユーザーの *プロフィール* または *ダッシュボード* サイトに使用したい公開ページまたは非公開ページを作成します。 ここで作成する公開ページはユーザーの *プロフィール* サイトのページになり、非公開ページはユーザーの *ダッシュボード* サイトのページになります。

コントロールパネルでユーザーグループに戻ると、ユーザーグループの *アクション* ボタン（![Actions](../../images/icon-actions.png)）にあるこれらのリンクを介して、ユーザーグループの公開ページや非公開ページにアクセスできます。

**プロファイルページに移動：** ユーザーグループの公開 *プロフィール* ページを新しいブラウザウィンドウで開きます。

**ダッシュボードページに移動：** ユーザーグループの非公開 *ダッシュボード* ページを新しいブラウザウィンドウで開きます。

新しいウィンドウで、ページやポートレットを追加し、サイト設定を構成できます。

## 従来のユーザーグループサイトの動作

何百万ものユーザーがいる場合でも、ユーザーグループサイトページの継承によるパフォーマンスへの影響はありません。 ただし、7.0より前のバージョンのLiferay PortalとLiferay DXPでは、各ユーザーの個人用サイトにユーザーグループページをコピーする必要がありました。

Liferay DXP 7.2を使用していて、その動作を維持する必要がある場合は、次の行を `portal-ext.properties` ファイルに追加して有効にします。

```
user.groups.copy.layouts.to.user.personal.site=true
```

このプロパティはLiferay DXP 7.3で削除されました。

このプロパティが `true`設定されている場合、テンプレートページはユーザーの個人サイトに一度コピーされた後、ユーザーによって変更される可能性があります。 これは、後でテンプレートページに変更が加えられた場合、変更後にユーザーグループに追加されたユーザーにのみ影響することを意味します。 テンプレートに対して *［Allow Site Administrators to Modify Pages Associated with This Site Template］*ボックスをオンにすると、個人サイトの管理権限を持つユーザーがページとその内容を変更できます。 ユーザーがユーザーグループから削除されると、関連するページがユーザーの個人用サイトから削除されます。 ユーザーがグループから削除され、その後再び追加された場合、グループのテンプレートページがユーザーのサイトに再度コピーされます。 ユーザーグループのサイトがサイトテンプレートに基づいており、ユーザーがグループに追加された後に管理者がユーザーグループのサイトテンプレートを変更した場合、ユーザーグループの *［サイトテンプレートの変更のプロパゲーションを有効にする］* ボックスにチェックが入っていた場合のみ変更が有効になることに注意してください。
