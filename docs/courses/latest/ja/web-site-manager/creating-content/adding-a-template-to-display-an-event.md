# イベントを表示するテンプレートの追加

新しいタイプの構造を追加するたびに、ウェブコンテンツのテンプレートを用意する必要があります。

ここでは、HTMLと [FreeMarkerタグ](https://freemarker.apache.org/docs/dgui.html) を使って、イベント記事のフィールドをフォーマットします。

## テンプレートの作成開始

1. パブリックサイトの管理者であるPreston Palmerとしてログインしてください（まだの場合）。

1. サイトメニューに移動する (![サイトメニュー](../../images/icon-product-menu.png)) &rarr; _Content & Data_ &rarr; _Webコンテンツ_.

1. *Structures*タブをクリックして、以前に作成した構造体を表示する。

1. イベント構造のアクションメニュー（[アクションアイコン](../../images/icon-actions.png)）で_テンプレートの管理_を選択します。

   ![Click Manage Templates to specifically add templates for this web content structure.](./adding-a-template-to-display-an-event/images/01.png)

1. 新しいテンプレートを作成するには、_追加_ (![アイコンの追加](../../images/icon-add.png))をクリックします。

   新しいテンプレートは、あなたがテンプレートを管理することを選択したため、イベント構造と自動的に関連付けられます。

1. ページの一番上に、タイトルとして`Simple Event Format`と入力する。

1. Propertiesメニュー（画面右側）の_Description_フィールドに次のように入力する： `A generic template to display an event.`.

## テンプレートのフィールドを設定する

ここで、イベント記事のフィールドデータを表示する順番とフォーマットをアレンジする。

1. *Elements*（[Elementsアイコン](../../images/icon-list-ul.png)）をクリックして、Elementsメニューを再度開きます。

1. テンプレート本文をクリックし、プレースホルダー・テキストを削除する。

1. [要素]メニューで、[ジャーナル]の下のフィールドまでスクロールダウンし、_タイトル_をクリックします。

   これにより、タイトル値を使用するコードが自動的に追加される。

   ![Clicking one of the fields in the Elements menu automatically fills in code to reference the field's contents (if they exist).](./adding-a-template-to-display-an-event/images/02.png)

1. 次のように、コードをH1見出しHTMLタグ（`<h1>`）で囲みます：

   ```html
   <h1>${.vars["reserved-article-title"].data}</h1>
   ```

   このテンプレートで公開されるイベント記事は、タイトルがH1ヘッダーとして始まります。

1. 要素 "メニューの "フィールド"までスクロールし、"サマリー "をクリックする。

   これは、サマリーの内容が存在する限り、その内容への参照を追加する。 これにはFreeMarkerの `<#if>` タグを使用します。

1. Summaryテキスト参照をH3見出しHTMLタグ（`<h3>`）で囲む。

   ![HTML and FreeMarker tags are used together to format web content templates.](./adding-a-template-to-display-an-event/images/03.png)

1. Enterキーを2回押して新しい行を2行追加し、「要素」メニューのフィールドリストから「_バナー画像_」をクリックする。

1. Enterを2回押して新しい行を2行追加し、HTMLタグ（`<hr>`）で区切られた行を追加する。

1. Enterを2回押して新しい行を2行追加し、要素メニューのフィールドリストから_本文_をクリックする。

![The completed Event template displays the title, the summary, the banner image, and then the article body beneath a separator line.](./adding-a-template-to-display-an-event/images/04.png)

これでイベントテンプレートが完成し、見栄えの良いフォーマットでイベント記事を表示できるようになりました。 後ほど、記事をページに表示するときに、このことがわかるだろう。

次ページ： [を、作成したもう1つの構造体、FAQs](./adding-a-template-to-display-faqs.md) のテンプレートとして作成する。

## 関連コンセプト

- [ウェブ・コンテンツ・テンプレートの作成](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates)

- [ウェブコンテンツのテンプレートをフラグメントにマッピングする](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-templates/mapping-web-content-templates-to-fragments)
