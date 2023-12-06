# アセットパブリッシャーウィジェットでのアセットの選択

アセット・パブリッシャー・ウィジェットは、特定の基準に基づいて動的にアセットを選択するか、手動で表示するアセットを正確に指定するように構成できます。 [コレクション](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)からアセットを表示することもできます。

```{note}
Liferay 7.2以下では、コレクションは [コンテンツセット](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md#liferay-dxp-7-2) と呼ばれます。
```

1. [新規ページの作成](../../creating-pages/adding-pages/adding-a-page-to-a-site.md) または [既存ページの編集](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)

1. **Add**( ![Add widget icon](../../../images/icon-add-widget.png) ) をクリックして、Fragments and Widgets パネルを開きます。

1. ウィジェット]タブの[コンテンツ表示]カテゴリで、[**Asset Publisher**]ウィジェットをページの任意の場所にドラッグします。

1. Asset Publisher ウィジェットの右上隅にある **Actions**(![Actions icon.](../../../images/icon-actions.png)) をクリックします。

   ![Actions] をクリックして、Asset Publisher 設定オプションにアクセスします。](./selecting-assets-in-the-asset-publisher-widget/images/01.png)

1. ［**Configuration**］ を選択して、設定ダイアログを表示します。

   Asset Selection（資産選択）で、資産のフィルタリング方法を選択します。 これらのオプションの説明については、 [データ選択方法オプション](#asset-selection-options) を参照してください。

   ![構成ウィンドウには、［Setup］タブの下にさまざまなデータ選択方法オプションがあります。](selecting-assets-in-the-asset-publisher-widget/images/02.png)

1. オプションとして、 [Dynamic](#dynamic) および [Manual](#manual) Asset Selection オプションが選択されている場合、 **Create a collection from this configuration** をクリックして新しいコレクションを作成できます。 これは新しい [コレクション](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)として設定を保存する。

1. アセットを選択し、ウィジェットを設定したら、 **Save** をクリックします。

## データ選択方法オプション

Asset Publisher ダイアログの Asset Selection セクションでは、さまざまなオプションを使用してアセットを選択できます：

- [コレクション](#collection)
- [動的](#dynamic)
- [手動](#manual)

### コレクション

以前に保存したコレクションまたはコレクションプロバイダから選択するには、このオプションを選択します。 コレクションについて詳しくは、 [コレクションとコレクション・ページについて](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)をお読みください。

 1. ［Select Collection］で、 ［**選択**］ をクリックします。

 1. ［**Collections**］ または ［**Collection Providers**］ タブのいずれかを選択します。

 1. 既存のコレクションまたはコレクションプロバイダーのいずれかを選択します。

 1. ［**Save**］ をクリックします。

 ![選択」をクリックし、保存したコレクションから選択します。](selecting-assets-in-the-asset-publisher-widget/images/03.png)

```{note}
開発者は、コレクションプロバイダーを使用して、より高度な基準を持つ特定のコレクションを作成することができます。 詳しくは、開発者向けドキュメント [Info Framework](https://help.liferay.com/hc/ja/articles/360029067251-Introduction-to-The-Info-Framework) の [Creating an Information List Provider](https://help.liferay.com/hc/ja/articles/360029067271-Creating-an-Information-List-Provider) に関する情報をご覧ください。
```

### 動的

動的アセット選択を使用すると、さまざまな基準に基づいてアセットをアセット・パブリッシャ・ウィジェットに自動的に含めることができます。

  1. ソースセクションで、アセットタイプドロップダウンメニューを使用してアセットを選択します。 特定のアセットタイプを選択するか、 **Select More Than One** 、異なるタイプから選択します。

  1. Scope（範囲）セクションで、個々のサイトまたは他のサイトのアセットを表示するかどうかを選択します。

  1. Filter]セクションで、Asset Publisherウィジェットのアセットのルールを定義します。 [カテゴリ](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)、 [タグ](../../../content-authoring-and-management/tags-and-categories/tagging-content-and-managing-tags.md)、またはキーワードに基づいてルールを定義することができます。

  1. カスタムユーザ属性を定義している場合は、それを含める。

  1. Ordering] セクションで、Asset Publisher ウィジェットのアセットの表示順序を選択します。

![ソース、スコープ、フィルタ、カスタムユーザー属性、順序など、ダイナミックアセットコレクションのオプションを定義します。](selecting-assets-in-the-asset-publisher-widget/images/04.png)

### 手動

ここでは、パラメータを設定し、手動で特定の資産をフィルタリングすることができます：

 1. Scope（範囲）セクションで、個々のサイトまたは他のサイトのアセットを表示するかどうかを選択します。

 1. ［アセットエントリー］セクションで、［選択］ボタンを使用して特定のタイプのアセットをフィルタリングします。

 1. 選択するアセットのタイプについて、含めるアセットにチェックを入れます。

 1. ［**追加**］ をクリックします。

 ![以下は、基本的なウェブコンテンツをフィルタリングし、手動で項目を選択する例である。](selecting-assets-in-the-asset-publisher-widget/images/05.png)

 ```{note}
 選択に基づいて新しいコレクションが作成されます。
 ```

## 関連トピック

- [アセットパブリッシャーウィジェットを使用したアセットの表示](./displaying-assets-using-the-asset-publisher-widget.md)
- [アセットパブリッシャー表示設定の構成](./configuring-asset-publisher-display-settings.md)
- [コレクションとコレクションページについて](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
