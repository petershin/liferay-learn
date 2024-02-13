---
toc:
- ./search-facets/site-facet.md
- ./search-facets/type-facet.md
- ./search-facets/category-facet.md
- ./search-facets/tag-facet.md
- ./search-facets/folder-facet.md
- ./search-facets/user-facet.md
- ./search-facets/modified-facet.md
- ./search-facets/custom-facet.md
---
# 検索ファセット

# ファセット

検索バーにキーワードを入力し、［検索］ボタンをクリックします。 デフォルトの検索エクスペリエンスでは、右側に結果が、左側に **ファセット** のコレクションが表示されるページにリダイレクトされます。

- [サイトファセット](search-facets/site-facet.md)
- [タイプファセット](search-facets/type-facet.md)
- [カテゴリファセット](search-facets/category-facet.md)
- [タグ ファセット](search-facets/tag-facet.md)
- [フォルダファセット](search-facets/folder-facet.md)
- [ユーザーファセット](search-facets/user-facet.md)
- [編集済みファセット](search-facets/modified-facet.md)
- [カスタムファセット設定](search-facets/custom-facet.md)

![検索結果のサンプルページ。](./search-facets/images/01.png)

ファセットとは、検索結果を共通の特性（ファセット用語）で集約したものである。

## ファセットの使用

1つまたは複数のファセット・タームをクリックすると、検索結果を効率的に絞り込むことができます。 例えば、Apolloに関連する文書を検索する場合、Typeファセットで用語をチェックすることができる。

![タイプでフィルタリングされたApollo検索結果。](./search-facets/images/02.png)

Apollo 11に関連する文書を特に探すには、フォルダファセットでその用語をチェックすることもできます。

![フォルダでフィルタリングされたApollo検索結果。](./search-facets/images/03.png)

このようにして、検索結果を絞り込むことができます。

## 複数ファセット選択

上の例に見られるように、異なるファセットの用語を選択することは減法的である（すなわち、AND演算子を使用する）。 つまり、すべてのフィルター条件に一致する結果のみが返される。

ただし、個々のファセット内のタームの選択は加算式である（すなわち、OR演算子を使用する）。 つまり、各用語の組み合わせた結果が返されます。 たとえば、Apollo 11フォルダとApollo 14フォルダの両方の検索結果をフィルタリングする場合は、両方の用語にチェックを入れます。

![両方のフォルダのApollo検索結果。](./search-facets/images/04.png)

## ファセットとフレンドリURL

検索機能は、ファセットフィルタリングにわかりやすい検索URLを使用します。 デフォルト設定では、キーワード **test** を検索する場合のデフォルトのメイン検索URLは次のとおりです。

    http://localhost:8080/web/guest/search?q=test

ファセット用語を選択すると、上記のURLに新しいパラメーターが追加されます。 たとえば、タイプファセットからブログのエントリを選択すると、URLは次のようになります。

    http://localhost:8080/web/guest/search?q=test&type=com.liferay.blogs.model.BlogsEntry

同じファセットカテゴリから別のファセット用語を選択すると、同じパラメーターが再度追加されますが、新しく選択された値が追加されます。

    http://localhost:8080/web/guest/search?q=test&type=com.liferay.blogs.model.BlogsEntry&type=com.liferay.portal.kernel.model.User

残りのファセットは同じように機能します。 最終更新ファセットの過去1時間オプションでフィルタリングすると、次のURLが生成されます。 

    http://localhost:8080/web/guest/search?q=test&modified=past-hour

パラメーター名は、ファセットごとに設定できます。

各ファセットタイプの詳細は、個々の記事を参照してください。

