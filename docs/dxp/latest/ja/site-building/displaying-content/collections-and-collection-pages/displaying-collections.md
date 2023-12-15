# コレクションの表示

{bdg-secondary}`liferay Portal 7.4 GA6+、DXP 7.3 GA1+が利用可能です。`

コレクションを表示するには、コレクションページ、またはコレクション表示フラグメントを追加します。 これらの表示オプションの詳細は、 [コレクションとコレクションページについて](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md#displaying-collections) を参照してください。

デフォルトでは、どのユーザーもコレクションのコンテンツを見ることができます。 しかし、 [セグメントを使用して、ユーザーがこのコンテンツをどのように見るかをパーソナライズすることができます](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md#customizing-collections) 。

```{note}
 [コレクションを作成する](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md)、コレクションを作成する必要があります。
```

## ページにコレクションを表示する

コレクションを表示する最も簡単な2つの方法は、コレクションページを追加するか、既存のページにコレクション表示フラグメントを追加することです。

### コレクションページでコレクションを表示する

コレクションページは、ページをコレクションにリンクします。 コレクションページには、 [コレクション表示フラグメント](#adding-a-collection-display-fragment-to-a-page) がページの一部として含まれています。

コレクションページを追加するには、以下の手順に従ってください：

1. **サイトメニュー**( ![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **サイトビルダー** &rarr; **ページ** に進みます。

1. **新しいページ**(![新しいページ](../../../images/icon-add.png))をクリックし、 **コレクションページ** を選択します。

   ![Create a new collection page from the pages administration.](./displaying-collections/images/01.png)

1. コレクション]タブで、コレクションの1つを選択するか、 **追加**( ![アイコンの追加](../../../images/icon-add.png))をクリックして、 [新しいコレクションを作成する](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md) 。

1. 使用する **マスターページ** を選択します。

1. コレクションページの名前を入力し、 **Add** をクリックします。

1. コレクションを表示するには、 [そのコンテンツをページ要素にマッピングする](#mapping-components-to-display-a-collections-assets) 。

```{important}
コレクションページの下に子ページを作成することはできません。
```

これで、コレクション表示フラグメント内に、選択したコレクションを表示するコレクションページができました。

### コレクション表示フラグメントをページに追加する

コレクション表示フラグメントは、コンテンツページ内のコレクションを表示します。 コレクションを任意のスタイルやレイアウトで表示するように設定できます。

![Use a collection display fragment to display a collection in the desired format.](./displaying-collections/images/02.png)

コレクション表示フラグメントに既存のコレクションを追加するには

1. [新規ページの作成](../../creating-pages/adding-pages/adding-a-page-to-a-site.md) または [コンテンツページの編集を開始](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md) .

1. **Add**( ![Add widget icon](../../../images/icon-add-widget.png) ) をクリックして、Fragments and Widgetsパネルを開きます。

1. FragmentsタブのContent Displayカテゴリで、 **Collection Display** フラグメントをページ上の任意の場所にドラッグします。

1. 選択パネルにコンフィギュレーションを表示するには、 **Collection Display** フラグメントをクリックします。

1. General タブで、 **Collection** フィールドをクリックして、選択したコレクションをフラグメントにマップする：

   ![Select a collection and map it to the collection display fragment.](./displaying-collections/images/03.png)

コレクション表示フラグメントがページに表示され、選択されたコレクションが表示されます。

```{important}
コレクション表示フラグメントをページに追加する場合、編集可能なフラグメントにマッピングできるコレクションのみが使用可能です（ブログエントリー、ドキュメント、ナレッジベース記事、ウェブコンテンツ記事、カスタムオブジェクトエントリー）。
```

## コレクション表示フラグメントの設定

コレクション表示フラグメントを手動で追加した場合でも、コレクションページ経由で追加した場合でも、 [ページを編集して、](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md) フラグメントを選択することで設定できます。

コレクション表示フラグメントを選択すると、コレクション内の各アセットのセクションに分割されます。 コレクションを選択した後、フラグメントの一般設定の下に新しいオプションが表示されます：

**スタイル表示** ：リスト内のアセットのフォーマットに使用するスタイルを選択します（グリッドまたは箇条書きリストスタイルなど）。 7.4 GA23またはU23より前のバージョンでは、この設定はリスト・スタイルと呼ばれます。

**レイアウト** :アセットを表示する列の数を選択します。

**Show Gutter** ：列間のガター（間隔）を表示するには、チェックボックスをオンにします。 このオプションは、カラムレイアウトのグリッドスタイルを選択した場合にのみ表示されます（バージョン7.4 GA23+またはU23+の場合）。

**Show Empty Collection Alert** ：適用されたフィルタに一致する結果がない場合、またはコレクションが空の場合にアラートメッセージを表示するには、このボックスにチェックを入れます。

**空のコレクション警告** ： **Show Empty Collection Alert** が有効な場合、表示されるアラートメッセージを選択します。 このメッセージはローカライズ可能です。

**Vertical Alignment** ：各行の上部、中央部、または下部：項目の整列方法を選択します。 このオプションは、 **Grid** スタイルを選択した場合にのみ表示されます（バージョン7.4のGA23+またはU23+）。

**リスト項目のスタイル** ：各資産をフォーマットするスタイルを選択します。 このオプションは一部のリスト・スタイルにのみ適用されます。

**最大アイテム数** ：フラグメントが一度に表示できるアセットの最大数を選択します。

![Click a collection display fragment with a configured collection to reveal more configuration options.](./displaying-collections/images/04.png)

コレクション内のアセットを設定どおりに表示する準備ができたら、ページをパブリッシュします。

```{tip}
Liferay 7.4 GA23+またはU23+では、コレクション表示フラグメントにGridスタイルを選択した場合、デバイスの種類ごとに個別にレイアウト設定を行うことができます。 画面上部のデバイスビューポートボタンをクリックして、各デバイスにこの設定を行います。 タブレットの設定のデフォルトはデスクトップの設定と同じで、縦長と横長の電話の設定のデフォルトは1列です。
```

<!-- Add reference to developer tutorials to add more options for the List styles/List item styles when available -->

### コレクションのアセットを表示するためのコンポーネントのマッピング

表示コンポーネントをフラグメントにマッピングすることで、フラグメント内の項目のスタイル (各アセットを個別に表示する方法) を構成することもできます。

これらの要素をフラグメントのセルにドラッグして、コレクション表示フラグメントのアセットにマッピングします。

```{note}
コレクション表示フラグメントのリストスタイルで選択したオプションによっては、コンポーネントをフラグメントにドラッグできない場合があります。 コンポーネントをフラグメントにドラッグできない場合は、別のリストスタイルを選択するか、「リストアイテムのスタイル」で別のオプションを選択します。
```

1. ページエディタで、コレクションを表す **コレクション表示** をクリックします。

1. ツールのサイドバーで、 **フラグメントとウィジェット**(![フラグメントとウィジェット](../../../images/icon-add-widget.png))をクリックします。

1. フラグメントとウィジェットのサイドバーパネルから、コレクションアイテムの表示に使用したいコンポーネントをドラッグ＆ドロップします。

   ![Add fragments or widgets to the collection display and configure the display properties.](./displaying-collections/images/05.gif)

   ```{note}
   コレクション表示に複数のアイテムが含まれている場合、フラグメントまたはウィジェットをそれらのいずれかにドラッグすることができます。 コレクション内の残りのアイテムは、自動的に同じレイアウト設定を使用します。
   ```
1. コレクションディスプレイ上の **フラグメント** または **ウィジェット** をダブルクリックすると、そのマッピングオプションにアクセスできます。

1. Mapping 列で、コレクションにマップしたい **フィールド** を選択します。

   ![Map the fragments and widgets to the collection items](./displaying-collections/images/06.gif)

1. 必要に応じてフラグメントやウィジェットを追加し、コンテンツをコンテンツフィールドにマッピングする。

   ![Add fragments and widgets to the collection display and map the content fields.](./displaying-collections/images/07.gif)

1. ［**公開**］ をクリックします。

## 表示項目のページネーション

{bdg-secondary}7.4+で利用可能

ページネーション設定を使用して、コレクション項目をページ分割できます。 このオプションには、2つの重要な利点があります。

* アイテム数の多いコレクションの方が見せやすい。 コレクション内のすべてのアイテムを表示する代わりに、一度に表示するアイテムの数を決めることができ、同時にユーザーはコレクション内のアイテムのリストを戻ったり進んだりすることができます。

* 閲覧可能なアイテムのリストを小さなグループに分割すると、サーバーのオーバーヘッドが削減され、サーバーの応答時間とユーザーエクスペリエンスが向上します。

```{note}
Liferay7.4のU18とGA18より前のバージョンでは、利用可能なページネーションオプションが少なくなっています。 これらのバージョンでも、ページ分割を有効にしたり、一度に表示するアイテムの最大数を選択したりすることはできますが、ページ分割メニューに表示されるページ数を変更することはできません。
```

コレクション表示の表示項目をページ分割する、

1. コレクションが表示されているコンテンツページで **編集**( ![編集アイコン](../../../images/icon-edit.png) ) をクリックします。

1. **Browser**( ![Browser icon](../../../images/icon-hierarchy.png) ) をクリックして、Browser パネルを開きます。

1. 要素ブラウザで、ページ分割したいコレクション表示フラグメントを選択します。 選択したフラグメントは、既存のコレクションを表示するように設定する必要があります。

1. 一般設定で、ページネーションオプションを選択します。

   **ページネーション** ：None（ページネーションなし）、Numeric（数値）、Simple（Previous/Nextコントロール）。

   **すべてのページを表示するすべてのページを表示する** ：ページネーションメニューにすべてのページの数字またはコントロールを表示するには、このボックスにチェックを入れます。 ページ分割タイプが選択されていない場合、このオプションは代わりに [すべてのコレクション アイテムを表示] になります。

   **最大表示ページ数** ：ページネーションメニューに表示される最大ページ数。 このオプションは、「すべてのページを表示」チェックボックスが選択されていない場合にのみ表示されます。

   **ページあたりの最大アイテム数** ：ページネーションが有効な場合、コレクションからページごとに表示するアイテムの最大数。 ページネーションタイプが選択されていない場合、このオプションは代わりに最大表示アイテム数になります。

   ![Choose the pagination options for the collection display items.](./displaying-collections/images/08.png)

ページ分割を有効にした場合、利用可能なページの総数は、コレクション内のアイテムの総数と、ページあたりのアイテムの最大数の設定の両方に依存します。

```{note}
デフォルトでは、コレクション表示フラグメントは、編集モードで一度に20項目まで表示します。 この制限は、*コントロールパネル* &rarr; *インスタンス設定* &rarr; *ページ* &rarr; *ページエディタ* に移動して、*編集モードの最大アイテム数* フィールドの数値を変更することで変更できます。 編集モードで一度に20以上の項目を表示すると、パフォーマンスに悪影響を及ぼす可能性があります。 この設定は、ユーザーが表示モードでページに表示される内容には影響しません。
```

## サイト全体でのコレクションの使用状況の表示

あなたのサイトのコレクションの利用統計を見ることができます。

1. **サイトメニュー**( ![サイトメニュー](../../../images/icon-product-menu.png))を開き、 **サイトビルダー** &rarr; **コレクション** に移動します。

1. コレクションタブで、 **アクション**( [アクションメニュー](../../../images/icon-actions.png) )をクリックします。 &rarr; レビューしたいコレクションの横にある **View Usages** をクリックします。

![Select View Usages to understand how your collections are being used through the site](./displaying-collections/images/09.png)

## Liferay DXP 7.2

### コンテンツセットの表示

コンテンツ・セットは主にアセット・パブリッシャーで表示されます。 現在のところ、コンテンツ・セットをそのまま表示する唯一の方法だが、コンテンツ・セットを利用するための外部アプリケーションやウィジェットを独自に開発することもできる。 [コンテンツセットの作成](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md#creating-content-sets) では、2つのコンテンツセットを作成しました。 それらをページに表示してみましょう。

#### コンテンツセット用のアセットパブリッシャーの構成

コンテンツセットを表示するには、空白のページから始め、必要なアセットパブリッシャーを追加し、コンテンツセットを表示するように設定します。

1. サイトの新しいホームページを1カラムレイアウトのウィジェットページとして作成します。 新しいLiferay DXPバンドルを使っている場合は、サンプルのHomeページからHello Worldウィジェットを削除するだけです。

1. **Add** メニューを開き、"Content Management" &rarr; "Asset Publishers "を2つ、縦に重ねてページに追加する。

1. クリックオプション ( ![Options](../../../images/icon-app-options.png) ) ) &rarr; トップアセットパブリッシャーの **設定** です。

1. Asset Selectionで **Content Set** を選択する。

   ![The asset publisher has a number of options available for selecting its source for content.](./displaying-collections/images/10.png)

1. **コンテンツ セットの選択** を開き、 **選択** をクリックします。

1. **宇宙番組画像** コンテンツセットを選択する。

1. ［**保存**］をクリックします。

これで画像はページ上部に表示されるようになった。 どのようなメタデータが表示されるかなど、コンテンツの表示方法を管理したり、ウィジェットテンプレートを作成してコンテンツをスタイリングすることもできるが、表示されるアイテムや表示順序はコンテンツセットによって決定される。

次に、一番下のアセットパブリッシャーにもう一つのコンテンツセットを設定します。

1. オプションをクリック (![Options](../../../images/icon-app-options.png)) &rarr; 一番下のアセットパブリッシャーの **設定** をクリックします。

1. Asset Selectionで **Content Set** を選択する。

1. **Select Content Set** を開き、 **Select** をクリックする。

1. **トレンド** コンテンツセットをクリックする。

   ![Select the content set you want to use.](./displaying-collections/images/11.png)

1. ［**保存**］をクリックします。

ここでも、さまざまな表示設定を管理することができるが、表示される項目とその順序は、コンテンツ・セットの基準によって決定される。

![アセットパブリッシャーの標準出力として結果を見ることができます。 ウィジェットテンプレートを作成し、スタイルと華やかさを追加できます。](./displaying-collections/images/12.png)

#### 既存のコンテンツセットにアイテムを追加する

静的コンテンツ・セットと動的コンテンツ・セットの両方の管理を実演するために、新しい画像をアップロードし、タグ付けして、静的コンテンツ・セットに手動で追加します。

1. 新しい画像をアップロードし、[分類] で **トレンド** としてタグ付けします。

1. 画像はトレンドコンテンツリストのトップに追加されます。

   ![The result is added dynamically to the content list wherever it is displayed.](./displaying-collections/images/13.png)

1. マニュアルセットに追加するには、 **サイトメニュー** に戻り、 **コンテンツ＆データ** &rarr; **サイトビルダー** に移動します。

1. **Space Program Images** をクリックするか、！ [Options](../../../images/icon-options.png) &rarr; **編集** スペース・プログラム・イメージの隣にある。

1. Asset Entriesの横にある、 **Select** &rarr; **Basic Document** をクリックします。

1. 新しい画像を選択し、 **追加** をクリックします。

1. ホームページに戻ると、リストに追加された画像が表示されます。

コンテンツセットは、サイト全体に表示されるコンテンツやその他のアセットを定義するための1つの場所を提供します。 また、再利用が可能なので、ユーザーに優れたコンテンツを届けるための繰り返しの作業が少なくて済みます。

## 関連トピック

[コレクションの作成](../../../site-building/displaying-content/collections-and-collection-pages/creating-collections.md)
[コレクションとコレクションページについて](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
[コレクションのパーソナライズ](../../personalizing-site-experience/experience-personalization/personalizing-collections.md)
