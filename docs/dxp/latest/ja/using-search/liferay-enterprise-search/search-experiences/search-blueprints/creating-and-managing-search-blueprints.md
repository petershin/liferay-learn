# 検索ブループリントの作成と管理

[Search Blueprints](./understanding-search-blueprints.md) は、Global メニューの Applications セクション &rarr; Search Experiences から作成できます。 もし既にブループリントを持っていて、その機能をLiferay [ページの検索](../../../search-pages-and-widgets/working-with-search-pages.md) に適用したい場合は、 [Using a Search Blueprint on a Search Page](./using-a-search-blueprint-on-a-search-page.md) をご覧ください。

検索ブループリントを作成するには、

1. Global Menu &rarr; Applications (Search Experiences) から _Blueprints_ をクリックして、Blueprints アプリケーションを開きます。

1. *Add* (![Add](../../../../images/icon-add.png)) をクリックしてブループリントを追加します。

   ![Start creating a Blueprint from the Add Blueprint modal window.](./creating-and-managing-search-blueprints/images/01.png)

1. ［新規検索ブループリント］ウィンドウで、ブループリントに［name］ (必須) と［description］(オプション) を指定します。

1. ブループリントの計画に応じて、次にこれらのメニューを使用して [ブループリント](./understanding-search-blueprints.md#what-is-a-blueprint) の構築を継続することになります。

   * [クエリビルダー](#using-the-query-builder) ：クエリ要素セクションで、ブループリントの要素を選択または作成して、検索に新しいクエリー条件を追加します。 クエリ設定セクションで、クエリの追加設定（検索するアセットタイプやオブジェクトタイプなど）を行います。

   * [設定](#adding-configurations) ：検索における詳細設定（ソートや集計など）を行います。

1. ブループリントを構築し、構成しながらテストします。 Preview\_をクリックし、検索キーワードを入力します。

   ![Preview a Blueprint before putting it in action.](./creating-and-managing-search-blueprints/images/02.png)

   詳しくは、 [Testing a Blueprint](#testing-a-blueprint-with-the-preview-sidebar) を参照してください。

1. 最初のブループリント作成が終わったら、_Save_をクリックします。

ブループリントの作成プロセスは迅速かつシンプルに行えますが、反復とテストが必要になることもあります。 ブループリントを頻繁に保存して、作業内容を確実に保存してください。

アクションメニューからブループリントを編集または削除します (![Actions](../../../../images/icon-actions.png)).

また、 [](#importing-and-exporting-blueprints) 検索ブループリントをインポートおよびエクスポートすることもできます。

![Edit, delete, or export a Blueprint from its Actions menu.](./creating-and-managing-search-blueprints/images/03.png)

## クエリビルダーの使用

クエリビルダーの使用して

1. [ブループリントに要素を追加](#adding-elements-to-the-blueprint) .

1. [どのLiferayアセットを検索するかを選択](#choosing-which-liferay-assets-to-search) .

### ブループリントに要素を追加する

要素を追加してブループリントにクエリ句の追加を開始します。

1. Query Elements画面で_Add_ (![Add](../../../../images/icon-add.png)) をクリックして、Add Query Elementsサイドバーを開きます。

   ![Add Elements to the Blueprint.](./creating-and-managing-search-blueprints/images/04.png)

1. 探検したい要素カテゴリーを展開する。

1. 要素にカーソルを合わせ、_Add_をクリックする。

1. この要素は、［Query Builder］に追加され、設定できるようになります。

   ![This Element gives a boost of 10 to content found on sites the searching user is a member of.](./creating-and-managing-search-blueprints/images/05.png)

1. 検索クエリを設定するために必要な数の要素を追加します。

   既成の各要素の説明については、 [Search Blueprints Elements Reference](./search-blueprints-elements-reference.md) を参照してください。

1. カスタム要素が必要な場合は、クエリビルダーにカスタムJSON要素を追加し、必要なクエリ句を記述します。

   カスタムJSON要素の作成については、 [Creating Elements](./creating-and-managing-elements/creating-elements.md) を参照してください。

```{important}
一部の要素は、クエリビルダでブループリントに追加する以上のアクションを必要とします。 たとえば、「Boost Longer Contents」エレメントや「Boost Contents with More Versions」エレメントを使用するには、コントロールパネル &rarr; Search &rarr; Index Actions で以下のエントリのインデックスを再作成する必要があります：

* `com.liferay.blogs.model.BlogsEntry`
* `com.liferay.document.library.kernel.model.DLFileEntry`
* `com.liferay.journal.model.JournalArticle`
* `com.liferay.knowledge.base.model.KBArticle`
* `com.liferay.wiki.model.WikiPage`

その他のエレメントは、ジオロケーション機能を提供するエレメント（例：Boost Proximity）のように、追加のセットアップが必要です。 詳しくは、 [Elements Reference](./search-blueprints-elements-reference.md) をご覧ください。
```

要素を追加した後、ブループリントを保存していることを確認してください。

### どのLiferayアセットを検索するかを選択

ブループリントのクエリにどのLiferayアセットタイプを含めるかを決定します。 ［クエリ設定］ &rarr; ［Searchable Types］を使用します。

![Expand the Searchable Types drop-down to begin removing assets from the Search Blueprint.](./creating-and-managing-search-blueprints/images/06.png)

- デフォルトでは、すべてのアセットタイプとオブジェクトタイプが選択されています。
- 特定のタイプを削除するには、_Select Asset Types_をクリックしてSelect Typesを開き、対応するチェックボックスの選択を解除します。

![The Select Types modal is used for bulk management of the assets to be searched.](./creating-and-managing-search-blueprints/images/07.png)

```{note}
Searchble Types] モーダルですべてのアセットの選択を解除すると、すべてのタイプを選択した場合と同じように、すべてのアセットおよびオブジェクト タイプが検索されます。 [Configuring Query Clause Contributors](#advanced-configuring-query-clause-contributors) を参照して、Liferay のほとんどの検索句を無効にする方法を学んでください。
```

［Searchable Types］の設定を編集した後は、必ずブループリントを保存してください。

［Searchable Types］設定でアセットタイプを無効にすると、通常そのインデックス作成コードによって提供されるクエリ句が除外されることになります。 このタイプは検索可能ではなく、ブループリントが検索に適用されても、エンドユーザは除外されたタイプの結果を見ることはできません。

検索可能な型(Searchable Types)の設定は、他の節貢献者(Clause Contributors)の設定オプションに重要な影響を与えるため、詳細は後述します。

### 詳細：クエリ句のコントリビューターを設定する

Liferayのバックエンドのコード（そしてあなたのLiferayインスタンスにデプロイされたカスタムアプリケーションの可能性もあります）は、進行中の検索にクエリ句を提供します。

バックエンドから提供されるこれらの条項は、Search Blueprintsを介して設定することができます。 しかし、ほとんどのユーザーは2つの設定に触れることはないはずだ：

- 検索フレームワークのインデクサー条件
- 検索フレームワークのクエリコントリビューター

通常はデフォルトの設定で十分です。 [Searchable Types](#choosing-which-liferay-assets-to-search) を使用する以上に、この動作を微調整しなければならないと確信するのであれば、これらのバックエンド貢献者の動作方法を理解しなければならない：

1. 個々のインデクサを検索に参加させないようにするには、**検索可能なタイプ**を使用します。 型のインデクサを無効にすると、その型のクエリ・コントリビュータが選択されていても、その型の句は検索クエリに追加されません。 これらのタイプの結果は、ユーザーには表示されない。

1. **Search Framework Indexer Clauses** を使用して、Liferay のすべてのインデクサが検索に句を提供しないようにします。 すべてのインデクサを無効にする唯一の理由は、検索クエリをゼロから構築し、すべてのクエリコントリビューターと検索可能なアセットを同様に無効にすることです。

1. 特定の投稿者を検索に参加させないようにするには、**Search Framework Query Contributors** セクションを使用します。 独自のBlueprints設定を使用してそれらを上書きしたい場合は、特定の条項の貢献者を無効にするか、Liferayの検索動作を完全に上書きするためにすべての条項を無効にし、LiferayのIndexersとSearchable Typesも無効にします。

```{important}
* すべてのインデクサと条件コントリビューターを無効にした場合でも、Liferayの検索フレームワークによって特定の必須句が常に追加されます。 そのため、ブループリントでクエリを一から作ることはありません。

* LiferayのIndexerフレームワークはLiferay 7.2でリファクタリングされました。 Web Content ArticlesやFoldersのようなLiferayのコア資産の一部は、新しいパターンに更新されていません。 これは、これらのアセットにはクエリコントリビュータが存在しないため、検索ブループリントに影響を及ぼします。 そのため、Liferay Indexer Clausesが有効になっている場合、アセットの標準句は常に検索クエリに追加されます。 したがって、Webコンテンツ記事の句を完全にオーバーライドすることはできません。 しかし、より多くの節を上に重ねることによって、これらのアセットの検索動作を微調整することができる（例えば、特定の節のマッチを後押しする）。

* 内部的な制限のため、Liferayのすべての`Indexer`を有効にするか無効にするかを選択する必要があります。 他の条件コントリビューターは、より柔軟に管理できます。すべてのコントリビューターを含めるか、まったく含めないか、または希望するコントリビューターのサブセットを選択します。

![Disable certain clause contributors or all indexers from contributing clauses to the search query.](./creating-and-managing-search-blueprints/images/08.png)
```

条件コントリビューターやインデクサー動作を編集したら、必ずブループリントを保存してください。

## 構成の追加

検索クエリを細かく設定するだけでなく、検索ブループリント設定を追加すると、次のようなJSON設定が追加されます。

- 集計
- ハイライト
- ソート
- パラメーター
- 詳細設定

![Additional settings can be configured using JSON.](./creating-and-managing-search-blueprints/images/09.png)

これらを追加するには、_Configuration_タブをクリックし、目的のコンフィギュレーションのテキスト入力ボックスを見つけてください。 JSONを入力し、ブループリントを保存します。

以下は、検索結果を `name` フィールドで降順（アルファベット逆順--Z-A）にソートするソートの例である：

```json
{
	"sorts": [
		{
			"title_sortable": "desc"
		}
	]
}
```

詳細については、 [Search Blueprints Configuration Reference](./search-blueprints-configuration-reference.md) を参照してください。

## ブループリントのインポートとエクスポート

ブループリントは、JSONオブジェクトです。 ある環境からブループリントの JSON をエクスポートし、別の環境にインポートします。 これは、ステージングおよびテスト環境から本番環境にブループリントを移行する際に便利です。

ブループリントのJSONをエクスポートするには。

1. ［グローバルメニュー］ &rarr; ［アプリケーション］ &rarr; ［ブループリント］(［Search Experiences］セクション) からブループリントアプリケーションを開いてください。

1. ブループリントのリストから、ブループリントの\_Actions\_ (![Actions](../../../../images/icon-actions.png)) メニューを開き、\_Export\_をクリックします。

ブループリントのJSON定義をインポートする。

1. ［グローバルメニュー］ &rarr; ［アプリケーション］ &rarr; ［ブループリント］(［Search Experiences］セクション) からブループリントアプリケーションを開いてください。

1. メインのブループリント _Actions_ (![Actions](../../../../images/icon-actions.png)) メニューを開き、_Import_ をクリックします。

1. 有効なブループリント JSON ファイルを選択します。 有効な要素のJSONファイルもこの画面からインポートすることができます。

   ![Import Blueprints and Elements.](./creating-and-managing-search-blueprints/images/10.png)

1. インポート」をクリックする。

## プレビューサイドバーでブループリントをテストする

実行中のブループリントに裏付けされた検索結果を調べるのに便利なプレビューサイドバーがあります。 Edit Blueprint画面から_Preview_ボタンをクリックしてプレビューにアクセスします。

![Preview a Blueprint before putting it in action.](./creating-and-managing-search-blueprints/images/14.png)

ここでは、これらの機能にアクセスできます。

- 7.4 U52+の場合、_View Raw Request_をクリックすると、検索リクエスト文字列全体が表示されます。 ［Raw Request］モーダルから、リクエストをクリップボードにコピーするか、JSONファイルとしてダウンロードすることができます。 これは、検索ページの [［検索インサイト］](../../../search-pages-and-widgets/search-insights.md) ウィジェットで見られるリクエストと同じです。

- _View Raw Response_をクリックすると、検索応答文字列全体が表示されます。 ここで、レスポンスをクリップボードにコピーするか、JSONファイルとしてダウンロードすることができる。 これは、検索ページの [Search Insights](../../../search-pages-and-widgets/search-insights.md) ウィジェットに表示される文字列と同じです。

  ![View the raw response string returned from Elasticsearch.](./creating-and-managing-search-blueprints/images/11.png)

- 各結果のスコアは、結果タイトルの左側に表示される。 スコアをクリックするとスコア解説が表示されます。

  ![View the score explanation for a result.](./creating-and-managing-search-blueprints/images/12.png)

- 結果を展開して、返されたドキュメントのすべてのフィールドを見るには、結果のタイトルの右側にある右向きの角括弧をクリックします。

  ![Inspect the document's fields.](./creating-and-managing-search-blueprints/images/13.png)

[いくつかの要素](./search-blueprints-elements-reference.md) は、手動で提供またはオーバーライドできる検索コンテキスト属性を読み取ります。 これらの要素を含むブループリントをテストするには、歯車のアイコン (![Gear](../../../../images/icon-cog3.png)) をクリックして、ブループリントのプレビュー検索に検索コンテキスト属性を追加します。 属性のキーと値のペアを入力し、_Done_をクリックします。 このアトリビュートはブループリントのプレビューにのみ設定され、ブループリント自体には保存されないことに注意してください。 これらの属性は、ページの検索で設定することができます。 詳しくは、 [検索ブループリントを検索ページで使用する](./using-a-search-blueprint-on-a-search-page.md) を参照してください。

例えば、

1. カテゴリー [「_administrative_」を持つ新しい](../../../../content-authoring-and-management/tags-and-categories.md) 語彙を追加する。

1. [Web Content Articles](../../../../content-authoring-and-management/web-content/web-content-articles.md) を2つ追加する。両方ともタイトルフィールドに_test_があることを確認する。 そのうちの1つを、作成したカテゴリーに関連付けます。

1. 新しいブループリントを作成し、条件要素 _Hide Contents in a Category for Guest Users_ を追加します。 作成したカテゴリのアセットカテゴリIDが必要ですが、それはプレビューウィンドウで確認することができます。

1. プレビューで_administrative_を検索。 ウェブコンテンツ記事のドキュメントをカテゴリーとともに展開し、`assetCategoryId`（例：43013）を見つける。

1. 要素の設定にあるIDを使用します。

1. プレビュー・サイドバーの「属性」を開き、次のように入力する。

   キー: `user.is_signed_in`

   値: `false`

1. _Done_をクリックし、_test_の検索を入力する。

これで、未分類のWebコンテンツだけが返されるようになりました。 もう1つは、検索ユーザーがゲストであるかのように検索を動作させる検索コンテキスト属性のため、非表示になっています。

この例では、コンテキスト変数 `user.is_signed_in` を読み込む Element を使っている。 値を手動で設定することにより、既存の値をオーバーライドして、ブループリントが特定の動作を示すことができます。 値はすでに検索コンテキストに存在するため、手動での設定は任意です。 その他の要素では、通常の検索リクエストのコンテキスト内に存在しないカスタムパラメータが必要です。 プレビューサイドバーからブループリントをテストする場合でも、検索ページで使用するためにブループリントを設定する場合でも、要素/ブループリントが正しく機能するように、これらを手動で検索コンテキストに渡す必要があります。

## 外部参照コード（ERC）の設定

{bdg-secondary}`ライフェライ2023.Q4+/GA102+について`

ブループリントは編集可能なERCで参照でき、可能な限りこれを推奨する。 便宜上、ERCを覚えやすく人間が読めるものに設定することができる。 ブループリント・エディターから、_Edit_ をクリックします！[Edit](../../../../images/icon-edit-pencil.png) をクリックします：

![Edit the ERC to be memorable and readable.](./creating-and-managing-search-blueprints/images/15.png)

この人間が読めるERCは、検索ページ [や](../../../developer-guide/search-headless-apis.md) ヘッドレス検索リクエスト [でブループリント](./using-a-search-blueprint-on-a-search-page.md) を設定するときに便利です。

## 次のステップ

* [検索ページで検索ブループリントを使う](./using-a-search-blueprint-on-a-search-page.md)
