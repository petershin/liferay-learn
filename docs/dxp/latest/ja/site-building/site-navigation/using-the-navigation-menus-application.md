# ナビゲーションメニューアプリケーションの使用

ナビゲーションメニューアプリケーションを使用して、サイトページやコンテンツのカスタムメニューを作成します。 これを使えば、メニューにどの要素が含まれ、どのように構成されるかを決めることができる。 一度作成したカスタムメニューは、 [ページフラグメント](../creating-pages/page-fragments-and-widgets/using-fragments.md) または [ウィジェット](../creating-pages/using-widget-pages/adding-widgets-to-a-page.md)を使って表示することができます。

```{note}
Liferay 7.3以前では、ナビゲーションメニューに追加できるエンティティはページだけです。 Liferay 7.4 U1+では、ナビゲーションメニューにエンティティタイプを追加することができます。
```

![サイトページやコンテンツのカスタムメニューの作成。](./using-the-navigation-menus-application/images/01.png)

```{tip}
Liferay 7.3+では、カスタムフィールドを使ってナビゲーションメニューの項目に詳細な情報を追加することができます（*Custom Fields*メニューの*Site Navigation Menu Item*の下）。 この情報をApplication Display Templatesを使用して、ナビゲーションメニューをさらにカスタマイズすることができます。
```

## ナビゲーションメニューの作成

ナビゲーションメニューを作成するには、以下の手順に従ってください：

1. **Site Menu**( ![Site menu](../../images/icon-product-menu.png) ) を開き、 **Site Builder** &rarr; **Navigation Menus** に移動する。

   ![サイトメニューのナビゲーションメニューにアクセスする。](./using-the-navigation-menus-application/images/02.png)

1. **Add**( ![Add button](../../images/icon-add.png) ) をクリックする。

1. **ナビゲーションメニューの名前** を入力する。

   ![ナビゲーション・メニューを作成する。](./using-the-navigation-menus-application/images/03.png)

1. ［**Save**］ をクリックします。

新しいカスタムメニューが表示され、エレメント（ページ、ドキュメント、カテゴリーなど）を追加することができます。

### ナビゲーション・メニューに新しい要素を追加する

1. **Add**( ![Add button](../../images/icon-add.png) ) をクリックする。

1. メニューに追加したい要素の種類（ページ、ドキュメント、カテゴリーなど）を選択します。 項目選択ウィンドウが開きます。

   同じメニューに複数の要素を追加することができます。

  ![メニューに追加したい要素の種類を選択します。](./using-the-navigation-menus-application/images/04.png)

1. 追加したい要素を選択し、 **Select** をクリックする。

   複数の要素を選択できる。

   ```{important}
   追加された要素が[関連する表示ページ](../displaying-content/using-display-page-templates.md)を持っていない場合、警告が表示されます。 この項目には表示ページがありません。表示ページのない項目はリンクがないため、メニューに表示されません。
   ```

   ![追加された要素に関連する表示ページがない場合、警告が表示されます。](./using-the-navigation-menus-application/images/05.png)

1. オプションで、メニュー要素をドラッグ・アンド・ドロップして再編成したり、階層構造に並べたりすることもできます。

   ```{tip}
   メニュー要素を階層構造にすることに加えて、*Submenu*タイプを使ってメニューにサブセクションを追加することもできます。 子要素を持つ要素を削除すると、子要素も削除されます。
   ```

   ![ナビゲーションメニューに要素を追加する](./using-the-navigation-menus-application/images/06.png)

1. オプションで、ナビゲーション・メニュー・ツリーから子ナビゲーション・メニュー要素を追加することができます。

   必要なナビゲーション・メニュー・エレメントの **アクション**( ![Actions button](../../images/icon-actions.png) ) をクリックし、 **子エレメントの追加** を選択し、子エレメント・タイプを選択します。

   ![ナビゲーション・メニュー・ツリーから子ナビゲーション・メニュー要素を直接追加する](./using-the-navigation-menus-application/images/07.png)

   ```{tip}
   ナビゲーション・メニューの要素の一つをクリックし、キーボードの矢印を使ってナビゲーション・メニュー・ツリーを移動する。
   ```

1. オプションで、各メニュー要素のカスタム表示名を定義します。 ページ要素や、表示ページを使用するあらゆるコンテンツタイプ要素（ブログエントリー、ウェブコンテンツ記事、ドキュメント、ボキャブラリー、カテゴリーを含む）に対して、カスタム名を定義できます。

   ```{note}
   Liferay 7.4のバージョンU9+またはGA13+では、表示ページを使用するコンテンツタイプ要素にのみカスタム表示名を定義できます。
   ```

   これを行うには、メニュー要素を選択し、サイドパネルで **Use Custom Name** をチェックし、名前を入力し、 **Save** をクリックします。

   ![メニュー要素の表示をカスタマイズする。](./using-the-navigation-menus-application/images/08.png)

メニューの変更はすべて保存される。

### 動的語彙要素の使用

[ボキャブラリー・ナビゲーション・メニュー・エレメント](./navigation-menu-element-types.md#vocabularies) は動的です。1つのエレメントがページに表示されると、1つのエレメントではなく、現在の階層にあるすべてのカテゴリーとサブカテゴリーが追加されます。 語彙の内容を変更すると、自動的にメニューに反映される。

ダイナミック・ボキャブラリー・エレメントを使えば、アイテムの階層が変化しても、素早く簡単にナビゲーション・メニューを更新することができます。 例えば、 [新しいカタログを作成する](https://learn.liferay.com/commerce/latest/ja/product-management/catalogs/creating-a-new-catalog.html) の中で、商品のタイプを表すためにカテゴリーを使用することができます。そして、カテゴリーを更新すると、語彙を使用しているすべてのメニューが自動的に更新されます。 そして、それらのカテゴリーに使われている [表示ページ](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) に応じて、カテゴリー分けの変更が自動的にページやナビゲーションメニューに反映されることがある。

![動的な語彙要素は、ナビゲーションメニューのカテゴリ階層を反映して自動的に更新されます。](./using-the-navigation-menus-application/images/09.png)

### ナビゲーション・メニューのプレビュー

ナビゲーションメニューを編集中にプレビューして、ページ上に表示されたときの見え方を確認することができます。 **Eye アイコン**( ![Eye icon](../../images/icon-view.png) ) をクリックすると、ナビゲーションメニューのプレビューを表示するポップアップウィンドウが開きます。

![ナビゲーションメニューをプレビューして、ページ上に表示したときの見え方を確認できます。](./using-the-navigation-menus-application/images/10.png)

また、ドロップダウンメニューからさまざまなオプションを選択し、リストやタブスタイルなど、メニューの表示スタイルを変更することもできます。

## ページ作成時にメニューを使用する

ユーザーがサイトページを作成する際、既存のすべてのナビゲーション・メニューのリストが表示されます。 利用可能なメニューリストから特定のメニューを非表示にすることで、この動作を変更することができる。

![既存のナビゲーションメニューに新しいページを追加します。](./using-the-navigation-menus-application/images/11.png)

ナビゲーションメニューにこの動作を設定するには、以下の手順に従います：

1. **Site Menu**( ![Site menu](../../images/icon-product-menu.png) ) を開き、 **Site Builder** &rarr; **Navigation Menus** に移動する。

1. 希望のメニューを選択する。

1. **アクション**( ![Actions button](../../images/icon-actions.png) ) をクリックしてください。

1. チェックを外す／チェックする

    ![サイトページを作成する際に、既存のナビゲーションメニューから選択することができます。](./using-the-navigation-menus-application/images/12.png)

1. ［**Save**］ をクリックします。

## ナビゲーションメニュータイプの設定

以下の手順に従って、ナビゲーション・メニューのタイプを設定してください：

1. **Site Menu**( ![Site menu](../../images/icon-product-menu.png) ) を開き、 **Site Builder** &rarr; **Navigation Menus** に移動する。

1. **Actions**( ![Actions button](../../images/icon-actions.png) ) をクリックします。

1. 希望のナビゲーション・タイプを選択します：プライマリーナビゲーション、セカンダリーナビゲーション、またはソーシャルナビゲーション。

    ![ご希望のナビゲーション・タイプを選択してください。](./using-the-navigation-menus-application/images/13.png)

    一度選択されると、各メニューの設定はMarked As欄に表示されます。

| ナビゲーションメニューのタイプ    | 使用法                                                               |
|:------------------ |:----------------------------------------------------------------- |
| **プライマリ ナビゲーション** | プライマリ ナビゲーションは、ページのメインナビゲーションです。                                  |
| **セカンダリー・ナビゲーション** | セカンダリーナビゲーションは、ナビゲーションの第2レベルであり、ページ内のサイドバーまたは個別のメニューが考えられます。      |
| **ソーシャルナビゲーション** | ソーシャルナビゲーションは、ソーシャルメディアまたは同様のタスクでコンテンツを共有するためのリンクを含むメニューのためのものです。 |

## ナビゲーションメニューの削除

1. **Site Menu**( ![Site menu](../../images/icon-product-menu.png) ) を開き、 **Site Builder** &rarr; **Navigation Menus** に移動する。

1. **アクション**( ![Actions button](../../images/icon-actions.png) ) をクリックし、 **削除** をクリックします。

1. 確認ウィンドウで [**OK**] をクリックします。

ナビゲーションメニューが削除される。

## 関連トピック

* [サイトナビゲーションの管理](./managing-site-navigation.md)
* [ナビゲーション・メニュー要素の種類](./navigation-menu-element-types.md)
* [メニュー表示を設定する](./configuring-menu-displays.md)
