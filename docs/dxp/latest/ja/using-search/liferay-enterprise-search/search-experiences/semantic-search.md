---
toc:
- ./semantic-search/setting-up-a-text-embedding-provider.md
- ./semantic-search/creating-a-search-blueprint-for-semantic-search.md
---
# セマンティック検索
{bdg-secondary}`7.4 U70+`
{bdg-link-primary}`[ベータ版機能](../../ system-administration/configuring-liferay/feature-flags.md)`

```{toctree}
:maxdepth: 1

./semantic-search/setting-up-a-text-embedding-provider.md
./semantic-search/creating-a-search-blueprint-for-semantic-search.md
```

_セマンティック_ 検索されたフレーズの背後にある意図を評価するものです。 一方、 _キーワード_ 検索は、検索されたフレーズをインデックスされたテキストフィールドにマッチさせるもので、意味に基づくマッチを作り出すことはできません。

| 検索したフレーズ | インデックス付きコンテンツ                            | マッチタイプ                                        |
|:-------- |:---------------------------------------- |:--------------------------------------------- |
| 技術動向     | Liferay、7.3のサーチエクスペリエンスをリリース             | Semantic &#10004;<br />Keyword &#10008; |
| 新譜       | Liferay Search Experiencesの新機能をリリースしました。 | Semantic &#10004;<br />Keyword &#10004; |

Liferayのような高度なキーワード検索(Elasticsearchを使用）でも、ユーザーの意図とインデックスされたドキュメントを一致させることはできませんが、次のような工夫がされています。
- を解析して、キーワードと文書フィールドをトークン化します。
- ファジィやスロッピングで不正確なマッチングを可能にします。
- ステミングで単語を語源に分解し、同義語のマッチングを可能にする。
- 些細な言葉を無視するために、言葉を止める。

トークン化されたキーワードと文書フィールドによる検索は、多くの検索ニーズに十分対応できます。 検索体験にさらなるものを求めるなら、セマンティック検索は、キーワード検索で達成できることと、ユーザーが検索に本当に求めていることとのギャップを大きく縮めます：検索の言葉だけでなく、その意図も処理します。

![自然言語の検索フレーズは、セマンティック検索システムで処理されます。](./semantic-search/images/03.png)

セマンティック検索は、コンテンツ処理のパイプラインを追加することを可能にします。 有効化すると、プラットフォームはテキストエンベッディングと呼ばれる入力テキストのベクトル表現を生成し、Elasticsearchのインデックス文書に格納します。 検索時には、ユーザーが入力した検索キーワードを同じベクトル化・埋め込み処理を行うことで、ユーザーにとってより意味のある検索結果を提供する類似検索を行うことが可能になります。 すべてのコンテンツタイプがテキスト埋め込みに対応しているわけではありません：

| 対応するコンテンツタイプ  | デフォルト設定で有効? |
|:------------- |:----------- |
| ブログのエントリ      | &#10004;    |
| ナレッジベース記事     | &#10004;    |
| 掲示板のメッセージ     | &#10008;    |
| ウェブコンテンツの基本記事 | &#10004;    |
| Wikiページ       | &#10004;    |

```{important}
効果的なセマンティック検索ソリューションには、データドメイン用にトレーニングされたモデルが必要です。 最も簡単な方法は、適切な事前学習済みモデルを見つけ、それをデータに合わせて微調整することです。 ここで示した例は、量産可能なセマンティック検索ソリューションではありません。
```

## セマンティック検索を可能にする

Liferayでセマンティック検索を可能にするため、

1. *グローバルメニュー* (![Global Menu](../../../images/icon-applications-menu.png)) を開き、 *コントロールパネル* &rarr; *インスタンスの設定*をクリックします。
1. *Platform* &rarr; *Feature Flags* セクションを開いてください。
1. Betaの項目で、Semantic Searchを有効にします。

![セマンティック検索はベータ版機能であり、インスタンス設定で有効にする必要があります。](./semantic-search/images/02.png)

[ポータルのプロパティ](../../../installation-and-upgrades/reference/portal-properties.md)を使ってセマンティック検索を可能にするには、 `portal-ext.properties`にこれを追加します：

```properties
feature.flag.LPS-122920=true
```

[環境変数](../../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables)を使ってセマンティック検索を有効にするには、次のように設定を追加します：

```properties
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER2__NUMBER2__NUMBER9__NUMBER2__NUMBER0_=true
```

セマンティック検索を設定するには

1. [モデルを選ぶか、自分で作るか。](#choosing-a-model)
1. [テキスト埋め込みプロバイダーを有効にし、Liferayに設定する。](./semantic-search/setting-up-a-text-embedding-provider.md)
1. [テキスト埋込のインデックスを再作成する。](#re-indexing-the-text-embeddings)
1. [ベクトル化された検索語と文書の類似性検索を行うためのSearch Blueprintを作成します。](./semantic-search/creating-a-search-blueprint-for-semantic-search.md)

### モデルの選択

[適切に訓練されたモデル](https://www.sbert.net/docs/pretrained_models.html) が最も重要です。インデックスに含まれるデータは、選択したモデルにとって適切でなければなりません。 訓練済みのモデルを使うのは便利ですが、本番で使う前にデータに合わせて微調整が必要な場合があります。 ロバスト・テストによってのみ、選択したモデルが適切であることを知ることができます。

例えば、 _「スケートはどのように動くのか」と検索した場合、海洋生物学を学習したモデルとレクリエーションを学習したモデルでは、結果が異なります。_と検索した場合、海洋生物学を学んだモデルと、レクリエーションを学んだモデルでは、異なる結果が得られるでしょう。

[Hugging Face モデルハブ](https://huggingface.co/models) は、事前に訓練されたドメイン固有のモデルの大規模なコレクションを提供します。

### テキストエンベッディングのインデックス化

テキスト埋め込みは、以下の場合にインデックスされる必要があります。

1. 初めてセマンティック検索を可能にする。
1. セマンティックサーチの設定で、テキスト埋め込みプロバイダー、モデル、ベクトル寸法、テキスト切り捨ての戦略を変更すること。

テキスト埋め込みのインデックスを作成するには、インデックスアクション画面を使用し、セマンティック検索システムまたはインスタンス設定のアセットエントリークラス名の設定で有効にしているモデルタイプだけについて、 _Reindex_ ボタンをクリックします。

## セマンティック検索を設定する

[text embeddings provider](./semantic-search/setting-up-a-text-embedding-provider.md)を設定する以外にも、セマンティック検索のための設定オプションが用意されています。 コントロールパネルにアクセス &rarr; インスタンス設定 &rarr; セマンティック検索。

テキスト埋め込みプロバイダの設定については、 [セマンティック検索を有効にする](#enabling-semantic-search)で説明しています。

インデックス設定には、このようなものがあります：

**最大文字数：** テキスト埋め込みプロバイダーに送信する最大文字数を設定します。 デフォルトでは、最大500文字が送信され、ベクトル表現に変換されます。 ここでの理想的な値は、どの [テキスト埋め込みプロバイダー](./semantic-search/setting-up-a-text-embedding-provider.md) を使用しているかによります。

**Text Truncation Strategy(テキスト切り捨て戦略）：** テキストの先頭(デフォルト）、中間、または末尾から変換前のサンプルを抽出するかどうかを選択します。 この設定は、ソーステキストが最大文字数より長い場合にのみ適用されます。 戦略や最大文字数に応じて、タイトル/サブジェクトとコンテンツ/ボディの一部を使用してテキスト埋め込みを生成することができます。

**Types(タイプ）：** 変換するコンテンツの種類を選択します。 デフォルトでは、Blogs Entry、Knowledge Base Article、Web Content Article、Wiki Pageの4つのタイプが処理されます。 メッセージボード メッセージエンティティは、必要に応じて設定することができます。

```{note}
現在、Basic Web Contentの記事のみ対応しています。
```

**Languages(言語）：** 変換する言語とローカライズを選択します。 デフォルトでは、リストアップされたすべての言語が選択されています。 _Ctrl + Click_を使って、リストから複数の言語を選択します。

```{warning}
言語を有効にしても、その言語に対応した文埋め込みが作成されることを保証するものではありません。 サイト内で使用可能な言語であること。 システム/インスタンス設定で言語が有効で、サイト内で利用可能であるにもかかわらず、あるコンテンツの翻訳がない場合、デフォルトの翻訳がテキスト埋め込みを作成するために使用されます。
```

**Text Embedding Cache Timeout(テキスト埋め込みキャッシュタイムアウト）：** 検索キーワードを変換したときのキャッシュのタイムアウトをミリ秒単位で設定します。 キャッシュがタイムアウト内にある場合、Liferayはキーワードのテキスト埋め込みをテキスト埋め込みプロバイダーに要求しない。 デフォルトでは、タイムアウトは604800ms(約10分）です。

## Liferayのセマンティック検索を理解する

Liferayのセマンティックサーチは、以下のどちらかです。

1. フルセマンティックサーチは、Search blueprintで通常のインデクサーを無効にし、テキストエンベッディングのみを使用して関連するコンテンツを検索するものである。

1. ハイブリッドセマンティック検索では、まずキーワード検索を行い、その結果をテキスト埋め込みで再スコア化する。

セマンティック検索とその複雑さをしっかりと理解することは、この簡単な説明の範囲を超えています。 ここでは、Liferayハイブリッドセマンティックサーチの実装がどのように機能するかを説明し、セマンティックサーチのいくつかの基本的な概念について説明します。

セマンティック検索は、インデックスタイムと検索タイムの両方でLiferayの検索に影響を与え、コンテンツ処理の追加レベルを導入します。

### インデックス作成段階でのセマンティック検索

* まず、通常のコンテンツ処理が行われます：
  * [LIFERAY] Liferayのコンテンツは検索エンジンに送られ、そこでデータの種類に応じて処理されます。テキストは適切に分析され、インデックスに保存されます。
* [LIFERAY] 追加の意味検索処理が発生します：
   * System/Instance Settingsの設定に従い、テキストスニペットがLiferayからテキスト埋め込みプロバイダーに送信されます。
      * Max Character CountとText Truncation Strategyは、テキスト埋め込みプロバイダーに送信されるスニペットを決定します。
      * Liferayは、Blogs Entries、Knowledge Base Articles、Wiki Pages、Basic Web Content Articlesのタイトルとコンテンツを選択します。 メッセージボード メッセージの場合、件名と本文のフィールドが処理されます。
  * [TEXT EMBEDDING PROVIDER] まず、設定されたモデルに従ってスニペットが処理され、そのパラメータに従ってスニペットをトークン化します。 よく使われる BERT モデルでは、512 はモデルが扱うトークンの最大数である。 システム/インスタンス設定」の「セマンティック検索 &rarr; 最大文字数」の設定で設定された文字数に影響されます。
  * [TEXT EMBEDDING PROVIDER] テキスト埋め込みと呼ばれるソースのベクトル表現が、トランスフォーマーが使用するモデルに基づいて作成されます。
  * [LIFERAY] テキスト埋め込み処理の結果は、 [Liferay Company Index](../../search-administration-and-tuning/elasticsearch-indexes-reference.md) に、各文書の [dense_vector](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/dense-vector.html) フィールドとして格納されます[^1].
  * システム/インスタンス設定」の設定に従って、テキストスニペットがテキスト埋め込みプロバイダーに送信され、テキスト埋め込みが行われ、トランスフォーマーが使用するモデルに基づいて、ベクトル表現が作成されます。 テキスト埋め込み処理の結果は、 [Liferay Company Index](../../search-administration-and-tuning/elasticsearch-indexes-reference.md) に、各文書の [dense_vector](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/dense-vector.html) フィールドとして格納されます[^1].

### 検索段階でのセマンティック検索

* 通常のキーワードマッチングが発生します：
  * 検索バーウィジェットに入力された検索フレーズは、Liferayの検索フレームワークによって受信され、分析と追加処理のために検索エンジンに送られ、検索エンジンの既存のインデックス文書とマッチングされ、関連性がスコア化され、その追加処理(ハイライト、要約、許可のための追加フィルタリングの実行など）のためにLiferayに返されます。
* 追加の意味検索処理が発生します：
  * 検索フレーズはテキスト埋め込みプロバイダーに送られ、ベクトル表現が作成されます(テキスト埋め込み [](https://neuml.github.io/txtai/embeddings/)）。 キーワード検索の関連性でスコアリングされた検索結果をレンダリングする前に、ウィンドウ制限設定内に取り込まれた結果は、検索フレーズのベクトル表現とインデックス文書のベクトル表現を比較することで再スコアリングされます。 新しいスコアが計算され、その結果はエンドユーザーが消費するために検索ページに返されます。 詳しくはElasticの [ベクターサーチとは](https://www.elastic.co/what-is/vector-search) をご覧ください。

[^1]: ドキュメント内のフィールドを検査するには、 [Display Results in Document Form](../../search-pages-and-widgets/search-results/configuring-the-search-results-widget.md) の設定、または [Search Blueprints preview](./search-blueprints/creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar) 機能を使用します。
