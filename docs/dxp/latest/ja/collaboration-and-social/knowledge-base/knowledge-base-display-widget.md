# ナレッジベース表示ウィジェット

{bdg-secondary}`liferay 7.4 U72+/GA72+`.

ナレッジベース表示ウィジェットを使用すると、ナビゲーション、コメント、評価、ソーシャルメディアリンクが組み込まれたサイトページに公開記事を表示できます。 デフォルトでは、このウィジェットにナレッジベースのホームフォルダの記事が表示されるようになっています。 どの記事が含まれるかはカスタマイズできる。

ウィジェットは、フラグメントとウィジェットのサイドパネルの_コンテンツ管理_の下にあります。

![The Knowledge Base Display widget appears under Content Management in the widget menu.](./knowledge-base-display-widget/images/01.png)

## ウィジェットの構成

1. ナレッジベース表示ウィジェットを含むページの編集を開始します。

1. ウィジェットの_オプション_ボタン(![オプションボタン](../../images/icon-actions.png))をクリックし、_設定_を選択します。

   ![Click the Options button and select Configuration.](./knowledge-base-display-widget/images/02.png)

1. Setupタブで、Content Selectionの_Select_をクリックし、表示する記事を決定する。

   ![In the Setup tab, click Select under Content Selection  to determine which articles to display.](./knowledge-base-display-widget/images/03.png)

1. 個々の記事またはフォルダの_選択_をクリックします。

   または、_このフォルダを選択_をクリックすると、現在のフォルダの記事が表示されます。

   ![Click Select for the desired article or folder, or click Select this Folder to select the current folder.](./knowledge-base-display-widget/images/04.png)

1. SetとEnableで、ウィジェットで使用する機能を決定します。 オプション

   * 記述の有効化
   * 評価を有効にする
   * アセットエントリの表示
   * 添付ファイルを表示
   * 関連するアセット表示機能を有効にする
   * 閲覧数の増加を有効にする
   * 購読を有効にする
   * 履歴を有効にする
   * 印刷を有効にする

   ![Determine which Knowledge Base features to use in the widget.](./knowledge-base-display-widget/images/05.png)

1. ソーシャルブックマーク」では、どのソーシャルメディアリンクをどのように表示するかを決めます。

   ![Determine which social media links to include and how to display them.](./knowledge-base-display-widget/images/06.png)

1. セクションセレクタのフォルダにプレフィックスを追加。

   ![Add a prefix to folders in the section selector.](./knowledge-base-display-widget/images/07.png)

1. 最大ネスティングレベルを設定する。 これは、記事の階層がどのように表示されるかを決定する。

   ![Set a maximum nesting level.](./knowledge-base-display-widget/images/08.png)

   この階層のシナリオを考えてみよう：

   ```
   第 1 条
   ├── 第 1.1 条
   │ ├── 第 1.1.1 条
   │ └── 第 1.1.2 条
   └── 第 1.2 条
       ├── 第 1.2.1 条
       └── 第 1.2.2 条
   ```

   最大入れ子レベルを `3` 以上に設定すると、これらの記事は3つのレベルに入れ子になって表示される。 しかし、最大入れ子レベルを`2`に設定すると、記事は2つのレベルに表示される：

   ```
   第 1 条
   ├── 第 1.1 条
   ├── 第 1.1.1 条
   ├── 第 1.1.2 条
   ├── 第 1.2 条
   ├── 第 1.2.1 条
   └── 第 1.2.2 条
   ```

1. ［_保存_］をクリックします。

## ウィジェットの機能を調べる

ナレッジベース表示のナビゲーションメニューと表示オプションは、フルページのウィジェットに最適な候補です。 記事のフォルダを表示すると、ウィジェットの左側のナビゲーションに、フォルダのすべての記事へのリンクが表示されます。 あなたの記事が [フォルダー](./managing-the-knowledge-base.md#adding-folders) に整理されている場合、このウィジェットはユーザーにフォルダーを切り替えるためのセレクタを提供します。

![The navigation menu on the left shows you article links.](./knowledge-base-display-widget/images/09.png)

ウィジェットの右側にある表示エリアには、フォルダの先頭記事が表示されます。 ナビゲーションで記事をクリックすると、その記事が表示エリアに表示されます。 現在表示されている記事のリンクは、ナビゲーションに太字で表示されます。 候補セクションの前にある記事の下部にあるリンクをクリックして、記事間を移動することもできます。

![The navigation on the left and the article on the right are displayed.](./knowledge-base-display-widget/images/10.png)

ナレッジベース表示では、記事の階層を表示することもできます。 子記事がある記事を表示すると、ナビゲーションツリーが展開され、子記事へのリンクが表示されます。 別の一番上のレベルの記事を表示すると、展開されたノードが折りたたまれます。

ウィジェットの上部にあるリンクは、記事に対する次のアクションを公開します。

* ナレッジベースのRSSフィードを購読する
* 現在の記事を購読する
* 現在の記事の履歴を表示する
* 現在の記事を印刷する

管理者は、ウィジェットの上部にある追加のリンクセットにアクセスできます。

* 記事を編集する
* 子記事を追加する
* 記事を移動する
* 記事を削除する

記事のコンテンツの下には評価インターフェイスがあり、サムアップ/サムダウンのアイコンが表示されています。 ユーザーは、記事の下にある「_ご意見はありますか_」と書かれたテキストボックスで、提案やコメントを提出することもできる。 管理者は、 [提案を確認し、それらの進行状況をマークすることができます](./responding-to-knowledge-base-feedback.md) 。

管理者がKnowledge BaseのソースURL機能を有効にしていて、記事にソースURLが割り当てられている場合、記事のタイトルの右側に_Edit on GitHub_ボタン(![GitHub icon](./knowledge-base-display-widget/images/11.png)) が表示されます。 このボタンは、GitHubの記事のソースにリンクしています。 この機能を利用して、記事の修正や改善のための投稿を促すことができます。 詳しくは [ナレッジベース システム設定](./knowledge-base-system-settings.md) をご覧ください。

## 関連トピック

* [ナレッジ・ベース記事の作成](./creating-knowledge-base-articles.md)
* [ナレッジベースの管理](./managing-the-knowledge-base.md)
* [その他のナレッジベース・ウィジェット](./other-knowledge-base-widgets.md)