# 検索ブループリントの作成と管理

[検索ブループリント](./understanding-search-blueprints.md) は、グローバルメニューの管理用アプリケーションを使用して作成、更新、削除します。 グローバルメニューのアプリケーションセクションを開き、Search Experiencesカテゴリーを見つけます。 もし既にブループリントを持っていて、その機能をLiferay [ページの検索](../../search-pages-and-widgets/working-with-search-pages.md)に適用したい場合は、 [Using a Search Blueprint on a Search Page](using-a-search-blueprint-on-a-search-page.md)をご覧ください。

検索ブループリントを作成する。

1. ［グローバルメニュー］ &rarr; ［アプリケーション］ (Search Experiences) から _［ブループリント］ _ をクリックして、ブループリントアプリケーションを開きます。

1. 追加 (![Add](../../../images/icon-add.png)) ボタンをクリックし、ブループリントを追加します。

   ![［ブループリントの追加］モーダルウィンドウからブループリントの作成を開始します。](./creating-and-managing-search-blueprints/images/01.png)

1. ［新規検索ブループリント］ウィンドウで、ブループリントに［name］ (必須) と［description］(オプション) を指定します。

1. Blueprint のプランに応じて、次にこれらのメニューを使って [Blueprint](./understanding-search-blueprints.md#what-is-a-blueprint)を構築し続けます。

   - [クエリビルダー](#using-the-query-builder): クエリ要素セクションで、ブループリントの要素を選択または作成して、検索に新しいクエリー条件を追加します。 クエリ設定セクションで、クエリの追加設定（検索するアセットタイプやオブジェクトタイプなど）を行います。

   - [設定](#adding-configurations): 検索における詳細設定（ソートや集計など）を行います。

1. ブループリントを構築し、構成しながらテストします。 _［Preview］_ をクリックし、検索キーワードを入力してください。

   ![ブループリントを実行する前にプレビューすることができます。](./creating-and-managing-search-blueprints/images/02.png)

   詳しくは、 [Testing a Blueprint](#testing-a-blueprint-with-the-preview-sidebar) を参照してください。

1. 最初のブループリントの作成が完了したら、 _［保存］_をクリックします。

ブループリントの作成プロセスは、高速でシンプルな場合もありますが、時にはより多くの反復とテストを伴います。 ブループリントを頻繁に保存して、作業内容を確実に保存してください。

ブループリントの編集や削除は、その［アクション］メニュー（![Actions](../../../images/icon-actions.png)）から行います。

CRUDオプションに加えて、検索ブループリントは [インポートおよびエクスポート](#importing-and-exporting-blueprints)することができます。

![ブループリントのアクションメニューから編集、削除、エクスポートを行うことができます。](./creating-and-managing-search-blueprints/images/03.png)

## クエリビルダーの使用

ブループリントの多くの使用例では、クエリビルダーを使用する必要があります。 クエリビルダーの使用して

1. [ブループリントに要素を追加](#adding-elements-to-the-blueprint).

1. [どのLiferayアセットを検索するかを選択](#choosing-which-liferay-assets-to-search).

### ブループリントに要素を追加する

要素を追加してブループリントにクエリ句の追加を開始します。

1. ［Query Elements］画面の［Add］（![Add](../../../images/icon-add.png)）ボタンをクリックして、［クエリ要素を追加］サイドバーを表示します。

   ![ブループリントに要素を追加する。](./creating-and-managing-search-blueprints/images/04.png)

1. 調べたい要素のカテゴリーを展開します。

1. ［要素］にカーソルを合わせ、 _［Add］_ ボタンをクリックします。

1. この［要素］は、クエリビルダーに追加され、設定できるようになります。

   ![この要素は、検索したユーザーが所属しているサイトのコンテンツに10を加算するものです。](./creating-and-managing-search-blueprints/images/05.png)

1. 検索クエリを設定するために必要な数の要素を追加します。

   既成の各要素の説明については、 [Search Blueprints Elements Reference](./search-blueprints-elements-reference.md) を参照してください。

1. カスタム要素が必要な場合は、クエリビルダーにカスタムJSON要素を追加し、必要なクエリ句を記述します。

   カスタムJSON要素の作成については、 [Creating Elements](./creating-and-managing-elements/creating-elements.md) を参照してください。

```{important}
一部の要素は、クエリビルダーでブループリントに単に追加するだけではなく、より多くのアクションを必要とします。 例えば、Boost Longer Contents要素または Boost Contents with More Versions要素を使用するには、［コントロールパネル］ &rarr; ［検索］ &rarr; ［Index Actions］で次のエントリのインデックスを再作成する必要があります。


* `com.liferay.blogs.model.BlogsEntry`
* `com.liferay.document.library.kernel.model.DLFileEntry`
* `com.liferay.journal.model.JournalArticle`
* `com.liferay.blog.model.BlogsEntryliferay.knowledge.base.model.KBArticle`
* `com.liferay.wiki.model.WikiPage`

その他の要素は、位置情報機能を提供する要素（例:,Boost Proximity など)のように、追加の設定が必要です。 詳しくは、[Elements Reference](./search-blueprints-elements-reference.md)をご覧ください。
```

要素を追加した後、ブループリントを保存していることを確認してください。

### どのLiferayアセットを検索するかを選択

ブループリントのクエリにどのLiferayアセットタイプを含めるかを決定します。 ［クエリ設定］ &rarr; ［Searchable Types］を使用:

![［検索可能なタイプ］ドロップダウンを展開し、検索ブループリントからアセットの削除を開始します。](./creating-and-managing-search-blueprints/images/06.png)

- デフォルトでは、すべてのアセットタイプとオブジェクトタイプが選択されています。
- 特定のタイプを削除するには、「アセットタイプの選択」ボタンをクリックして「タイプの選択」モーダルを開き、対応するチェックボックスの選択を解除してください。

   ![［タイプを選択］モーダルは、検索対象となる資産を一括管理するために使用します。](./creating-and-managing-search-blueprints/images/07.png)

```{note}
［Searchble Types］モーダルですべてのアセットを選択解除すると、すべてのタイプを選択した場合と同じように、すべてのアセットおよびオブジェクトタイプが検索されます。 Liferayの検索句のほとんどを無効にする方法については、 [Configuring Query Clause Contributors](#advanced-configuring-query-clause-contributors) をご覧ください。
```

［Searchable Types］の設定を編集した後は、必ずブループリントを保存してください。

［Searchable Types］設定でアセットタイプを無効にすると、通常そのインデックス作成コードによって提供されるクエリ句が除外されることになります。 そのため、ブループリントを検索に適用しても、このタイプは検索できず、エンドユーザは除外されたタイプの結果を見ることができません。

［Searchable Types］の設定は、他の条件コントリビューターの設定オプションに重要な影響を与えるため、詳細については次のセクションに記載します。

### 詳細：クエリ句のコントリビューターを設定する

クエリ句は、Liferayのバックエンドコード（およびLiferayインスタンスにデプロイされたカスタムアプリケーションの可能性もあります）によって進行中の検索に提供されます。

検索ブループリントは、これらのバックエンドが提供するクエリ句を設定することができます。 しかし、ほとんどのユーザーは、［Search Framework Indexer Clauses］や ［Search Framework Query Contributor］の設定には決して触れないようにしてください。 通常はデフォルトの設定で十分です。 もし、 [［Searchable Types］](#choosing-which-liferay-assets-to-search)を使う以外にこの動作を微調整する必要があると確信するならば、これらのバックエンドのコントリビューターの動作方法を理解する必要があります。

1. **［Searchable Types］** を使用すると、個々のインデクサが検索に参加できないようにすることができます。 タイプのインデクサを無効にすると、クエリコントリビュータが選択されていても、そのタイプの句は検索クエリに追加されなくなります。 検索エンドユーザーには、これらのタイプの結果は表示されません。

1. **［Search Framework Indexer Clauses］** を使って、Liferayのすべてのインデクサが検索に句を提供しないようにします。 すべてのインデクサを無効にする唯一の理由は、検索クエリをゼロから構築し、すべてのクエリコントリビューターと検索可能なアセットを同様に無効にすることです。

1. **［Search Framework Query Contributors］** セクションを使用して、特定のコントリビューターを検索に参加させないようにすることができます。 あなた自身のブループリントの設定を使用してそれらをオーバーライドしたい場合は、特定の条件コントリビューターを無効にします。または、Liferayの検索動作を完全にオーバーライドするためにすべての句、Liferayのインデクサと検索可能なタイプも同様に無効にします。

```{important}
* すべてのインデクサと条件コントリビューターを無効にした場合でも、Liferayの検索フレームワークによって特定の必須句が常に追加されます。 そのため、ブループリントでクエリを一から作ることはありません。

* Liferayのインデクサフレームワークは Liferay 7.2でリファクタリングされました。 Webコンテンツの記事やフォルダなど、Liferyのコアアセットの中には、新しいパターンにアップデートされていないものがあります。 これは、これらのアセットにはクエリコントリビュータが存在しないため、検索ブループリントに影響を及ぼします。 そのため、［Liferayインデクサ条件］を有効にすると、アセットに対する標準的な句が常に検索クエリに追加されることになります。 したがって、Webコンテンツ記事の句を完全にオーバーライドすることはできません。 しかし、このようなアセットの検索動作は、より多くの句を重ねることで微調整することができます（例えば、特定の句のマッチングを高めるなど）。

* 内部的な制限により、Liferayの `Indexer`s をすべて有効にするか無効にするかを選択する必要があります。 他の条件コントリビューターは、より柔軟に管理できます。すべてのコントリビューターを含めるか、まったく含めないか、または希望するコントリビューターのサブセットを選択します。

特定の検索語句の貢献者またはすべてのインデクサが検索語句を貢献しないようにします](./creating-and-managing-search-blueprints/images/08.png)
```

条件コントリビューターやインデクサー動作を編集したら、必ずブループリントを保存してください。

## 構成の追加

検索クエリを細かく設定するだけでなく、検索ブループリント設定を追加すると、次のようなJSON設定が追加されます。

- 集計
- ハイライト
- ソート
- パラメーター
- 詳細設定

![追加設定はJSONを使用して設定することができます。](./creating-and-managing-search-blueprints/images/09.png)

これらを追加するには、［設定］タブをクリックし、目的の設定のテキスト入力ボックスを見つけてください。 JSONを入力し、ブループリントを保存します。

以下は、検索結果を `name` フィールドで降順（アルファベット逆順--Z-A）にソートするソートの例です。

```json
{
    "sorts": [
        {
            "title_sortable": "desc"
        }
    ]
}
```

詳細については、 [Search Blueprint Configuration Reference](./search-blueprints-configuration-reference.md)を参照してください。

## ブループリントのインポートとエクスポート

ブループリントは、JSONオブジェクトです。 ある環境からブループリントの JSON をエクスポートし、それを別の環境にインポートします。 これは、ステージングおよびテスト環境から本番環境にブループリントを移行する際に便利です。

ブループリントのJSONをエクスポートするには。

1. ［グローバルメニュー］ &rarr; ［アプリケーション］ &rarr; ［ブループリント］(［Search Experiences］セクション) からブループリントアプリケーションを開いてください。

1. ブループリントの一覧から、ブループリントの［アクション］(![Actions](../../../images/icon-actions.png)) メニューを開き、 _［エクスポート］_をクリックします。

ブループリントのJSON定義をインポートする。

1. ［グローバルメニュー］ &rarr; ［アプリケーション］ &rarr; ［ブループリント］(［Search Experiences］セクション) からブループリントアプリケーションを開いてください。

1. メインのブループリントの［アクション］(![Actions](../../../images/icon-actions.png)) メニューを開き、 _［インポート］_をクリックします。

1. インポートモーダルを使用して、有効なブループリントJSONファイルを選択します。 有効な要素のJSONファイルもこの画面からインポートすることができます。

   ![ブループリントと要素をインポートします。](./creating-and-managing-search-blueprints/images/10.png)

1. _［Import］_クリックします。

## プレビューサイドバーでブループリントをテストする

実行中のブループリントに裏付けされた検索結果を調べるのに便利なプレビューサイドバーがあります。 ブループリントの編集画面から _［プレビュー］_ ボタンをクリックすることでプレビューにアクセスできます。

![ブループリントを実行する前にプレビューすることができます。](./creating-and-managing-search-blueprints/images/14.png)

ここでは、これらの機能にアクセスできます。

- 7.4 U52+の場合、 _View Raw Request_ をクリックすると、検索リクエストの文字列全体が表示されます。 Raw Requestモーダルから、リクエストをクリップボードにコピーするか、JSONファイルとしてダウンロードすることができます。 これは、検索ページの [Search Insights](../../search-pages-and-widgets/search-insights.md) ウィジェットで見られるリクエストと同じです。

- _［View Raw Response］_ をクリックすると、検索応答文字列全体を表示します。 Raw Responseモーダルから、レスポンスをクリップボードにコピーするか、JSONファイルとしてダウンロードすることができます。 これは、検索ページの [Search Insights](../../search-pages-and-widgets/search-insights.md) ウィジェットで見ることができる文字列と同じです。

   ![Elasticsearchから返された生の応答文字列を表示します。](./creating-and-managing-search-blueprints/images/11.png)

- 各結果のスコアは、結果タイトルの左側に表示されます。 ［スコア］をクリックするとScore Explanationモーダルが表示されます。

   ![結果のスコアの説明を表示します。](./creating-and-managing-search-blueprints/images/12.png)

- 結果を展開して、返されたドキュメントのすべてのフィールドを見るには、結果のタイトルの右側にある右向きの角括弧をクリックします。

   ![ドキュメントのフィールドを調べます。](./creating-and-managing-search-blueprints/images/13.png)

[いくつかの要素](./search-blueprints-elements-reference.md) は、手動で提供したり上書きしたりできる検索コンテキスト属性を読み取ります。 これらの要素でブループリントをテストするには、歯車のアイコン (![Gear](../../../images/icon-cog3.png)) をクリックして、ブループリントのプレビュー検索に検索コンテキスト属性を追加します。 属性のキーと値のペアを入力し、 _［完了］_をクリックします。 この属性はブループリントのプレビューにのみ設定され、ブループリント自体には保存されないことに留意してください。 これらの属性は、検索ページで設定することができます。 詳しくは、 [検索ページで検索ブループリントを使用する](./using-a-search-blueprint-on-a-search-page.md) を参照してください。

例えば、

1. _administrative_と呼ばれる新しい[Vocabulary with a Category](../../../content-authoring-and-management/tags-and-categories.md)を追加します。

1. 2つの新しい [Webコンテンツ](../../../content-authoring-and-management/web-content/web-content-articles.md)を追加します。両方ともタイトルフィールドに _test_ があることを確認します。 そのうちの1つを、作成したカテゴリーに関連付けます。

1. 新しいブループリントを作成し、条件要素 _Hide Contents in a Category for Guest Users_を追加します。 作成したカテゴリのアセットカテゴリIDが必要ですが、それはプレビューウィンドウで確認することができます。

1. プレビューで _administrative_ を検索します。 Webコンテンツのドキュメントをカテゴリで展開し、 `assetCategoryId` (例：43013)を見つけます。

1. 要素の設定にあるIDを使用します。

1. プレビューをサイドバーの属性モーダルを開き、次のように入力します。

   キー:  `user.is_signed_in`。

   値:  `false`

1. _［完了］_ をクリックし、 _test_の検索を入力してください。

これで、未分類のWebコンテンツだけが返されるようになりました。 もう1つは、検索ユーザーがゲストであるかのように検索を動作させる検索コンテキスト属性のため、非表示になっています。

この例では、コンテキスト変数 `user.is_signed_in`を読み取る要素を使用しています。値を手動で設定することにより、既存の値をオーバーライドして、ブループリントが特定の動作を示すことができるようにします。 値はすでに検索コンテキストに存在するため、手動での設定は任意です。 その他の要素では、通常の検索リクエストのコンテキスト内に存在しないカスタムパラメータが必要です。 プレビューサイドバーからブループリントをテストする場合でも、検索ページで使用するためにブループリントを設定する場合でも、要素/ブループリントが正しく機能するように、これらを手動で検索コンテキストに渡す必要があります。

## 次のステップ

- [検索ブループリントを検索ページで使用する](using-a-search-blueprint-on-a-search-page.md)
