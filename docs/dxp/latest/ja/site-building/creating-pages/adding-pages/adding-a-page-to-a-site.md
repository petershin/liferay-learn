# サイトにページを追加する

以下の手順では、サイトに新しいページを追加し、一般的なオプションを設定する方法について説明します。 残りのページ設定を設定する方法については、[Configuring Individual Pages](../page-settings/configuring-individual-pages.md)を参照するか、または[ページセット](../understanding-pages/understanding-pages.md#page-sets)のオプションを設定する方法について[Configuring Page Sets](../page-settings/configuring-page-sets.md)を参照してください。

```{note}
Liferay 7.4 U22+とGA22+では、新規インストール時にプライベートページが無効になります。 ただし、必要に応じて有効にすることもできる。 詳しくは[プライベートページの有効化](../understanding-pages/understanding-pages.md#enabling-private-pages)を参照してください。
```

## 新しいページを追加する

ページの管理画面またはページツリー（Liferay DXP 7.3+のみ）から新しいページを追加できます。

### ページ管理から新しいページを追加する

1. *Site Menu* (![Site Menu](../../../images/icon-menu.png)) を開き、 *Site Builder*を展開し、 *Pages*をクリックします。

1. *Add* ボタン (![Add](../../../images/icon-add.png)) をクリックし、 *Page*を選択する。

   ![サイトにページを追加する。](./adding-a-page-to-a-site/images/01.png)

1. ページテンプレートセットで、基本テンプレートまたはグローバルテンプレートを選択します。

   空の [コンテントページ](../understanding-pages/understanding-pages.md#page-types)から始めるには、 *空白の* [マスターページテンプレート](../defining-headers-and-footers/master-page-templates.md)をクリックしてください。

   または、他の利用可能なテンプレートから選択します。

   ![ページの基本テンプレートまたはグローバルテンプレートを選択します。](./adding-a-page-to-a-site/images/02.png)

1. ページの追加ダイアログで、名前を入力し、 *Add*をクリックします。

コンテンツページを作成した場合、コンテンツページの下書きにリダイレクトされ、フラグメントやウィジェットを追加することができます。

ウィジェットページを作成した場合、ページの設定オプションにリダイレクトされます。

```{tip}
デフォルトでは、新しいページはサイトのナビゲーションメニューに含まれます。 このナビゲーションメニューを設定するには、[サイトナビゲーションの管理](../../site-navigation/managing-site-navigation.md)を参照してください。
```

### ページツリーメニューから新しいページを追加する

> 対応可能：Liferay DXP/Portal 7.3以降

1. *Site Menu* (![Site Menu](../../../images/icon-menu.png)) を開き、 *Page Tree* (![Page Tree](../../../images/icon-page-tree.png)) をクリックします。

1. 新しいページを追加するには、 *Add* ボタン (![Add Button](../../../images/icon-add-app.png)) をクリックします。

   ![ページツリーメニューを使用して新規ページを追加する。](adding-a-page-to-a-site/images/03.png)

1. [上記](#adding-a-new-page)のページ作成の標準的な手順に従ってください。

```{tip}
下書きステータスのページには、ページツリーの名前の横にアスタリスク(*)が付いています。
```

## サブページを追加する

サブページは、ページ管理またはページツリー（Liferay DXP 7.3以降のバージョンに限る）から追加することができます。

### ページ管理からサブページを追加する

1. *Site Menu* (![Site Menu](../../../images/icon-menu.png)) を開き、 *Site Builder*を展開し、 *Pages*をクリックします。

1. 既存のページの *追加* ボタン (![Add](../../../images/icon-duplicate.png)) をクリックします。

   ![終了するページの横にある［Add］ボタンをクリックして、新しい子ページを作成します。](./adding-a-page-to-a-site/images/04.png)

1. [上記](#adding-a-new-page)のページ作成の標準的な手順に従ってください。

```{tip}
ページの横にあるアクションメニュー (![Actions Menu](../../../images/icon-actions.png)) を使用すると、コンテントページのドラフトをプレビュー（Liferay DXP 7.2以降）したり、下書きを承認（Liferay DXP 7.2 のみ）することができます。 これらのオプションは、下書き状態のページと、ページの編集権限を持つユーザーで利用できます。
```

### ページツリーからサブページを追加する

> 対応可能：Liferay DXP/Portal 7.3以降

1. *Site Menu* (![Site Menu](../../../images/icon-menu.png)) を開き、 *Page Tree* (![Page Tree](../../../images/icon-page-tree.png)) をクリックします。

1. 目的のページの *アクション* ボタン (![Actions Button](../../../images/icon-actions.png)) をクリックし、 *子ページの追加*を選択します。

    ![ページツリーメニューを使用して子ページを追加する。](adding-a-page-to-a-site/images/05.png)

1. [上記](#adding-a-new-page)のページ作成の標準的な手順に従ってください。

## ページのプレビュー

作成したページをプレビューして、本番前にどのように見えるかを確認したり、作業が必要なページを特定することができます：

*Product Menu* ( ![Product Menu icon](../../../images/icon-product-menu.png) ) を開き、 *Site Builder* &rarr; Pages を選択します。

プレビューしたいページの *アクション* ( ![Actions Icon](../../../images/icon-actions.png) ) をクリックし、 *表示*を選択します。

![作業前にページを簡単にプレビューできる](./adding-a-page-to-a-site/images/06.png)

## 関連情報

- [ページについて](../understanding-pages/understanding-pages.md)
- [Using Content Pages](../using-content-pages.md)
- [サイトナビゲーションの管理](../../site-navigation/managing-site-navigation.md)
