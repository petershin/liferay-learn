# ナビゲーションメニューアプリケーションの使用

ナビゲーションメニューアプリケーションを使用して、サイトページやコンテンツのカスタムメニューを作成します。 これを使えば、メニューにどの要素が含まれ、どのように構成されるかを決めることができる。 一度作成したカスタムメニューは、 [ページフラグメント](../creating-pages/page-fragments-and-widgets/using-fragments.md) または [ウィジェット](../creating-pages/using-widget-pages/adding-widgets-to-a-page.md) を使って表示することができます。

```{note}
Liferay 7.3以前では、ナビゲーションメニューに追加できるエンティティはページだけです。 Liferay 7.4 U1+では、ナビゲーションメニューにエンティティタイプを追加することができます。
```

![Creating custom menus for site pages and content.](./using-the-navigation-menus-application/images/01.png)

```{tip}
Liferay 7.3+では、カスタムフィールドを使ってナビゲーションメニューの項目に詳細な情報を追加することができます（*Custom Fields*メニューの*Site Navigation Menu Item*の下）。 この情報をApplication Display Templatesを使用して、ナビゲーションメニューをさらにカスタマイズすることができます。
```

## ナビゲーションメニューの作成

ナビゲーションメニューを作成するには、以下の手順に従ってください：

1. **サイトメニュー**( ![サイトメニュー](../../images/icon-product-menu.png))を開き、 **サイトビルダー** &rarr; **ナビゲーションメニュー** に移動します。

   ![Access navigation menus in the site menu.](./using-the-navigation-menus-application/images/02.png)

1. **追加**( ![追加ボタン](../../images/icon-add.png))をクリックします。

1. ナビゲーションメニューの **名前** を入力します。

   ![Create a navigation menu.](./using-the-navigation-menus-application/images/03.png)

1. ［**保存**］をクリックします。

新しいカスタムメニューが表示され、エレメント（ページ、ドキュメント、カテゴリーなど）を追加することができます。

### ナビゲーション・メニューに新しい要素を追加する

1. **追加**( ![追加ボタン](../../images/icon-add.png))をクリックします。

1. メニューに追加したい要素の種類（ページ、ドキュメント、カテゴリーなど）を選択します。 項目選択ウィンドウが開きます。

   同じメニューに複数の要素を追加することができます。

![Select the type of element you want to add to the menu.](./using-the-navigation-menus-application/images/04.png)

1. 追加したい要素を選択し、 **選択** をクリックします。

   複数の要素を選択できる。

   ```{important}
   追加された要素が [関連する表示ページ](../displaying-content/using-display-page-templates.md) を持っていない場合、警告が表示されます。 この項目には表示ページがありません。表示ページのない項目はリンクがないため、メニューに表示されません。
   ```

   ![A warning appears when the added element does not have an associated display page.](./using-the-navigation-menus-application/images/05.png)

1. オプションで、メニュー要素をドラッグ・アンド・ドロップして再編成したり、階層構造に並べたりすることもできます。

   ```{tip}
   メニュー要素を階層構造にすることに加えて、*Submenu*タイプを使ってメニューにサブセクションを追加することもできます。 子要素を持つ要素を削除すると、子要素も削除されます。
   ```

   ![Adding elements to navigation menus.](./using-the-navigation-menus-application/images/06.png)

1. オプションで、ナビゲーション・メニュー・ツリーから子ナビゲーション・メニュー要素を追加することができます。

   必要なナビゲーション・メニュー・エレメントの **Actions**( ![アクション・ボタン](../../images/icon-actions.png))をクリックし、 **Add Child** を選択し、子エレメントのタイプを選択します。

   ![Add child navigation menu elements right from the navigation menu tree](./using-the-navigation-menus-application/images/07.png)

   ```{tip}
   ナビゲーション・メニューの要素の一つをクリックし、キーボードの矢印を使ってナビゲーション・メニュー・ツリーを移動する。
   ```

1. オプションで、各メニュー要素のカスタム表示名を定義します。 ページ要素や、表示ページを使用するあらゆるコンテンツタイプ要素（ブログエントリー、ウェブコンテンツ記事、ドキュメント、ボキャブラリー、カテゴリーを含む）に対して、カスタム名を定義できます。

   ```{note}
   Liferay 7.4のバージョンU9+またはGA13+では、表示ページを使用するコンテンツタイプ要素にのみカスタム表示名を定義できます。
   ```

   これを行うには、メニュー要素を選択し、サイドパネルで **Use Custom Name** をチェックし、名前を入力し、 **Save** をクリックします。

   ![Customize the display of menu elements.](./using-the-navigation-menus-application/images/08.png)

メニューの変更はすべて保存される。

### 動的語彙要素の使用

[ボキャブラリー・ナビゲーション・メニュー・エレメント](./navigation-menu-element-types.md#vocabularies) は動的です。1つのエレメントがページに表示されると、1つのエレメントではなく、現在の階層にあるすべてのカテゴリーとサブカテゴリーが追加されます。 語彙の内容を変更すると、自動的にメニューに反映される。

ダイナミック・ボキャブラリー・エレメントを使えば、アイテムの階層が変化しても、素早く簡単にナビゲーション・メニューを更新することができます。 例えば、 [新しいカタログを作成する](https://learn.liferay.com/w/commerce/product-management/catalogs/creating-a-new-catalog) の中で、商品のタイプを表すためにカテゴリーを使用することができます。そして、カテゴリーを更新すると、語彙を使用しているすべてのメニューが自動的に更新されます。 そして、それらのカテゴリーに使われている [表示ページ](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) に応じて、カテゴリー分けの変更が自動的にページやナビゲーションメニューに反映されることがある。

![Dynamic vocabulary elements automatically update to reflect their hierarchy of categories in your navigation menus.](./using-the-navigation-menus-application/images/09.png)

### ナビゲーション・メニューのプレビュー

ナビゲーションメニューを編集中にプレビューして、ページ上に表示されたときの見え方を確認することができます。 目のアイコン\* ( ![目のアイコン](../../images/icon-view.png))をクリックすると、ナビゲーション・メニューのプレビューがポップアップ・ウィンドウで開きます。

![Preview a navigation menu to see how it looks when displayed on a page.](./using-the-navigation-menus-application/images/10.png)

また、ドロップダウンメニューからさまざまなオプションを選択し、リストやタブスタイルなど、メニューの表示スタイルを変更することもできます。

## ページ作成時のメニューの使用

ユーザーがサイトページを作成する際、既存のすべてのナビゲーションメニューのリストが表示されます。 利用可能なメニューリストから特定のメニューを非表示にすることで、この動作を変更することができる。

![Add the new page to an existing navigation menu.](./using-the-navigation-menus-application/images/11.png)

ナビゲーションメニューにこの動作を設定するには、以下の手順に従ってください：

1. **サイトメニュー**( ![サイトメニュー](../../images/icon-product-menu.png))を開き、 **サイトビルダー** &rarr; **ナビゲーションメニュー** に移動します。

1. 希望のメニューを選択する。

1. **Actions**（ [Actionsボタン](../../images/icon-actions.png) ）をクリックします。

1. チェックを外す／チェックする

   ![You can select from existing navigationmenus when creating site pages](./using-the-navigation-menus-application/images/12.png)

1. ［**保存**］をクリックします。

## ナビゲーションメニュータイプの設定

以下の手順に従って、ナビゲーション・メニューのタイプを設定してください：

1. **サイトメニュー**( ![サイトメニュー](../../images/icon-product-menu.png))を開き、 **サイトビルダー** &rarr; **ナビゲーションメニュー** に移動します。

1. 必要なメニューの **アクション**( ![アクションボタン](../../images/icon-actions.png) ) をクリックします。

1. 希望のナビゲーション・タイプを選択します：プライマリーナビゲーション、セカンダリーナビゲーション、またはソーシャルナビゲーション。

   ![Select the desired navigation type.](./using-the-navigation-menus-application/images/13.png)

   一度選択されると、各メニューの設定はMarked As欄に表示されます。

| ナビゲーションメニューのタイプ    | 使用量                                                               |
| :----------------- | :---------------------------------------------------------------- |
| **プライマリ ナビゲーション** | プライマリ ナビゲーションは、ページのメインナビゲーションです。                                  |
| **セカンダリー・ナビゲーション** | セカンダリーナビゲーションは、ナビゲーションの第2レベルであり、ページ内のサイドバーまたは個別のメニューが考えられます。      |
| **ソーシャルナビゲーション** | ソーシャルナビゲーションは、ソーシャルメディアまたは同様のタスクでコンテンツを共有するためのリンクを含むメニューのためのものです。 |

## ナビゲーションメニューの削除

1. **サイトメニュー**( ![サイトメニュー](../../images/icon-product-menu.png))を開き、 **サイトビルダー** &rarr; **ナビゲーションメニュー** に移動します。

1. [アクションボタン](../../images/icon-actions.png) をクリックし、 **削除** をクリックします。

1. 確認で **OK** をクリックします。

ナビゲーションメニューが削除される。

## 関連トピック

* [ナビゲーション・メニュー要素の種類](./navigation-menu-element-types.md)
* [メニュー表示の設定](./configuring-menu-displays.md)
