# ページ上のコレクションをフィルタリングする

コレクションを閲覧するユーザーの利便性を向上させるために、ページフラグメントを追加して、コレクション内のコンテンツをフィルタリングすることができます。 例えば、表示されたCollectionsのコンテンツをキーワードで検索し、フィルタリングするためのFragmentを追加することができます。

表示されたコレクションのコンテンツをユーザーがフィルタリングするために、ページに追加できるページフラグメ ントとして、 [Collection Filter Fragment](#using-the-collection-filter-fragment) と [Applied Filters Fragment](#using-the-applied-filters-fragment) の2つがあります。

## コレクションフィルタフラグメントの使用

コレクションフィルタフラグメントは、選択したコレクションに表示されるコンテンツをページ上でフィルタリングするために使用されます。 キーワード検索や、カテゴリーやタグを選択し、フラグメントに関連するコレクションを絞り込むことができます。

以下の手順で、ページ（ [コレクション表示フラグメント](./displaying-collections.md#configuring-a-collection-display-fragment) で既にコレクションを表示している）にコレクションフィルターフラグメントを追加し、設定することができます：

1. ページを編集しながら、ページ上の任意の場所にコレクションフィルターフラグメントを追加します。

1. フラグメントの **一般** 設定で、目的のコレクションを選択します。 コレクションが効果を発揮するためには、ページ上のコレクション表示フラグメントに表示されている必要があります。

    ![コレクション表示フラグメントで既に表示されているコレクションを使用するように設定する。](./filtering-collections-on-a-page/images/01.png)

    **Filter** ドロップダウンメニューは、互換性のあるコレクションを選択したときに表示されます。

1. フィルターメニューを使用して、 **キーワード** 、 **カテゴリー** 、 **タグ** のフィルターを選択します。

    ```{note}
    カスタムコレクションフィルタ（ [`FragmentCollectionFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/fragment/fragment-collection-filter-api/src/main/java/com/liferay/fragment/collection/filter/FragmentCollectionFilter.java) と [`InfoFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/info/info-api/src/main/java/com/liferay/info/filter/InfoFilter.java) インターフェースを実装したモジュールをデプロイした場合、これらのフィルタをリストから選択することも可能です。
    ```

コレクションフィルターのフラグメントの動作は、キーワード、カテゴリー、タグのいずれのフィルタータイプを設定したかに応じて変化します。

### キーワードによる絞り込み

 キーワードを選択すると、コレクションフィルターが検索バーとして表示され、ユーザーはキーワードを入力することでコレクションの表示内容をフィルタリングすることができます。

![キーワードのフィルタータイプは、ユーザーがキーワードを入力してフィルターするための検索バーを表示します。](./filtering-collections-on-a-page/images/03.png)

### カテゴリー別フィルタリング

Categoryを選択した場合、Source入力フィールドを使用して、ユーザーが選択できるカテゴリを設定することができます。

![希望するカテゴリー選択を含む語彙またはカテゴリーを選択します。](./filtering-collections-on-a-page/images/02.png)

1. 希望するカテゴリーを含む語彙または親カテゴリーを選択したら、「**このレベルを選択**」 をクリックします。

2. ページを公開する。

カテゴリフィルタを設定すると、コレクションフィルタフラグメントにカテゴリのメニューが表示されます。 ユーザーは1つまたは複数のカテゴリーを選択し、コレクションの表示内容をフィルタリングすることができます。

![カテゴリーフィルタータイプは、ユーザーがフィルターとして有効化し、適用するためのカテゴリーのリストを表示します。](./filtering-collections-on-a-page/images/04.png)

### タグによるフィルタリング

タグを選択すると、ユーザーはフィールドに入力し、選択可能な既存のタグを示すドロップダウンを見ることができます。

![タグのフィルタータイプでは、利用可能なタグを表示するオートコンプリートを備えた検索バーを表示します。](./filtering-collections-on-a-page/images/06.png)

## アプライドフィルタフラグメントの使用

Applied Filters Fragment は、 [Collection Filter Fragment](#using-the-collection-filter-fragment) で適用されたフィルターの一覧を見るために使用します。

コレクションフィルタフラグメントが設定されているページに、アプライドフィルタフラグメントを追加するには、以下の手順で行います：

1. ページの編集中に、ページ上の任意の場所にアプライドフィルターフラグメントを追加します。

1. Applied Filter Fragment の **General** 設定で、目的のコレクションを選択します。 同じコレクションをページに表示し、 [コレクションフィルターフラグメント](#using-the-collection-filter-fragment) で構成する必要があります。

1. ページを公開する。

これにより、ユーザーがコレクションフィルタフラグメントでコンテンツをフィルタリングすると、適用されたフィルタフラグメントに、設定されたコレクションに現在適用されているフィルタのリストが表示されるようになりました。 また、ユーザーは、リストアップされた各フィルタの **X** ボタンをクリックして、フィルタを削除することができます。

![Applied Filters Fragmentには、設定されたコレクションに現在適用されているすべてのフィルターが表示されます。](./filtering-collections-on-a-page/images/05.png)

## 関連トピック

* [コレクションの表示](./displaying-collections.md)
