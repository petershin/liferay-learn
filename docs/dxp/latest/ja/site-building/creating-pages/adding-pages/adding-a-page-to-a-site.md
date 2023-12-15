# サイトにページを追加する

以下のステップでは、サイトに新しいページを追加し、一般的なオプションを設定する方法を説明します。 残りのページ設定の構成方法については、 [個別ページの構成](../page-settings/configuring-individual-pages.md) を参照するか、 [ページセットの構成](../page-settings/configuring-page-sets.md) を参照して、 [ページセットのオプションを構成する](../understanding-pages/understanding-pages.md#page-sets) 。

```{note}
Liferay 7.4 U22+とGA22+では、新規インストール時にプライベートページが無効になります。 これを有効にするには、 [プライベートページを有効にする](../understanding-pages/understanding-pages.md#enabling-private-pages) を参照してください。
```

## 新しいページを追加する

新しいページはページ管理画面またはページツリーから追加できます（Liferay DXP 7.3+のみ）。

### ページ管理から新しいページを追加する

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-menu.png))を開き、 **サイトビルダー** を展開し、 **ページ** をクリックします。

1. **追加**(![追加ボタン](../../../images/icon-add.png))をクリックし、 **ページ** を選択します。

   ![Add a page to the site.](./adding-a-page-to-a-site/images/01.png)

1. ページテンプレートセットで、基本テンプレートまたはグローバルテンプレートを選択します。

   空の [コンテンツページ](../understanding-pages/understanding-pages.md#page-types) から始めるには、 **Blank**[マスターページテンプレート](../defining-headers-and-footers/master-page-templates.md) を選択します。

   または、他の利用可能なテンプレートから選択します。

   ![Select a Basic or Global template for your page.](./adding-a-page-to-a-site/images/02.png)

1. ページの追加ダイアログで名前を入力し、 **追加** をクリックします。

コンテンツページを作成した場合、コンテンツページの下書きにリダイレクトされ、フラグメントやウィジェットを追加することができます。

ウィジェットページを作成した場合、ページの設定オプションにリダイレクトされます。

```{tip}
デフォルトでは、新しいページはサイトのナビゲーション・メニューに含まれます。 このナビゲーション・メニューを設定するには、 [ナビゲーション・メニュー・アプリケーションを使う](../../site-navigation/configuring-menu-displays.md) を参照。
```

### ページツリーメニューから新しいページを追加する

{bdg-secondary}利用可能です：Liferay DXP/Portal 7.3+\`.

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-menu.png))を開き、 **ページツリー**(![ページツリー](../../../../images/icon-page-tree.png))をクリックします。

1. **追加**( [ボタン追加](../../../images/icon-add-app.png) )をクリックし、 **ページ追加** を選択します。

   ![Adding a new page using the page tree menu.](adding-a-page-to-a-site/images/03.png)

1. [Adding a New Page](#adding-a-new-page) に示すように、ページを作成する標準的な手順に従ってください。

```{tip}
下書きステータスのページには、ページツリーの名前の横にアスタリスク(*)が付いています。
```

## サブページを追加する

子ページはページ管理画面またはページツリー（Liferay DXP 7.3+のみ）から追加できます。

### ページ管理からサブページを追加する

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-menu.png))を開き、 **サイトビルダー** を展開し、 **ページ** をクリックします。

1. 既存のページの **追加**(![追加ボタン](../../../images/icon-duplicate.png))をクリックします。

   ![Click the Add button next to an exiting page to create a new child page.](./adding-a-page-to-a-site/images/04.png)

1. [新しいページの追加](#adding-a-new-page) に概説されているように、ページを作成するための標準的な手順に従ってください。

```{tip}
ページの横にあるアクションメニュー（！ [アクションメニュー](../../../images/icon-actions.png) ）を使って、コンテンツページのドラフトをプレビューすることができます（Liferay DXP 7.2+）。 これらのオプションは、下書きステータスのページと、ページ編集権限を持つユーザーに利用可能です。
```

### ページツリーからサブページを追加する

{bdg-secondary}`利用可能です：Liferay DXP/Portal 7.3+`.

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-menu.png))を開き、 **ページツリー**(![ページツリー](../../../../images/icon-page-tree.png))をクリックします。

1. 目的のページで、 **Actions**(![Actions Button](../../../images/icon-actions.png)) をクリックし、 **Add Child Page** を選択します。

   ![Adding a child page using the page tree menu.](adding-a-page-to-a-site/images/05.png)

1. [新しいページの追加](#adding-a-new-page) に概説されているように、ページを作成するための標準的な手順に従ってください。

## ページのプレビュー

作成したページを公開する前にプレビューしたり、作業が必要なページを確認することができます：

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-menu.png))を開き、 **サイトビルダー** &rarr; ページを選択します。

1. プレビューしたいページで **Actions**(![Actions Icon](../../../images/icon-actions.png)) をクリックし、 **View** を選択します。

![You can preview pages easily before working on them](./adding-a-page-to-a-site/images/06.png)

```{tip}
もしユーザーがログインしていて、ページを編集する権限を持っていて、複数の [体験](../../personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md) がある場合、ユーザーは選択した体験に基づいてページを表示/プレビューすることができます。
```

## 関連トピック

[ページについて](../understanding-pages/understanding-pages.md) 

[コンテンツページの使用](../using-content-pages.md) 
