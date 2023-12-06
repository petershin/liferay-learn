# サイトにページを追加する

以下のステップでは、サイトに新しいページを追加し、一般的なオプションを設定する方法を説明します。 残りのページ設定の構成方法については、 [個別ページの構成](../page-settings/configuring-individual-pages.md)を参照するか、 [ページセットの構成](../page-settings/configuring-page-sets.md) を参照して、 [ページセットのオプションを構成する](../understanding-pages/understanding-pages.md#page-sets) 。

```{note}
Liferay 7.4 U22+とGA22+では、新規インストール時にプライベートページが無効になります。 プライベート・ページを有効にするには、 [プライベート・ページを有効にする](../understanding-pages/understanding-pages.md#enabling-private-pages) を参照してください。
```

## 新しいページを追加する

新しいページはページ管理画面またはページツリーから追加できます（Liferay DXP 7.3+のみ）。

### ページ管理から新しいページを追加する

1. **Site Menu**( ![Site Menu](../../../images/icon-menu.png) ) を開き、 **Site Builder** を展開し、 **Pages** をクリックします。

1. **Add**( ![Add button](../../../images/icon-add.png) ) をクリックし、 **Page** を選択する。

   ![サイトにページを追加する。](./adding-a-page-to-a-site/images/01.png)

1. ページテンプレートセットで、基本テンプレートまたはグローバルテンプレートを選択します。

   空の [コンテンツページ](../understanding-pages/understanding-pages.md#page-types) から始めるには、 **空白**[マスターページテンプレート](../defining-headers-and-footers/master-page-templates.md)を選択します。

   または、他の利用可能なテンプレートから選択します。

   ![ページの基本テンプレートまたはグローバルテンプレートを選択します。](./adding-a-page-to-a-site/images/02.png)

1. ページの追加ダイアログで、名前を入力し、 **Add** をクリックします。

コンテンツページを作成した場合、コンテンツページの下書きにリダイレクトされ、フラグメントやウィジェットを追加することができます。

ウィジェットページを作成した場合、ページの設定オプションにリダイレクトされます。

```{tip}
デフォルトでは、新しいページはサイトのナビゲーション・メニューに含まれます。 このナビゲーションメニューを設定するには、 [サイトナビゲーションの管理](../../site-navigation/managing-site-navigation.md) を参照してください。
```

### ページツリーメニューから新しいページを追加する

{bdg-secondary}`Liferay DXP/Portal 7.3以降で利用可能`

1. **Site Menu**( ![Site Menu](../../../images/icon-menu.png) ) を開き、 **Page Tree**( ![Page Tree](../../../images/icon-page-tree.png) ) をクリックします。

1. **Add**( ![Add Button](../../../images/icon-add-app.png) ) をクリックし、 **Add Page** を選択する。

   ![ページツリーメニューを使って新しいページを追加する。](adding-a-page-to-a-site/images/03.png)

1. [Adding a New Page](#adding-a-new-page) に示すように、ページを作成する標準的な手順に従ってください。

```{tip}
下書きステータスのページには、ページツリーの名前の横にアスタリスク(*)が付いています。
```

## サブページを追加する

子ページはページ管理画面またはページツリー（Liferay DXP 7.3+のみ）から追加できます。

### ページ管理からサブページを追加する

1. **Site Menu**( ![Site Menu](../../../images/icon-menu.png) ) を開き、 **Site Builder** を展開し、 **Pages** をクリックします。

1. **Add**( ![Add button](../../../images/icon-duplicate.png) ) をクリックします。

   ![新しい子ページを作成するには、終了したページの横にある追加ボタンをクリックしてください。](./adding-a-page-to-a-site/images/04.png)

1. [新しいページの追加](#adding-a-new-page) に概説されているように、ページを作成するための標準的な手順に従ってください。

```{tip}
ページの横にあるアクションメニュー（ ![アクションメニュー](../../../images/icon-actions.png) ）を使うと、コンテンツページのドラフトをプレビューすることができます（Liferay DXP 7.2+）。 これらのオプションは、下書きステータスのページと、ページ編集権限を持つユーザーに利用可能です。
```

### ページツリーからサブページを追加する

{bdg-secondary}`Liferay DXP/Portal 7.3以降で利用可能`

1. **Site Menu**( ![Site Menu](../../../images/icon-menu.png) ) を開き、 **Page Tree**( ![Page Tree](../../../images/icon-page-tree.png) ) をクリックします。

1. 目的のページで、 **Actions**( ![Actions Button](../../../images/icon-actions.png) ) をクリックし、 **Add Child Page** を選択する。

   ![ページツリーメニューを使って子ページを追加する。](adding-a-page-to-a-site/images/05.png)

1. [新しいページの追加](#adding-a-new-page) に概説されているように、ページを作成するための標準的な手順に従ってください。

## ページのプレビュー

作成したページを公開する前にプレビューしたり、作業が必要なページを確認することができます：

1. **Site Menu**( ![Site Menu](../../../images/icon-menu.png) ) を開き、 **Site Builder** &rarr; Pages を選択します。

1. プレビューしたいページの **アクション**( ![Actions Icon](../../../images/icon-actions.png) ) をクリックし、 **表示** を選択します。

![作業前にページを簡単にプレビューできる](./adding-a-page-to-a-site/images/06.png)

## 関連トピック

- [ページについて](../understanding-pages/understanding-pages.md)
- [コンテントページの使用](../using-content-pages.md)
- [サイトナビゲーションの管理](../../site-navigation/managing-site-navigation.md)
