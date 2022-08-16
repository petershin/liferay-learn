# サイトにページを追加する

以下の手順では、サイトに新しいページを追加し、一般的なオプションを設定する方法について説明します。 残りのページ設定を設定する方法については、 [ページ単位での設定](../page-settings/configuring-individual-pages.md) を参照するか、または [ページセット](../understanding-pages/understanding-pages.md#page-sets) のオプションを設定する方法について [ページセットの設定](../page-settings/configuring-page-sets.md) を参照してください。

```{note}
Liferay 7.4 U22+ と GA22+ では、新規インストール時にプライベートページが無効になっています。 ただし、必要に応じて有効にすることができます。 詳しくは、 [プライベートページを有効にする](../understanding-pages/understanding-pages.md#enabling-private-pages) をご覧ください。
```

## 新しいページを追加する

新しいページは、ページの管理画面、またはページツリー（Liferay DXP 7.3+のみ）から追加することができます。

### ページ管理から新しいページを追加する

1. **サイトメニュー**(![Site Menu](../../../images/icon-menu.png)) を開き、 **サイトビルダー** を展開し、 **ページ** をクリックします。

1. **追加** ボタン (![Add](../../../images/icon-add.png)) をクリックし、 **ページ** を選択します。

   ![サイトにページを追加する。](./adding-a-page-to-a-site/images/01.png)

1. Page Template Sets」で、「Basic」または「Global」のテンプレートを選択します。

   空の [コンテントページ](../understanding-pages/understanding-pages.md#page-types) から始めるには、 **空白の**[マスターページテンプレート](../defining-headers-and-footers/master-page-templates.md)をクリックしてください。

   または、他の利用可能なテンプレートから選択します。

   ![ページの基本テンプレートまたはグローバルテンプレートを選択します。](./adding-a-page-to-a-site/images/02.png)

1. ページの追加」ダイアログで名前を入力し、 「**ページの追加**」 をクリックします。

コンテンツページを作成した場合は、コンテンツページの下書きにリダイレクトされ、フラグメントやウィジェットの追加を開始することができます。

Widgetページを作成した場合、ページの設定オプションにリダイレクトされます。

```{tip}
デフォルトでは、新しいページはサイトのナビゲーションメニューに含まれます。 このナビゲーションメニューを設定するには、[サイトナビゲーションの管理](../../site-navigation/managing-site-navigation.md)を参照してください。
```

### ページツリーメニューから新しいページを追加する

> 対応可能：Liferay DXP/Portal 7.3以降

1. **サイトメニュー**(![Site Menu](../../../images/icon-menu.png)) を開き、 **ページツリー**(![Page Tree](../../../images/icon-page-tree.png)) をクリックします。

1. **追加** ボタン(![Add Button](../../../images/icon-add-app.png))をクリックすると、新しいページが追加されます。

   ![ページツリーメニューを使用して新規ページを追加する。](adding-a-page-to-a-site/images/03.png)

1. [上記](#adding-a-new-page) のページ作成の標準的な手順に従ってください。

```{tip}
下書き状態のページには、ページツリーで名前の横にアスタリスク（*）が表示されます。
```

## サブページを追加する

サブページは、ページ管理またはページツリー（Liferay DXP 7.3以降のバージョンに限る）から追加することができます。

### ページ管理からサブページを追加する

1. **サイトメニュー**(![Site Menu](../../../images/icon-menu.png)) を開き、 **サイトビルダー** を展開し、 **ページ** をクリックします。

1. </em> 既存のページの「 *追加」ボタン（![Add](../../../images/icon-duplicate.png)）をクリックします。</p>

   ![終了するページの横にある［Add］ボタンをクリックして、新しい子ページを作成します。](./adding-a-page-to-a-site/images/04.png)</li>

1

[上記](#adding-a-new-page) のページ作成の標準的な手順に従ってください。</ol>

```{tip}
ページの横にあるアクションメニュー (![Actions Menu](../../../images/icon-actions.png)) を使用すると、コンテントページのドラフトをプレビュー（Liferay DXP 7.2以降）したり、下書きを承認（Liferay DXP 7.2 のみ）することができます。 これらのオプションは、下書き状態のページと、ページの編集権限を持つユーザーで利用できます。
```

### ページツリーからサブページを追加する

> 対応可能：Liferay DXP/Portal 7.3以降

1. **サイトメニュー**(![Site Menu](../../../images/icon-menu.png)) を開き、 **ページツリー**(![Page Tree](../../../images/icon-page-tree.png)) をクリックします。

1. 目的のページの **アクション** ボタン (![Actions Button](../../../images/icon-actions.png)) をクリックし、 **子ページの追加** を選択します。

    ![ページツリーメニューを使用して子ページを追加する。](adding-a-page-to-a-site/images/05.png)

1. [上記](#adding-a-new-page) のページ作成の標準的な手順に従ってください。

## 関連情報

- [ページについて](../understanding-pages/understanding-pages.md)
- [コンテントページの使用](../using-content-pages.md)
- [サイトナビゲーションの管理](../../site-navigation/managing-site-navigation.md)
