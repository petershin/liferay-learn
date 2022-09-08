# アセットパブリッシャーウィジェットを使用したアセットの表示

Webコンテンツを作成するときは、掲示板のエントリーやブログ投稿と同じように、コンテンツの構成要素がアセットであることに留意してください。 アセットの最も一般的なタイプは[Webコンテンツ](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)です。 Asset Publisherウィジェットは、デフォルトでこれらのアセットタイプをサポートしています。

* ブログのエントリ
* ブックマークエントリー
* ブックマークフォルダー
* カレンダー
* 基本ドキュメント
* Google ドライブのショートカット
* ドキュメントとメディアフォルダー
* 動的データリスト(DDL)・レコード
* ナレッジベース記事
* 掲示板のメッセージ
* 基本Webコンテンツ
* Webコンテンツフォルダー
* Wikiページ

```{note}
Liferay DXP 7.2以降、開発者は [情報フレームワーク](https://help.liferay.com/hc/ja/articles/360029067251-Introduction-to-The-Info-Framework) を使用して [情報リスト](https://help.liferay.com/hc/ja/articles/360029067271-Creating-an-Information-List-Provider) からアセットを表示できるようになりました。
```

必要なアセットを表示するためにAsset Publisherを設定する最も簡単な方法は、ニーズに合った [Collection](../../../content-authoring-and-management/collections-and-collection-pages.md) を使用することです。 コレクションに手動または動的にアセットが割り当てられても、Asset Publisher ウィジェットは、コレクションが定義した順序で自動的にアセットをロードします。 Liferay DXP 7.4 U10+ または GA14 では、Asset Publishers はデフォルトで Collection 構成を使用します。

![Asset Publisher ウィジェットでは、表示するアセットを取得する方法として、Collection、Manual、Dynamic のいずれかを使用するように設定できます。](./displaying-assets-using-the-asset-publisher-widget/images/01.png)

また、Asset Publisher ウィジェットの Manual または Dynamic 構成を設定すると、Collection なしで表示されるアセットを決定することができます。 手動で選択すると、表示されるアセットをコントロールできますが、リストを定期的に更新するとなると、リストの管理が面倒になります。 この場合、アセットパブリッシャーウィジェットを使って動的にコンテンツを選択する方が便利です。

## オプションを表示

アセットパブリッシャーウィジェットにはアセットが表示されます。 多くの [設定オプション](./configuring-asset-publisher-display-settings.md) があり、それを使って表示方法を適応させることができます。 デフォルトでは、アセットパブリッシャーは最近公開されたアセットの概要 (プレビュー) を、完全なビューへのリンクとともに表示します。 アセットの表、アセットタイトルの一覧、またはアセットの完全なコンテンツを表示するようにアセットパブリッシャーを設定できます。 特定のアセットを表示するように設定したり、一覧に表示する項目の数を選択したりすることもできます。 アセットパブリッシャーを使用して、選択したコンテンツタイプ、最近のコンテンツ、またはタグやカテゴリ別にコンテンツを表示できます。

## 混合コンテンツの公開

Asset Publisherウィジェットはアセットを公開するため、画像、文書、ブログ、そしてもちろんWebコンテンツなど、さまざまな種類のコンテンツを公開することに優れています。 これにより、より動的なWebサイトを作成できます。 ユーザーが作成したWikiエントリ、ブログ投稿、または掲示板のメッセージをWebコンテンツのコンテキストに配置できます。

![Asset Publisherウィジェットで、混合コンテンツタイプを公開することができます。](./displaying-assets-using-the-asset-publisher-widget/images/02.png)

## 追加情報

* [アセットパブリッシャーウィジェットでのアセットの選択](./selecting-assets-in-the-asset-publisher-widget.md)
* [アセットパブリッシャー表示設定の構成](./configuring-asset-publisher-display-settings.md)
* [アセットパブリッシャー購読の設定](./configuring-asset-publisher-subscriptions.md)
