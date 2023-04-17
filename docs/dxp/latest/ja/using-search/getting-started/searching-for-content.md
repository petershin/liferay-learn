# コンテンツの検索

すべてのインデックス付きコンテンツ(別名 Liferay DXPの_アセット_ ）を検索結果として返すことができます。 [カスタムコンテンツにもインデックスを付けることができます](https://help.liferay.com/hc/en-us/articles/360032260612-Model-Entity-Indexing-Framework)そのため、ご使用のシステムには、デフォルトで含まれているもの以外の追加のアセットタイプがある場合があります。 次の画像は、Liferay DXPでインデックスが作成されるさまざまなタイプのコンテンツの例を示しています。

![これらのアプリがデプロイされている場合、そのコンテンツはデフォルトで検索可能です。](./searching-for-content/images/08.png)

## 検索バーの使用

デフォルトのLiferay DXP設定を使用すると、ユーザーは検索バーに検索語を入力して検索を行うことができます。 検索を実行すると、[検索ページ](../search-pages-and-widgets/working-with-search-pages/search-pages.md)に移動し、さまざまな検索ウィジェットをデプロイします。

![デフォルトの検索設定では、デフォルトのビューに検索バーが表示され、ユーザーに検索コンテキストの入力を求めます。](./searching-for-content/images/01.png)

### 検索用語を入力する

Liferayの検索インフラストラクチャは、サポートされている検索エンジン([Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/full-text-queries.html)および[Solr](http://lucene.apache.org/solr/features.html))によって実装されている全文検索に対応しています。

全文検索では、検索クエリに入力されたすべての単語(例えば、 *stock market*）と、インデックスされた各文書に含まれるすべての単語を比較します。 Elasticsearchのような検索エンジンは、関連性スコアを計算して、最適な結果が最初に返されるようにしています(最近の強気の市場についてのBlog Entryなど）。 *stock* や *market* のような単語を含むものが返されます。

全文検索に加えて、高度な検索構文がサポートされています。 基盤となる検索エンジンが正確な動作を決定するため、詳細は [Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/7.6/query-dsl-simple-query-string-query.html) または [Solr](https://lucene.apache.org/solr/guide/7_0/query-syntax-and-parsing.html) ドキュメントを参照してください。

![Elasticsearchのクエリ文字列構文を使用して、特定のフィールドのテキストを検索します。](./searching-for-content/images/02.png)

### 検索バーのサジェスチョン：ユーザーのタイプに合わせた検索

{bdg-secondary}`7.4 U36+とGA36+`

最新のLiferay 7.4では、ユーザーが検索フレーズを入力すると、検索バーが検索候補を表示するようになりました：

![サーチバーサジェスチョンとは、ユーザーがサーチバーに検索語句を入力すると、その検索結果の速報を表示するものです。](./searching-for-content/images/11.png)

動作の詳細については、 [検索バーのサジェスチョン](../search-pages-and-widgets/search-bar-suggestions.md)をご覧ください。

### 完全一致のフレーズ：引用検索

ユーザーが検索語(たとえば、 _アジャイルフレームワーク_）に、入力したとおりのフレーズで結果のみを生成させたい場合はどうなりますか？ 通常の全文検索では、 _アジャイルフレームワーク_ 検索すると、用語 _アジャイル_ および _フレームワーク_のみを含む検索結果と、両方の用語を含むが他のテキストで区切られたヒット、および完全に一致するフレーズの結果が返されます。 完全に一致するフレーズのヒットのみが返されるようにするには、それを次のように引用符で囲みます： _"アジャイルフレームワーク"_。

![検索語句を引用符で囲んで、完全に一致するフレーズを検索します。](./searching-for-content/images/04.png)

### プレフィックス検索

プレフィックス検索では、*楽器*という用語を検索すると、完全な単語を含むドキュメントだけでなく、*楽器*をプレフィックスとするバリエーションも返します。 例えば、*楽器*、*楽器の*、*器楽編成*の結果も返されます。

!["lever&quotを検索すると、また"leverage"と "leveraging"を返します。](./searching-for-content/images/03.png)

```{note}
プレフィックス検索は、多くのフィールドですぐに利用できますが、ボンネットの中はもっと複雑です。 フィールドで使用されている分析器や実行された変換など、フィールドマッピングの詳細が最終的な動作を決定します。
```

ユーザーに確実に結果を表示するもう1つの方法は、 [検索候補](../search-pages-and-widgets/search-results/enabling-search-suggestions.md)を使用することです。

### 検索バーの構成

検索バーの動作は、ウィジェット設定画面で設定することができます。 設定オプションは、ディスプレイ設定、サジェスチョン設定、アドバンス設定に分類されます。

![構成画面で検索バーの動作を構成します。](./searching-for-content/images/05.png)

```{note}
あるページの上部にグローバルに埋め込まれた検索バーウィジェットを設定すると、サイト内のすべてのページでページトップの検索バーウィジェットが設定されます。 また、[目的地の検索ページ](../search-pages-and-widgets/working-with-search-pages/search-pages.md)の検索バーウィジェットの設定が異なる場合は、そちらを上書きします。 ただし、他のページに手動で設置した検索バーウィジェットを上書きすることはできません。
```

#### 表示設定

**キーワードパラメータ名：** 検索で入力したキーワードのパラメータ名を編集します。 たとえば、キーワード _データ_ 検索するときのデフォルトのURLは次のようになります。

```
http://localhost:8080/web/guest/search?q=data
```

キーワードパラメータ名を _キーワード_ に変更すると、次のようになります。

```
http://localhost:8080/web/guest/search?keyword=data
```

**スコープ：** このサイト(デフォルト）、すべて、およびユーザーに選択させるの3つのオプションから選択します。 *このサイト* は、検索が実行されるサイトに関連付けられているアセットのみが検索されることを意味します。 *すべて*を選択して、検索範囲をすべてのサイトに展開します。 ユーザーが検索するスコープを選択できるようにするには、［ *ユーザーに選択させる*］を選択します。

![ユーザーに検索を実行する範囲を選択させます。](./searching-for-content/images/06.png)

**スコープパラメータ名：** 検索が行われているスコープのURLパラメータ名を設定します。 このパラメーターは、スコープ _ユーザーに_ を選択させるが選択されている場合にのみURLに表示されます。 デフォルト値は _scope_で、単語 _data_ を検索すると、デフォルトURLは次のようになります。

```
http://localhost:8080/web/guest/search?q=data&scope=this-site
```

_scope_ を _target_ に変更すると、次のようなURLになります。

```
http://localhost:8080/web/guest/search?q=data&target=this-site
```

**対象ページ：** [検索ページ](../search-pages-and-widgets/working-with-search-pages/search-pages.md)にフレンドリURLを提供します。 構成されていない場合、または存在しないページを指している場合、ユーザーに表示するには検索バーを構成する必要があるというメッセージが管理者に表示されます。

#### 検索提案の設定

[Search Bar Suggestions](../search-pages-and-widgets/search-bar-suggestions.md) が利用可能で有効な場合、追加の設定が Search Bar ウィジェット設定に表示されます。 これらの設定オプションについて理解するには、 [検索バーのサジェスチョンを設定する](../search-pages-and-widgets/search-bar-suggestions/configuring-search-bar-suggestions.md) を参照してください。

#### 詳細設定

**詳細検索シンタックスを利用する：** Elasticsearchを使用している場合、これを有効にすると、ユーザーは [検索文字列構文](https://www.elastic.co/guide/en/elasticsearch/reference/7.6/query-dsl-simple-query-string-query.html) を検索バーに入力できます。 Solrを使用している場合は、 [適切な構文](https://lucene.apache.org/solr/guide/7_0/query-syntax-and-parsing.html)に関するドキュメントを参照してください。

**ステージサイトからの結果を表示：** ステージング環境 [からのコンテンツは](../../site-building/publishing-tools/staging.md) この設定に関わらず、本番環境サイトでは [検索できない](../search-pages-and-widgets/search-results/search-results-behavior.md#search-and-staging) ようになりました。 この設定は、ローカルステージングを有効にしたサイトで「すべて」のスコープが構成されている場合に、他のローカルステージングサイトからのコンテンツの検索を可能にします。

## Liferay Objectの検索

Liferay 7.4 には [Liferay Objects](../../building-applications/objects.md)という、GUI主導型アプリケーション構築のフレームワークが含まれています。 各オブジェクトの定義のフィールドは検索可能と宣言できます。オブジェクトエントリ(アプリケーションのユーザが送信したレコード）は、クエリを実行でき、検索結果ウィジェットに返すことが可能です。

```{important}
オブジェクトのスコープにより、検索方法が決定されます。

*オブジェクトのスコープが Company の場合、検索バーがすべてを検索するように設定されているときのみ、オブジェクトのエントリが検索されます。
*オブジェクトのスコープがSiteの場合、検索バーが このサイト内で検索するように設定されていれば、オブジェクトのエントリを検索することができます。
```

タイプファセットと検索結果ウィジェットは、以下の方法で Liferay Objectsの検索をサポートします。

* タイプファセットには自動的に公開オブジェクトが含まれます。

   ![公開オブジェクトがタイプファセットウィジェットに追加されます。](./searching-for-content/images/09.png)

* 検索結果ウィジェットには、オブジェクトエントリのタイトルと概要が自動的に表示されます。

   ![オブジェクトエントリには、タイトルとコンテンツの概要が表示されます。](./searching-for-content/images/10.png)

Liferay 7.4 U64+/GA64+ では、検索結果のオブジェクトエントリーをクリックすると、そのエントリーの [表示ページ](../../building-applications/objects/displaying-object-entries.md#creating-display-page-templates-for-objects)が存在する場合、そちらにリダイレクトされます。

## 追加情報

* [検索結果の動作](../search-pages-and-widgets/search-results/search-results-behavior.md)
* [検索候補の有効化](../search-pages-and-widgets/search-results/enabling-search-suggestions.md)
