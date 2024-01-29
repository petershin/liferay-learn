# その他のナレッジベースウィジェット

[ナレッジベース表示ウィジェット](knowledge-base-display-widget.md) 以外にも、ページに追加できるナレッジベースのウィジェットがあります。

**知識ベース記事** ：一つの記事の内容を表示します。

**Knowledge Base Section** ：特定のトピック（セクション）に関連する記事を公開する。

**知識ベース検索** ：記事を検索します。

これらのウィジェットは、 **Add**( [Add icon](../../images/icon-add.png) ) から追加できます。 &rarr; **ウィジェット** &rarr; **コンテンツ管理** .

## ナレッジベース記事ウィジェット

ナレッジベース記事ウィジェットは、単一の記事のコンテンツを表示します。 子記事の概要も表示されます。 1つのページに複数のナレッジベースの記事のインスタンスを追加でき、それぞれが異なる記事を表示できます。

ナレッジベース記事ウィジェットをサイトページに追加した後、

1. **オプション**( [オプションボタン](../../images/icon-options.png) )をクリックし、 **設定** を選択します。

1. **Setup** タブで、 **Select** をクリックする。

1. 記事を選択してください。

1. **Save** をクリックし、Configurationウィンドウを閉じます。

   ![Use the Knowledge Base Article widget to display an individual article.](./other-knowledge-base-widgets/images/01.png)

ナレッジベース記事ウィジェットは、ナレッジベース表示ウィジェットと同じUIを共有して、記事を表示および管理します。 ウィジェットのUIの詳細は、 [ナレッジベース表示ウィジェット](knowledge-base-display-widget.md) のドキュメンテーションを参照してください。

## ナレッジベースセクションウィジェット

```{note}
Knowledge Base 3.0.0 では、Knowledge Base Sections ウィジェットは非推奨となり、 [categories](../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md) に置き換えられました。
```

ナレッジベースセクションウィジェットは、特定のトピック（セクション）に関連する記事を公開できます。 たとえば、夏のオリンピックに関するサイトには、チームスポーツ、ウォータースポーツ、マーシャルアーツのセクションがあるかもしれない。

![The widget displays articles based on specific sections.](./other-knowledge-base-widgets/images/02.png)

セクションを使用するには、最初にシステム設定で機能を設定し、ナレッジベースセクションウィジェットで使用するセクション名を作成する必要があります。 このプロセスは、 [ナレッジベースシステム設定](knowledge-base-system-settings.md) で詳しく説明しています。

ナレッジベースの記事を作成または編集するときに、作成者は［設定］ → ［Sections ］フィールドで記事のセクションを選択できます。

![Select a specific section for your article.](./other-knowledge-base-widgets/images/03.png)

ナレッジベースセクションウィジェットの複数のインスタンスをページに追加できます。 各ウィジェットは、任意の数のセクションの記事を表示できます。 記事のタイトルまたは概要を表示するようにウィジェットを設定できます。 また、ページネーションやセクションタイトルを表示するかどうかも定義できます。

ナレッジベースセクションウィジェットを設定するには、

1. **オプション**( [オプションボタン](../../images/icon-options.png) )をクリックし、 **設定** を選択します。

   ![Customize the widget in the Configuration window.](./other-knowledge-base-widgets/images/04.png)

1. **Setup** &rarr; **General** タブで、使用したいセクションを選択し、 **Save** をクリックします。

1. ［設定］ウィンドウを閉じて、更新を確認します。

一致する記事がアプリのセクション見出しの下に表示されます。

## ナレッジベース検索ウィジェット

```{note}
Knowledge Base 3.0.0では、Knowledge Base Searchウィジェットは廃止され、Liferay Searchに置き換えられました。
```

ナレッジベースは記事の構造を表示できますが、閲覧して探しているものを正確に見つけるのは難しい場合があります。 そのため、検索には、ナレッジベース検索ウィジェットを使用できます。

検索語を入力し、 **検索** ボタンを押してください。 結果は、一致する記事ごとに次の基準でテーブルに表示されます。

* タイトル
* 作成者
* 作成日
* 編集日時
* 閲覧数

![Use the app to get search results for Knowledge Base articles.](./other-knowledge-base-widgets/images/05.png)

ウィジェットをページに追加した後、

1. オプション ( ![オプションボタン](../../images/icon-options.png) )をクリックし、**設定** を選択します。

   ![Choose the criteria to display for the search results.](./other-knowledge-base-widgets/images/06.png)

1. **設定** &rarr; **全般** タブで、検索結果に表示する条件を選択します。

1. **Save** をクリックし、Configurationウィンドウを閉じます。

## 関連トピック

* [ナレッジ・ベース記事の作成](./creating-knowledge-base-articles.md)
* [ナレッジベースの管理](./managing-the-knowledge-base.md)
* [ナレッジベース表示ウィジェット](./knowledge-base-display-widget.md)
