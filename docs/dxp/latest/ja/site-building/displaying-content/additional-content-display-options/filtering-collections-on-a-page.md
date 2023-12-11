# ページ上のコレクションをフィルタリングする

サイト上でコレクションを閲覧するユーザーのエクスペリエンスを向上させるために、ページフラグメントを追加してコレクション内のコンテンツをフィルタリングすることができます。 例えば、キーワードを使用して、表示されたコレクションのコンテンツを検索およびフィルタリングするために使用できるフラグメントを追加できます。

ユーザーが表示されたコレクション内のコンテンツをフィルタリングできるように、ページに追加できる 2 つのページフラグメントがあります。 [コレクションフィルタフラグメント](#using-the-collection-filter-fragment) と [適用済みフィルタフラグメント](#using-the-applied-filters-fragment) 。

## コレクション・フィルター・フラグメントの使用

コレクションフィルタフラグメントは、ページ上の選択されたコレクションに表示されるコンテンツをフィルタリングするために使用されます。 ユーザーは、キーワードを検索したり、カテゴリやタグを選択して、フィルタフラグメントに関連するコレクションをフィルタリングすることができます。

[コレクション表示フラグメント](./displaying-collections.md#configuring-a-collection-display-fragment) ですでにコレクションを表示している）ページにコレクションフィルタフラグメントを追加して構成するには、以下の手順に従います：

1. ページの編集中に、ページの任意の場所にコレクション・フィルター・フラグメントを追加します。

1. フラグメントの _全般_ 設定で、目的のコレクションを選択します。 コレクションが効果を発揮するには、ページ上のコレクション表示フラグメントに表示されている必要があります。

   ![Configure the Fragment to use a Collection that is already displayed in a Collection Display Fragment.](./filtering-collections-on-a-page/images/01.png)

   互換性のあるコレクションを選択すると、_Filter_ ドロップダウンメニューが表示されます。

1. フィルターメニューを使用して、_キーワード_、_カテゴリー_、または_タグ_フィルターを選択します。

    ```{note}
    [`FragmentCollectionFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/fragment/fragment-collection-filter-api/src/main/java/com/liferay/fragment/collection/filter/FragmentCollectionFilter.java) と [`InfoFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/info/info-api/src/main/java/com/liferay/info/filter/InfoFilter.java) インターフェイスを実装した）カスタムコレクションフィルターを追加するモジュールがデプロイされている場合、これらのフィルターをリストから選択することもできます。
    ```

Collection Filter フラグメントの動作は、Keywords、Category、Tags のいずれのフィルタタイプを設定したかによって変化します。


```

```{note}
コレクション表示フラグメントで使用されるコレクション・フィルタ・フラグメントは、オブジェクト・コレクション・プロバイダまたはブループリント・コレクション・プロバイダにマッピングされている場合にのみ機能します。
``````

### キーワードによるフィルタリング

キーワード]を選択すると、[コレクションフィルター]フラグメントが検索バーとして表示され、ユーザーはキーワードを入力してコレクションの表示内容をフィルタリングすることができます。

![The Keywords filter type presents a search bar to users to enter keywords to filter by.](./filtering-collections-on-a-page/images/03.png)

### カテゴリーによる絞り込み

Category（カテゴリー）」を選択した場合、「Source（ソース）」入力フィールドを使用して、ユーザーが選択できるカテゴリーを設定することができます。

![Select the vocabulary or category that contains the desired category selection.](./filtering-collections-on-a-page/images/02.png)

1. 希望するカテゴリーを含む語彙または親カテゴリーを選択したら、_Select This Level_をクリックします。

1. ページを公開する。

カテゴリフィルタを設定すると、コレクションフィルタフラグメントにカテゴリのメニューが表示されます。 ユーザーは、1つまたは複数のカテゴリーを選択して、コレクションの表示内容をフィルタリングすることができます。

![The Category filter type presents a list of categories for Users to enable and apply as a filter.](./filtering-collections-on-a-page/images/04.png)

### タグによるフィルタリング

タグが選択されている場合、ユーザーは提供されたフィールドに入力し、選択可能な既存のタグを示すドロップダウンを見ることができます。

![The Tags filter type presents a search bar with autocomplete that displays available tags.](./filtering-collections-on-a-page/images/06.png)

## 適用フィルターフラグメントの使用

Applied Filters Fragment は、 [Collection Filter Fragment](#using-the-collection-filter-fragment) で適用されたフィルターのリストを見るために使われる。

次の手順に従って、（すでに設定されているコレクションフィルタフラグメントを持つ）ページに適用済みフィルタフラグメントを追加してください：

1. ページの編集中に、ページ上の任意の場所に適用済みフィルターフラグメントを追加します。

1. Applied Filter Fragment の _General_ 設定で、目的のコレクションを選択します。 同じコレクションをページに表示し、 [コレクションフィルタフラグメント](#using-the-collection-filter-fragment) で構成する必要があります。

1. ページを公開する。

これで、ユーザがコレクションフィルタフラグメントでコンテンツをフィルタリングすると、Applied Filters Fragmentに、設定されたコレクションに現在適用されているフィルタのリストが表示されます。 また、表示されている各フィルタの_X_ボタンをクリックして、フィルタを削除することもできます。

![The Applied Filters Fragment shows all filters currently applied to the configured Collection.](./filtering-collections-on-a-page/images/05.png)

## 関連トピック

* [コレクションの表示](./displaying-collections.md) 
