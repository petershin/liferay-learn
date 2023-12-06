# 基本Webコンテンツ記事の追加

サイトに公開するコンテンツが多い場合、Liferayのコンテンツ管理システムは、実用的で不可欠な管理方法を提供します。 ウェブ・コンテンツの記事は、 [ウィジェット](../../../site-building/displaying-content/additional-content-display-options/using-the-web-content-display-widget.md)、 [フラグメント](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md)、 [表示ページ](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)を通じて表示することができる。

各Webコンテンツの記事は、使用可能なフィールドを定義するストラクチャーに基づいています。 Liferayには、 すぐに使える基本Webコンテンツストラクチャーが含まれていますが、独自のストラクチャーを作成することもできます。 詳しくは [Webコンテンツストラクチャーを理解する](../web-content-structures/understanding-web-content-structures.md) を参照してください。

## 基本Webコンテンツ記事の作成

1. サイトメニュー (![Site Menu](../../../images/icon-menu.png)) を開き、 **コンテンツ & データ** &rarr; **ウェブコンテンツ** に移動する。

1. Web Content タブで、 **Add**(![Add icon](../../../images/icon-add.png)) をクリックし、 **Basic Web Content** を選択する。

   ![ウェブコンテンツの管理ページ。](./adding-a-basic-web-content-article/images/01.png).

1. 新しい記事の **タイトル**（必須）を入力し、それぞれのフィールドに目的の **コンテンツ** を追加します。

   ![新しいWebコンテンツ記事の編集画面。](./adding-a-basic-web-content-article/images/02.png)

1. ［**Publish**］ をクリックします。


[ウェブコンテンツ表示ウィジェット](../../../site-building/displaying-content/additional-content-display-options/using-the-web-content-display-widget.md)を使って、ウェブコンテンツ記事をページに表示できるようになりました。

## Webコンテンツの記事をプレビューする

選択したデフォルトテンプレートや表示ページテンプレートを使って、公開前にコンテンツをプレビューできるので、意図したとおりのコンテンツがユーザーに表示されるように調整できます。

### テンプレートでWebコンテンツ記事をプレビューする

1. プロパティタブで、Webコンテンツの記事をプレビューするテンプレートを選択します。

1. **プレビュー**( ![Preview](../../../images/icon-preview.png) ) をクリックしてください。

   ![デフォルトのテンプレートには、目のようなプレビューボタンがある。](./adding-a-basic-web-content-article/images/04.png)

```{note}
 プレビューできるのは、公開済みまたは下書きとして保存済みのWebコンテンツの記事のみです。
```

### 表示ページでWebコンテンツ記事をプレビューする

任意のサイトまたはアセットライブラリから、表示ページテンプレートを使ってWebコンテンツをプレビューできます。

1. プロパティタブで、Webコンテンツの記事をプレビューするサイトと表示ページを選択します。

1. **プレビュー**( ![Preview](../../../images/icon-preview.png) ) をクリックしてください。

   ![表示ページテンプレートを選択したら、プロパティタブのプレビューボタンを使用します。](./adding-a-basic-web-content-article/images/05.png)

```{note}
プレビューボタンを選択すると、プレビューを表示する前にウェブコンテンツ記事の下書きが保存されます。
```

## プロパティタブ

基本ウェブコンテンツの記事を作成または編集すると、サイドバーメニューのプロパティタブに以下のオプションが表示されます：

| **プロパティ** | **目的** | **追加ノート** |
|:---------------- |:-------------------------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **基本情報** | ウェブコンテンツ構造、バージョン、ステータス、ID、編集可能な短い説明など、記事の基本情報を見ることができます。 | 記事の作成後は、構造を編集できません。 詳細は、[Web コンテンツストラクチャー](../web-content-structures/understanding-web-content-structures.md)を参照してください。                                                                           |
| **デフォルトのテンプレート** | このウェブコンテンツを表示するデフォルトのテンプレートを選択します。                       | 詳しくは [ウェブ・コンテンツ・テンプレートの作成](../web-content-templates/creating-web-content-templates.md) を参照してください。                                                                                                 |
| **表示ページテンプレート** | 必要であれば、この記事の表示ページテンプレートを選択する。                            | 詳細は、[表示ページテンプレートの作成と管理](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)を参照してください。                                         |
| **メイン画像** | 記事のサムネイルとして使用する小さな画像を選択します。                              | 画像は、URL、システムからのアップロード、またはドキュメントとメディアにあるファイルから取得できます。                                                                                                                                              |
| **カテゴリ設定** | 記事の公開または非公開のカテゴリー、タグ、優先順位を設定する。                          | 詳しくは、 [コンテンツにタグを付ける](../../tags-and-categories/tagging-content-and-managing-tags.md) および [カテゴリーとタグでコンテンツを整理する](../../tags-and-categories/organizing-content-with-categories-and-tags.md) をご覧ください。 |
| **フレンドリURL** | この記事のカスタムフレンドリーURLを設定する。                                 |                                                                                                                                                                                                   |
| **スケジュール** | 必要であれば、記事を表示または失効させる日付をスケジュールする。                         | 詳細は、[Scheduling Web Content](./using-expiration-and-review-dates-in-web-content.md)を参照してください。                                                                                                     |
| **検索** | この記事が検索のためにインデックスされるかどうかを設定します。                          |                                                                                                                                                                                                   |
| **関連するアセット** | 必要であれば、関連資産を選択する。                                        |                                                                                                                                                                                                   |

## 関連トピック

[表示ページテンプレートの作成と管理](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)

[Introduction to Web Content Structures](../web-content-structures/understanding-web-content-structures.md)

[Webコンテンツ記事の絞り込みとソート](./filtering-and-sorting-web-content-articles.md)
