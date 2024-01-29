# 基本Webコンテンツ記事の追加

サイトに公開するコンテンツが多い場合、Liferayのコンテンツ管理システムは、実用的で不可欠な管理方法を提供します。 ウェブ・コンテンツの記事は、 [ウィジェット](../../../site-building/displaying-content/additional-content-display-options/using-the-web-content-display-widget.md) 、 [フラグメント](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md) 、 [表示ページ](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md) を通じて表示することができる。

各Webコンテンツの記事は、使用可能なフィールドを定義するストラクチャーに基づいています。 Liferayには、 すぐに使える基本Webコンテンツストラクチャーが含まれていますが、独自のストラクチャーを作成することもできます。 詳しくは [Webコンテンツストラクチャーを理解する](../web-content-structures/understanding-web-content-structures.md) を参照。

## 基本Webコンテンツ記事の作成

1. Site Menu (![Site Menu](../../../images/icon-menu.png)) を開き、 **Content & Data** &rarr; **Web Content** に移動します。

1. [ウェブ・コンテンツ]タブで、 **追加**( [アイコンの追加](../../../images/icon-add.png) )をクリックし、 **基本ウェブ・コンテンツ** を選択します。

   ![ウェブコンテンツ管理ページ](./adding-a-basic-web-content-article/images/01.png)。

1. 新しい記事の **タイトル**（必須）を入力し、それぞれのフィールドに必要な **コンテンツ** を追加します。

   ![The edit screen for a new web content article.](./adding-a-basic-web-content-article/images/02.png)

1. ［**公開**］ をクリックします。

これで新しい記事が作成された！ フォルダーの中にある場合は、ナビゲーションしやすいようにインタラクティブなパスが表示されます。

![An interactive path enables easy file navigation.](./adding-a-basic-web-content-article/images/06.png)

[ウェブコンテンツ表示ウィジェット](../../../site-building/displaying-content/additional-content-display-options/using-the-web-content-display-widget.md) を使って、ウェブコンテンツ記事をページに表示できるようになりました。

## Webコンテンツの記事をプレビューする

選択したデフォルトテンプレートや表示ページテンプレートを使って、公開前にコンテンツをプレビューできるので、意図したとおりのコンテンツがユーザーに表示されるように調整できます。

### テンプレートでWebコンテンツ記事をプレビューする

1. プロパティタブで、Webコンテンツの記事をプレビューするテンプレートを選択します。

1. **プレビュー**( ![プレビュー](../../../images/icon-preview.png))をクリックします。

   ![The default template has a preview button that looks like an eye.](./adding-a-basic-web-content-article/images/04.png)

```{note}
 プレビューできるのは、公開済みまたは下書きとして保存されたウェブコンテンツ記事のみです。
```

### 表示ページでWebコンテンツ記事をプレビューする

任意のサイトまたはアセットライブラリから、表示ページテンプレートを使ってWebコンテンツをプレビューできます。

1. プロパティタブで、Webコンテンツの記事をプレビューするサイトと表示ページを選択します。

1. クリック **プレビュー**( ![プレビュー](../../../images/icon-preview.png))。

   ![When you've selected a display page template, use the preview button in the properties tab.](./adding-a-basic-web-content-article/images/05.png)

```{note}
プレビューボタンを選択すると、プレビューを表示する前にウェブコンテンツ記事の下書きが保存されます。
```

## プロパティタブ

基本ウェブコンテンツの記事を作成または編集すると、サイドバーメニューのプロパティタブに以下のオプションが表示されます：

| **プロパティ** | **目的**                                                   |**追加メモ**                                                                                                                                                                                                                |
| :--------------- | :------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **基本情報** | ウェブコンテンツ構造、バージョン、ステータス、ID、編集可能な短い説明など、記事の基本情報を見ることができます。 | 記事の作成後は、構造を編集できません。 詳しくは [ウェブコンテンツ構造](../web-content-structures/understanding-web-content-structures.md) を参照。                                                                                                |
| **デフォルトのテンプレート** | このウェブコンテンツを表示するデフォルトのテンプレートを選択します。                       | 詳しくは [ウェブ・コンテンツ・テンプレートの作成](../web-content-templates/creating-web-content-templates.md) を参照してください。                                                                                                            |
| **表示ページテンプレート** | 必要であれば、この記事の表示ページテンプレートを選択する。                            | 詳しくは、 [表示ページテンプレートの作成と管理](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md) を参照してください。                                                 |
| **メイン画像** | 記事のサムネイルとして使用する小さな画像を選択します。                              | 画像は、URL、システムからのアップロード、またはドキュメントとメディアにあるファイルから取得できます。                                                                                                                                                                    |
| **カテゴリ設定** | 記事の公開または非公開のカテゴリー、タグ、優先順位を設定する。                          | 詳しくは、 [コンテンツにタグを付ける](../../tags-and-categories/tagging-content-and-managing-tags.md) および [カテゴリーとタグでコンテンツを整理する](../../tags-and-categories/organizing-content-with-categories-and-tags.md) をご覧ください。 |
| **フレンドリURL** | この記事のカスタムフレンドリーURLを設定する。                                 |                                                                                                                                                                                                                         |
| **スケジュール** | 必要であれば、記事を表示または失効させる日付をスケジュールする。                         | 詳しくは [ウェブコンテンツのスケジューリング](./using-expiration-and-review-dates-in-web-content.md) を参照してください。                                                                                                                   |
| **検索** | この記事が検索のためにインデックスされるかどうかを設定します。                          |                                                                                                                                                                                                                         |
| **関連するアセット** | 必要であれば、関連資産を選択する。                                        |                                                                                                                                                                                                                         |

## 関連トピック

[表示ページテンプレートの作成と管理](../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)

[ウェブコンテンツ構造入門](../web-content-structures/understanding-web-content-structures.md)

[ウェブコンテンツ記事のフィルタリングと並べ替え](./filtering-and-sorting-web-content-articles.md)
