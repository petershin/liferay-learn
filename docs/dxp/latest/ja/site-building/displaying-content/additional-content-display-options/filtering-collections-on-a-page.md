# ページ上のコレクションをフィルタリングする

お客様のサイトでコレクションを閲覧するユーザーの体験を向上させるために、ページフラグメントを追加して、コレクション内のコンテンツをフィルタリングすることができます。 例えば、表示されたCollectionsのコンテンツをキーワードで検索し、フィルタリングするために使用するFragmentを追加することができます。

表示されたコレクションのコンテンツをユーザーがフィルタリングするために、ページに追加できるページフラグメントは、 [Collection Filter Fragment](#using-the-collection-filter-fragment) と [Applied Filters Fragment](#using-the-applied-filters-fragment) の2種類です。

## コレクションフィルタフラグメントの使用

コレクションフィルタフラグメントは、選択されたコレクションに表示されるコンテンツをページ上でフィルタリングするために使用されます。 キーワード検索やカテゴリ選択により、フラグメントに関連するコレクションをフィルタリングすることができます。

以下の手順に従って、コレクションフィルターフラグメントをページ（ [コレクション表示フラグメント](./displaying-collections.md#configuring-a-collection-display-fragment) で既にコレクションを表示している）に追加し、設定します。

1. ページを編集しながら、ページの任意の場所にコレクションフィルタフラグメントを追加します。

1. Fragment の **General** 設定で、目的のコレクションを選択します。 コレクションが効果を発揮するためには、ページ上のコレクション表示フラグメントに表示される必要があります。

    ![コレクション表示フラグメントで既に表示されているコレクションを使用するように設定します。](./filtering-collections-on-a-page/images/01.png)

    互換性のあるコレクションを選択すると、 **Filter** ドロップダウンメニューが表示されます。

1. Filter メニューで、Fragment のフィルタの種類を、 **Keywords** または **Category** から選択します。

    ```{note}
    カスタムコレクションフィルターを追加するモジュールがデプロイされている場合（ [`FragmentCollectionFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/fragment/fragment-collection-filter-api/src/main/java/com/liferay/fragment/collection/filter/FragmentCollectionFilter.java) と [`InfoFilter`](https://github.com/liferay/liferay-portal/blob/master/modules/apps/info/info-api/src/main/java/com/liferay/info/filter/InfoFilter.java) インターフェースを実装することで）、これらのフィルターもリストから選択することが可能です。
    ```

    **キーワード** フィルタタイプを選択した場合、ユーザーはコレクションをフィルタリングするための任意のキーワードを検索することができます。 **Category** フィルタタイプを選択した場合、 **Source** 入力フィールドが表示され、ユーザーが選択できるカテゴリの選択を設定することができます。

1. カテゴリーフィルタータイプを選択した場合は、ソース入力フィールドをクリックし、ポップアップダイアログを使用して、ユーザーが選択するカテゴリーのソースを選択します。

    ![希望するカテゴリー選択を含む語彙またはカテゴリーを選択します。](./filtering-collections-on-a-page/images/02.png)

1. **Select This Level** をクリックし、選択したいカテゴリーを含む語彙または親カテゴリー **を選択します** .

1. ページを公開する。

コレクションフィルタフラグメントの動作は、キーワードとカテゴリのどちらのフィルタタイプを設定したかによって変化します。

キーワードタイプを選択した場合は、コレクションフィルターフラグメントが検索バーとして表示されます。 ユーザーがキーワードを入力することで、そのキーワードを含むコンテンツにページ上のCollectionを絞り込むことができます。

![キーワードのフィルタリングでは、検索バーが表示され、キーワードを入力してフィルタリングすることができます。](./filtering-collections-on-a-page/images/03.png)

カテゴリータイプを選択した場合、フラグメントは選択可能なすべてのカテゴリーをリストアップしたメニューとして表示されます。 ユーザーは、これらのカテゴリーをいくつでも選択し、カテゴリーを持つコンテンツにコレクションをフィルタリングするために適用することができます。

![カテゴリーフィルタータイプは、ユーザーがフィルターとして有効化し、適用するためのカテゴリーのリストを表示します。](./filtering-collections-on-a-page/images/04.png)

## アプライドフィルタフラグメントの使用

Applied Filters Fragment は、 [Collection Filter Fragment](#using-the-collection-filter-fragment) で適用したフィルタの一覧を表示するために使用します。

以下の手順で、（すでにコレクションフィルタフラグメントが設定されている）ページに、アプライドフィルタフラグメントを追加します。

1. ページを編集しながら、ページ上の任意の場所にApplied Filter Fragmentを追加します。

1. Applied Filter Fragment の **General** 設定で、目的のコレクションを選択します。 同じコレクションをページに表示し、 [コレクションフィルタフラグメント](#using-the-collection-filter-fragment) で構成する必要があります。

1. ページを公開する。

これで、ユーザーがCollection Filter Fragmentでコンテンツをフィルタリングすると、Applied Filters Fragmentに、設定されたコレクションに現在適用されているフィルタのリストが表示されるようになりました。 また、ユーザーは、リストアップされた各フィルターの **X** ボタンをクリックし、フィルターを削除することができます。

![Applied Filters フラグメントには、設定されたコレクションに現在適用されている すべてのフィルタが表示されます。](./filtering-collections-on-a-page/images/05.png)

## 追加情報

* [コレクションの表示](./displaying-collections.md)
