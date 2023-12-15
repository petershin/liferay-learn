# 表示ページを使用したカテゴリー表示

{bdg-secondary}`利用可能です：Liferay DXP/Portal 7.4+.`.

表示ページテンプレートを使えば、ウェブコンテンツ、ドキュメント、ブログエントリーを [表示ページ](../../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) にレンダリングすることができます。 Liferay DXP 7.4からは、表示ページにカテゴリをレンダリングすることもできます。 これは、 [カテゴリを使用して整理された複数の製品やサービスを紹介したい場合に便利です](../../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md) 。 ディスプレイページは、一貫した方法で要素のカタログを表示するのに適しているため、カテゴリベースのディスプレイページを使用して、製品やサービスのカタログを閲覧する際に一貫した体験をユーザーに提供することができます。

## 表示ページを使用したカテゴリー表示

表示ページでカテゴリをレンダリングする方法は、他のタイプの表示ページコンテンツをレンダリングする方法と同じです：

* [カテゴリー用の表示ページテンプレート（](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md) ）を作成し、このテンプレートをデフォルトとして設定する。
* [、カテゴリー](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) を作成または編集する際に、お好みの表示ページ・テンプレートを選択してください。

また、一度に複数のカテゴリーに表示ページテンプレートを割り当てることもできます。

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **Categorization** &rarr; **Categories** に移動します。

2. 更新したいカテゴリーにチェックを入れ、 **ページ**(![Page](../../../images/icon-page.png)) をクリックするか、上部のアクションメニュー (![Actions](../../../images/icon-actions.png)) メニューから、 **表示ページテンプレートの割り当て** を選択します。

![Set the display page template as default using the Actions menu.](./displaying-categories-using-display-pages/images/01.png)

## 例：表示ページでのカテゴリベースのナビゲーションの使用

このステップバイステップの例では、架空の保険会社のサービスを表示するために、表示ページテンプレートと組み合わせてカテゴリーを使用する方法を紹介します。

1. [表示したいカテゴリーを作成し、編集する](#step-1-creating-and-editing-the-categories) 。

2. [表示ページのテンプレートを作成する](#step-2-creating-the-display-page-template) 。

3. [表示ページのテンプレートを編集して公開する](#step-3-edit-and-publish-the-display-page-template) 。

```{warning}
次の例は、デフォルトの表示ページ・テンプレートを変更する方法を示しています。 本番サイトでの混乱を避けるため、テストサイトでこの手順を完了してください。
```

### ステップ1：カテゴリの作成と編集

[カテゴリーがまだ存在しない場合は](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#creating-categories) を作成し、表示ページにマッピングしたい情報を含めます。 この例では、説明と画像を持つ2つの新しいカテゴリーを作成し、それぞれのカテゴリーが異なるサービスに対応しています。

1. **サイトメニュー**(![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **Categorization** &rarr; **Categories** に移動します。

1. [Vehicle Ownership という新しい語彙](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-vocabularies) を作成する。

1. [新しいカテゴリーを作成する](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-categories) 「自動車保険」という新しいカテゴリーを作成する。 ［**Save**］をクリックします。

1. カテゴリー・アプリケーションで、新しいカテゴリーの **Actions**(![Actions](../../../images/icon-actions.png)) をクリックし、 **Edit** を選択します。

1. 画像 **タブをクリックし、***追加**(![追加ボタン](../../../images/icon-add.png))をクリックして、カテゴリーに画像を追加します。

1. 詳細*タブをクリックし、このカテゴリの説明を追加します。

   ![Edit the category and add a description.](./displaying-categories-using-display-pages/images/02.png)

1. ［**Save**］をクリックします。

### ステップ２：表示ページテンプレートの作成

Liferay DXP 7.4から、表示ページテンプレートには、コンテンツタイプとしてカテゴリを使用するオプションが含まれています。

1. [サイトメニュー](../../../images/icon-product-menu.png) )を開き、 **デザイン** &rarr; **ページテンプレート** に移動します。

1. ページテンプレートの表示]をクリックし、[追加]をクリックします(![画像の追加](../../../images/icon-add.png))。

1. この表示ページテンプレートに使用するマスターページテンプレートを選択します。

   ```{tip}
   すべてのページやページテンプレートはマスターページテンプレートを必要とします。 詳しくは、 [マスターページテンプレート](../../creating-pages/defining-headers-and-footers/master-page-templates.md) をお読みください。
   ```

1. 表示ページテンプレートの **名前** を入力し、コンテンツタイプのドロップダウンメニューで **カテゴリー** を選択します。

   ![Select category as the content type of your new display page template.](./displaying-categories-using-display-pages/images/03.png)

1. ［**Save**］をクリックします。

### ステップ３：表示ページテンプレートの編集と公開

表示ページテンプレートを作成したら、コンポーネントのマッピングとレイアウトを編集できます。

```{tip}
表示ページ・テンプレート・エディターはコンテンツ・ページ・エディターのように機能します。 詳しくは、 [コンテンツページに要素を追加する](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md) をご覧ください。
```

この例では、 [カード・フラグメント](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) を使って、カテゴリー・フィールドをマッピングする方法を示している。

1. コンテナフラグメントをデフォルトのドロップゾーンにドラッグ＆ドロップする。

1. コンテナフラグメントの上に、新しいカードフラグメントをドラッグ＆ドロップします。

1. **ブラウザ**(![Browser](../../../images/icon-hierarchy.png)) ボタンをクリックし、カードのタイトルをクリックしてマッピングオプションを開きます。

1. マッピングタブで、 **ソース** ドロップダウンメニューをクリックし、 **特定のコンテンツ** を選択します。

1. アイテム*をクリックし、マッピングしたいカテゴリーを選択します。

1. フィールド 」**ドロップダウンメニューをクリックし、「名前**」を選択して、カテゴリー名をカードのタイトルにマッピングします。

   ![Map the category fields in the display page template using a card fragment.](./displaying-categories-using-display-pages/images/04.png)

1. カードの説明についても同じマッピング作業を繰り返す。 このリストは、例のカード・フラグメントとカテゴリー・フィールドのマッピングをまとめたものである：

   * タイトル &rarr; 名前
   * コンテンツ &rarr; 説明
   * 画像 &rarr; メイン画像

1. ［**公開**］ をクリックします。

1. 表示ページテンプレート]リストで、新しい表示ページテンプレートの [アクション ](**![Actions](../../../images/icon-actions.png) ) をクリックし、[デフォルトとしてマーク**]を選択します。

   ![Set the display page template as default using the Actions menu.](./displaying-categories-using-display-pages/images/05.png)

1. サイト・メニュー (**![サイト・メニュー](../../../images/icon-product-menu.png))を開き、***Categorization***&rarr;***Categories** に移動し、 [ステップ1](#step-1-creating-and-editing-the-categories) のカテゴリーを持つ語彙を選択します。

1. どのカテゴリーでも、 **Actions**(![Actions](../../../images/icon-actions.png)) をクリックし、 **View Display Page** を選択します。

    ![Open the display page for one of the categories using Actions option.](./displaying-categories-using-display-pages/images/06.png)

表示ページはあなたの表示ページテンプレートマッピングを使ってカテゴリーフィールドを表示します。 表示ページのURLは、選択したカテゴリーで一意です。

![The display page template shows the category fields and provides a unique URL.](./displaying-categories-using-display-pages/images/07.png)

## 関連トピック

[表示ページテンプレートの作成と管理](./creating-and-managing-display-page-templates.md) 

[表示ページによるコンテンツの公開](./publishing-content-with-display-pages.md) 

[コンテンツのカテゴリーとボキャブラリーを定義する](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) 。
