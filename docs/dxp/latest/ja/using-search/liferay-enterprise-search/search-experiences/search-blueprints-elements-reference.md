# 検索ブループリント要素のリファレンス

要素は、[検索ブループリント](understanding-search-blueprints.md#what-is-a-blueprint)の基本的な構成要素の 1 つです。 利用可能なすべての要素を調べるには、グローバルメニュー (![Global](../../../images/icon-applications-menu.png)) &rarr; ［アプリケーション］ &rarr; ［ブループリント］ に移動してください。 ［要素］タブを開き、目的の要素を見つけ、それをクリックします。 要素の完全なJSON表現が表示されます。

要素をブループリントに追加するには、[ブループリントを作成](./creating-and-managing-search-blueprints.md)し、その［クエリビルダー］ &rarr; ［クエリ要素サイドバー］で要素を検索して追加する方法を使用します。

![検索ブループリントアプリケーションでクエリ要素を設定します。](./search-blueprints-elements-reference/images/13.png)

［ブループリント］ &rarr; ［Query Elements］画面で作業中に、任意の Element のクエリ設定 JSON を表示するには、アクションアイコン (![Actions](../../../images/icon-actions.png)) &rarr; ［View Element JSON］ をクリックしてください。

各要素は、ブループリントのタイトルバーにあるトグルスイッチを使用して、ブループリントで無効または有効にすることができます。 ブループリントの要素を効率的に表示するには、要素のタイトルバーにある下矢印アイコン（![Down Arrow Icon](../../../images/icon-angle-down.png)）を使用して要素のコンテンツを折りたたむことができます。

各要素には設定オプションがあり、その多くはElasticsearch[Query DSL documentation](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl.html)で定義されているクエリの属性に直接対応しています。 特定のクエリタイプへのリンクは、適宜、以下に記載されています。

## いくつかの結果をブーストする

`boost`を[Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-term-query.html#term-field-params)クエリに設定すると、一致する結果の関連性スコアを調整します。 1.0を超えるとスコアが増加し、0から1.0の間の値ではスコアが減少します。

特定の結果をブーストする場合、ブースト値を調整する必要があります。 [プレビューサイドバー](creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar)を使用して、ドキュメントがどのようにスコアリングされているかを検査し、ブースト値を微調整します。

### ［Boost All Keywords Match］

複数の一致するクエリを使用すると、検索キーワードが指定されたフィールドに一致する場合、検索結果をブーストします。 要素の複数の一致するクエリ句を全体としてブーストすることも、個々のフィールドへの一致をブーストすることも可能です。 _［Text to Match］_設定フィールドはオプションです。空白のままだと、検索ユーザーのキーワードがクエリに渡されます。

![複数の一致するクエリの一致を柔軟にブーストすることができます。](./search-blueprints-elements-reference/images/01.png)

- ［Field］：検索するフィールドと、それらを個別にブーストするかどうかを選択します。
- ［Match Type］：Elasticsearchが内部で処理するクエリの方法を指定します。 _Most Fields_ は、指定したフィールドごとにMatchクエリを作成し、スコアを結合するというもので、おそらく最も基本的なものでしょう。
- 「Boost］：一致する結果の関連性スコアを調整します。 デフォルト値は1.0なので、1.0を超えるとスコアが上がり、0〜1.0だとスコアが下がります。
- ［Text to Match］：ハードコードされたキーワードに一致させるか、空白のままユーザーの検索キーワードに一致させるかを選択します。

_外部参照_: Elasticsearch[Multi-match](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-multi-match-query.html)クエリのドキュメントを参照してください。

### アセットタイプのブースト

指定されたアセットタイプをブーストします。 登録されている[アセット](../../../building-applications/data-frameworks/asset-framework.md)の一覧からアセットタイプ（必須）を選択し、ブースト値を設定します。

### 現在の言語のコンテンツをブースト

`context.language_id`フィールドに格納されている、現在のセッション言語と一致するデフォルト言語を持つページとウェブコンテンツをブーストします。 ブースト値を設定します。

### キーワードマッチによるカテゴリー内のコンテンツをブースト

ユーザーの検索キーワードが設定したキーワードのいずれかを含む場合、カテゴリ内のコンテンツをブーストします。 ［キーワード］と［アセットカテゴリーID］は必須項目です。

Elasticsearchのインデックスをクエリして（例えば Kibana を使って）アセットカテゴリーの検索ドキュメントを見つけることができ、それには `assetCategoryId`が含まれます。 この場合、検索されるカテゴリーのタイトルは_ビジネス_です。

```json
GET /_search
{
  "query": {
    "multi_match": {
      "fields": [
        "localized_title_en_US",
        "title_en_US",
        "title"
      ],
      "query": "business"
    }
  }
}
```

```{tip}
検索するフィールドがローカライズされているかどうかわからない場合は、上記のスニペットのように複数の一致したクエリを使用して、そのフィールドの複数のバリエーションを検索してください。
```

また、適切な権限を持つユーザーは、サイトメニュー &rarr; ［カテゴリー設定］ &rarr; ［カテゴリー］ からアセットカテゴリーIDを確認することも可能です。 ［カテゴリ］を開き、そのURLを確認します。 例:

[http://localhost:8080/group/guest/~/control_panel/manage/-/categories_admin/vocabulary/41891/category/41892](http://localhost:8080/group/guest/~/control_panel/manage/-/categories_admin/vocabulary/41891/category/41892)

必要なIDは、URLの最後の部分です。 この場合は`41892`になります。

### ［Boost Contents in a Category for a Period of Time］

指定された期間、カテゴリ内のコンテンツをブーストします。 ［Asset Category ID］、開始時刻、終了時刻はすべて必須です。 この要素は条件付きです。現在の日付が設定された日付範囲外の場合、クエリとそのブーストは実行されません。

![指定された日付の範囲内で、特定のカテゴリを持つ結果をブーストします。](./search-blueprints-elements-reference/images/02.png)

### ［Boost Contents in a Category for a User Segment］

指定された[ユーザーセグメント](../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)に属するユーザーのカテゴリ内のコンテンツをブーストします。 複数のユーザーセグメントIDを入力する場合は、テキストボックスにカンマを入力し、次のIDの入力を開始します。 ［Asset Category ID］、［User Segment IDs］は必須項目です。 これは条件付きの要素です。`user.active_segment_entry_ids`に指定したセグメントIDが含まれている場合のみ、クエリが実行されブーストされることになります。

![指定されたセグメントのユーザーに対して、特定のカテゴリで結果をブーストします。](./search-blueprints-elements-reference/images/03.png)

### ゲストユーザー向けにカテゴリー内のコンテンツをブーストする

ユーザーがログインしていない場合、カテゴリ内のコンテンツをブーストします。 アセットカテゴリーIDは必須項目です。 これは条件付き要素で、`user.is_signed_in`パラメータが`false`の場合にのみクエリーが実行され、ブーストされます。

### ［Boost Contents in a Category for New User Accounts］

指定された時間内に作成されたユーザーアカウントに対して、カテゴリ内のコンテンツをブーストします。 ［Asset Category ID］と［Time range］（日数）は必須項目です。 指定された日数以内に作成されたアカウントは新規アカウントとみなされ、そのユーザーに対して特定の結果がブーストされます。 これは条件付き要素です。`user.create_date`パラメータが指定された時間範囲内の値を持つ場合にのみ、クエリが実行され、ブーストされます。

![特定のカテゴリの新規ユーザーでの結果をブーストします。](./search-blueprints-elements-reference/images/04.png)

### ［Boost Contents in a Category for the Time of Day］

時間帯に応じてカテゴリー内のコンテンツをブーストします。 これらの時間範囲から一つを選択します。

- 午前：4AM～12PM
- 午後12時～17時
- 夕方：5PM～8PM
- 夜間：午後8時〜午前4時

![指定された時間帯に特定のカテゴリーの結果をブーストします。](./search-blueprints-elements-reference/images/05.png)

### カテゴリー内のコンテンツをブーストする

特定のカテゴリのコンテンツのブーストとプロモーションします。 アセットカテゴリーIDは必須項目です。

### マイサイトのコンテンツをブースト

ユーザーが会員になっているサイトのコンテンツをブーストします。 この要素には必須項目はありません。他のブースト要素と同様に、ブーストの値を任意に設定します。 検索コンテキストには、現在のユーザーのグループを追跡するためのパラメータ `user.group_ids`があり、現在のサイトのIDがそのリストの一部である場合、クエリが一致しブーストが適用されます。

### ［Boost Contents With More Versions］

より多くのバージョンを持つ結果をブーストします。 この要素は、`field_value_factor`関数を用いて、`versionCount_sortable`キーワードフィールドに対して関数スコアクエリを実行します。 ［Factor］と［Modifier］は必須であり、［要素］で設定可能です。 係数、修飾子、バージョン数、ブーストの組み合わせにより、結果のブーストの仕方が決まります。

![高いバージョン数の結果をブーストします。](./search-blueprints-elements-reference/images/06.png)

- 係数：フィールドの値を乗じる係数を設定する。デフォルトは1.2である。
- 修飾子：フィールドの値に適用する修飾子を使用します。デフォルトは平方根です。 その他、None、log、log1p、log2p、ln、ln1p、ln2p、正方形、逆数があります。
- ブースト：ブーストの初期値を設定します。デフォルトは10です。 ブースト値と関数スコアを掛けて、最終的なスコア調整値を取得します。

_例：_あるドキュメントのバージョン数が`8`で、要素にデフォルト値が使用されていた場合、そのドキュメントのスコアは以下のように計算されます。

`10 * (sqrt (1.2 * 8))`

したがって、この要素のために、このドキュメントには、約`30`のスコアが追加されることになります。

_外部参照：_ Elasticsearch [Function score query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-function-score-query.html)のドキュメントを参照してください。

### ［Boost Freshness］

ガウス関数を使って最近修正したコンテンツをブーストします。

![最近修正された結果をブーストします。](./search-blueprints-elements-reference/images/07.png)

ドキュメントの更新時間をスコアリングするために使用するガウス関数は、調整が必要な場合があります。 更新時間要素のブーストの設定で、減衰、スケール、オフセット、ブーストを調整することができます。

- 減衰は、アセットの更新時間がスケールとオフセットの合計と等しい場合に、ブースト値を減少させる係数を定義します。
- オフセットとは、現在から（過去における）日数で、それを超えると、減衰関数によって計算された結果の関連性が低下し始めます。
- スケールは、オフセットに追加され、結果の関連性が減衰パラメータに等しくなる今から（過去の）日数を決定します。
- ブーストは、定義されたスケール内の結果をブーストするための開始値です。

_外部参照：_ 詳細はElasticsearchの [Function Score Query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-function-score-query.html) のドキュメントを参照してください。

### ［Boost Longer Contents］

関数スコアクエリのフィールド値係数を使用し、ユーザーの現在の言語のより長いコンテンツフィールドデータで結果を向上させます。

`context.language_id`パラメータは、 `content_{context.language_id}_length_sortable`フィールドの値、数値フィールドを得るために使用されます。 数値フィールドの値に関数（デフォルトでは自然対数）を用いて、ドキュメントのスコアの修正値を計算します。

![より長いコンテンツの結果をブーストします。](./search-blueprints-elements-reference/images/08.png)

要素の設定でブースト、係数、修飾子を調整することができます。

- ブーストは、関数でスコアリングされた結果をブーストするための数値です。
- 係数は、フィールドの値に乗算する値です。
- 修飾子は、フィールドの値を変更する際に使用する関数を定義します。

_外部参照：_ 詳細はElasticsearchの [Function Score Query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-function-score-query.html) のドキュメントを参照してください。

### 近接性のブースト

検索ユーザーに近いコンテンツをガウス関数でブーストします。 別途設定が必要です。 詳しくは、 [Search Experiencesのパーソナライズ](./personalizing-the-search-experience.md) を参照してください。

### タグ付けされたコンテンツをブーストする

指定されたタグのうち少なくとも1つを持つコンテンツをブーストします。 複数のタグ名をカンマ区切りで入力します。

### 一致するタグをブーストする

タグに完全一致するキーワードでコンテンツをブーストします。 検索ユーザーのキーワードと`assetTagNames.raw`フィールドのコンテンツを比較し（これは`assetTagNames`テキストフィールドからキーワードフィールドを作る）、ドキュメント内で用語クエリーが一致すれば、そのスコアを設定した値でブーストします。

_外部参照：_ Elasticsearch [Term query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-term-query.html)のドキュメントを参照してください。

### キーワードの一致でWebコンテンツをブーストする

ユーザーの検索キーワードに指定されたキーワードが含まれている場合、特定のWebコンテンツをブーストします。 記事IDとキーワードが一致するように設定します。

## 結果のフィルタリング

検索結果をフィルタリングする場合、ドキュメントのフィールドがクエリに一致するかというイエスかノーかの質問をすることになります。 この場合、関連性（＝どの程度マッチしているか）は気にしないようにします。 検索結果に表示される範囲を絞り込むために、いくつかのフィルタリング要素が提供されています。 これらはすべて、メインの[検索リクエスト](./understanding-search-blueprints.md#understanding-the-search-request)の`フィルタ`ブロックにクエリを提供します。

### 用語の完全一致による絞り込み

1つまたは複数の用語をフィールド値にマッチさせる（用語クエリを使用する）ことによって、結果をフィルタリングします。 フィルターが適用されるためには、少なくとも1つは一致しなければなりません。

![指定されたフィールドに完全に一致する結果をフィルタリングします。](./search-blueprints-elements-reference/images/09.png)

_外部参照：_ [Elasticsearch Terms query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-terms-query.html)のドキュメントを参照してください。

### 一定期間内に作成されたコンテンツに限定して検索する

Rangeクエリで結果をフィルタリングします。 時間範囲を設定します。

_外部参照：_ [Elasticsearch Range query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-range-query.html) のドキュメントを参照してください。

### HEADバージョンに限定して検索する

Webコンテンツの最新版の記事のみを返すように検索を制限します。 この要素は、Liferay検索フレームワークのクエリ句の機能を複製したもので、高度なユースケースで最も有用です。 例えば、Liferayの検索フレームワークがデフォルトの検索句を提供しないようにした場合、この要素を使用して失われた機能の一部を復元することが可能です。

### マイコンテンツに限定して検索する

ユーザーが所有者であるコンテンツに限定して検索します。 この要素は、`userId`フィールドに対する用語クエリで結果をフィルタリングし、`user.id`コンテキストパラメータと一致させます。

### 検索をマイサイトに限定する

ユーザーが所属しているサイトに検索範囲を限定します。 この要素は、`scopeGroupId`フィールドに対する用語クエリで結果をフィルタリングし、`user.group_ids`contextパラメータと一致させます。

### PDFファイルに限定して検索する

PDFファイルに限定して検索します。 この要素は、`mimeType`フィールドに対する用語クエリによって結果をフィルタリングし、その値をハードコードされたクエリ値`application_pdf`と一致させます。

### 公開されているコンテンツに限定して検索する

公開されているコンテンツに限定して検索します。 この要素は、Liferay検索フレームワークのクエリ句の機能を複製したもので、高度なユースケースで最も有用です。 例えば、Liferayの検索フレームワークがデフォルトの検索句を提供しないようにした場合、この要素を使用して失われた機能の一部を復元することが可能です。

この要素は、`status`フィールドの用語クエリを使用して結果をフィルタリングし、その値を[Liferayのワークフローシステム](../../../process-automation/workflow/introduction-to-workflow.md#understanding-workflow-status)における公開コンテンツを示す`0`というハードコード値に一致させます。

### 現在のサイトに限定して検索する

現在のサイトに限定して検索します。 この要素は、`scopeGroupId`フィールドの用語クエリを使用して結果をフィルタリングし、その値をコンテキストパラメータ`context.scope_groupId`と一致させます。

この要素の機能は、[検索バー](../../getting-started/searching-for-content.md#configuring-the-search-bar)のスコープ設定オプションと重複しています。

### ［Limit Search to These Sites］

検索範囲を指定したサイトに限定します。 `scopeGroupId`フィールドに対する用語クエリを使用して結果をフィルタリングし、その値を設定されたグループ IDと一致させます。

![指定されたサイト内でのみ検索結果を返すように制限します。](./search-blueprints-elements-reference/images/10.png)

サイトのIDは、その［サイト設定］ &rarr; ［サイト設定］画面に表示されます。

この要素の機能は、[検索バー](../../getting-started/searching-for-content.md#configuring-the-search-bar)のスコープ設定オプションと重複しています。 この要素が動作するためには、検索バーのスコープを_［すべて］_に設定する必要があります。

## 一部の結果を隠す

クエリをMust Not occurrence句を含むブールクエリで折り返すことで、クエリにマッチした場合に結果を非表示にすることができます。

_外部参照：_ [Elasticsearch Boolean query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-bool-query.html)のドキュメントを参照してください。

### ［Hide by Exact Term Match］

指定されたフィールドに完全に一致する単語を持つコンテンツを非表示にします。 ローカライズされたテキストフィールドを選択すると、ローカライズオプションが設定に表示されます。

![用語クエリに一致する結果を非表示にします。](./search-blueprints-elements-reference/images/11.png)

### コメントの非表示

コメントを検索しないでください。 この要素は、`ディスカッション`フィールドを持つドキュメントを検索します。 フィールドが存在し、その内容が `false`以外の場合、そのドキュメントは検索結果に含まれません。

### ゲストユーザーのためにカテゴリのコンテンツを非表示にする

ユーザーがログインしていない場合、カテゴリ内の結果を非表示にします。 これは条件付きの要素です。`user.is_signed_in`コンテキストパラメータが`false`の場合、`assetCategoryIds`フィールドが設定されたアセットカテゴリーIDに一致する結果は返されません。

### カテゴリ内のコンテンツを非表示にする

指定されたカテゴリを持つ結果を非表示にします。 `assetCategoryIds`フィールドに対して用語クエリが実行されます。 設定されているアセットカテゴリーIDが一致する場合は、検索結果にドキュメントが表示されません。

### 非表示コンテンツを非表示にする

検索できないとマークされたアセットを非表示にします。 この要素は、Liferay検索フレームワークのクエリ句の機能を複製したもので、高度なユースケースで最も有用です。 例えば、Liferayの検索フレームワークがデフォルトの検索句を提供しないようにした場合、この要素を使用して失われた機能の一部を復元することが可能です。

この要素は、返される結果が`hidden`というフィールドを持ってはならない事を指定します、もし持っている場合、その値は`false`でなければなりません。

### タグ付きコンテンツの非表示

指定されたタグを持つ結果を非表示にします。 `assetTagNames.raw`フィールドに対して用語クエリが実行されます（rawフィールドは `assetTagNames` テキストフィールドからキーワードフィールドを作成します）。 設定されているアセットタグが一致する場合は、検索結果にドキュメントが表示されません。

## その他の要素

### ［Paste Any Elasticsearch Query］

Elasticsearch DSLのクエリ本体をそのまま要素に貼り付けます。 occur句を指定します。 この要素は、提供されたJSON文字列を受け取り、バックグラウンドでそこからWrapperクエリを作成します。

例えば、タイトルがクエリキーワードbrunoに一致するドキュメントが返されないようにするには、3つの共通タイトルフィールドに複数の一致するクエリを追加し、Must Not occur句を指定します。

![Elasticsearchのクエリ本体を要素に貼り付けます。](./search-blueprints-elements-reference/images/12.png)

_外部参照：_  [Elasticsearch Wrapper query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-wrapper-query.html) のドキュメントをご参照ください。

### スケジューリングアウェア

表示期限が未来でないコンテンツのみを表示し、期限切れのコンテンツは表示しません。 この要素は、Liferay検索フレームワークのクエリ句の機能を複製したもので、高度なユースケースで最も有用です。 例えば、Liferayの検索フレームワークがデフォルトの検索句を提供しないようにした場合、この要素を使用して失われた機能の一部を復元することが可能です。

### Lucene構文で検索

1つまたは複数のフィールドにマッチさせるには、検索文字列のクエリ構文を使用します。 検索キーワードがすべて一致しなければならない（AND）か、1つだけ一致しなければならない（OR）かを決定する際に使用するデフォルトのブール演算子（ORまたはAND）を指定します。 この要素では、ブール演算子やワイルドカードなどを使って、より高度な検索キーワードを入力することができます。

_外部参照：_ [Elasticsearch Query String query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-query-string-query.html#query-string-syntax) のドキュメントをご覧ください。

### ステージングアウェア

ライブサイトで公開されているコンテンツのみを表示します。 公開されたコンテンツやステージコンテンツをステージングサイトに表示します。 この要素は、Liferay検索フレームワークのクエリ句の機能を複製したもので、高度なユースケースで最も有用です。 例えば、Liferayの検索フレームワークがデフォルトの検索句を提供しないようにした場合、この要素を使用して失われた機能の一部を復元することが可能です。

### 複数フィールドのテキストマッチ

複数のテキストフィールドでテキストマッチを検索します。 検索ユーザーのキーワードか、要素設定で設定したText to Matchのどちらかに一致させます。 これは、複数のフィールドに対して高度に設定可能なフルテキストクエリを追加するもので、要素の[マルチツール](https://en.wikipedia.org/wiki/Swiss_Army_knife#Cultural_impact)です。

- 検索するフィールドを選択するには、フィールド設定を使用します。 分析済みのテキストフィールドのみを選択する。
- 演算子は、分析したすべての検索キーワードを各フィールドに表示するか(AND)、1つだけを各フィールドに表示するか(OR)を決定します。 正確な動作は、マッチタイプの影響を受けます。
- マッチタイプは、Elasticsearchが内部的にクエリを処理する方法を決定します。 _Most Fields_はおそらく最も基本的なもので、指定したフィールドごとにMatchクエリを作成し、そのスコアを結合するものです。
- あいまいさは、不正確な一致に関する動作を設定します。 0, 1, 2を設定すると、クエリが一致を返すことができる[レーベンシュタイン編集距離](https://en.wikipedia.org/wiki/Levenshtein_distance)を直接指定することができます。 AUTOは、検索される用語の長さに基づいて編集距離を生成します。 詳しくは、[Elasticsearch fuzziness documentation](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/common-options.html#fuzziness)をご覧ください。
- 最低必須一致は、検索で返されるドキュメントのために、一致しなければならない最小の句の数を設定します。 詳しくは、[Elasticsearchのminimum_should_match](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-minimum-should-match.html)のドキュメントをご覧ください。
- スロープは、語句および語句プリフィックスマッチタイプで使用されます。 語句がずれても一致する単語数を指定することで、不正確なフレーズの一致が可能になります。 例えば、語句タイプでスロープが1の場合、「liferayブログ」を検索しても、「Liferay DXPブログ」を含むフィールドに一致する可能性があります。
- この要素が提供する句に一致するドキュメントをブーストするようブーストを設定します。
- クエリ句を一致させる値をハードコードしたい場合は、Text to Matchを設定します。 ユーザーのキーワードで検索したいだけの場合は、空欄にしてください。

_外部参照：_ [Elasticsearch Multi-match query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-multi-match-query.html)のドキュメントをご覧ください。

## 追加情報

- [検索ブループリントの作成と管理](./creating-and-managing-search-blueprints.md)
- [Search Experiencesのパーソナライズ](./personalizing-the-search-experience.md)
- [検索結果](../../search-pages-and-widgets/search-results.md)
