# 検索バー サジェスチョン ブループリント

{bdg-primary}`定期購読`
{bdg-secondary}`7.4 U36+とGA36+`

検索バーのサジェスチョンでは、デフォルトで通常の [検索バーのクエリ](../search-insights.md) を使用します。 [Liferay Enterprise Search のユーザー](../../liferay-enterprise-search/activating-liferay-enterprise-search.md) は、 [Search Blueprints](../../liferay-enterprise-search/search-experiences/search-blueprints/understanding-search-blueprints.md)を使ってクエリに影響を与えたり上書きしたりすることができます。

まず、 [Blueprint](../../liferay-enterprise-search/search-experiences/search-blueprints/creating-and-managing-search-blueprints.md)を構築します。 Blueprintを手に入れたら

1. インスタンス設定で「検索バーのサジェスチョン」が有効になっていることを確認します。 デフォルトで有効になっています。

1. 検索バーウィジェットの設定で、検索バーサジェストを設定します。
   - オプション」(![Options](../../../images/icon-widget-options.png))メニューをクリックし、「 _構成」(_)を選択します。

1. Suggestions Contributor を _Blueprint_に変更します。

1. _Select_をクリックして、ブループリントを選択します。

1. _［Save］_ をクリックします。

これで Search Bar Suggestions は、Blueprint が提供するクエリ句と設定を使用して、Elasticsearch にカスタマイズされたリクエストを送信します。

使用できる追加設定はいくつかあります。

## ブループリントを使用するための検索バーのサジェスチョンを設定する

Blueprint Suggestions Contributorを選択すると、Search Bar Widget Configurationに新しい設定フィールドが表示されます。

![Blueprintコントリビューターは、追加のコンフィギュレーションを使用します。](./search-bar-suggestions-blueprints/images/01.png)

**Blueprint(ブループリント）：** 必要な追加設定はこれだけです。 使用するブループリントを選択します。

**Asset URLを含める：** これを有効にすると、レスポンスに結果へのリンクが返されます。 検索ユーザーがアクセスできるページにアセットが表示されている場合、結果をクリックすると、その表示ページにユーザーが移動します。 それ以外の場合は、検索ページのコンテキストにあるAsset Publisherにアセットが表示されます。 無効の場合、サジェスチョンリストの結果をクリックしても何もしません。

**Include Asset Summary:** これを有効にすると、レスポンスと一緒に結果の [サマリー](../search-results/search-results-behavior.md#result-summaries) を返します。 これを無効にすると、検索フレームワークによって構築された要約を除いて、より簡潔な結果リストを返すようになります。

**Fields：** レスポンスと一緒に返す追加のインデックス付きフィールドを定義します。 これは、特定のインデックスフィールドとその値の使用を必要とするカスタム [ウィジェットテンプレート](../../../site-building/displaying-content/additional-content-display-options/styling-widgets-with-widget-templates.md#creating-a-widget-template) を作成する際に使用されます。
