# コンテンツダッシュボードインターフェース

{bdg-secondary}`7.3以降で利用可能`

コンテンツダッシュボードのユーザーインターフェースは、主に3つのセクションから構成されています。

1. [コンテンツ監査ツール](#content-audit-tool)
1. [コンテンツ一覧](#contents-list)
1. [コンテンツ情報サイドバー](#content-info-sidebar)

![コンテンツダッシュボードのユーザーインターフェースは、主に3つのセクションから構成されています。](./content-dashboard-interface/images/01.png)

ダッシュボードにアクセスするには、 **グローバルメニュー**( !/../images/icon-applications-menu.png ) を開き、 **アプリケーション** タブを開いて、 **コンテンツダッシュボード** をクリックします。ここでは、ページ上部に［コンテンツ監査ツール］（#content-audit-tool）（1）、下部に［コンテンツリスト］（#contents-list）（2）が表示されます。コンテンツリストでは、コンテンツにカーソルを合わせて **Info** ボタン（ ![Info](../../images/icon-information.png) ）をクリックすると、 [コンテンツ情報サイドバー](#content-info-sidebar) (3) にアクセスできます。または、コンテンツアイテムの **Actions** ボタン( ![Actions Button](../../images/icon-actions.png) )をクリックして、 **Info** を選択することもできます。

```{note}
インスタンスがAnalytics Cloudに接続されている場合、*View Metrics*を選択して、Content Performanceサイドパネルを開くこともできます。 詳しくは、[コンテンツパフォーマンスツールについて](../page-performance-and-accessibility/about-the-content-performance-tool.md) をご覧ください。
```

## コンテンツ監査ツール

コンテンツ監査ツールは、 [コンテンツリスト](#contents-list) セクションのアセットをチャートで表示します。 このグラフは、選択した [ボキャブラリーとカテゴリ](#customizing-vocabularies-and-categories-for-the-content-audit-tool) のアセットの総数を表し、すべてのサイトとアセットライブラリーのアイテムを含めることができます。 ただし、チャートは現在のユーザーがアクセスできるデータのみ表示されます。 また、 [コンテンツリストフィルタ](#filtering-and-sorting-content-in-the-contents-list) を使って、チャート結果を制限することもできます。

![コンテンツ監査ツールは、コンテンツ一覧セクションのアセットをチャートで表示します。](./content-dashboard-interface/images/02.png)

```{tip}
期待した情報が表示されない場合は、選択した語彙について[カテゴリの確認](../tags-and-categories/defining-categories-and-vocabularies-for-content.md) と [コンテンツのカテゴリ分け](../tags-and-categories/organizing-content-with-categories-and-tags.md) をしてください。
```

コンテンツ監査ツールは、4つのUI要素を含んでいます。

1. チャートの凡例 

1. 第一語彙のX軸カテゴリー 

1. 第二語彙のY軸カテゴリー 

1. 棒グラフの様子

![コンテンツ監査ツールには、これらのUI要素が含まれています。](./content-dashboard-interface/images/03.png)


### コンテンツ監査ツールのボキャブラリーとカテゴリーのカスタマイズ

デフォルトでは、選択されたボキャブラリーの各カテゴリーのアセット数の合計が棒グラフで表示されます。 これらのボキャブラリーを変更すること。

1. コンテンツ監査領域の **Configure** ボタン ( ![Configure Button](../../images/icon-settings.png) ) をクリックします。

1. **左** と **右** の矢印ボタンで、チャートに表示するボキャブラリーを選択します。
   
   一度に使えるボキャブラリーは1つか2つだけです。 また、同じサイトのボキャブラリーしか組み合わせることができません。 ただし、グローバルボキャブラリーは、どのサイトのボキャブラリーでも使用可能です。

1. **上** と **下** の矢印ボタンをクリックして、ボキャブラリーを順番に並べることができます。
   
   このグラフでは、X軸に上の語彙を、Y軸に下の語彙を使用しています。
   
   ![コンテンツ監査表のボキャブラリーを選択します。](./content-dashboard-interface/images/04.png)

1. ［**Save**］ をクリックします。

```{tip}
Flip Axes* ボタン ( ![Flip Axes](../../images/icon-change.png) ) をクリックすると、X軸とY軸をすばやく切り替えることができます。
```

## コンテンツ一覧

デフォルトでは、コンテンツリストには、サイトやアセットライブラリでアクセスできるすべてのコンテンツが表示されます。 ここから、組み込みまたはカスタムのフィルターを使用してコンテンツを並べ替えたり絞り込んだりできます。 コンテンツ監査ツールのチャートは、設定したフィルターに基づいて動的に変化します。

コンテンツリストには、4つのUI要素が含まれています。

1. フィルタとソートセレクター 

1. フィルターエディター 

1. 検索フィールド 

1. コンテンツ一覧 

![コンテンツリストには、コンテンツを探すのに便利ないくつかの要素が含まれています。](./content-dashboard-interface/images/05.png)

コンテンツリストには、次のような欄があります。

| 列               | 説明                                                                                                                |
|:--------------- |:----------------------------------------------------------------------------------------------------------------- |
| タイトル            | コンテンツのタイトルです。                                                                                                     |
| 作成者             | コンテンツの作者です。                                                                                                       |
| 種類              | コンテンツタイプ：Webコンテンツ記事、文書 {bdg-secondary}`7.4+`、またはブログエントリー {bdg-secondary}`7.4 U23+/GA23+`                          |
| サブタイプ           | コンテンツ [サブタイプ](../tags-and-categories/defining-categories-and-vocabularies-for-content.md#creating-subcategories) . |
| サイトまたはアセットライブラリ | Liferay インスタンスにおけるコンテンツアイテムの位置。                                                                                   |
| ステータス           | 各コンテンツのワークフローの状態です。                                                                                               |
| ボキャブラリー(x軸)     | コンテンツ監査ツールの [x軸の語彙からコンテンツアイテムに適用されるカテゴリ](#content-audit-tool) 。                                                    |
| ボキャブラリー（Y軸）     | コンテンツ監査ツールの [y 軸の語彙からコンテンツアイテムに適用されるカテゴリ](#content-audit-tool) 。                                                   |
| 編集日時            | コンテンツの最終更新日                                                                                                       |


コンテンツリストでは、 **ページ** アイコン ( ![Page Icon](../../images/icon-page.png) ) を使って、 [表示ページテンプレート](../../site-building/displaying-content/using-display-page-templates.md)を持つアセットを識別します。

リスト内のコンテンツにカーソルを合わせると、これらのアクションにアクセスできます。

* ** ( ![View](../../images/icon-preview.png) ) を表示します。コンテンツの表示ページを表示します。

* ** ( ![Edit](../../images/icon-edit.png) ) を編集します。コンテンツを編集モードで開きます。

* **情報**( ![Information](../../images/icon-information.png) ): [コンテンツ情報](#content-info-sidebar) サイドバーを開きます。

* **View Metrics**( ![View Metrics](../../images/icon-analytics.png) ) を表示します。 [コンテンツパフォーマンスパネルを開く](../page-performance-and-accessibility/about-the-content-performance-tool.md).
  
  ![コンテンツ情報サイドバーとコンテンツパフォーマンスパネルは、「アクション」メニューまたは各コンテンツ行のアイコンからアクセスできます。](./content-dashboard-interface/images/06.png)

### コンテンツ一覧内のコンテンツの絞り込みとソート

**Filter and Order** ドロップダウンメニューから、 [pre-defined filter](#filter-options-reference) を選択します。 また、タイトルや更新日時でコンテンツをソートすることも可能です。

検索バーを使ってキーワードでコンテンツを絞り込むか、 [コンテンツ監査](#content-audit-tool) チャートでバーをクリックすると、選択したカテゴリーでコンテンツを絞り込むことができます。

![絞り込みエディターを使用して、特定のフィルターまたはすべてのフィルターをフィルター領域から削除します.](./content-dashboard-interface/images/07.png)

フィルタの組み合わせの仕組みについては、 [Understanding Contents List Filters](#understanding-contents-list-filters) を参照してください。

```{note}
ダッシュボードページを閉じると、デフォルトのフィルタとソートオプションはリセットされます。
```

### フィルターオプションリファレンス

{bdg-secondary}`7.4+用`

**フィルターと並び替え** ドロップダウンメニューから、以下のオプションを選択することができます。

| 絞り込み            | 説明                                                                                                               |
|:--------------- |:---------------------------------------------------------------------------------------------------------------- |
| カテゴリ            | ボキャブラリーから1つまたは複数の [カテゴリ](../tags-and-categories/organizing-content-with-categories-and-tags.md) を使用してフィルタリングします。 |
| サイトまたはアセットライブラリ | サイトやアセットライブラリによるフィルタリング。                                                                                         |
| 種類              | コンテンツタイプおよびサブタイプによるフィルタリング。                                                                                      |
| 内線              | ファイルの拡張子でフィルタリングします。</br><ul><li>`音声`</li><li>`コード`</li><li>`圧縮`</li><li>`画像`</li><li>`プレゼンテーション`</li><li>`スプレッドシート`</li><li>`テキスト`</li><li>`ベクター`</li><li>`ビデオ`</li><li>`その他`</li></ul>                                                               |
| タグ              | Filters by content [tags](../tags-and-categories/tagging-content-and-managing-tags.md).                          |
| 作成者で絞り込む        | コンテンツの作者によるフィルタリング。                                                                                              |
| ステータスで絞り込み      | コンテンツの [ワークフローの状態によるフィルタリング](../../process-automation/workflow/introduction-to-workflow.md).                     |


![コンテンツの項目を絞り込む。](./content-dashboard-interface/images/08.png)



### 理解する コンテンツリスト フィルタ

* カテゴリーやタグのフィルターを複数の基準で使用すると、結果はすべての基準を満たすコンテンツに対応します（例Aを参照）。

* 同じフィルター条件で複数のオプションを選択すると、コンテンツリストには少なくとも1つのオプションに一致するアセットが表示されます（例B参照）。

* 異なるフィルターからの基準は、`and` 演算子を使用して結合されます（例Cを参照）。

| 例 | 次の項目で絞り込む | フィルターの例                           | コンテンツリストの結果                                     |
|:- |:--------- |:--------------------------------- |:----------------------------------------------- |
| A | カテゴリ      | カテゴリー： **Entrepreneur** および **Family** | **Entrepreneur** `および` Familyカテゴリーの両方に属しているアセットのみ |
| B | 作成者       | 作成者： **Peter** および **Linda** | **Peter** `または` **Linda** `または`両者が作成したアセット。         |
| C | カテゴリー、作成者 | カテゴリーは **Entrepreneur** 、作成者は **Linda** | **Entrepreneur** カテゴリーにあり、`かつ`Lindaが作成したアセットのみ。    |

## コンテンツ情報サイドバー

情報サイドバーでは、選択したアセットのアクションやメタデータにアクセスできます。 サイドバーを開くには、目的のアセットの **Actions** ボタン ( ![Actions Button](../../images/icon-actions.png) ) をクリックし、 **Info** を選択します。 または、アセットの上にカーソルを置いて、 **情報** ボタン ( ![Information Button](../../images/icon-information.png) ) をクリックすることもできます。

![ [情報]ボタンをクリックすると、コンテンツ情報サイドバーにアクセスできます。](./content-dashboard-interface/images/09.png)

この表は、アセットタイプごとに利用可能なメタデータとアクションの一覧です。

| アセットタイプ                                     | メタデータ/アクション               |
|:------------------------------------------- |:------------------------- |
| Webコンテンツ                                    | <ul><li>タイトル</li><li>Type {bdg-secondary}`7.4 U44+/GA44+`.</li><li>サブタイプ </li><li>バージョン（現在有効なバージョン）</li><li>ステータス</li><li>作成者</li><li>プレビュー画像 {bdg-secondary}`7.4 U42+/GA42+`.</li><li>翻訳先言語</li><li>公開開始日時</li><li>制作日</li><li>編集日時</li><li>ID</li><li>購読 {bdg-secondary}`7.4 U42+/GA42+`.</li><li>バージョン (クリックするとバージョン履歴が表示されます){bdg-secondary}`7.4 U53+/GA53+`.</li></ul> |
| ドキュメントとメディア {bdg-secondary}`7.4 U23+/GA23+` | <ul><li>タイトル</li><li>URL</li><li>WebDAV URL {bdg-secondary}`7.4 U42+/GA42+`.</li><li>ファイル名</li><li>Type {bdg-secondary}`7.4 U44+/GA44+`.</li><li>サブタイプ</li><li>MIME Type {bdg-secondary}`7.4 U44+/GA44+`.</li><li>バージョン（現在有効なバージョン）</li><li>ステータス</li><li>作成者</li><li>プレビュー画像</li><li>ダウンロードする</li><li>シェア {bdg-secondary}`7.4 U42+/GA42+`.</li><li>内線</li><li>サイズ</li><li>制作日</li><li>編集日時</li><li>ID</li><li>バージョン (クリックするとバージョン履歴が表示されます){bdg-secondary}`7.4 U53+/GA53+`.</li></ul> |
| ブログエントリー                                    | <ul><li>タイトル</li><li>種類</li><li>バージョン（現在有効なバージョン）</li><li>ステータス</li><li>作成者</li><li>プレビュー画像 {bdg-secondary}`7.4 U42+/GA42+`.</li><li>株式 {bdg-secondary}`7.4 U42+/GA42+`.</li><li>公開開始日時</li><li>制作日</li><li>編集日時</li><li>ID</li></ul> |

![コンテンツ情報サイドバーには、コンテンツのメタデータとアクションが表示されます。](./content-dashboard-interface/images/10.png)

### バージョン履歴

{bdg-secondary}`利用可能 7.4 U53+/GA53+`

コンテンツ情報パネルには、Webコンテンツとドキュメントとメディアのアセットに関するバージョン履歴が表示されます。 バージョン履歴を見るには、コンテンツアイテムの **Info**(![Info Button](../../images/icon-information.png)) をクリックし、 **Versions** タブを表示させます。

このタブには、そのアイテムで利用可能なバージョンが最大10個まで表示されます。 さらにバージョンがある場合は、「View More」ボタンをクリックすると表示されます。

各バージョンには、そのバージョンの作者、作成日時、変更履歴が表示されます。 各バージョンのアクションボタン(![Actions Button](../../images/icon-actions.png))をクリックすると、これらのアクションにアクセスできます。

**プレビューを表示します。** レンダリングされたWebコンテンツまたはドキュメントを表示します。

**比較先** 選択したバージョンと別のバージョンとの差分を表示します。 バージョン間の追加、削除、書式の変更を表示する新しいページが表示されます。 このアクションは、アクティブなバージョンが2つ以上ある場合にのみ利用可能です。

**期限切れ。** あるバージョンを無効化し、次に利用可能なバージョンを有効化します。 例えば、1.2と1.1の2つのバージョンがあり、1.2を失効させた場合、1.1がアクティブバージョンとなります。

![バージョン」タブをクリックすると、コンテンツダッシュボードのアイテムのバージョン履歴が表示されます。](./content-dashboard-interface/images/11.png)


## 追加情報

* [コンテンツダッシュボードについて](./about-the-content-dashboard.md)
* [コンテンツパフォーマンスツールの説明](../page-performance-and-accessibility/about-the-content-performance-tool.md)
* [コンテンツのカテゴリとボキャブラリの定義](../tags-and-categories/defining-categories-and-vocabularies-for-content.md)
