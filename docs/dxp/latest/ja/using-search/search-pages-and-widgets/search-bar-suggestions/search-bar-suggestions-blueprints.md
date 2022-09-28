# 検索バー サジェスチョン ブループリント

{bdg-primary}`Subscription`
{bdg-secondary}`7.4 U36+とGA36+`

検索バーのサジェスチョンでは、デフォルトで通常の[検索バーのクエリ](../search-insights.md)を使用します。 [Liferay Enterprise Search のユーザー](../../liferay-enterprise-search/activating-liferay-enterprise-search.md) は、 [Search Blueprints](../../liferay-enterprise-search/search-experiences/understanding-search-blueprints.md)を使ってクエリに影響を与えたり上書きしたりすることができます。 

まず、 [Blueprint](../../liferay-enterprise-search/search-experiences/creating-and-managing-search-blueprints.md)を構築します。 ブループリントができたら

1. インスタンス設定]で[検索バーのサジェスト]が有効になっていることを確認します。 デフォルトで有効になっています。

1. 検索バーウィジェットの設定で、検索バーサジェスチョンを設定します。
   
      - オプション」(![Options](../../../images/icon-widget-options.png))メニューをクリックし、「**コンフィグレーション**」()を選択します。
1. Suggestions Contributor を **Blueprint** に変更します。

1. **Select** をクリックして、Blueprint を選択します。

1. ［**Save**］ をクリックします。

これでSearch Bar SuggestionsはBlueprintが提供するクエリ句と設定を使って、Elasticsearchにカスタマイズされたリクエストを送ることができるようになりました。

さらに使える設定もいくつかあります。



## 検索バーのサジェスチョンがブループリントを使用するように設定する

Blueprint Suggestions Contributor を選択すると、Search Bar Widget Configuration に新しい設定フィールドが表示されます。

![Blueprintコントリビューターは、追加のコンフィギュレーションを使用します。](./search-bar-suggestions-blueprints/images/01.png)

**ブループリント。** 唯一必要な追加設定です。 使用するブループリントを選択します。

**Asset URLを含める。** これを有効にすると、レスポンスと一緒に結果へのリンクが返されます。 検索ユーザーがアクセスできるページにアセットが表示されている場合、結果をクリックすると、その表示ページにユーザーが移動します。 それ以外の場合は、検索ページのコンテキストの下にあるアセットパブリッシャーに表示されます。 無効の場合、「候補」リストで結果をクリックしても何も起こりません。

**Include Asset Summary:** これを有効にすると、レスポンスと一緒に結果の [サマリー](../search-results/search-results-behavior.md#result-summaries) が返されます。 これを無効にすると、検索フレームワークによって作成された要約を除いた、より簡潔な結果リストが返されます。

**Fields:** レスポンスと一緒に返す追加のインデックス付きフィールドを定義します。 [これは、特定のインデックスフィールドとその値の使用を必要とするカスタムウィジェットテンプレート](../../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md#creating-a-widget-template) を作成するときに使用されます。
